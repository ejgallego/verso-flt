#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_tex_prelude_katex import extract_prelude


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


if __name__ == "__main__":
    test_extract_prelude()
    print("check_tex_prelude_katex tests passed")
