#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import re
import subprocess
import sys


PRELUDE_RE = re.compile(r'tex_prelude\s+r#"(.*?)"#', re.S)
PROBE_CASES = [
    (
        "builtin-preservation",
        # KaTeX already defines short names such as \N, \Z, \R, and \Reals.
        # The prelude must not trip over those built-ins.
        r"\N \Z \R \Reals",
    ),
    (
        "source-macro-coverage",
        # These names exist in the old FLT prelude but are not provided by KaTeX.
        r"\A \Q \F \Qp \Ql \Qbar \Qpbar \Qlbar \bbC \GQ \GQp \GQl \m \GK \GN \Kbar \Qhat \calO \calOhat \bbH \p \rhobar \Zhat",
    ),
    (
        "operator-macro-coverage",
        # The old TeX source uses \DeclareMathOperator for these, but KaTeX
        # requires them to be expressed through macros that expand to
        # \operatorname{...}.
        r"\Gal(\Qbar/\Q) \avoid \Aut \GL \PGL \PSL \SL \Spec \sep \ab \tr \Hom \Frob",
    ),
]


def extract_prelude(path: Path) -> str:
    text = path.read_text(encoding="utf-8")
    m = PRELUDE_RE.search(text)
    if not m:
        raise ValueError(f"could not find tex_prelude raw string in {path}")
    return m.group(1)


def katex_probe(
    root: Path,
    prelude: str,
    probe_cases: list[tuple[str, str]] | None = None,
) -> str | None:
    katex_path = root / ".lake" / "packages" / "verso" / "vendored-js" / "katex" / "katex.js"
    cases = probe_cases or PROBE_CASES
    script = f"""
const katex = require({katex_path.as_posix()!r});
const prelude = {prelude!r};
const cases = {cases!r};
for (const [label, probe] of cases) {{
  try {{
    katex.renderToString(prelude + "\\n" + probe, {{ throwOnError: true, displayMode: false }});
  }} catch (err) {{
    process.stdout.write(label + ": " + String(err));
    process.exit(1);
  }}
}}
"""
    result = subprocess.run(
        ["node", "-e", script],
        cwd=root,
        capture_output=True,
        text=True,
        check=False,
    )
    if result.returncode == 0:
        return None
    msg = result.stdout.strip() or result.stderr.strip() or "KaTeX prelude probe failed"
    return msg


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Check that FLTBlueprint/TeXPrelude.lean is accepted by the vendored KaTeX runtime."
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    prelude_path = root / "FLTBlueprint" / "TeXPrelude.lean"
    try:
        prelude = extract_prelude(prelude_path)
    except ValueError as e:
        print(str(e), file=sys.stderr)
        return 2

    failure = katex_probe(root, prelude)
    if failure is not None:
        print("TeX prelude KaTeX audit failed:")
        print(f"- {prelude_path}: {failure}")
        return 1

    print(f"TeX prelude KaTeX audit passed for {prelude_path}.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
