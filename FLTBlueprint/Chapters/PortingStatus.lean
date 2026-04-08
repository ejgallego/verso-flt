import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "TeX To Verso Porting Status" =>

:::group "porting_status"
This chapter records the current harness-level view of how far the Verso port
has progressed relative to the TeX blueprint. The harness migration is largely
done, and the LT workflow has now converged onto the stricter source-paired
methodology. `LT` is the canonical repository term, while `LF` (`LaTeX
Fidelity` / `Literal Fidelity`) and `TF` (`Translation Faithfulness`) are
accepted aliases for the same workflow. Earlier chapter-level LT-pass claims
are not treated here as trusted certification, but the current local LT
dashboard now reports zero exact drift across the direct-port chapter set.
:::

# Literal Translation Policy

:::definition "literal_translation_policy" (parent := "porting_status")
This tracker now uses a stricter literal-translation policy than some earlier
porting notes did.

- `LT` is the canonical term in this tracker
- `LF` and `TF` are accepted aliases for the same translation-faithfulness
  workflow
- the default goal for a direct port is an LT pass, not a semantic
  reinterpretation
- LT work translates the TeX source into Verso but does not improve or smooth
  the source prose just because it could be written better
- users may say `LT`, `LF`, or `TF`; in this repository they all refer to the
  same workflow
- when the TeX source uses mathematical notation, the default LT move is to
  keep it as mathematical notation rather than demoting it into code spans
- Verso syntax discipline matters for LT work: directive headers and attachment
  options should stay syntactically conservative, and raw TeX commands should
  not be left in ordinary Verso prose
- earlier LT-pass labels are provisional only; they do not count as trusted LT
  certification without local source witnesses
- each translated informal block should sit immediately next to a labeled
  `tex` block carrying the corresponding TeX source excerpt
- sentence order, paragraph order, section order, and
  theorem/definition/proof order from the TeX source are treated as intentional
- one TeX witness block should not be amortized across several translated
  blocks when finer pairing is possible
- raw TeX blocks are preferred over paraphrased placeholder prose when a block
  cannot yet be translated cleanly
- extra blueprint nodes, theorem interfaces, and dependency scaffolding should
  not be invented unless the TeX source already warrants them or they are
  marked clearly as editorial harness notes
- metadata fidelity means preserving the source's intended dependency semantics,
  not copying TeX syntax mechanically; when the old blueprint splits one real
  dependency awkwardly across `\uses{...}` and prose `\ref{...}`, the Verso port
  may consolidate that into one source-grounded `{uses "..."}[]`
:::

# How To Read This Page

:::definition "porting_status_legend" (parent := "porting_status")
This tracker now uses four status labels.

- `LT-clean`: the local Verso chapter currently passes the strict LT checks used
  in this repository, including source-pair coverage, node-kind alignment, and
  zero exact drift on the local mechanical dashboard
- `LT-clean with source-side formalization debt`: the local Verso chapter is
  LT-clean, but the active TeX source still has labeled source nodes with no
  `\lean{...}` target or similar source-side formalization backlog
- `intentional stub or frontier`: the Verso chapter is deliberately partial because the TeX source is itself still a stub, work in progress, or placeholder-heavy frontier
- `harness-native`: the Verso chapter has no single TeX chapter counterpart and exists to support the harness or to expose project structure more clearly
:::

Direct-port chapters should now be read in two layers. First, ask whether the
local Verso chapter is LT-clean under the current source-paired methodology.
Second, ask whether the active TeX source still records missing `\lean{...}`
targets or unfinished proof sketches. Those are different questions, and the
current board keeps them separate.

The TeX source of truth for these chapter trackers lives in
`FLT/blueprint/src/chapter/*.tex`, together with the corresponding top-level
chapter wrappers. The harness status pages summarize the local porting state;
they do not replace the TeX source itself.

The refreshed VersoBlueprint 4.28 branch supports labeled `tex` blocks, and
the repository now treats them as the default LT witness format rather than as
something reserved only for leftover or open source snippets.

When chapter metadata, dependency edges, or completion status are unclear, the
harness should consult the original blueprint inputs in
`FLT/blueprint/src/web.tex`, `FLT/blueprint/src/plastex.cfg`,
`FLT/blueprint/notes_on_how_blueprint_works.txt`, and the TeX chapter sources
before inferring anything from memory.

# Main Expository Chapters

