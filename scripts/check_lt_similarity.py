#!/usr/bin/env python3
from __future__ import annotations

import argparse
from collections import Counter
from dataclasses import dataclass
import difflib
import re
from pathlib import Path
import statistics
import sys
import unicodedata

from check_lt_source_pairs import Block, default_chapter_paths, parse_blocks


@dataclass
class PairScore:
    block: Block
    tex: Block
    sequence_ratio: float
    token_ratio: float
    length_ratio: float
    verso_text: str
    tex_text: str
    verso_uses: set[str]
    tex_uses: set[str]
    verso_lean: set[str]
    tex_lean: set[str]
    tex_refs: set[str]

    @property
    def primary_ratio(self) -> float:
        return self.token_ratio

    @property
    def missing_uses(self) -> set[str]:
        return self.tex_uses - self.verso_uses

    @property
    def extra_uses(self) -> set[str]:
        return self.verso_uses - self.tex_uses

    @property
    def missing_lean(self) -> set[str]:
        return self.tex_lean - self.verso_lean

    @property
    def extra_lean(self) -> set[str]:
        return self.verso_lean - self.tex_lean

    @property
    def unresolved_ref_hints(self) -> set[str]:
        return self.tex_refs - self.tex_uses - self.tex_lean - self.verso_uses

    @property
    def metadata_diff_count(self) -> int:
        return (
            len(self.missing_uses)
            + len(self.extra_uses)
            + len(self.missing_lean)
            + len(self.extra_lean)
        )


MARKDOWN_LINK_RE = re.compile(r"\[([^\]]+)\]\([^)]+\)")
USES_RE = re.compile(r'\{uses "[^"]+"\}\[\]')
USES_CAPTURE_RE = re.compile(r'\{uses "([^"]+)"\}\[\]')
CITE_RE = re.compile(r"\{[^{}]*cite[^{}]*\}\[\]")
INLINE_TAG_RE = re.compile(r"\{[^{}]+\}\[\]")
TEX_COMMENT_RE = re.compile(r"(?<!\\)%.*$")
TEX_META_RE = re.compile(r"\\(label|lean|uses|discussion|proves)\{[^{}]*\}")
TEX_REF_RE = re.compile(r"\\ref\{[^{}]*\}")
TEX_FLAGS_RE = re.compile(r"\\(leanok|mathlibok|notready)\b")
TEX_BEGIN_END_RE = re.compile(r"\\(begin|end)\{[^{}]*\}(?:\[[^\]]*\])?")
TEX_ITEM_RE = re.compile(r"\\item\b")
TEX_HREF_RE = re.compile(r"\\href\{[^{}]*\}\{([^{}]*)\}")
TEX_TEXORPDF_RE = re.compile(r"\\texorpdfstring\{([^{}]*)\}\{([^{}]*)\}")
TEX_SIMPLE_CMD_ARG_RE = re.compile(r"\\[A-Za-z]+\*?(?:\[[^\]]*\])?\{([^{}]*)\}")
TEX_SIMPLE_CMD_RE = re.compile(r"\\([A-Za-z]+)")
TEX_USES_CAPTURE_RE = re.compile(r"\\uses\{([^{}]*)\}")
TEX_LEAN_CAPTURE_RE = re.compile(r"\\lean\{([^{}]*)\}")
TEX_REF_CAPTURE_RE = re.compile(r"\\ref\{([^{}]*)\}")
VERSO_LEAN_CAPTURE_RE = re.compile(r'lean := "([^"]+)"')
NON_ALNUM_RE = re.compile(r"[^a-z0-9]+")


def paired_blocks(path: Path) -> tuple[list[tuple[Block, Block]], list[str]]:
    blocks = parse_blocks(path)
    pairs: list[tuple[Block, Block]] = []
    errors: list[str] = []

    for index, block in enumerate(blocks):
        if block.kind not in {"prose", "verso"}:
            continue
        if block.kind == "verso" and block.header.startswith(":::group "):
            continue
        following = blocks[index + 1] if index + 1 < len(blocks) else None
        if following is None or following.kind != "tex":
            kind = "prose block" if block.kind == "prose" else "informal node"
            errors.append(
                f"{path}:{block.start_line}: {kind} is missing an adjacent ```tex block"
            )
            continue
        pairs.append((block, following))

    return pairs, errors


