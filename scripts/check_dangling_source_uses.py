#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
from pathlib import Path
import sys


CONTENT_INPUT_RE = re.compile(r"\\input\{chapter/([^}]+)\}")
LABEL_RE = re.compile(r"\\label\{([^}]*)\}", re.S)
USES_RE = re.compile(r"\\uses\{([^}]*)\}")
TEX_COMMENT_RE = re.compile(r"(?<!\\)%.*$")
NON_CHAPTER_INPUTS = {"biblio.tex"}


def strip_tex_comment(line: str) -> str:
    return TEX_COMMENT_RE.sub("", line)


def split_label_list(chunk: str) -> list[str]:
    return [item.strip() for item in chunk.split(",") if item.strip()]


def active_chapter_paths(root: Path) -> list[Path]:
    content_path = root / "FLT" / "blueprint" / "src" / "content.tex"
    chapters: list[Path] = []
    for raw_line in content_path.read_text(encoding="utf-8").splitlines():
        stripped = strip_tex_comment(raw_line)
        match = CONTENT_INPUT_RE.search(stripped)
        if not match:
            continue
        tex_name = match.group(1)
        if not tex_name.endswith(".tex"):
            tex_name += ".tex"
        if tex_name in NON_CHAPTER_INPUTS:
            continue
        chapters.append(root / "FLT" / "blueprint" / "src" / "chapter" / tex_name)
    return chapters


def collect_labels_and_uses(chapters: list[Path]) -> tuple[set[str], list[tuple[str, Path, int]]]:
    labels: set[str] = set()
    uses: list[tuple[str, Path, int]] = []
    for path in chapters:
        stripped_lines = [
            strip_tex_comment(raw_line)
            for raw_line in path.read_text(encoding="utf-8").splitlines()
        ]
        for chunk in LABEL_RE.findall("\n".join(stripped_lines)):
            labels.update(split_label_list(chunk.replace("\n", " ")))
        for line_no, stripped in enumerate(stripped_lines, start=1):
            for chunk in USES_RE.findall(stripped):
                for target in split_label_list(chunk):
                    uses.append((target, path, line_no))
    return labels, uses


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Report active-source TeX \\uses targets that have no matching active-source \\label."
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root containing FLT/.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    chapters = active_chapter_paths(root)
    labels, uses = collect_labels_and_uses(chapters)
    missing = [(target, path, line_no) for target, path, line_no in uses if target not in labels]

    if not missing:
        return 0

    for target, path, line_no in missing:
        print(f"{path}:{line_no}: dangling uses target `{target}`")
    return 1


if __name__ == "__main__":
    raise SystemExit(main())
