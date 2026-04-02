#!/usr/bin/env python3
from __future__ import annotations

import argparse
import html
import json
from pathlib import Path
import re
import subprocess
import sys


PRELUDE_RE = re.compile(
    r'window\.bpTexPreludeTable = Object\.assign\(\{\}, window\.bpTexPreludeTable \|\| \{\}, (\{.*?\})\);\s*</script>',
    re.S,
)
CODE_RE = re.compile(
    r'<code class="bp_math (inline|display)"([^>]*)>(.*?)</code>',
    re.S,
)
ATTR_RE = re.compile(r'([a-zA-Z0-9_-]+)="(.*?)"')


def default_paths(root: Path) -> list[Path]:
    return sorted((root / "_out" / "site" / "html-multi").rglob("*.html"))


def parse_page(path: Path) -> tuple[dict[str, str], list[dict[str, str | bool]]]:
    text = path.read_text(encoding="utf-8")
    m = PRELUDE_RE.search(text)
    prelude_table = json.loads(m.group(1)) if m else {}
    nodes: list[dict[str, str | bool]] = []
    for mode, raw_attrs, body in CODE_RE.findall(text):
        attrs = {k: html.unescape(v) for k, v in ATTR_RE.findall(raw_attrs)}
        nodes.append(
            {
                "mode": mode,
                "tex": html.unescape(body),
                "prelude_id": attrs.get("data-bp-tex-prelude-id", ""),
                "prelude_fallback": attrs.get("data-bp-tex-prelude", ""),
            }
        )
    return prelude_table, nodes


def render_failures(root: Path, nodes: list[dict[str, str | bool]], prelude_table: dict[str, str]) -> list[dict[str, str | int]]:
    katex_path = root / ".lake" / "packages" / "verso" / "vendored-js" / "katex" / "katex.js"
    payload = json.dumps({"nodes": nodes, "preludeTable": prelude_table})
    script = f"""
const katex = require({katex_path.as_posix()!r});
const payload = JSON.parse(process.argv[1]);
const failures = [];
for (let i = 0; i < payload.nodes.length; i++) {{
  const node = payload.nodes[i];
  const preludeId = String(node.prelude_id || '').trim();
  const prelude =
    preludeId && typeof payload.preludeTable[preludeId] === 'string'
      ? String(payload.preludeTable[preludeId]).trim()
      : String(node.prelude_fallback || '').trim();
  const tex = String(node.tex || '');
  const input = prelude ? `${{prelude}}\\n${{tex}}` : tex;
  const out = katex.renderToString(input, {{
    throwOnError: false,
    displayMode: node.mode === 'display'
  }});
  const m = out.match(/katex-error[^>]*title="([^"]*)"/);
  if (m) {{
    failures.push({{ index: i, mode: node.mode, tex, error: m[1] }});
  }}
}}
process.stdout.write(JSON.stringify(failures));
"""
    result = subprocess.run(
        ["node", "-e", script, payload],
        cwd=root,
        capture_output=True,
        text=True,
        check=False,
    )
    if result.returncode != 0:
        msg = result.stderr.strip() or result.stdout.strip() or "node render audit failed"
        raise RuntimeError(msg)
    return json.loads(result.stdout)


def audit_file(root: Path, path: Path) -> list[str]:
    prelude_table, nodes = parse_page(path)
    if not nodes:
        return []
    failures = render_failures(root, nodes, prelude_table)
    return [
        f"{path}: math node {failure['index']} ({failure['mode']}) failed KaTeX render: {failure['tex']} :: {failure['error']}"
        for failure in failures
    ]


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Render built blueprint math nodes through the vendored KaTeX bundle and fail on page-level render errors."
    )
    parser.add_argument("paths", nargs="*", type=Path)
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    paths = [p.resolve() for p in args.paths] if args.paths else default_paths(root)

    missing = [path for path in paths if not path.exists()]
    if missing:
        for path in missing:
            print(f"missing file: {path}", file=sys.stderr)
        return 2

    failures: list[str] = []
    for path in paths:
        failures.extend(audit_file(root, path))

    if failures:
        print("Built math render audit failed:")
        for failure in failures:
            print(f"- {failure}")
        print(f"\n{len(failures)} built math node(s) failed KaTeX rendering.")
        return 1

    print(f"Built math render audit passed for {len(paths)} file(s).")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
