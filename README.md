# FLT Verso Blueprint

[![Blueprint Pages](https://github.com/ejgallego/verso-flt/actions/workflows/blueprint.yml/badge.svg)](https://github.com/ejgallego/verso-flt/actions/workflows/blueprint.yml)

Verso Blueprint port of the FLT Blueprint. The upstream formalization is carried
locally as the [`FLT`](FLT/) submodule.

Blueprint: <https://ejgallego.github.io/verso-flt/>
Upstream blueprint repository:
[ImperialCollegeLondon/FLT](https://github.com/ImperialCollegeLondon/FLT)

This repo follows the upstream blueprint strictly and translates its source
markup language to Verso with the help of AI. Credit for the original blueprint
and formalization belongs to the upstream project.

## Build the Blueprint site

```bash
bash ./scripts/ci-pages.sh
```

The harness command checks the dependency cache before running
`lake exe vbp build --output _out/site`.

This repository follows the shared
[`tools/verso-harness`](tools/verso-harness/) workflow. The root
[`lean-toolchain`](lean-toolchain) and the vendored formalization select Lean
v4.34.0-rc2. [`lakefile.lean`](lakefile.lean) pins `VersoBlueprint` to the
v4.34 revision with checked Blueprint references and section anchors. The root
mathlib revision stays aligned with the formalization.

## Translating references

Keep document tags, Blueprint labels, and Lean declaration names distinct.
Translate prose references to Blueprint nodes with `{bpref "label"}[]`; use
`uses` only for source-authorized dependency edges. References to chapters and
sections use Verso's `{ref "tag"}[link text]`, with the source label declared in
the destination's `%%%` metadata as `tag := "tag"`. These document references
display the chapter title instead of a TeX chapter number; ordinary `ref` needs
explicit link text.

`scripts/ci-pages.sh` checks the chapter and corrected lemma links against the
generated cross-references and HTML. To repeat this check after building:

```bash
python3 scripts/check_built_references.py --site-dir _out/site/html-multi
```

Keep the adjacent TeX witness unchanged when correcting a stale source reference,
and record the correction in [UpstreamSuggestions.md](UpstreamSuggestions.md).
The correction from `nolean-U1-coset-decomposition` to
`bijOn_unipotent_mul_diagU1_U1diagU1` is recorded in
[lt-source-deviations.toml](lt-source-deviations.toml) as a `[[reference]]` entry.
The metadata audit accepts it only for the reviewed witness fingerprint and
requires the destination to exist in the active source. Remove or review the
entry when the upstream reference changes.
