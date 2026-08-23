#!/usr/bin/env python3
from __future__ import annotations

import argparse
import re
import sys
from pathlib import Path
import tomllib


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))
HELPER_SCRIPT_DIR = SCRIPT_DIR.parent / "tools/verso-harness/scripts"
if str(HELPER_SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(HELPER_SCRIPT_DIR))

from _harnesslib import load_config  # noqa: E402


CONTENT_INPUT_RE = re.compile(r"\\input\{chapter/([^}]+)\}")
TEX_COMMENT_RE = re.compile(r"(?<!\\)%.*$")
NON_CHAPTER_INPUTS = {"biblio.tex"}


def active_source_paths_from_content(project_root: Path) -> list[str]:
    content_path = project_root / "FLT/blueprint/src/content.tex"
    sources: list[str] = []
    for raw_line in content_path.read_text(encoding="utf-8").splitlines():
        line = TEX_COMMENT_RE.sub("", raw_line)
        match = CONTENT_INPUT_RE.search(line)
        if match is None:
            continue
        tex_name = match.group(1)
        if not tex_name.endswith(".tex"):
            tex_name += ".tex"
        if tex_name in NON_CHAPTER_INPUTS:
            continue
        sources.append(str(Path("FLT/blueprint/src/chapter") / tex_name))
    return sources


def configured_source_owners(project_root: Path) -> dict[str, str]:
    config_path = project_root / "verso-harness.toml"
    data = tomllib.loads(config_path.read_text(encoding="utf-8"))
    lt = data.get("lt", {})
    source_files = lt.get("source_files", {}) if isinstance(lt, dict) else {}
    if not isinstance(source_files, dict) or not source_files:
        raise ValueError("verso-harness.toml must define [lt.source_files]")

    owners: dict[str, str] = {}
    for chapter, sources in source_files.items():
        if not isinstance(chapter, str) or not isinstance(sources, list):
            raise ValueError("verso-harness.toml has invalid [lt.source_files]")
        for source in sources:
            if not isinstance(source, str):
                raise ValueError("verso-harness.toml has invalid [lt.source_files]")
            normalized = str(Path(source))
            previous = owners.get(normalized)
            if previous is not None and previous != chapter:
                raise ValueError(
                    f"source file {normalized} is owned by both {previous} and {chapter}"
                )
            owners[normalized] = chapter
    return owners


def expected_chapter_modules(project_root: Path) -> tuple[object, list[str], list[str]]:
    config = load_config(project_root)
    owners = configured_source_owners(project_root)
    active_sources = active_source_paths_from_content(project_root)
    missing = [source for source in active_sources if source not in owners]
    if missing:
        raise ValueError(
            "active TeX source files have no lt.source_files owner: " + ", ".join(missing)
        )
    paths = [owners[source] for source in active_sources]
    modules = [Path(path).stem for path in paths]
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
    errors: list[str] = []
    try:
        config, expected_modules, expected_paths = expected_chapter_modules(project_root)
    except (OSError, tomllib.TOMLDecodeError, ValueError) as exc:
        return [str(exc)]

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
