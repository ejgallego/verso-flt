# Verso FLT Integration Notes

This repository is the integration layer for the FLT Verso blueprint.

## Layout

- The root directory is the blueprint and harness root.
- `FLT/` is the upstream FLT formalization checkout and should be treated as
  upstream-owned Lean code.
- Keep all Verso blueprint sources, scripts, CI wiring, and generated output
  management at the repository root, not inside `FLT/`.
- There is no separate harness package anymore: the repository root itself is
  the harness.
- Use the `ejgallego/verso-blueprint` mirror as the Lake dependency source for
  `VersoBlueprint`; do not switch back to the private upstream URL in project
  config until the upstream repo is public.

## Source Of Truth

- The source of truth for the mathematics is the existing FLT formalization in
  `FLT/**/*.lean` together with `FLT/FermatsLastTheorem.lean`.
- When a Verso blueprint node refers to existing formalized mathematics, prefer
  `(lean := "...")` links to the real declaration names in those FLT files.
- Do not duplicate existing FLT declarations into the blueprint just to make a
  page render.

## Scope For The Port

- The goal of this migration is to move the blueprint infrastructure from TeX /
  `leanblueprint` to Verso / `verso-blueprint`.
- Keep the existing FLT formalization files unchanged for blueprint-port work
  unless we are doing explicit rc6 compatibility work intended for the FLT fork.

## Build Harness

- Prefer the focused target `nice lake build blueprint-gen`.
- The site-generation smoke test is `bash ./scripts/ci-pages.sh`.
- Fetch the mathlib cache before long verification runs.
- For Lean-facing checks on edited blueprint modules, prefer `lean-beam`
  (`ensure`, `sync`, `hover`, `run-at`) over full rebuild loops whenever that is
  enough to validate the change.

## Math Porting

- Verso Blueprint math syntax is easy to get wrong: inline math is opened with
  `$`` and closed with a backtick, not with a trailing dollar sign. For display
  math, use `$$`` ... ``.
- Keep shared TeX macros in a dedicated Lean module so the project has one
  canonical `tex_prelude` definition rather than ad hoc per-file macros.
- The shared prelude currently lives in
  `FLTBlueprint/TeXPrelude.lean`; extend that module rather than scattering
  `tex_prelude` declarations across chapter files.
- Reuse the old TeX blueprint macro vocabulary where practical, but keep the
  prelude small and intentional.
- The KaTeX linter is available through `verso-blueprint`, so math additions
  should be written with KaTeX compatibility in mind.
- When porting math-heavy text, prefer simple incremental edits and validate the
  edited module with Beam immediately after saving.
- In practice, after a real Lean edit, save the file and run `lean-beam sync`
  on the edited module before escalating to a larger `lake build`.

## If Something Does Not Line Up

- If a declaration needs to be referenced, add or fix the `(lean := "...")`
  target in the Verso document rather than copying the Lean code.
- If the current FLT declarations do not compile on the chosen toolchain, treat
  that as a separate compatibility issue to fix deliberately in the FLT fork,
  ideally in a way that can be proposed upstream.

## Porting Workflow

- Port TeX blueprint content into the root Verso chapters in this repository,
  not into `FLT/`.
- For each blueprint node, prefer attaching the real FLT declaration with
  `(lean := "...")`.
- Before adding a Lean reference, check that the needed FLT module chain can be
  imported from the root harness without pulling in unrelated rc6-broken code.
- If the declaration exists but the import chain fails on `v4.29.0-rc6`, treat
  that as an FLT-fork task first. Fix it in `FLT/`, push to
  `ejgallego/FLT`, and only then enable the blueprint link.
- Keep rc6 compatibility fixes in the FLT fork and keep blueprint/integration
  changes in the outer `verso-flt` repository.
- After FLT-fork changes land, update the `FLT/` submodule pointer in the outer
  repository.