:::definition "main_expository_porting_status" (parent := "porting_status")
The current chapter-by-chapter status for the main proof spine is:

- `ch01introduction.tex` -> `Introduction.lean`: `LT-clean`
- `ch02reductions.tex` -> `Reductions.lean`: `LT-clean`
- `ch03freyold.tex` -> `EllipticFrey.lean`: `LT-clean`
- `ch03freyreduction.tex` -> `HardlyRamified.lean`: `LT-clean`
- `ch04overview.tex` -> `Overview.lean`: `LT-clean with source-side formalization debt`
- `ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`: `LT-clean with source-side formalization debt`
- `ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`: `LT-clean`
- `ch07exampleGLn.tex` -> `LanglandsGLn.lean`: `LT-clean`
- `global_langlands.tex` -> `GlobalLanglands.lean`: `intentional stub or frontier`
- `chtopbestiary.tex` -> `Bestiary.lean`: `LT-clean with source-side formalization debt`
:::

# Miniproject Chapters

:::definition "miniproject_porting_status" (parent := "porting_status")
The current miniproject-side status is:

- `AdeleMiniproject.tex` -> `AdeleProject.lean`: `LT-clean`
- `FrobeniusProject.tex` -> `FrobeniusProject.lean`: `LT-clean`
- `FujisakiProject.tex` -> `FujisakiProject.lean`: `LT-clean`
- `HaarCharacterProject.tex` -> `HaarCharacters.lean`: `LT-clean`
- `HeckeOperatorProject.tex` -> `HeckeOperators.lean`: `LT-clean`
- `QuaternionAlgebraProject.tex` -> `QuaternionAlgebras.lean`: `LT-clean`
:::

These chapters are broadly ported already, and the current LT dashboard now
confirms that local exact drift has been cleared. The remaining chapter-side
work is no longer broad source pairing but source-side formalization debt and a
small reviewed upstream queue of prose-reference suggestions and dangling TeX
`\uses` targets.

# Harness-Native Chapters

:::definition "harness_native_status" (parent := "porting_status")
Some chapters are part of the Verso harness rather than direct ports of one TeX
chapter.

- `HistoricalInputs.lean`: `harness-native`
  This chapter records explicit assumptions already surfaced as Lean declarations.
- `MiniProjects.lean`: `harness-native`
  This chapter is a legacy blueprint map explaining how the TeX miniprojects feed the broader Verso structure.
:::

# Current Snapshot

:::definition "porting_status_snapshot" (parent := "porting_status")
At the moment, the repository has broad Verso coverage of the direct-port
chapters, and the strict local LT dashboard is now green on exact drift:

- the direct-port chapter set passes the source-pair audit
- the direct-port chapter set passes the node-kind audit
- the current LT dashboard reports zero low-similarity blocks, zero exact
  metadata drift, zero label-regrounding drift, and zero witness mismatch
  hints

The main remaining frontiers are now:

- source-side formalization debt still recorded in `PortingTodo.md`,
  especially missing `\lean{...}` targets in active TeX source nodes
- reviewed upstream suggestions now tracked in `UpstreamSuggestions.md`,
  covering prose `\ref{...}` candidates and definite dangling TeX `\uses`
  targets
- KaTeX-facing cleanup for math-heavy chapters, especially where old TeX macro
  expectations still need to be encoded explicitly in the local prelude
- the intentional frontier material in `GlobalLanglands.lean`
:::

# Comparison Tool

:::definition "future_harness_plan" (parent := "porting_status")
A first harness draft of the literal-translation comparison tool now exists,
following a suggestion from David.

- the current script is `python3 tools/verso-harness/scripts/check_lt_similarity.py --project-root .`
- it compares translated blocks against the adjacent local `tex` witness blocks
  rather than against a chapter only at coarse whole-file granularity
- it normalizes markup on both sides before comparing the residual text
- it now separates exact LT drift from reviewed prose-reference suggestions, so
  the harness can distinguish local mismatch from upstream-review candidates
- future work is to tune the normalization and thresholds so the report is less
  noisy on math-heavy chapters
- future work is to expose better pointers to the old blueprint metadata path,
  including the original harness inputs and, when needed, regenerated graph /
  metadata artifacts from the TeX-side blueprint
- future work is to surface KaTeX-lint guidance more directly during math-heavy
  ports, while still treating the old TeX prelude as the primary source for
  which macros need to exist locally
