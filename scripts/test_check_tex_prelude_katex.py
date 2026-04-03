#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_tex_prelude_katex import extract_prelude, katex_probe


def write_tmp(tmp: Path, body: str) -> Path:
    path = tmp / "TeXPrelude.lean"
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_extract_prelude() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            r'''
            import VersoBlueprint

            tex_prelude
              r#"\providecommand{\Q}{\mathbb{Q}}"#
            ''',
        )
        assert extract_prelude(path) == r"\providecommand{\Q}{\mathbb{Q}}"


def test_katex_probe_rejects_declare_math_operator() -> None:
    root = Path(__file__).resolve().parents[1]
    failure = katex_probe(
        root,
        r"\DeclareMathOperator{\Gal}{Gal}",
        [("operator-macro-coverage", r"\Gal")],
    )
    assert failure is not None
    assert "DeclareMathOperator" in failure


def test_katex_probe_rejects_builtin_redefinition() -> None:
    root = Path(__file__).resolve().parents[1]
    failure = katex_probe(
        root,
        r"\newcommand{\R}{\mathbb{R}}",
        [("builtin-preservation", r"\R")],
    )
    assert failure is not None
    assert "attempting to redefine \\R" in failure


def test_katex_probe_accepts_katex_safe_mix() -> None:
    root = Path(__file__).resolve().parents[1]
    failure = katex_probe(
        root,
        r"""
\providecommand{\R}{\mathbb{R}}
\providecommand{\Q}{\mathbb{Q}}
\providecommand{\Gal}{\operatorname{Gal}}
""".strip(),
        [
            ("builtin-preservation", r"\R"),
            ("source-macro-coverage", r"\Q"),
            ("operator-macro-coverage", r"\Gal(\Q/\Q)"),
        ],
    )
    assert failure is None


if __name__ == "__main__":
    test_extract_prelude()
    test_katex_probe_rejects_declare_math_operator()
    test_katex_probe_rejects_builtin_redefinition()
    test_katex_probe_accepts_katex_safe_mix()
    print("check_tex_prelude_katex tests passed")
