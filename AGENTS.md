# Verso FLT Integration Notes

This repository is the integration layer for the FLT Verso blueprint.

## Layout

- The root directory is the blueprint and harness root.
- `FLT/` is the upstream FLT formalization checkout and should be treated as
  upstream-owned Lean code.
- Keep all Verso blueprint sources, scripts, CI wiring, and generated output
  management at the repository root, not inside `FLT/`.

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

## If Something Does Not Line Up

- If a declaration needs to be referenced, add or fix the `(lean := "...")`
  target in the Verso document rather than copying the Lean code.
- If the current FLT declarations do not compile on the chosen toolchain, treat
  that as a separate compatibility issue to fix deliberately in the FLT fork,
  ideally in a way that can be proposed upstream.
