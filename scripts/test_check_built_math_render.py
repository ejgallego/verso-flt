#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_built_math_render import parse_page


def write_tmp(tmp: Path, body: str) -> Path:
    path = tmp / "page.html"
    path.write_text(textwrap.dedent(body), encoding="utf-8")
    return path


def test_parse_page_extracts_prelude_and_math_nodes() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        path = write_tmp(
            Path(tmpdir),
            r'''
            <html><body>
            <script>
            window.bpTexPreludeTable = Object.assign({}, window.bpTexPreludeTable || {}, {"default":"\\providecommand{\\Q}{\\mathbb{Q}}"});
            </script>
            <code class="bp_math inline" data-bp-tex-prelude-id="default">\Q</code>
            </body></html>
            ''',
        )
        table, nodes = parse_page(path)
        assert table["default"] == r"\providecommand{\Q}{\mathbb{Q}}"
        assert len(nodes) == 1
        assert nodes[0]["tex"] == r"\Q"
        assert nodes[0]["prelude_id"] == "default"


if __name__ == "__main__":
    test_parse_page_extracts_prelude_and_math_nodes()
    print("check_built_math_render tests passed")
