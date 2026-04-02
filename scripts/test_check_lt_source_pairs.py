#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_lt_source_pairs import audit_file, is_harness_native_chapter


def write_tmp(tmp: Path, name: str, body: str) -> Path:
    path = tmp / name
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_missing_tex_is_reported_for_direct_port() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            "Sample.lean",
            """
            #doc (Manual) "X" =>

            This prose block is missing a witness.
            """,
        )
        errs = audit_file(path)
        assert len(errs) == 1
        assert "missing an adjacent ```tex block" in errs[0]


def test_harness_native_name_is_skipped() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            "HistoricalInputs.lean",
            """
            #doc (Manual) "X" =>

            This prose block is missing a witness.
            """,
        )
        assert is_harness_native_chapter(path)


if __name__ == "__main__":
    test_missing_tex_is_reported_for_direct_port()
    test_harness_native_name_is_skipped()
    print("check_lt_source_pairs tests passed")
