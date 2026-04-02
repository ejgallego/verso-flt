#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys


MALFORMED_INLINE_MATH_RE = re.compile(r"\$`[^`\n]+`\$")


def default_chapter_paths(root: Path) -> list[Path]:
    chapter_dir = root / "FLTBlueprint" / "Chapters"
    return sorted(chapter_dir.glob("*.lean"))


def suspicious_dollars(path: Path) -> list[str]:
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
            continue
        if "$" in stripped:
            errors.append(
                f"{path}:{line_no}: heading contains raw dollar math and may leak into rendered titles: "
                f"{stripped}"
            )

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Check for raw dollar-math in headings and malformed Verso inline math delimiters "
            "outside fenced blocks."
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
        failures.extend(suspicious_dollars(path))

    if failures:
        print("Verso math delimiter check failed:")
        for failure in failures:
            print(f"- {failure}")
        return 1

    print(f"Verso math delimiter check passed for {len(paths)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
