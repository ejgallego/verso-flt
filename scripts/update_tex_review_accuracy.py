#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


REVIEW_ACCURACY_RE = re.compile(r"\s+\(accuracy := [0-9]+\)")


def ratio_per_mille(value: float) -> int:
    return max(0, min(1000, round(value * 1000)))


def update_file(path: Path, *, dry_run: bool) -> int:
    from check_lt_similarity import paired_blocks, score_pair  # noqa: PLC0415

    lines = path.read_text(encoding="utf-8").splitlines()
    pairs, errors = paired_blocks(path)
    if errors:
        for error in errors:
            print(error, file=sys.stderr)
        raise SystemExit(1)

    changed = 0
    for block, tex in pairs:
        score = score_pair(block, tex)
        accuracy = ratio_per_mille(score.primary_ratio)
        index = tex.start_line - 1
        old_header = lines[index].rstrip()
        new_header = REVIEW_ACCURACY_RE.sub("", old_header)
        new_header = f"{new_header} (accuracy := {accuracy})"
        if new_header != old_header:
            changed += 1
            lines[index] = new_header

    if changed and not dry_run:
        path.write_text("\n".join(lines) + "\n", encoding="utf-8")
    return changed


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Add or refresh LT token accuracy metadata on adjacent TeX review fences."
    )
    parser.add_argument(
        "paths",
        nargs="*",
        type=Path,
        help="Specific Lean chapter files. Defaults to lt.default_chapters.",
    )
    parser.add_argument(
        "--project-root",
        type=Path,
        default=None,
        help="Host project root. Defaults to the current working directory.",
    )
    parser.add_argument("--dry-run", action="store_true", help="Report changes without writing files.")
    args = parser.parse_args()

    project_root = (args.project_root or Path.cwd()).resolve()
    harness_scripts = project_root / "tools" / "verso-harness" / "scripts"
    if str(harness_scripts) not in sys.path:
        sys.path.insert(0, str(harness_scripts))

    from _harnesslib import resolve_chapter_paths  # noqa: PLC0415

    paths = resolve_chapter_paths(project_root, args.paths)
    total = 0
    for path in paths:
        changed = update_file(path, dry_run=args.dry_run)
        total += changed
        print(f"{path}: {changed} TeX review accuracy header(s)")

    suffix = " would be updated" if args.dry_run else " updated"
    print(f"TOTAL: {total}{suffix}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
