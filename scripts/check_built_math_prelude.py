#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys


BP_MATH_RE = re.compile(r'<code class="bp_math (?:inline|display)"')
EMPTY_PRELUDE_RE = re.compile(
    r'window\.bpTexPreludeTable = Object\.assign\(\{\}, window\.bpTexPreludeTable \|\| \{\}, \{"default":""\}\);'
)


def default_paths(root: Path) -> list[Path]:
    return sorted((root / "_out" / "site" / "html-multi").rglob("*.html"))


def audit_file(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    if not BP_MATH_RE.search(text):
        return []
    if EMPTY_PRELUDE_RE.search(text):
        return [f"{path}: page contains blueprint math but registers an empty default TeX prelude"]
    return []


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Ensure built HTML pages with blueprint math do not ship an empty default TeX prelude."
    )
    parser.add_argument("paths", nargs="*", type=Path)
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root. Used when no explicit paths are given.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    paths = [p.resolve() for p in args.paths] if args.paths else default_paths(root)

    missing = [path for path in paths if not path.exists()]
    if missing:
        for path in missing:
            print(f"missing file: {path}", file=sys.stderr)
        return 2

    failures: list[str] = []
    for path in paths:
        failures.extend(audit_file(path))

    if failures:
        print("Built math prelude audit failed:")
        for failure in failures:
            print(f"- {failure}")
        print(f"\n{len(failures)} built page(s) contain blueprint math with an empty default prelude.")
        return 1

    print(f"Built math prelude audit passed for {len(paths)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
