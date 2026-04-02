#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_blueprint_node_kinds import audit_file


def write_tmp(tmp: Path, body: str) -> Path:
    path = tmp / "Sample.lean"
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_matching_lemma() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            #doc (Manual) "X" =>

            :::lemma_ "foo"
            Foo.
            :::

            ```tex "foo"
            \\begin{lemma}
            \\label{foo}
            Foo.
            \\end{lemma}
            ```
            """,
        )
        assert audit_file(path) == []


def test_theorem_vs_lemma_mismatch() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            #doc (Manual) "X" =>

            :::theorem "foo"
            Foo.
            :::

            ```tex "foo"
            \\begin{lemma}
            \\label{foo}
            Foo.
            \\end{lemma}
            ```
            """,
        )
        errors = audit_file(path)
        assert len(errors) == 1
        assert ":::lemma_" in errors[0]


def test_corollary_mismatch() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            #doc (Manual) "X" =>

            :::theorem "foo"
            Foo.
            :::

            ```tex "foo"
            \\begin{corollary}
            \\label{foo}
            Foo.
            \\end{corollary}
            ```
            """,
        )
        errors = audit_file(path)
        assert len(errors) == 1
        assert ":::corollary" in errors[0]


if __name__ == "__main__":
    test_matching_lemma()
    test_theorem_vs_lemma_mismatch()
    test_corollary_mismatch()
    print("check_blueprint_node_kinds tests passed")
