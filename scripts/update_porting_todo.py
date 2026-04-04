#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
from dataclasses import dataclass, field
from pathlib import Path


# Keep the TeX->Verso filename map here, but derive the active chapter list from
# `FLT/blueprint/src/content.tex`, which is the authoritative upstream blueprint
# chapter order. Replaced/commented-out files such as `ch03freyold.tex` must not
# appear on the task board when they are no longer active there.
CHAPTER_TO_LEAN = {
    "ch01introduction.tex": "Introduction.lean",
    "ch02reductions.tex": "Reductions.lean",
    "ch03freyold.tex": "EllipticFrey.lean",
    "ch03freyreduction.tex": "HardlyRamified.lean",
    "ch04overview.tex": "Overview.lean",
    "ch05automorphicformexample.tex": "AutomorphicFormExample.lean",
    "ch06automorphicrepresentations.tex": "ModularityLifting.lean",
    "ch07exampleGLn.tex": "LanglandsGLn.lean",
    "global_langlands.tex": "GlobalLanglands.lean",
    "FrobeniusProject.tex": "FrobeniusProject.lean",
    "AdeleMiniproject.tex": "AdeleProject.lean",
    "HaarCharacterProject.tex": "HaarCharacters.lean",
    "FujisakiProject.tex": "FujisakiProject.lean",
    "QuaternionAlgebraProject.tex": "QuaternionAlgebras.lean",
    "HeckeOperatorProject.tex": "HeckeOperators.lean",
    "chtopbestiary.tex": "Bestiary.lean",
}
# Legacy compatibility for other audit scripts that import `CHAPTERS` from here.
# The task board itself now uses `active_chapters_from_content`.
CHAPTERS = list(CHAPTER_TO_LEAN.items())
NON_CHAPTER_INPUTS = {"biblio.tex"}

TARGET_ENVS = {
    "theorem",
    "lemma",
    "corollary",
    "proposition",
    "definition",
    "example",
    "remark",
    "proof",
}

FORMAL_ENVS = {
    "theorem",
    "lemma",
    "corollary",
    "proposition",
    "definition",
    "example",
}

COMPLETION_FLAGS = {"leanok", "mathlibok"}
PLACEHOLDER_LEAN_TARGETS = {"???", "TODO", "TBD", "FIXME"}
OPEN_PROOF_MARKERS = (
    "todo",
    "omitted for now",
    "omit the argument",
    "we omit",
    "for now",
    "presumably",
    "need checking",
    "i have not yet",
    "i have not thought",
    "not yet",
    "maybe",
)

BEGIN_RE = re.compile(r"\\begin\{([A-Za-z*]+)\}(?:\[(.*?)\])?")
END_RE = re.compile(r"\\end\{([A-Za-z*]+)\}")
CHAPTER_RE = re.compile(r"\\chapter(?:\[[^\]]*\])?\{([^}]*)\}")
LABEL_RE = re.compile(r"\\label\{([^}]*)\}")
LEAN_RE = re.compile(r"\\lean\{([^}]*)\}")
USES_RE = re.compile(r"\\uses\{([^}]*)\}")
CONTENT_INPUT_RE = re.compile(r"\\input\{chapter/([^}]+)\}")
VERSO_NODE_HEADER_RE = re.compile(r'^:::(?:definition|theorem|lemma_|corollary|proof)\s+"([^"]+)"(.*)$')
VERSO_LEAN_RE = re.compile(r'\(lean := "([^"]+)"\)')


@dataclass
class EnvNode:
    kind: str
    start_line: int
    end_line: int | None = None
    title: str | None = None
    lines: list[str] = field(default_factory=list)
    labels: list[str] = field(default_factory=list)
    leans: list[str] = field(default_factory=list)
    verso_leans: list[str] = field(default_factory=list)
    uses: list[str] = field(default_factory=list)
    flags: set[str] = field(default_factory=set)
    open_reasons: list[str] = field(default_factory=list)

    def text(self) -> str:
        return "\n".join(self.lines)


