#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path

from _helper_shim import export_public, load_helper_module

_helper_module = load_helper_module("check_lt_source_pairs.py")
_harnesslib = load_helper_module("_harnesslib.py")
export_public(_helper_module, globals())


def default_chapter_paths(root: Path) -> list[Path]:
    return _harnesslib.default_chapter_paths(root)


if __name__ == "__main__":
    raise SystemExit(main())
