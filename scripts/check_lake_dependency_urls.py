#!/usr/bin/env python3

from __future__ import annotations

import argparse
import json
import re
import sys
import tomllib
from dataclasses import dataclass
from pathlib import Path


LEAN_GIT_REQUIRE_RE = re.compile(
    r'^\s*require\s+(?P<name>[A-Za-z_][A-Za-z0-9_]*)\s+from\s+git\s+"(?P<url>[^"]+)"(?:\s*@\s*"(?P<rev>[^"]+)")?',
    re.M,
)
LEAN_PATH_REQUIRE_RE = re.compile(
    r'^\s*require\s+(?P<name>[A-Za-z_][A-Za-z0-9_]*)\s+from\s+"(?P<path>[^"]+)"',
    re.M,
)


@dataclass(frozen=True)
class GitRequire:
    name: str
    url: str
    rev: str | None
    source: Path


@dataclass(frozen=True)
class PathRequire:
    name: str
    path: Path
    source: Path


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Check Lake dependency URLs that can trigger unwanted package reclones."
    )
    parser.add_argument("--project-root", default=Path.cwd(), type=Path)
    return parser.parse_args()


def parse_lakefile_lean(path: Path) -> tuple[list[GitRequire], list[PathRequire]]:
    if not path.exists():
        return [], []

    text = path.read_text(encoding="utf-8")
    git_requires = [
        GitRequire(
            name=match.group("name"),
            url=match.group("url"),
            rev=match.group("rev"),
            source=path,
        )
        for match in LEAN_GIT_REQUIRE_RE.finditer(text)
    ]
    path_requires = [
        PathRequire(
            name=match.group("name"),
            path=Path(match.group("path")),
            source=path,
        )
        for match in LEAN_PATH_REQUIRE_RE.finditer(text)
    ]
    return git_requires, path_requires


def parse_lakefile_toml(path: Path) -> list[GitRequire]:
    if not path.exists():
        return []

    data = tomllib.loads(path.read_text(encoding="utf-8"))
    raw_requires = data.get("require", [])
    if not isinstance(raw_requires, list):
        return []

    git_requires: list[GitRequire] = []
    for raw_require in raw_requires:
        if not isinstance(raw_require, dict):
            continue
        name = raw_require.get("name")
        url = raw_require.get("git")
        rev = raw_require.get("rev")
        if isinstance(name, str) and isinstance(url, str):
            git_requires.append(
                GitRequire(
                    name=name,
                    url=url,
                    rev=rev if isinstance(rev, str) else None,
                    source=path,
                )
            )
    return git_requires


def manifest_git_requires(path: Path) -> list[GitRequire]:
    if not path.exists():
        return []

    data = json.loads(path.read_text(encoding="utf-8"))
    packages = data.get("packages", [])
    if not isinstance(packages, list):
        return []

    git_requires: list[GitRequire] = []
    for raw_package in packages:
        if not isinstance(raw_package, dict):
            continue
        if raw_package.get("type") != "git":
            continue
        name = raw_package.get("name")
        url = raw_package.get("url")
        rev = raw_package.get("inputRev") or raw_package.get("rev")
        if isinstance(name, str) and isinstance(url, str):
            git_requires.append(
                GitRequire(
                    name=name,
                    url=url,
                    rev=rev if isinstance(rev, str) else None,
                    source=path,
                )
            )
    return git_requires


def relative(path: Path, project_root: Path) -> str:
    try:
        return str(path.relative_to(project_root))
    except ValueError:
        return str(path)


def format_requirement(require: GitRequire, project_root: Path) -> str:
    rev = f" @ {require.rev}" if require.rev else ""
    return f"{relative(require.source, project_root)}: {require.url}{rev}"


def check_manifest_matches_config(
    config_requires: list[GitRequire],
    manifest_requires: list[GitRequire],
    project_root: Path,
) -> list[str]:
    issues: list[str] = []
    manifest_by_name = {require.name: require for require in manifest_requires}
    for require in config_requires:
        manifest_require = manifest_by_name.get(require.name)
        if manifest_require is None:
            continue
        rev_mismatch = require.rev is not None and require.rev != manifest_require.rev
        if require.url != manifest_require.url or rev_mismatch:
            issues.append(
                "Lake manifest does not match the dependency declaration:\n"
                f"  declared: {format_requirement(require, project_root)}\n"
                f"  manifest: {format_requirement(manifest_require, project_root)}"
            )
    return issues


def check_duplicate_git_requires(
    root_requires: list[GitRequire],
    child_requires: list[GitRequire],
    project_root: Path,
) -> list[str]:
    issues: list[str] = []
    root_by_name = {require.name: require for require in root_requires}
    for child_require in child_requires:
        root_require = root_by_name.get(child_require.name)
        if root_require is None:
            continue
        if root_require.url == child_require.url and root_require.rev == child_require.rev:
            continue
        issues.append(
            f"Dependency {child_require.name!r} is declared inconsistently:\n"
            f"  root: {format_requirement(root_require, project_root)}\n"
            f"  path dependency: {format_requirement(child_require, project_root)}\n"
            "  Lake compares git URLs literally; inconsistent URLs can make it delete and reclone the package."
        )
    return issues


def main() -> int:
    args = parse_args()
    project_root = args.project_root.resolve()

    root_lakefile = project_root / "lakefile.lean"
    root_git_requires, path_requires = parse_lakefile_lean(root_lakefile)
    issues = check_manifest_matches_config(
        root_git_requires,
        manifest_git_requires(project_root / "lake-manifest.json"),
        project_root,
    )

    child_git_requires: list[GitRequire] = []
    for path_require in path_requires:
        dependency_root = (project_root / path_require.path).resolve()
        child_lakefile = dependency_root / "lakefile.toml"
        child_requires = parse_lakefile_toml(child_lakefile)
        child_git_requires.extend(child_requires)
        issues.extend(
            check_manifest_matches_config(
                child_requires,
                manifest_git_requires(dependency_root / "lake-manifest.json"),
                project_root,
            )
        )

    issues.extend(check_duplicate_git_requires(root_git_requires, child_git_requires, project_root))

    if issues:
        print("Lake dependency URL check failed:")
        for issue in issues:
            print(issue)
        return 1

    return 0


if __name__ == "__main__":
    sys.exit(main())
