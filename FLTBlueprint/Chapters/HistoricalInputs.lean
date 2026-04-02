import FLT.Assumptions.KnownIn1980s
import FLT.Assumptions.Mazur
import FLT.Assumptions.Odlyzko
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Historical Inputs" =>

:::group "historical_inputs"
During the current project phase, the FLT formalization is allowed to assume
results that were known before 1990 while the reduction chain is made precise.
This chapter records the highest-signal assumptions that are already surfaced as
Lean declarations.
:::

The TeX-era project documentation is very clear about the role of these
assumptions. The first major target for the project is not a fully assumption-
free proof of FLT, but rather a proof that reduces FLT to results that were
already known by the end of 1989. As the project grows, more such assumptions
will be stated precisely, while some others cannot even be formulated until the
surrounding definitions exist.

:::definition "known_in_1980s_phase_boundary" (parent := "historical_inputs")
The `knownin1980s` axiom marks results that the project treats as available in
the first phase: they should be derivable from the pre-1990 literature even
when the corresponding formal proof is not yet present in the repository.
:::

The corresponding tactic is meant as a temporary project-management device. The
idea is to allow easy access to mathematics that was unquestionably in the
literature before 1990, then gradually replace broad uses of that tactic by a
small, explicit list of named assumptions and eventually by full formal proofs.

This point is important for fidelity to the original project notes: the
`knownin1980s` mechanism was never meant to be the finished interface, only the
first staging tool.

:::definition "formalized_assumptions_scope" (parent := "historical_inputs")
At the moment, the formally stated assumptions chapter is intentionally small:
the main examples already surfaced as Lean declarations are Mazur’s torsion
bound and the Odlyzko–Poitou discriminant bound.
:::

:::proof "formalized_assumptions_scope"
The chapter is small on purpose. The project is not trying to dump every
pre-1990 theorem into Lean as an undifferentiated axiom file; it is trying to
surface the assumptions that are already strategic bottlenecks in the current
proof spine.
:::

:::definition "forthcoming_assumptions_scope" (parent := "historical_inputs")
The assumptions README also lists future targets that should eventually become
formal assumptions once enough infrastructure exists: local/global class field
theory consequences, Moret--Bailly, Galois representations attached to
quaternionic automorphic forms, cyclic base change, Jacquet--Langlands, and
Poitou–Tate duality.
:::

:::proof "forthcoming_assumptions_scope"
This list already mirrors the appendix frontier recorded in
{uses "bestiary_appendix"}[]. The difference is one of maturity: appendix nodes
track mathematical obligations, while this chapter records which of those
obligations have become precise enough to promote into explicit project
assumptions.
:::

:::theorem "future_assumptions_pipeline" (parent := "historical_inputs")
The likely next assumptions to be promoted are the major appendix/theory
interfaces: class field theory, Moret--Bailly, automorphic-to-Galois
constructions, and Poitou--Tate duality.
:::

:::proof "future_assumptions_pipeline"
The chapter's own forward-looking list already names these themes. In current
blueprint terms, the relevant appendix nodes are
{uses "local_class_field_theory_placeholder"}[],
{uses "global_class_field_theory_placeholder"}[],
{uses "moret_bailly_placeholder"}[],
{uses "automorphic_to_galois_representation_placeholder"}[], and
{uses "poitou_tate_duality_placeholder"}[].

So the assumptions chapter and the appendix are not redundant: one marks the
currently explicit axioms, the other marks the queue of future axioms or future
proof targets.
:::

:::theorem "mazur_torsion_bound" (parent := "historical_inputs") (lean := "Mazur_statement")
Mazur's theorem bounds the size of the torsion subgroup of an elliptic curve
over $`\\mathbf{Q}`.
Within the FLT strategy, this is the key external input behind
{uses "Mazur_Frey"}[].
:::

:::proof "mazur_torsion_bound"
The TeX-side project notes explain why this theorem is indispensable. If a Frey
curve had a reducible `p`-torsion representation, then one would obtain too much
rational torsion on the curve, contradicting Mazur’s classification. So Mazur’s
theorem is the historical input that turns the vague “Frey curve should be
irreducible” intuition into a precise obstruction.

The assumption is recorded as a Lean axiom so the reduction chain can remain
explicit while the full geometric proof stays outside the current phase.
:::

:::theorem "odlyzko_root_discriminant_bound" (parent := "historical_inputs") (lean := "Odlyzko_statement")
Odlyzko-Poitou discriminant bounds rule out certain totally complex number
fields with too-small root discriminant.
In the planned FLT route, this is part of the $`3`-adic contradiction after
passing to a compatible family.
:::

:::proof "odlyzko_root_discriminant_bound"
This assumption is one of the explicit numerical inputs used to analyze the
specialization at $`3` after the modularity-lifting stage.

The project notes spell out the strategic point here too: this bound replaces
the older Langlands–Tunnell detour in the classical Wiles/Taylor–Wiles proof by
supporting a later contradiction on the 3-adic specialization of a compatible
family.
:::

:::theorem "explicit_assumptions_replace_broad_knownin1980s_uses" (parent := "historical_inputs")
One purpose of this chapter is to gradually replace broad uses of the
`knownin1980s` tactic by a short, explicit list of named assumptions.
:::

:::proof "explicit_assumptions_replace_broad_knownin1980s_uses"
The TeX-side project philosophy is that phase one should be historically
faithful but still precise. The generic `knownin1980s` mechanism is a temporary
project-management tool; the long-term aim is to replace it either by explicit
named assumptions such as {uses "mazur_torsion_bound"}[] and
{uses "odlyzko_root_discriminant_bound"}[], or by actual formal proofs.
:::
