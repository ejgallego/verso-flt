# FLT Verso Blueprint

This repository is the Verso port and integration repo for the FLT blueprint.

- Upstream formalization: [`FLT/`](/home/egallego/lean/verso-flt/FLT)
- Shared harness: [`tools/verso-harness/`](/home/egallego/lean/verso-flt/tools/verso-harness)
- Harness config: [`verso-harness.toml`](/home/egallego/lean/verso-flt/verso-harness.toml)

## Pages

- Public site: <https://ejgallego.github.io/verso-flt/>
- Workflow: <https://github.com/ejgallego/verso-flt/actions/workflows/blueprint.yml>
- Local build: `bash ./scripts/ci-pages.sh`
- Local output: `_out/site/html-multi/index.html`

## Port Source

The written-mathematics source of truth remains the TeX blueprint in
`FLT/blueprint/src/chapter/*.tex`.

For normal blueprint and integration work in this repo, treat `FLT/` as
read-only. Make harness and Verso chapter changes in the repository root unless
you are explicitly doing FLT upstream or fork work.

## Workflow

This repo is a consumer of the shared harness. For startup, retrofit, LT audit,
and maintenance rules, use the harness docs:

- [`tools/verso-harness/README.md`](/home/egallego/lean/verso-flt/tools/verso-harness/README.md)
- [`tools/verso-harness/references/start-new-port.md`](/home/egallego/lean/verso-flt/tools/verso-harness/references/start-new-port.md)
- [`tools/verso-harness/references/retrofit.md`](/home/egallego/lean/verso-flt/tools/verso-harness/references/retrofit.md)
- [`AGENTS.md`](/home/egallego/lean/verso-flt/AGENTS.md)

Project-specific FLT status surfaces remain local:

- [`FLTBlueprint/Chapters/PortingStatus.lean`](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/PortingStatus.lean)
- [`PortingTodo.md`](/home/egallego/lean/verso-flt/PortingTodo.md)

## Notes

- Root `lean-toolchain` follows the upstream formalization toolchain.
- `lakefile.lean` pins the matching `VersoBlueprint` branch for that toolchain.
- Generic LT commands should be run via `tools/verso-harness/scripts/...`.
