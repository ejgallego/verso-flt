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

For the detailed chapter-by-chapter workflow and validation rules, see
`AGENTS.md`.

For the current strict LT source-pair audit, run:

```bash
python3 scripts/check_lt_source_pairs.py
```

For the first draft of the block-level LT similarity report, following David's
idea of using a mechanical drift signal, run:

```bash
python3 scripts/check_lt_similarity.py
```

For regression checks on the LT similarity tool itself, run:

```bash
python3 scripts/test_check_lt_similarity.py
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
