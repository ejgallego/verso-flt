#!/usr/bin/env python3
from __future__ import annotations

import argparse
from dataclasses import dataclass
from pathlib import Path
import subprocess
import sys


ROOT = Path(__file__).resolve().parents[1]


@dataclass
class StepResult:
    name: str
    command: list[str]
    returncode: int
    stdout: str
    stderr: str

    @property
    def ok(self) -> bool:
        return self.returncode == 0


def run_step(name: str, command: list[str]) -> StepResult:
    result = subprocess.run(
        command,
        cwd=ROOT,
        capture_output=True,
        text=True,
        check=False,
    )
    return StepResult(
        name=name,
        command=command,
        returncode=result.returncode,
        stdout=result.stdout.strip(),
        stderr=result.stderr.strip(),
    )


def lean_file_to_module(path: Path) -> str | None:
    try:
        rel = path.resolve().relative_to(ROOT)
    except ValueError:
        return None
    if rel.suffix != ".lean":
        return None
    return ".".join(rel.with_suffix("").parts)


def print_step(result: StepResult) -> None:
    status = "OK" if result.ok else "FAIL"
    print(f"  [{status}] {result.name}")
    print(f"    $ {' '.join(result.command)}")
    if result.stdout:
        for line in result.stdout.splitlines():
            print(f"    {line}")
    if result.stderr:
        for line in result.stderr.splitlines():
            print(f"    stderr: {line}")


def main() -> int:
    parser = argparse.ArgumentParser(
        description=(
            "Run the LT audit stack for one or more chapter files: source-pair check, "
            "similarity report, chapter build, and optionally the pages smoke test."
        )
    )
    parser.add_argument(
        "paths",
        nargs="+",
        type=Path,
        help="Lean chapter files to audit.",
    )
    parser.add_argument(
        "--top",
        type=int,
        default=8,
        help="Maximum number of low-similarity blocks to show per file.",
    )
    parser.add_argument(
        "--warn-below",
        type=float,
        default=0.70,
        help="Similarity warning threshold to pass through to check_lt_similarity.py.",
    )
    parser.add_argument(
        "--no-build",
        action="store_true",
        help="Skip `lake build` for the individual chapter modules.",
    )
    parser.add_argument(
        "--pages",
        action="store_true",
        help="Also run the full pages smoke test at the end.",
    )
    parser.add_argument(
        "--verbose",
        action="store_true",
        help="Pass through verbose per-block LT similarity output instead of the summary view.",
    )
    args = parser.parse_args()

    overall_ok = True

    for raw_path in args.paths:
        path = raw_path.resolve()
        print(f"\n== {path}")

        pair_result = run_step(
            "LT source-pair audit",
            [sys.executable, "scripts/check_lt_source_pairs.py", str(path)],
        )
        print_step(pair_result)
        overall_ok &= pair_result.ok

        similarity_result = run_step(
            "LT similarity report",
            [
                sys.executable,
                "scripts/check_lt_similarity.py",
                str(path),
                "--top",
                str(args.top),
                "--warn-below",
                str(args.warn_below),
                *([] if not args.verbose else ["--verbose"]),
            ],
        )
        print_step(similarity_result)
        overall_ok &= similarity_result.ok

        if not args.no_build:
            module = lean_file_to_module(path)
            if module is None:
                print("  [SKIP] chapter build")
                print("    could not infer a Lake module name from the file path")
            else:
                build_result = run_step(
                    "chapter build",
                    ["nice", "lake", "build", module],
                )
                print_step(build_result)
                overall_ok &= build_result.ok

    if args.pages:
        print("\n== pages")
        pages_result = run_step("pages smoke test", ["bash", "./scripts/ci-pages.sh"])
        print_step(pages_result)
        overall_ok &= pages_result.ok

    print(f"\nOverall: {'OK' if overall_ok else 'FAIL'}")
    return 0 if overall_ok else 1


if __name__ == "__main__":
    raise SystemExit(main())
