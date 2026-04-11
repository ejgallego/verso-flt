#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from _helper_shim import load_helper_module
from update_porting_todo import active_chapters_from_content


_harnesslib = load_helper_module("_harnesslib.py")


def expected_chapter_modules(project_root: Path) -> tuple[object, list[str], list[str]]:
    config = _harnesslib.load_config(project_root)
    active = active_chapters_from_content(project_root)
    modules = [Path(lean_name).stem for _, lean_name in active]
    paths = [str(Path(config.chapter_root) / lean_name) for _, lean_name in active]
    return config, modules, paths


def parse_main_chapter_lists(main_path: Path, package_name: str) -> tuple[list[str], list[str]]:
    import_re = re.compile(
        rf"^import {re.escape(package_name)}\.Chapters\.([A-Za-z0-9_]+)$"
    )
    include_re = re.compile(
        rf"^\{{include 0 {re.escape(package_name)}\.Chapters\.([A-Za-z0-9_]+)\}}$"
    )

    imports: list[str] = []
    includes: list[str] = []
    for raw_line in main_path.read_text(encoding="utf-8").splitlines():
        line = raw_line.strip()
        import_match = import_re.match(line)
        if import_match:
            imports.append(import_match.group(1))
            continue
        include_match = include_re.match(line)
        if include_match:
            includes.append(include_match.group(1))
    return imports, includes


def render_sequence(items: list[str]) -> str:
    return "[" + ", ".join(items) + "]"


def audit_project(project_root: Path) -> list[str]:
    config, expected_modules, expected_paths = expected_chapter_modules(project_root)
    errors: list[str] = []

    if config.non_port_chapters:
        errors.append(
            "harness.non_port_chapters must be empty; inactive or meta chapters must not be part of the active blueprint surface"
        )

    main_path = project_root / f"{config.package_name}.lean"
    if not main_path.exists():
        errors.append(f"missing main blueprint file: {main_path.relative_to(project_root)}")
        return errors

    imports, includes = parse_main_chapter_lists(main_path, config.package_name)
    if imports != expected_modules:
        errors.append(
            f"{main_path.relative_to(project_root)} chapter imports do not match active TeX TOC\n"
            f"  expected: {render_sequence(expected_modules)}\n"
            f"  actual:   {render_sequence(imports)}"
        )
    if includes != expected_modules:
        errors.append(
            f"{main_path.relative_to(project_root)} chapter includes do not match active TeX TOC\n"
            f"  expected: {render_sequence(expected_modules)}\n"
            f"  actual:   {render_sequence(includes)}"
        )

    if list(config.lt_default_chapters) != expected_paths:
        errors.append(
            "verso-harness.toml lt.default_chapters does not match active TeX TOC\n"
            f"  expected: {render_sequence(expected_paths)}\n"
            f"  actual:   {render_sequence(list(config.lt_default_chapters))}"
        )

    return errors


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Check that the active TeX blueprint TOC matches the main Verso manual "
            "chapter order and lt.default_chapters."
        )
    )
    parser.add_argument(
        "--project-root",
        type=Path,
        default=Path.cwd(),
        help="Host project root. Defaults to the current working directory.",
    )
    args = parser.parse_args()

    project_root = args.project_root.resolve()
    errors = audit_project(project_root)
    if errors:
        print("active chapter alignment check failed:")
        for error in errors:
            print(f"- {error}")
        return 1

    print("Active chapter alignment check passed.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
