#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import re
import sys

from check_lt_source_pairs import Block, default_chapter_paths, parse_blocks


VERSO_KIND_RE = re.compile(r'^:::(theorem|definition|lemma_|corollary) "')
TEX_ENV_RE = re.compile(r"\\begin\{(theorem|definition|lemma|corollary)\}")

EXPECTED_VERSO_KIND = {
    "theorem": "theorem",
    "definition": "definition",
    "lemma": "lemma_",
    "corollary": "corollary",
}


def block_body(block: Block) -> str:
    return "\n".join(block.lines[1:-1]) if block.kind == "tex" else "\n".join(block.lines)


def audit_file(path: Path) -> list[str]:
    blocks = parse_blocks(path)
    errors: list[str] = []

    for index, block in enumerate(blocks):
        if block.kind != "verso":
            continue
        if block.header.startswith(":::group "):
            continue

        match = VERSO_KIND_RE.match(block.header.strip())
        if not match:
            continue
        verso_kind = match.group(1)

        following = blocks[index + 1] if index + 1 < len(blocks) else None
        if following is None or following.kind != "tex":
            continue

        tex_match = TEX_ENV_RE.search(block_body(following))
        if not tex_match:
            continue

        tex_kind = tex_match.group(1)
        expected = EXPECTED_VERSO_KIND[tex_kind]
        if verso_kind != expected:
            errors.append(
                f"{path}:{block.start_line}: Verso node kind '{verso_kind}' does not match "
                f"adjacent TeX environment '{tex_kind}'; use ':::{expected}' instead: "
                f"{block.preview()}"
            )

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Check that theorem/lemma/corollary/definition Verso node kinds match the "
            "adjacent TeX source environment kind."
        )
    )
    parser.add_argument(
        "paths",
        nargs="*",
        type=Path,
        help="Specific Lean chapter files to audit. Defaults to FLTBlueprint/Chapters/*.lean.",
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
        failures.extend(audit_file(path))

    if failures:
        print("Blueprint node kind audit failed:")
        for failure in failures:
            print(f"- {failure}")
        print(f"\n{len(failures)} node kind mismatch(es) found.")
        return 1

    print(f"Blueprint node kind audit passed for {len(paths)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
