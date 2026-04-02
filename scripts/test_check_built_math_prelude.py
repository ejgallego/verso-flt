#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_built_math_prelude import audit_file


def write_tmp(tmp: Path, body: str) -> Path:
    path = tmp / "page.html"
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_empty_default_prelude_is_reported() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            <html><body>
            <script>
            window.bpTexPreludeTable = Object.assign({}, window.bpTexPreludeTable || {}, {"default":""});
            </script>
            <code class="bp_math inline">\\Q</code>
            </body></html>
            """,
        )
        errs = audit_file(path)
        assert len(errs) == 1
        assert "empty default TeX prelude" in errs[0]


def test_nonempty_default_prelude_passes() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            """
            <html><body>
            <script>
            window.bpTexPreludeTable = Object.assign({}, window.bpTexPreludeTable || {}, {"default":"\\\\newcommand{\\\\Q}{\\\\mathbb{Q}}"});
            </script>
            <code class="bp_math inline" data-bp-tex-prelude-id="default">\\Q</code>
            </body></html>
            """,
        )
        assert audit_file(path) == []


if __name__ == "__main__":
    test_empty_default_prelude_is_reported()
    test_nonempty_default_prelude_passes()
    print("check_built_math_prelude tests passed")
