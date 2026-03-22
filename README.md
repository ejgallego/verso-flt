# FLT Verso Blueprint

This repository is the Verso blueprint and integration layer for the FLT
project. The upstream Lean formalization lives in the `FLT/` submodule; the
Verso chapters, bibliography wiring, CI, and generated-site harness live at the
repository root.

## Porting Policy

The TeX blueprint remains the source of truth for the written mathematics. The
porting goal in this repository is a faithful, as-near-word-for-word-as-
practical translation from TeX/`leanblueprint` layout into Verso layout, not a
substantive rewrite of the mathematical content.

When the TeX source records dependency edges with `\uses{...}`, the port should
preserve those edges as Verso `{uses "..."}[]` references inside the relevant
informal nodes or proofs so the dependency graph remains faithful too.

For the detailed chapter-by-chapter workflow and validation rules, see
`AGENTS.md`.

## Pages Artifact

The GitHub Pages build is defined in `.github/workflows/blueprint.yml`.

- Public Pages site: <https://ejgallego.github.io/verso-flt/>
- Local build command: `bash ./scripts/ci-pages.sh`
- Local site output: `_out/site/html-multi/index.html`
- Uploaded Pages artifact directory: `_out/site/html-multi`
- Workflow page: <https://github.com/ejgallego/verso-flt/actions/workflows/blueprint.yml>

For pull requests, the `Blueprint Pages` workflow uploads the generated site as
the Pages artifact. On pushes to `main`, the same artifact is deployed by the
workflow's `deploy` job.
