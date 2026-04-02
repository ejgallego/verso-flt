#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_tex_prelude_imports import audit_file


def write_tmp(tmp: Path, name: str, body: str) -> Path:
    path = tmp / name
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_missing_prelude_import_is_reported() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            "Sample.lean",
            """
            import Verso
            import VersoManual
            import VersoBlueprint

            #doc (Manual) "X" =>
            Hello.
            """,
        )
        errs = audit_file(path)
        assert len(errs) == 1
        assert "FLTBlueprint.TeXPrelude" in errs[0]


def test_present_prelude_import_passes() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            "Sample.lean",
            """
            import Verso
            import VersoManual
            import VersoBlueprint
            import FLTBlueprint.TeXPrelude

            #doc (Manual) "X" =>
            Hello.
            """,
        )
        assert audit_file(path) == []


if __name__ == "__main__":
    test_missing_prelude_import_is_reported()
    test_present_prelude_import_passes()
    print("check_tex_prelude_imports tests passed")