@dataclass
class ChapterData:
    tex_path: Path
    lean_path: str
    title: str
    raw_lines: list[str]
    nodes: list[EnvNode]

    @property
    def open_nodes(self) -> list[EnvNode]:
        return [node for node in self.nodes if node.open_reasons]


def strip_tex_comment(line: str) -> str:
    return re.sub(r"(?<!\\)%.*$", "", line)


def extract_metadata(text: str) -> tuple[list[str], list[str], list[str], set[str]]:
    labels = LABEL_RE.findall(text)
    leans = LEAN_RE.findall(text)
    uses = [chunk.strip() for chunk in USES_RE.findall(text)]
    flags = set()
    for flag in COMPLETION_FLAGS | {"notready"}:
        if f"\\{flag}" in text:
            flags.add(flag)
    return labels, leans, uses, flags


def metadata_excerpt(lines: list[str], limit: int = 10) -> list[str]:
    excerpt: list[str] = []
    for index, line in enumerate(lines):
        stripped = strip_tex_comment(line)
        begins_here = [m for m in BEGIN_RE.finditer(stripped) if m.group(1) in TARGET_ENVS]
        if index > 0 and begins_here:
            break
        excerpt.append(line)
        if len(excerpt) >= limit:
            break
    return excerpt


def extract_verso_lean_targets(path: Path) -> dict[str, str]:
    if not path.exists():
        return {}
    targets: dict[str, str] = {}
    for raw_line in path.read_text(encoding="utf-8").splitlines():
        m = VERSO_NODE_HEADER_RE.match(raw_line.strip())
        if not m:
            continue
        label = m.group(1)
        rest = m.group(2)
        lean = VERSO_LEAN_RE.search(rest)
        if lean:
            targets[label] = lean.group(1)
    return targets


def active_chapters_from_content(root: Path) -> list[tuple[str, str]]:
    content_path = root / "FLT" / "blueprint" / "src" / "content.tex"
    chapters: list[tuple[str, str]] = []

    for raw_line in content_path.read_text(encoding="utf-8").splitlines():
        stripped = strip_tex_comment(raw_line)
        match = CONTENT_INPUT_RE.search(stripped)
        if not match:
            continue
        tex_name = match.group(1)
        if not tex_name.endswith(".tex"):
            tex_name = tex_name + ".tex"
        if tex_name in NON_CHAPTER_INPUTS:
            continue
        lean_name = CHAPTER_TO_LEAN.get(tex_name)
        if lean_name is None:
            raise ValueError(f"no Verso chapter mapping configured for active content entry {tex_name}")
        chapters.append((tex_name, lean_name))

    return chapters


def parse_chapter(tex_path: Path, lean_path: str, verso_lean_targets: dict[str, str] | None = None) -> ChapterData:
    raw_lines = tex_path.read_text(encoding="utf-8").splitlines()
    chapter_title = tex_path.stem
    active: list[EnvNode] = []
    nodes: list[EnvNode] = []
    verso_lean_targets = verso_lean_targets or {}

    for line_no, raw_line in enumerate(raw_lines, start=1):
        stripped = strip_tex_comment(raw_line)

        chapter_match = CHAPTER_RE.search(stripped)
        if chapter_match and chapter_title == tex_path.stem:
            chapter_title = chapter_match.group(1).strip()

        for node in active:
            node.lines.append(raw_line)

        begins = [m for m in BEGIN_RE.finditer(stripped) if m.group(1) in TARGET_ENVS]
        for match in begins:
            kind = match.group(1)
            title = match.group(2).strip() if match.group(2) else None
            active.append(
                EnvNode(
                    kind=kind,
                    start_line=line_no,
                    title=title,
                    lines=[raw_line],
                )
            )

        ends = [m for m in END_RE.finditer(stripped) if m.group(1) in TARGET_ENVS]
        for match in ends:
            kind = match.group(1)
            for index in range(len(active) - 1, -1, -1):
                if active[index].kind == kind:
                    node = active.pop(index)
                    node.end_line = line_no
                    nodes.append(node)
                    break

    for node in nodes:
        header_text = "\n".join(strip_tex_comment(line) for line in metadata_excerpt(node.lines))
        full_text = "\n".join(strip_tex_comment(line) for line in node.lines)
        labels, leans, uses, flags = extract_metadata(full_text)
        node.labels = labels
        node.leans = leans
        if not leans:
            node.verso_leans = [verso_lean_targets[label] for label in labels if label in verso_lean_targets]
        node.uses = uses
        node.flags = flags
        node.open_reasons = open_reasons(node, header_text, full_text)

    return ChapterData(
        tex_path=tex_path,
        lean_path=lean_path,
        title=chapter_title,
        raw_lines=raw_lines,
        nodes=nodes,
    )


