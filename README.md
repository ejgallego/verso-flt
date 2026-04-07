# FLT Verso Blueprint

This repository is the Verso blueprint and integration layer for the FLT
project. The upstream Lean formalization lives in the `FLT/` submodule; the
Verso chapters, bibliography wiring, CI, and generated-site harness live at the
repository root.

## Porting Policy

The TeX blueprint remains the source of truth for the written mathematics, and
the local chapter sources live in `FLT/blueprint/src/chapter/*.tex`. The
porting goal in this repository is a faithful, as-near-word-for-word-as-
practical translation from TeX/`leanblueprint` layout into Verso layout, not a
substantive rewrite of the mathematical content.

For normal work in this repository, treat `FLT/` as strictly read-only,
including `FLT/blueprint/src/chapter/*.tex`. Use those files as the reference
source for the port, but make blueprint/integration changes in the repository
root unless you are explicitly doing FLT upstream/fork work.

The repository uses `LT` as the canonical term for this workflow, but `LF`
(`LaTeX Fidelity` / `Literal Fidelity`) and `TF` (`Translation Faithfulness`)
are accepted aliases meaning the same thing. The first pass is a translation
effort, not a writing-improvement effort: translate the TeX source into Verso
as faithfully as possible, but do not rewrite the source just because the prose
could be smoothed, clarified, or modernized. Editorial improvement is a
separate follow-up effort to be requested explicitly.

The harness now treats this as an LT-first workflow. The first pass on a
chapter should preserve paragraph boundaries, sentence order,
section/theorem/proof order, and local claim order from the TeX source. New
blueprint structure should only be introduced when the TeX source already has a
corresponding formal item or when a clearly marked editorial note is
unavoidable.

Adding outer-repo placeholder interfaces is not an acceptable way to "complete"
the port. If a source-grounded block has no real TeX-side `\lean{...}` target
and no honest existing formal declaration to attach, leave it unattached rather
than adding `(lean := "..._placeholder")` or importing a helper placeholder
module. In this repository that counts as a priority-1 LT violation, not as
progress.

When a TeX source block is a `lemma`, `corollary`, or `definition`, preserve
that environment kind in Verso too. In practice, use `:::lemma_` for TeX
lemmas, `:::corollary` for TeX corollaries, `:::definition` for TeX
definitions, and reserve `:::theorem` for actual TeX theorems rather than using
it as a generic theorem-like wrapper.

When the TeX source uses mathematical notation, the default is to keep it as
mathematical notation in Verso too. Variables, formulas, congruences, and maps
should not routinely be rewritten as code spans just because that is
convenient; code spans are for Lean names, APIs, file paths, literal syntax,
and other genuinely code-like material.

Users may say `LT`, `LF`, or `TF`; in this repository they all refer to the
same translation-faithfulness workflow.

Previous LT-pass claims are not treated as trustworthy on their own. The
current LT methodology is stricter: every translated informal block must sit
immediately next to a labeled `tex` block carrying the corresponding source
excerpt. A chapter is not LT-audited until that source pairing is in place
throughout the chapter.

The refreshed VersoBlueprint 4.28 branch supports labeled `tex` blocks, so the
repository now uses them as the default LT witness format rather than only for
leftover source snippets. Do not batch one TeX block across several translated
blocks when a finer-grained pairing is possible.

When the TeX source records dependency edges with `\uses{...}`, the port should
preserve those edges as Verso `{uses "..."}[]` references inside the relevant
informal nodes or proofs so the dependency graph remains faithful too.
This is semantic fidelity, not TeX-syntax literalism: if the old blueprint
expresses one intended dependency awkwardly through a mix of `\uses{...}` and
prose `\ref{...}`, the Verso port may consolidate that into one source-grounded
`{uses "..."}[]` in the relevant node or proof. But prose references that are
not carrying real dependency content should remain prose references rather than
being promoted automatically into graph edges.

The refreshed VersoBlueprint 4.28 compatibility branch is already synced into
the local harness; follow the documented build and porting rules here rather
than assuming any extra special directive.

When missing labels, dependency edges, or completion metadata are unclear, do
not guess. Check the old blueprint harness inputs in
`FLT/blueprint/src/web.tex`, `FLT/blueprint/src/plastex.cfg`,
`FLT/blueprint/notes_on_how_blueprint_works.txt`, and the TeX sources
themselves. If that still leaves ambiguity, treat regeneration or inspection of
the old blueprint graph / metadata artifacts as harness follow-up work.

For math-heavy ports, KaTeX linting in `verso-blueprint` is one of the fastest
ways to catch bad syntax and missing macros. In most cases the needed macro
definitions should be recoverable from the original blueprint prelude in
`FLT/blueprint/src/macro/common.tex`, then ported intentionally into
`FLTBlueprint/TeXPrelude.lean`.