def block_body(block: Block) -> str:
    if block.kind == "verso":
        return "\n".join(block.lines[1:-1])
    if block.kind == "tex":
        return "\n".join(block.lines[1:-1])
    return "\n".join(block.lines)


def normalize_verso(text: str) -> str:
    text = MARKDOWN_LINK_RE.sub(r" \1 ", text)
    text = USES_RE.sub(" ", text)
    text = CITE_RE.sub(" ", text)
    text = INLINE_TAG_RE.sub(" ", text)
    return normalize_common(text)


def normalize_tex(text: str) -> str:
    stripped_lines = [TEX_COMMENT_RE.sub("", line) for line in text.splitlines()]
    text = "\n".join(stripped_lines)
    text = TEX_HREF_RE.sub(r" \1 ", text)
    text = TEX_TEXORPDF_RE.sub(r" \1 ", text)
    text = TEX_REF_RE.sub(" ", text)
    text = TEX_META_RE.sub(" ", text)
    text = TEX_FLAGS_RE.sub(" ", text)
    text = TEX_BEGIN_END_RE.sub(" ", text)
    text = TEX_ITEM_RE.sub(" ", text)

    previous = None
    while previous != text:
        previous = text
        text = TEX_SIMPLE_CMD_ARG_RE.sub(r" \1 ", text)

    return normalize_common(text)


def normalize_common(text: str) -> str:
    text = text.replace(":::"," ")
    text = text.replace("```", " ")
    text = text.replace("~", " ")
    text = text.replace("`", " ")
    text = text.replace("$", " ")
    text = text.replace("“", '"')
    text = text.replace("”", '"')
    text = text.replace("‘", "'")
    text = text.replace("’", "'")
    text = text.replace("``", '"')
    text = text.replace("''", '"')
    text = text.replace("\\", " \\")
    text = TEX_SIMPLE_CMD_RE.sub(r" \1 ", text)
    text = unicodedata.normalize("NFKD", text)
    text = text.encode("ascii", "ignore").decode("ascii")
    text = text.lower()
    text = NON_ALNUM_RE.sub(" ", text)
    return " ".join(text.split())


def token_ratio(left: str, right: str) -> float:
    left_tokens = left.split()
    right_tokens = right.split()
    if not left_tokens and not right_tokens:
        return 1.0
    if not left_tokens or not right_tokens:
        return 0.0
    common = sum((Counter(left_tokens) & Counter(right_tokens)).values())
    return (2 * common) / (len(left_tokens) + len(right_tokens))


def length_ratio(left: str, right: str) -> float:
    if not left and not right:
        return 1.0
    if not left or not right:
        return 0.0
    return min(len(left), len(right)) / max(len(left), len(right))


def split_csv_items(value: str) -> set[str]:
    return {item.strip() for item in value.split(",") if item.strip()}


def strip_tex_comments(text: str) -> str:
    return "\n".join(TEX_COMMENT_RE.sub("", line) for line in text.splitlines())


def extract_verso_uses(text: str) -> set[str]:
    return {match.group(1).strip() for match in USES_CAPTURE_RE.finditer(text)}


def extract_verso_lean(header: str) -> set[str]:
    items: set[str] = set()
    for match in VERSO_LEAN_CAPTURE_RE.finditer(header):
        items |= split_csv_items(match.group(1))
    return items


def extract_tex_uses(text: str) -> set[str]:
    stripped = strip_tex_comments(text)
    items: set[str] = set()
    for match in TEX_USES_CAPTURE_RE.finditer(stripped):
        items |= split_csv_items(match.group(1))
    return items


def extract_tex_lean(text: str) -> set[str]:
    stripped = strip_tex_comments(text)
    items: set[str] = set()
    for match in TEX_LEAN_CAPTURE_RE.finditer(stripped):
        items |= split_csv_items(match.group(1))
    return items


def extract_tex_refs(text: str) -> set[str]:
    stripped = strip_tex_comments(text)
    return {match.group(1).strip() for match in TEX_REF_CAPTURE_RE.finditer(stripped)}