- future work is to automate the audit for math-looking inline code spans so
  that TeX math is less likely to be silently downgraded into Verso literals
:::

:::proof "future_harness_plan"
The point of this tool is not to certify that a port is mathematically correct.
Its role is narrower and harness-oriented: once each translated block has a
local `tex` witness, strip Verso and TeX markup, compare the remaining text
with ordinary similarity measures, and use that report as one input to LT
audits.

That would give the project a cheap regression signal for chapter ports: when a
translated block drifts too far from the TeX source in wording or ordering, the
harness should be able to flag it automatically for re-audit.
:::

:::definition "chapter_audit_todo_index" (parent := "porting_status")
The repository-level chapter audit is now split into two layers.

- `PortingTodo.md` tracks source markers, missing Lean targets, and unfinished
  proof sketches drawn from the active TeX source.
  It intentionally ignores legacy `\leanok` / `\mathlibok` completion flags,
  and for now also ignores explicit `\notready` markers, as a source of
  backlog. In particular, a source block already marked complete is not kept
  open merely because the old TeX source omitted a `\lean{...}` attachment.
- the stricter LT audit tracks whether each translated informal block has a
  local adjacent `tex` witness block, checked with
  `python3 tools/verso-harness/scripts/check_lt_source_pairs.py --project-root .`
- the mechanical drift report compares each translated block to its adjacent
  witness block with `python3 tools/verso-harness/scripts/check_lt_similarity.py --project-root .`
- reviewed prose `\ref{...}` suggestions and definite dangling TeX `\uses`
  targets are tracked separately in `UpstreamSuggestions.md`

That split matters because a chapter can look locally source-backed in the
node-oriented task board while still failing the stricter block-pair LT
methodology.

Highlights from this audit:

- the direct-port chapter set now passes the strict source-pair audit, and the
  current LT dashboard reports zero exact drift
- the node-oriented task board and the stricter LT audit answer different
  questions and should not be conflated
- the remaining board surface is now honest source-side formalization debt, not
  local LT mismatch
- `GlobalLanglands` still has placeholder `\lean` entries in the TeX source, so
  the relevant local task there is frontier tracking rather than forced
  attachment completeness
:::

:::definition "chapter_audit_todo_summary" (parent := "porting_status")
Chapter-by-chapter tracker:

- `Introduction` (`ch01introduction.tex` -> `Introduction.lean`)
  LT-clean.
- `Reductions` (`ch02reductions.tex` -> `Reductions.lean`)
  LT-clean.
- `Elliptic-Frey` (`ch03freyold.tex` -> `EllipticFrey.lean`)
  LT-clean.
- `Hardly Ramified` (`ch03freyreduction.tex` -> `HardlyRamified.lean`)
  LT-clean.
- `Overview` (`ch04overview.tex` -> `Overview.lean`)
  LT-clean with source-side formalization debt.
- `Automorphic Form Example` (`ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`)
  LT-clean with source-side formalization debt.
- `Modularity Lifting` (`ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`)
  LT-clean.
- `Langlands GLn` (`ch07exampleGLn.tex` -> `LanglandsGLn.lean`)
  LT-clean.
- `Global Langlands` (`global_langlands.tex` -> `GlobalLanglands.lean`)
  The remaining tasks here are still frontier-tracking tasks tied to the local
  TeX source blocks.
- `Frobenius Project` (`FrobeniusProject.tex` -> `FrobeniusProject.lean`)
  LT-clean.
- `Adele Project` (`AdeleMiniproject.tex` -> `AdeleProject.lean`)
  LT-clean.
- `Haar Characters` (`HaarCharacterProject.tex` -> `HaarCharacters.lean`)
  LT-clean.
- `Fujisaki Project` (`FujisakiProject.tex` -> `FujisakiProject.lean`)
  LT-clean.
- `Quaternion Algebras` (`QuaternionAlgebraProject.tex` -> `QuaternionAlgebras.lean`)
  LT-clean.
- `Hecke Operators` (`HeckeOperatorProject.tex` -> `HeckeOperators.lean`)
  LT-clean.
- `Bestiary` (`chtopbestiary.tex` -> `Bestiary.lean`)
  LT-clean with source-side formalization debt.
- `MiniProjects` (harness-native)
- `Historical Inputs` (harness-native)
- `Porting Status` (harness-native)
:::
