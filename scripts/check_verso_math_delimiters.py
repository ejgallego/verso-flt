#!/usr/bin/env python3
from __future__ import annotations

import argparse
from collections import Counter
from pathlib import Path
import re
import sys


MALFORMED_INLINE_MATH_RE = re.compile(r"\$`[^`\n]+`\$")
EXTRA_CLOSING_BACKTICK_RE = re.compile(r"\$`[^`\n]+``")
MISSING_CLOSING_BACKTICK_RE = re.compile(r"\$`[^`\n$]+\$")
INLINE_MATH_RE = re.compile(r"\$`[^`\n]*`")
INLINE_CODE_RE = re.compile(r"(?<!\$)`([^`\n]+)`")
TEX_COMMAND_RE = re.compile(r"\\([A-Za-z]+)")
UNICODE_MATH_RE = re.compile(r"[∈∉⊆⊂⊇⊃∩∪⊗∏∑→↦≃≅≠≤≥∞]")
# Keep this narrower than generic punctuation so hyphenated prose and file paths
# do not drown the audit in false positives.
MATH_OPERATOR_RE = re.compile(r"(?<=[A-Za-z0-9)\]}])\s*(?:=|≠|≤|≥|<|>|\+)\s*(?=[A-Za-z0-9({\[])")
MATH_SUBSUP_RE = re.compile(r"(?:\b[A-Za-z]\s*_[A-Za-z0-9({\\]|\b[A-Za-z0-9)\]}]\s*\^\s*[A-Za-z0-9({\\])")
MATH_QUOTIENT_RE = re.compile(r"\b[A-Z][A-Za-z0-9]*\s*/\s*[A-Z][A-Za-z0-9]*\b")
LEAN_NAME_RE = re.compile(r"^[A-Za-z][A-Za-z0-9_']*(?:\.[A-Za-z0-9_']+)+$")
NON_MATH_TEX_COMMANDS = {
    "begin",
    "chapter",
    "cite",
    "citep",
    "discussion",
    "emph",
    "end",
    "label",
    "lean",
    "leanok",
    "mathlibok",
    "notready",
    "proves",
    "ref",
    "section",
    "uses",
}


def default_chapter_paths(root: Path) -> list[Path]:
    chapter_dir = root / "FLTBlueprint" / "Chapters"
    return sorted(chapter_dir.glob("*.lean"))


def looks_like_math_literal(content: str) -> str | None:
    content = content.strip()
    if not content:
        return None

    if LEAN_NAME_RE.fullmatch(content):
        return None

    tex_cmds = TEX_COMMAND_RE.findall(content)
    math_tex_cmds = [cmd for cmd in tex_cmds if cmd not in NON_MATH_TEX_COMMANDS]
    if math_tex_cmds:
        return f"TeX command '\\{math_tex_cmds[0]}' in code span"

    if UNICODE_MATH_RE.search(content):
        return "unicode math symbol in code span"

    if MATH_SUBSUP_RE.search(content):
        return "subscript/superscript-style notation in code span"

    if MATH_QUOTIENT_RE.search(content):
        return "quotient-style notation in code span"

    if MATH_OPERATOR_RE.search(content):
        return "formula-style operator in code span"

    return None


def mask_inline_math(line: str) -> str:
    return INLINE_MATH_RE.sub(lambda m: " " * (m.end() - m.start()), line)


def suspicious_math_syntax(path: Path) -> list[str]:
    errors: list[str] = []
    in_fence = False

    for line_no, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        stripped = line.strip()
        if stripped.startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence:
            continue

        if not stripped.startswith("#"):
            if MALFORMED_INLINE_MATH_RE.search(line):
                errors.append(
                    f"{path}:{line_no}: malformed Verso inline math delimiter; "
                    f"TeX '$...$' should become '$`...`', not '$`...`$': {stripped}"
                )
            if EXTRA_CLOSING_BACKTICK_RE.search(line):
                errors.append(
                    f"{path}:{line_no}: malformed Verso inline math delimiter; "
                    f"unexpected extra closing backtick after '$`...`': {stripped}"
                )
            if MISSING_CLOSING_BACKTICK_RE.search(line):
                errors.append(
                    f"{path}:{line_no}: malformed Verso inline math delimiter; "
                    f"missing closing backtick before '$': {stripped}"
                )
            masked = mask_inline_math(line)
            for m in INLINE_CODE_RE.finditer(masked):
                content = line[m.start() + 1 : m.end() - 1]
                reason = looks_like_math_literal(content)
                if reason is not None:
                    errors.append(
                        f"{path}:{line_no}: suspicious inline code span looks like math; "
                        f"{reason}; prefer '$`...`' over '`...`': `{content}`"
                    )
            continue
        if "$" in stripped:
            errors.append(
                f"{path}:{line_no}: heading contains raw dollar math and may leak into rendered titles: "
                f"{stripped}"
            )
        masked = mask_inline_math(line)
        for m in INLINE_CODE_RE.finditer(masked):
            content = line[m.start() + 1 : m.end() - 1]
            reason = looks_like_math_literal(content)
            if reason is not None:
                errors.append(
                    f"{path}:{line_no}: suspicious inline code span looks like math; "
                    f"{reason}; prefer '$`...`' over '`...`': `{content}`"
                )

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Check for raw dollar-math in headings, malformed Verso inline math delimiters, "
            "and suspicious inline code spans that likely should be Verso math."
        )
    )
    parser.add_argument(
        "paths",
        nargs="*",
        type=Path,
        help="Specific Lean files to scan. Defaults to FLTBlueprint/Chapters/*.lean.",
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root. Used when no explicit paths are given.",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Print every flagged occurrence instead of a per-file summary.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    paths = [path.resolve() for path in args.paths] if args.paths else default_chapter_paths(root)

    missing = [path for path in paths if not path.exists()]
    if missing:
        for path in missing:
            print(f"missing file: {path}", file=sys.stderr)
        return 2

    failures: list[str] = []
    for path in paths:
        failures.extend(suspicious_math_syntax(path))

    if failures:
        print("Verso math delimiter check failed:")
        if args.verbose:
            for failure in failures:
                print(f"- {failure}")
        else:
            by_path: Counter[str] = Counter(failure.split(":", 1)[0] for failure in failures)
            for path_str, count in sorted(by_path.items()):
                print(f"- {path_str}: {count} suspicious math-syntax issue(s)")
            sample = failures[: min(12, len(failures))]
            if sample:
                print("\nSample findings:")
                for failure in sample:
                    print(f"- {failure}")
                if len(failures) > len(sample):
                    print(f"- ... {len(failures) - len(sample)} more; re-run with --verbose for the full list.")
        return 1

    print(f"Verso math delimiter check passed for {len(paths)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
