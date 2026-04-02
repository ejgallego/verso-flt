#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_verso_math_delimiters import suspicious_dollars


def write_tmp(tmp: Path, body: str) -> Path:
    path = tmp / "Sample.lean"
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_heading_raw_dollar() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            #doc (Manual) "X" =>

            # Heading with $x$
            """,
        )
        errs = suspicious_dollars(path)
        assert len(errs) == 1
        assert "heading contains raw dollar math" in errs[0]


def test_malformed_inline_math() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            #doc (Manual) "X" =>

            This contains malformed inline math $`a`$ in prose.
            """,
        )
        errs = suspicious_dollars(path)
        assert len(errs) == 1
        assert "malformed Verso inline math delimiter" in errs[0]


def test_skip_fenced_tex() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            #doc (Manual) "X" =>

            ```tex "witness"
            This TeX witness contains $a$ and should be ignored.
            ```
            """,
        )
        assert suspicious_dollars(path) == []


if __name__ == "__main__":
    test_heading_raw_dollar()
    test_malformed_inline_math()
    test_skip_fenced_tex()
    print("check_verso_math_delimiters tests passed")
