import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "TeX To Verso Porting Status" =>

:::group "porting_status"
This chapter records the current harness-level view of how far the Verso port
has progressed relative to the TeX blueprint. The harness migration is largely
done, and the remaining work is now mostly literal-translation auditing,
rollback of interpretive drift where needed, and source-local cleanup rather
than broad infrastructure.
:::

# Literal Translation Policy

:::definition "literal_translation_policy" (parent := "porting_status")
This tracker now uses a stricter literal-translation policy than some earlier
porting notes did.

- the default goal for a direct port is a literal translation pass, not a
  semantic reinterpretation
- sentence order, paragraph order, section order, and
  theorem/definition/proof order from the TeX source are treated as intentional
- raw TeX blocks are preferred over paraphrased placeholder prose when a block
  cannot yet be translated cleanly
- extra blueprint nodes, theorem interfaces, and dependency scaffolding should
  not be invented unless the TeX source already warrants them or they are
  marked clearly as editorial harness notes
:::

# How To Read This Page

:::definition "porting_status_legend" (parent := "porting_status")
This tracker uses four status labels.

- `literal translation pass completed`: the TeX chapter has had an explicit chapter-level pass preserving sentence order, paragraph order, section order, theorem order, and claim order modulo the layout translation into Verso
- `structured port present`: the Verso chapter exists and covers the TeX topic substantially, but it has not yet been re-audited under the stricter literal-translation standard and may still contain interpretive restructuring
- `intentional stub or frontier`: the Verso chapter is deliberately partial because the TeX source is itself still a stub, work in progress, or placeholder-heavy frontier
- `harness-native`: the Verso chapter has no single TeX chapter counterpart and exists to support the harness or to expose project structure more clearly
:::

`literal translation pass completed` is a narrow harness claim. It says that
the chapter has received an explicit LT audit relative to the TeX source. It is
not a claim that the mathematics is fully formalized or that every placeholder
has disappeared.

Older harness notes sometimes used broader "fidelity" language that certified
section order and dependency story without certifying literalness. That wording
has been retired here because it overstates how close an interpretive port is
to the TeX source.

The TeX source of truth for these chapter trackers lives in
`FLT/blueprint/src/chapter/*.tex`, together with the corresponding top-level
chapter wrappers. The harness status pages summarize the local porting state;
they do not replace the TeX source itself.

The refreshed VersoBlueprint 4.28 branch supports labeled `tex` blocks, so
open source snippets can be attached locally in raw form when that is the
cleanest way to keep the chapter close to the TeX source of truth. Many of the
direct-port chapters now use that pattern for the remaining open blocks.

# Main Expository Chapters

:::definition "main_expository_porting_status" (parent := "porting_status")
The current chapter-by-chapter status for the main proof spine is:

- `ch01introduction.tex` -> `Introduction.lean`: `structured port present`
  Large parts of the chapter already stay close to the source and keep raw TeX nearby, but the chapter has not yet been re-certified chapter-wide under the LT audit standard.
- `ch02reductions.tex` -> `Reductions.lean`: `structured port present`
  The chapter currently has all `lean :=` targets resolved in the 4.28 baseline, but LT certification is still pending.
- `ch03freyold.tex` -> `EllipticFrey.lean`: `literal translation pass completed`
  The chapter has been re-audited against the TeX source, with the earlier English wrapper ids replaced by the source labels through both the arithmetic and irreducibility halves.
- `ch03freyreduction.tex` -> `HardlyRamified.lean`: `literal translation pass completed`
  The chapter has been re-audited against the TeX source, with the coefficient-ring prelude kept as source prose and the main theorem labels restored to the TeX naming.
- `ch04overview.tex` -> `Overview.lean`: `literal translation pass completed`
  The chapter has been re-audited against the TeX source and the earlier extra theorem/proof scaffolding around source prose has been removed.
- `ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`: `literal translation pass completed`
  The chapter has been re-audited against the TeX source, with the introductory and adelic wrapper scaffolding rolled back to the TeX section and label structure.
- `ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`: `literal translation pass completed`
  The TeX source itself is still a work in progress, but the current Verso chapter has been rolled back to the current draft instead of preserving the earlier extra statement-level scaffolding.