def display_name(node: EnvNode) -> str:
    if node.labels:
        return node.labels[0]
    if node.leans:
        return node.leans[0]
    if node.title:
        return node.title
    return f"{node.kind} @{node.start_line}"


def lean_targets_are_placeholder(node: EnvNode) -> bool:
    if not node.leans:
        return False
    return any(lean.strip() in PLACEHOLDER_LEAN_TARGETS for lean in node.leans)


def proof_looks_unfinished(text: str) -> bool:
    lower = text.lower()
    return any(marker in lower for marker in OPEN_PROOF_MARKERS)


def open_reasons(node: EnvNode, header_text: str, full_text: str) -> list[str]:
    reasons: list[str] = []
    has_completion = bool(node.flags & COMPLETION_FLAGS)

    if node.kind in FORMAL_ENVS:
        if not node.leans and not node.verso_leans and not has_completion:
            reasons.append("no `\\lean{...}` target")
        elif lean_targets_are_placeholder(node):
            reasons.append("placeholder Lean target")

    if node.kind == "proof":
        if proof_looks_unfinished(full_text):
            reasons.append("proof sketch still reads as unfinished")

    return reasons


def first_nonempty_lines(lines: list[str], limit: int) -> list[str]:
    out: list[str] = []
    for line in lines:
        out.append(line.rstrip())
        if len(out) >= limit:
            break
    return out


def snippet_for_node(node: EnvNode, limit: int = 10) -> str:
    return "\n".join(first_nonempty_lines(node.lines, limit))


def representative_snippet(chapter: ChapterData) -> str:
    open_nodes = chapter.open_nodes
    if open_nodes:
        return snippet_for_node(open_nodes[0], limit=12)
    if chapter.nodes:
        return snippet_for_node(chapter.nodes[0], limit=12)
    return "\n".join(first_nonempty_lines(chapter.raw_lines, limit=12))


def render_node_task(node: EnvNode) -> list[str]:
    lines: list[str] = []
    title = display_name(node)
    reason = "; ".join(node.open_reasons)
    lines.append(f"- [ ] `{title}` needs attention: {reason}.")

    metadata_bits: list[str] = []
    if node.labels:
        metadata_bits.append("labels: " + ", ".join(f"`\\label{{{label}}}`" for label in node.labels))
    if node.leans:
        metadata_bits.append("lean: " + ", ".join(f"`\\lean{{{lean}}}`" for lean in node.leans))
    if node.verso_leans:
        metadata_bits.append("verso lean: " + ", ".join(f"`{lean}`" for lean in node.verso_leans))
    if node.uses:
        metadata_bits.append("uses: " + ", ".join(f"`\\uses{{{use}}}`" for use in node.uses))
    if node.flags:
        metadata_bits.append("flags: " + ", ".join(f"`\\{flag}`" for flag in sorted(node.flags)))
    if metadata_bits:
        lines.append("  - metadata: " + "; ".join(metadata_bits) + ".")

    lines.append("  - source:")
    lines.append("```tex")
    lines.extend(f"{line}" for line in snippet_for_node(node).splitlines())
    lines.append("```")
    return lines


