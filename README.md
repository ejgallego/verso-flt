# FLT Verso Blueprint

This repository is the Verso blueprint and integration layer for the FLT
project. The upstream Lean formalization lives in the `FLT/` submodule; the
Verso chapters, bibliography wiring, CI, and generated-site harness live at the
repository root.

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
