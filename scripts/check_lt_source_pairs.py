#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path

from _helper_shim import load_helper_module

_helper_module = load_helper_module("check_lt_source_pairs.py")
_harnesslib = load_helper_module("_harnesslib.py")

Block = _helper_module.Block
parse_blocks = _helper_module.parse_blocks
audit_file = _helper_module.audit_file
main = _helper_module.main

_LEGACY_HARNESS_NATIVE = {
    "HistoricalInputs.lean",
    "MiniProjects.lean",
    "PortingStatus.lean",
    "GlobalLanglands.lean",
}


def default_chapter_paths(root: Path) -> list[Path]:
    return _harnesslib.default_chapter_paths(root)


def is_harness_native_chapter(path: Path) -> bool:
    try:
        config = _harnesslib.load_config(path.resolve().parents[1])
        non_port = {Path(item).name for item in config.non_port_chapters}
    except BaseException:
        non_port = set()
    return path.name in (_LEGACY_HARNESS_NATIVE | non_port)


if __name__ == "__main__":
    raise SystemExit(main())