Two recurring Verso syntax pitfalls are worth keeping in mind during direct
porting:
- keep directive headers and attachment options on one line when possible
- do not leave raw TeX commands like `\ref` or `\emph` in ordinary Verso prose;
  either keep them in the local `tex` witness or translate them into parser-safe
  Verso/math/prose form
- do not translate TeX inline math `$a$` into malformed Verso `$`a`$`; the
  correct Verso inline form is `$`a``

For the detailed chapter-by-chapter workflow and validation rules, see
`AGENTS.md`.

## Dependency Discipline

This repository is intended to enrich upstream FLT, not to carry an
independently drifting FLT dependency state.

- Keep `FLT/` verbatim with respect to the upstream FLT repository state you are
  targeting.
- Do not edit files under `FLT/` during normal blueprint/integration work in
  this repository unless the user explicitly asks for FLT-side work.
- Treat the committed `FLT/lake-manifest.json` as the source of truth for the
  exact upstream dependency artifact, especially the pinned `mathlib` revision.
- Do not run a general `lake update` in `FLT/` unless you are deliberately
  changing the upstream FLT dependency artifact.
- Prefer `lake exe cache get` over dependency refreshes whenever the goal is to
  reuse the existing upstream artifact.

On slow connections it is easy to accidentally fetch or compile a second copy of
`mathlib` from the repository root. The outer harness and `FLT/` share the same
`mathlib` pin, so when the root `.lake/packages/mathlib` checkout is missing or
partial, prefer reusing `FLT/.lake/packages/mathlib` rather than letting Lake
start a fresh clone.

Also note that the `mathlib` cache is not the same thing as a fully native-built
dependency tree. In this repository:

- `lake exe cache get` populates the cached Lean artifacts needed for checking
  modules cheaply.
- `lake env lean <file>` and `lean-beam` are the preferred validation paths when
  you want to avoid native-compiling dependency object files.
- `nice lake build blueprint-gen` and `bash ./scripts/ci-pages.sh` may still
  native-compile `Mathlib.*:c.o` objects even when the cache is present, because
  they build executables rather than only checking Lean modules.

So the reliable low-bandwidth workflow is:

```bash
cd FLT
lake exe cache get
lake build

cd ..
lake env lean FLTBlueprint/Chapters/SomeChapter.lean
lean-beam sync FLTBlueprint/Chapters/SomeChapter.lean
```

Reserve `nice lake build blueprint-gen` or `bash ./scripts/ci-pages.sh` for the
point where native compilation of the outer harness is acceptable.

For the current strict LT source-pair audit, run:

```bash
python3 scripts/check_lt_source_pairs.py
```

To check that theorem/lemma/corollary/definition node kinds match the adjacent
TeX source environment, run:

```bash
python3 scripts/check_blueprint_node_kinds.py
```

For a human-friendly combined LT audit on one or more chapters, run:

```bash
python3 scripts/lt_audit.py FLTBlueprint/Chapters/HeckeOperators.lean
python3 scripts/lt_audit.py FLTBlueprint/Chapters/AdeleProject.lean --pages
```

For a compact project-status snapshot, run:

```bash
python3 scripts/status_lt.py FLTBlueprint/Chapters/HeckeOperators.lean FLTBlueprint/Chapters/AdeleProject.lean
```

Reviewed upstream-facing suggestions for possible TeX `\ref` to `\uses`
promotion now live in `UpstreamSuggestions.md`. Those are review items, not
current LT drift.

For the first draft of the block-level LT similarity report, following David's
idea of using a mechanical drift signal, run:

```bash
python3 scripts/check_lt_similarity.py
python3 scripts/check_lt_similarity.py --verbose
```

The similarity report now also surfaces metadata drift heuristics:
- missing / extra `\uses{...}` vs `{uses "..."}[]`
- missing / extra `\lean{...}` vs `(lean := "...")`
- placeholder-only `(lean := "..._placeholder")` attachments as priority-1 LT
  violations
- TeX `\ref{...}` labels that are still only weak reference hints rather than
  mirrored explicit dependency metadata
- default output is summary-first for humans; `--verbose` restores the detailed
  per-block dump for agents and tool debugging

For regression checks on the LT similarity tool itself, run:

```bash
python3 scripts/test_check_lt_similarity.py
```

For malformed Verso math delimiters, especially bad TeX-to-Verso translations
like `$`a`$`, run:

```bash
python3 scripts/check_verso_math_delimiters.py
```

This same audit now also flags suspicious inline code spans that look like
TeX/math and probably should have been translated as Verso math rather than as
literal code spans. For the full per-occurrence dump, use:

```bash
python3 scripts/check_verso_math_delimiters.py --verbose
```

For the current TeX-to-Verso status snapshot inside the generated blueprint
harness, see the `TeX To Verso Porting Status` chapter.

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
