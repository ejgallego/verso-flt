import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "TeX To Verso Porting Status" =>

:::group "porting_status"
This chapter records the current harness-level view of how far the Verso port
has progressed relative to the TeX blueprint.
:::

# How To Read This Page

:::definition "porting_status_legend" (parent := "porting_status")
This tracker uses four status labels.

- `fidelity pass completed`: the TeX chapter has had an explicit chapter-level pass restoring section order, theorem order, and the main dependency story in the current Verso chapter
- `substantial port present`: the Verso chapter exists and covers the TeX topic substantially, but has not yet been tracked here as having received a recent end-to-end fidelity audit
- `intentional stub or frontier`: the Verso chapter is deliberately partial because the TeX source is itself still a stub, work in progress, or placeholder-heavy frontier
- `harness-native`: the Verso chapter has no single TeX chapter counterpart and exists to support the harness or to expose project structure more clearly
:::

`fidelity pass completed` is a harness claim, not a claim that the mathematics
is fully formalized or that every placeholder has disappeared. A chapter can be
high-fidelity as prose and still depend on informal nodes, explicit
assumptions, or unresolved Lean links.

The TeX source of truth for these chapter trackers lives in
`FLT/blueprint/src/chapter/*.tex`, together with the corresponding top-level
chapter wrappers. The harness status pages summarize the local porting state;
they do not replace the TeX source itself.

The refreshed VersoBlueprint 4.28 branch supports labeled `tex` blocks, so
open source snippets can be attached locally in raw form when that is the
cleanest way to keep the chapter close to the TeX source of truth.

# Main Expository Chapters

:::definition "main_expository_porting_status" (parent := "porting_status")
The current chapter-by-chapter status for the main proof spine is:

- `ch01introduction.tex` -> `Introduction.lean`: `fidelity pass completed`
- `ch02reductions.tex` -> `Reductions.lean`: `fidelity pass completed`
  The chapter currently has all `lean :=` targets resolved in the 4.28 baseline.
- `ch03freyold.tex` -> `EllipticFrey.lean`: `fidelity pass completed`
- `ch03freyreduction.tex` -> `HardlyRamified.lean`: `fidelity pass completed`
- `ch04overview.tex` -> `Overview.lean`: `fidelity pass completed`
- `ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`: `fidelity pass completed`
  The chapter received explicit fidelity passes on both the `\widehat{\mathbf{Z}}` and Hurwitz halves.
- `ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`: `fidelity pass completed`
  The TeX source itself is still a work in progress, so fidelity here means fidelity to the current draft rather than closure of the theorem-statement frontier.
- `ch07exampleGLn.tex` -> `LanglandsGLn.lean`: `fidelity pass completed`
- `global_langlands.tex` -> `GlobalLanglands.lean`: `intentional stub or frontier`
- `chtopbestiary.tex` -> `Bestiary.lean`: `fidelity pass completed`
  The appendix is still placeholder-heavy by design, but its current Verso chapter now follows the TeX appendix’s frontier-tracking role and section structure closely.
:::

# Miniproject Chapters

:::definition "miniproject_porting_status" (parent := "porting_status")
The current miniproject-side status is:

- `AdeleMiniproject.tex` -> `AdeleProject.lean`: `fidelity pass completed`
  The status, cheap-versus-restricted-product setup, finite and infinite base-change story, and the final discrete/cocompact embedding section have all received explicit fidelity passes.
- `FrobeniusProject.tex` -> `FrobeniusProject.lean`: `fidelity pass completed`
  This one is also a project success story, with the main theorem upstreamed to mathlib; the current Verso chapter now follows the TeX statement/proof strategy through the auxiliary fixed-field steps as well.
- `FujisakiProject.tex` -> `FujisakiProject.lean`: `fidelity pass completed`
  The chapter now covers the TeX goal/setup, the adelic compactness proof spine, and the two finite-adelic consequences stated at the end of the original miniproject.