def render_chapter(chapter: ChapterData) -> list[str]:
    lines: list[str] = []
    tex_name = chapter.tex_path.name
    lines.append(f"## {chapter.title}")
    lines.append(f"- Source: `{tex_name}` -> `{chapter.lean_path}`")
    lines.append(f"- Scanned nodes: {len(chapter.nodes)}")

    open_nodes = chapter.open_nodes
    if open_nodes:
        formal_open = sum(1 for node in open_nodes if node.kind in FORMAL_ENVS)
        proof_open = sum(1 for node in open_nodes if node.kind == "proof")
        lines.append(
            f"- Open work: {len(open_nodes)} source nodes need port attention "
            f"({formal_open} formal statements, {proof_open} proof sketches)."
        )
        lines.append("- Tasks:")
        for node in open_nodes:
            lines.extend(render_node_task(node))
    else:
        lines.append("- [x] No formal statements or proof sketches are currently flagged as open in the source.")

    lines.append("- Representative source:")
    lines.append("```tex")
    lines.extend(representative_snippet(chapter).splitlines())
    lines.append("```")
    return lines


def generate_markdown(chapters: list[ChapterData]) -> str:
    total_nodes = sum(len(chapter.nodes) for chapter in chapters)
    total_open = sum(len(chapter.open_nodes) for chapter in chapters)
    total_chapters = len(chapters)
    open_chapters = sum(1 for chapter in chapters if chapter.open_nodes)

    lines: list[str] = []
    lines.append("# TeX to Verso Porting Task Board")
    lines.append("")
    lines.append(
        "Generated from the active chapter list in `FLT/blueprint/src/content.tex`"
        " by `scripts/update_porting_todo.py`."
    )
    lines.append("")
    lines.append("This board is driven by source markers rather than stale cross-chapter match counts.")
    lines.append(
        "It follows the authoritative upstream blueprint chapter list from `content.tex`;"
        " commented-out or replaced chapter files are ignored."
    )
    lines.append(
        "The harness migration is largely done: most direct-port chapters now keep the remaining open"
        " source in local `tex` blocks, and the main work left is selective chapter fidelity rather"
        " than broad infrastructure."
    )
    lines.append(
        "This board is not an LT certification report. Strict LT now also requires every translated"
        " informal block in the Verso chapter to sit next to a labeled `tex` witness block;"
        " check that separately with `python3 scripts/check_lt_source_pairs.py`."
    )
    lines.append("It ignores legacy `\\leanok`, `\\mathlibok`, and `\\notready` markers for backlog purposes,")
    lines.append("and surfaces placeholder Lean targets, missing Lean targets on unfinished source items, and unfinished proof sketches as open work.")
    lines.append(
        "When a source block is still open, keep the raw TeX nearby in a labeled `tex` block"
        " instead of rewriting it into placeholder prose."
    )
    lines.append("")
    lines.append("## Snapshot")
    lines.append(f"- Mapped TeX chapters scanned: {total_chapters}")
    lines.append(f"- Source nodes scanned: {total_nodes}")
    lines.append(f"- Chapters with open work: {open_chapters}")
    lines.append(f"- Open source nodes: {total_open}")
    lines.append("")
    for chapter in chapters:
        lines.extend(render_chapter(chapter))
        lines.append("")
    return "\n".join(lines).rstrip() + "\n"


def main() -> int:
    parser = argparse.ArgumentParser(description="Regenerate PortingTodo.md from FLT TeX chapters.")
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root containing PortingTodo.md and FLT/.",
    )
    parser.add_argument(
        "--output",
        type=Path,
        default=None,
        help="Optional output path. Defaults to <root>/PortingTodo.md.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    output = args.output.resolve() if args.output else root / "PortingTodo.md"
    chapter_root = root / "FLT" / "blueprint" / "src" / "chapter"
    chapters: list[ChapterData] = []
    for tex_name, lean_name in active_chapters_from_content(root):
        tex_path = chapter_root / tex_name
        if not tex_path.exists():
            continue
        verso_path = root / "FLTBlueprint" / "Chapters" / lean_name
        chapters.append(parse_chapter(tex_path, lean_name, extract_verso_lean_targets(verso_path)))

    markdown = generate_markdown(chapters)
    output.write_text(markdown, encoding="utf-8")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
