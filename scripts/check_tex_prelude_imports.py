#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys


IMPORT_RE = re.compile(r"^import FLTBlueprint\.TeXPrelude$", re.MULTILINE)
VERSO_BLUEPRINT_IMPORT_RE = re.compile(r"^import VersoBlueprint$", re.MULTILINE)


def default_paths(root: Path) -> list[Path]:
    return sorted((root / "FLTBlueprint" / "Chapters").glob("*.lean"))


def audit_file(path: Path) -> list[str]:
    text = path.read_text(encoding="utf-8")
    if not VERSO_BLUEPRINT_IMPORT_RE.search(text):
        return []
    if IMPORT_RE.search(text):
        return []
    return [f"{path}: missing `import FLTBlueprint.TeXPrelude`"]


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Ensure chapter modules importing VersoBlueprint also import FLTBlueprint.TeXPrelude."
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
        print("TeX prelude import audit failed:")
        for failure in failures:
            print(f"- {failure}")
        print(f"\n{len(failures)} file(s) are missing the shared TeX prelude import.")
        return 1

    print(f"TeX prelude import audit passed for {len(paths)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
