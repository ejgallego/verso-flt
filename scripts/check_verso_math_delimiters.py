#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import re

from _helper_shim import export_public, load_helper_module

_module = load_helper_module("check_verso_math_delimiters.py")
export_public(_module, globals())

_helper_suspicious_math_syntax = _module.suspicious_math_syntax
_helper_main = _module.main
STRAY_TEX_CLOSER_RE = re.compile(r"`\$\$?")


def _line_numbers(errors: list[str], path: Path) -> set[int]:
    prefix = f"{path}:"
    line_numbers: set[int] = set()
    for error in errors:
        if not error.startswith(prefix):
            continue
        rest = error[len(prefix) :]
        line, _, _ = rest.partition(":")
        if line.isdigit():
            line_numbers.add(int(line))
    return line_numbers


def suspicious_math_syntax(path: Path) -> list[str]:
    errors = _helper_suspicious_math_syntax(path)
    already_flagged = _line_numbers(errors, path)
    in_fence = False

    for line_no, line in enumerate(path.read_text(encoding="utf-8").splitlines(), start=1):
        stripped = line.strip()
        if stripped.startswith("```"):
            in_fence = not in_fence
            continue
        if in_fence or line_no in already_flagged:
            continue
        if STRAY_TEX_CLOSER_RE.search(line):
            errors.append(
                f"{path}:{line_no}: malformed Verso math delimiter; "
                f"TeX-style closing '$' after a Verso math backtick should be removed: {stripped}"
            )

    return errors


def main() -> int:
    _module.suspicious_math_syntax = suspicious_math_syntax
    return _helper_main()


if __name__ == "__main__":
    raise SystemExit(main())