- `ch07exampleGLn.tex` -> `LanglandsGLn.lean`: `structured port present`
- `global_langlands.tex` -> `GlobalLanglands.lean`: `intentional stub or frontier`
- `chtopbestiary.tex` -> `Bestiary.lean`: `structured port present`
  The appendix is still placeholder-heavy by design, but its current Verso chapter now follows the TeX appendix’s frontier-tracking role and section structure closely.
:::

# Miniproject Chapters

:::definition "miniproject_porting_status" (parent := "porting_status")
The current miniproject-side status is:

- `AdeleMiniproject.tex` -> `AdeleProject.lean`: `structured port present`
- `FrobeniusProject.tex` -> `FrobeniusProject.lean`: `structured port present`
  This one is also a project success story, with the main theorem upstreamed to mathlib; the current Verso chapter now follows the TeX statement/proof strategy through the auxiliary fixed-field steps as well.
- `FujisakiProject.tex` -> `FujisakiProject.lean`: `structured port present`
  The chapter now covers the TeX goal/setup, the adelic compactness proof spine, and the two finite-adelic consequences stated at the end of the original miniproject.
- `HaarCharacterProject.tex` -> `HaarCharacters.lean`: `structured port present`
- `HeckeOperatorProject.tex` -> `HeckeOperators.lean`: `structured port present`
- `QuaternionAlgebraProject.tex` -> `QuaternionAlgebras.lean`: `structured port present`
:::

These chapters are generally further along than a bare stub but more uneven in
how much explicit chapter-by-chapter LT auditing has been recorded in the
harness so far. In the current baseline, they are mostly source-backed already;
the main remaining work is literal-translation certification and local rollback
of interpretive structure where that drifted from the source.

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
automorphic-form example is largely in place in Verso, but most direct-port
chapters have not yet been re-certified under the LT audit standard. Most of
the remaining work is chapter-by-chapter LT review, rollback of interpretive
scaffolding where needed, and local source-block cleanup. The main remaining
frontiers are:

- LT re-audits of existing direct-port chapters
- the intentional frontier material in `GlobalLanglands.lean`
:::

# Future Plan

:::definition "future_harness_plan" (parent := "porting_status")
One planned harness improvement is a literal-translation comparison tool,
following a suggestion from David.

- the tool should take a `.lean` chapter file and the corresponding `.tex`
  source file
- it should erase or normalize markup on both sides before comparing the
  residual text
- it should report standard text-distance or text-similarity metrics so the
  harness can detect interpretive drift quantitatively rather than only by
  manual review
:::

:::proof "future_harness_plan"
The point of this tool is not to certify that a port is mathematically correct.
Its role is narrower and harness-oriented: after stripping Verso and TeX
markup, compare the remaining text with ordinary distance measures such as edit
distance or similar normalized scores, and use that report as one input to LT
audits.

That would give the project a cheap regression signal for chapter ports: when a
chapter drifts too far from the TeX source in wording or ordering, the harness
should be able to flag it automatically for re-audit.
:::

:::definition "chapter_audit_todo_index" (parent := "porting_status")
The repository-level chapter audit is now tracked as source-backed local TeX
block tasks rather than as a stale exact-match checklist. Each item points at
the corresponding TeX snippet in `FLT/blueprint/src/chapter/*.tex` and records
the local Verso follow-up needed for that block. That reflects the current
state well: the harness is mostly settled, and the remaining work is LT
auditing, rollback of interpretive drift where needed, and local source
preservation.

When the right follow-up is to keep the source visible, attach the raw excerpt
in a labeled `tex` block next to the local note or proof instead of rewriting
it away.

Highlights from this audit:

- `Introduction` remains among the cleanest source-backed chapter blocks.
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
  LT pass completed.
- `Hardly Ramified` (`ch03freyreduction.tex` -> `HardlyRamified.lean`)
  LT pass completed.
- `Overview` (`ch04overview.tex` -> `Overview.lean`)
  LT pass completed.
- `Automorphic Form Example` (`ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`)
  LT pass completed.
- `Modularity Lifting` (`ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`)
  LT pass completed.
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