- `HaarCharacterProject.tex` -> `HaarCharacters.lean`: `fidelity pass completed`
  The additive/ring-level setup, examples, algebraic determinant formulas, restricted-product section, and adelic application have all received explicit fidelity passes.
- `HeckeOperatorProject.tex` -> `HeckeOperators.lean`: `fidelity pass completed`
  The abstract theory, restricted-product and local matrix setup, adelic group construction, concrete operators, and Hecke-algebra endpoint have all received explicit fidelity passes.
- `QuaternionAlgebraProject.tex` -> `QuaternionAlgebras.lean`: `fidelity pass completed`
:::

These chapters are generally further along than a bare stub but more uneven in
how much explicit chapter-by-chapter fidelity auditing has been recorded in the
harness so far.

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
At the moment, the core FLT proof spine from the introduction through the
automorphic-form example is no longer just sketched in Verso. The main
remaining fidelity frontier is:

- the intentional frontier material in `GlobalLanglands.lean`
:::

:::definition "chapter_audit_todo_index" (parent := "porting_status")
The repository-level chapter audit is now tracked as source-backed local TeX
block tasks rather than as a stale exact-match checklist. Each item points at
the corresponding TeX snippet in `FLT/blueprint/src/chapter/*.tex` and records
the local Verso follow-up needed for that block.

When the right follow-up is to keep the source visible, attach the raw excerpt
in a labeled `tex` block next to the local note or proof instead of rewriting
it away.

Highlights from this audit:

- `Introduction`, `Overview`, and `LanglandsGLn` remain among the cleanest
  source-backed chapter blocks.
- `Reductions`, `FrobeniusProject`, `AdeleProject`, and most miniproject
  chapters still need focused dependency `\uses` work at the block level.
- `GlobalLanglands` still has placeholder `\lean` entries in the TeX source, so
  the relevant local task is to track the frontier faithfully rather than force
  exact `lean :=` matching.
:::

:::definition "chapter_audit_todo_summary" (parent := "porting_status")
Chapter-by-chapter tracker:

- `Introduction` (`ch01introduction.tex` -> `Introduction.lean`)
  Source-backed local TeX block tasks remain current, and the chapter-level
  Verso structure is in good shape.
- `Reductions` (`ch02reductions.tex` -> `Reductions.lean`)
  The audit work here is still organized around the local TeX blocks rather
  than a stale exact-declaration match.
- `Elliptic-Frey` (`ch03freyold.tex` -> `EllipticFrey.lean`)
- `Hardly Ramified` (`ch03freyreduction.tex` -> `HardlyRamified.lean`)
- `Overview` (`ch04overview.tex` -> `Overview.lean`)
- `Automorphic Form Example` (`ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`)
- `Modularity Lifting` (`ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`)
- `Langlands GLn` (`ch07exampleGLn.tex` -> `LanglandsGLn.lean`)
- `Global Langlands` (`global_langlands.tex` -> `GlobalLanglands.lean`)
  The remaining tasks here are still frontier-tracking tasks tied to the local
  TeX source blocks.
- `Frobenius Project` (`FrobeniusProject.tex` -> `FrobeniusProject.lean`)
- `Adele Project` (`AdeleMiniproject.tex` -> `AdeleProject.lean`)
- `Haar Characters` (`HaarCharacterProject.tex` -> `HaarCharacters.lean`)
- `Fujisaki Project` (`FujisakiProject.tex` -> `FujisakiProject.lean`)
- `Quaternion Algebras` (`QuaternionAlgebraProject.tex` -> `QuaternionAlgebras.lean`)
- `Hecke Operators` (`HeckeOperatorProject.tex` -> `HeckeOperators.lean`)
- `Bestiary` (`chtopbestiary.tex` -> `Bestiary.lean`)
- `MiniProjects` (harness-native)
- `Historical Inputs` (harness-native)
- `Porting Status` (harness-native)
:::