def score_pair(block: Block, tex: Block) -> PairScore:
    verso_body = block_body(block)
    tex_body = block_body(tex)
    verso_text = normalize_verso(verso_body)
    tex_text = normalize_tex(tex_body)
    return PairScore(
        block=block,
        tex=tex,
        sequence_ratio=difflib.SequenceMatcher(a=verso_text, b=tex_text).ratio(),
        token_ratio=token_ratio(verso_text, tex_text),
        length_ratio=length_ratio(verso_text, tex_text),
        verso_text=verso_text,
        tex_text=tex_text,
        verso_uses=extract_verso_uses(verso_body),
        tex_uses=extract_tex_uses(tex_body),
        verso_lean=extract_verso_lean(block.header),
        tex_lean=extract_tex_lean(tex_body),
        tex_refs=extract_tex_refs(tex_body),
    )


def summarize_file(path: Path, scores: list[PairScore], warn_below: float, top: int) -> list[str]:
    primary_values = [score.primary_ratio for score in scores]
    low = [score for score in scores if score.primary_ratio < warn_below]
    low.sort(key=lambda score: (score.primary_ratio, score.sequence_ratio, score.block.start_line))
    metadata_mismatches = [score for score in scores if score.metadata_diff_count > 0]
    metadata_mismatches.sort(key=lambda score: (-score.metadata_diff_count, score.block.start_line))

    lines = [
        f"{path}: pairs={len(scores)} avg={statistics.mean(primary_values):.3f} "
        f"median={statistics.median(primary_values):.3f} min={min(primary_values):.3f} "
        f"warn_below={warn_below:.2f} low={len(low)} metadata_mismatch={len(metadata_mismatches)}"
    ]

    for score in low[:top]:
        kind = "prose" if score.block.kind == "prose" else "node"
        metadata_bits: list[str] = []
        if score.missing_uses:
            metadata_bits.append(f"missing_uses={sorted(score.missing_uses)}")
        if score.extra_uses:
            metadata_bits.append(f"extra_uses={sorted(score.extra_uses)}")
        if score.missing_lean:
            metadata_bits.append(f"missing_lean={sorted(score.missing_lean)}")
        if score.extra_lean:
            metadata_bits.append(f"extra_lean={sorted(score.extra_lean)}")
        if score.unresolved_ref_hints:
            metadata_bits.append(f"ref_hints={sorted(score.unresolved_ref_hints)}")
        metadata_suffix = f" {'; '.join(metadata_bits)}" if metadata_bits else ""
        lines.append(
            f"- line {score.block.start_line} {kind}: seq={score.sequence_ratio:.3f} "
            f"tok={score.token_ratio:.3f} len={score.length_ratio:.3f} "
            f"text={score.block.preview()}{metadata_suffix}"
        )

    return lines


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Block-level LT similarity checker using adjacent tex witnesses. "
            "LT is the canonical repository term; LF and TF are accepted aliases. "
            "This first draft follows David's suggestion to add a mechanical LT drift signal."
        )
    )
    parser.add_argument(
        "paths",
        nargs="*",
        type=Path,
        help="Specific Lean chapter files to audit. Defaults to the direct-port chapter list.",
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root. Used when no explicit paths are given.",
    )
    parser.add_argument(
        "--warn-below",
        type=float,
        default=0.70,
        help="Report blocks whose token similarity falls below this threshold.",
    )
    parser.add_argument(
        "--fail-below",
        type=float,
        default=None,
        help="Exit with code 1 if any block falls below this threshold.",
    )
    parser.add_argument(
        "--top",
        type=int,
        default=20,
        help="Maximum number of low-similarity blocks to print per file.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    paths = [path.resolve() for path in args.paths] if args.paths else default_chapter_paths(root)

    missing = [path for path in paths if not path.exists()]
    if missing:
        for path in missing:
            print(f"missing file: {path}", file=sys.stderr)
        return 2

    overall_fail = False
    any_scores = False

    for path in paths:
        pairs, errors = paired_blocks(path)
        if errors:
            print(f"{path}: cannot compare because some blocks are missing adjacent tex witnesses:")
            for error in errors:
                print(f"- {error}")
            overall_fail = True
            continue

        scores = [score_pair(block, tex) for block, tex in pairs]
        if not scores:
            print(f"{path}: no comparable block pairs found")
            continue
        any_scores = True

        for line in summarize_file(path, scores, args.warn_below, args.top):
            print(line)

        if args.fail_below is not None and any(score.primary_ratio < args.fail_below for score in scores):
            overall_fail = True

    if not any_scores and not overall_fail:
        print("No comparable LT block pairs found.")

    return 1 if overall_fail else 0


if __name__ == "__main__":
    raise SystemExit(main())
