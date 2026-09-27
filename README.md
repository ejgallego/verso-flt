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
v4.34.0. [`lakefile.lean`](lakefile.lean) pins `VersoBlueprint` to the
matching v4.34 release branch and keeps the root mathlib revision aligned with
the formalization.
