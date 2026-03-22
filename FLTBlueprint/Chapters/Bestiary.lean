import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.Citations

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Appendix: A Collection Of Results Needed In The Proof" =>

:::group "bestiary_appendix"
The old TeX appendix is a holding area for major background results that were
known before 1990 and will eventually migrate into more focused chapters.
:::

This appendix is intentionally heterogeneous. Some items are straightforward to
state but hard to prove. Others are not even easy to state cleanly in Lean yet
because the necessary surrounding definitions are still missing. The role of the
appendix is to make that frontier explicit.

# Class field theory

The TeX appendix begins with the local case and, for simplicity, speaks only
about finite extensions of `ℚ_p`. The point is not that the global theory is
absent, but that local class field theory and local Galois cohomology already
contain most of the background phenomena the FLT project eventually needs.

:::theorem "maximal_unramified_extension_placeholder" (parent := "bestiary_appendix")
For a finite extension `K / ℚ_p`, the maximal unramified extension should be
Galois with Galois group canonically identifiable with `\widehat{ℤ}` in the two
normalizations corresponding to arithmetic and geometric Frobenius.
:::

:::definition "local_weil_group_placeholder" (parent := "bestiary_appendix")
The appendix records the local Weil group and local class field theory among
the core background items still waiting for polished Lean-facing statements.
:::

:::theorem "local_class_field_theory_placeholder" (parent := "bestiary_appendix")
Local class field theory is one of the major background theorems still waiting
to be integrated into the main project narrative from this appendix.
:::

:::theorem "local_galois_cohomology_package" (parent := "bestiary_appendix")
The local cohomology package includes finiteness, cohomological dimension two,
top-degree identifications, Poincare duality, and Euler-Poincare formulas.
These are exactly the inputs referenced abstractly by {uses "s_good_lift_condition"}[]; the old appendix cites Serre's Galois cohomology text {Informal.citep serreGalCoh}[] throughout this package.
:::

:::theorem "global_class_field_theory_placeholder" (parent := "bestiary_appendix")
Global class field theory should identify the connected components of
`A_N^× / N^×` with the abelianized absolute Galois group of a number field `N`,
compatibly with the local reciprocity maps.
:::

:::theorem "skinner_wiles_cft_trick_placeholder" (parent := "bestiary_appendix")
The appendix isolates a global class-field-theoretic construction that produces
finite solvable extensions with prescribed local behavior and optional
disjointness from an auxiliary field.
:::

:::proof "skinner_wiles_cft_trick_placeholder"
This is the background theorem later referenced in the modularity lifting story
as the class-field-theory part of the Skinner--Wiles trick.
:::

# Structures on the points of an affine variety

:::definition "topology_on_affine_variety_points_placeholder" (parent := "bestiary_appendix")
If `X = Spec(A)` is affine of finite type over a field `K` and `R` is a
topological `K`-algebra, then the `R`-points of `X` should inherit the subspace
topology coming from the product topology on maps `A → R`.
:::

:::theorem "affine_variety_point_topology_computation" (parent := "bestiary_appendix")
When an affine variety is embedded as a closed subscheme of affine space, the
point-set topology described above should agree with the induced subspace
topology from the ambient finite-dimensional `R`-space.
:::

:::definition "manifold_on_affine_variety_points_placeholder" (parent := "bestiary_appendix")
For smooth affine varieties over `ℝ`, `ℂ`, or finite extensions of `ℚ_p`, the
point set should carry a natural manifold structure.
:::

:::proof "manifold_on_affine_variety_points_placeholder"
The appendix presents this as the conjectural bridge from algebraic geometry to
the analytic spaces on which automorphic forms live.
:::

# Algebraic groups and automorphic forms

:::definition "connected_reductive_group_placeholder" (parent := "bestiary_appendix")
The appendix also tracks the background definitions of connected reductive
groups, Lie-group structures on real and complex points, and automorphic-form
notions in generality well beyond the immediate FLT needs.
:::

:::proof "connected_reductive_group_placeholder"
The point of the appendix is triage rather than completion: it marks the
high-level objects that the project will eventually need to state precisely.
They are later specialized in {uses "automorphic_form_general_notion"}[] and {uses "automorphic_form_for_gln"}[].
:::

:::definition "automorphic_form_placeholder" (parent := "bestiary_appendix")
The appendix’s fully general automorphic-form definition includes local
constancy on the finite adelic side, smoothness on the archimedean side,
left-invariance under rational points, finite-level conditions, infinitesimal
character conditions, and a growth condition.
:::

:::definition "cuspidal_automorphic_representation_placeholder" (parent := "bestiary_appendix")
The eventual automorphic-representation theory is meant to include cusp forms,
their decomposition into irreducible pieces, and the local tensor-product
decomposition of admissible representations.
:::

:::theorem "automorphic_representation_local_decomposition_placeholder" (parent := "bestiary_appendix")
An admissible automorphic representation should decompose as a restricted tensor
product of local representations, unramified at almost all finite places.
:::

# Galois representations

:::definition "compatible_family_placeholder" (parent := "bestiary_appendix")
The appendix records the notion of a compatible family of Galois
representations: a common coefficient field, a finite bad set, Frobenius
polynomials away from that set, and ℓ-adic realizations compatible with those
polynomials.
:::

:::theorem "automorphic_to_galois_representation_placeholder" (parent := "bestiary_appendix")
One of the major missing theorem statements is the construction of compatible
Galois representations from automorphic representations of an inner form of
GL2 over a totally real field.
:::

# Algebraic geometry

:::definition "shimura_varieties_placeholder" (parent := "bestiary_appendix")
The project still needs precise Lean definitions of the compact Shimura curves
and surfaces attached to suitable inner forms of GL2.
:::

:::theorem "moret_bailly_placeholder" (parent := "bestiary_appendix")
Moret--Bailly's theorem on points with prescribed local behavior is one of the
major geometric inputs still tracked from the appendix.
:::

:::proof "moret_bailly_placeholder"
The TeX appendix presents this theorem as a key input to potential modularity;
see {Informal.citep moretBailly1990}[].
:::

# Algebra

:::theorem "finite_subgroups_of_pgl2_placeholder" (parent := "bestiary_appendix")
The appendix records the classification of finite subgroups of
`PGL₂(\overline{𝔽}_p)` as a background algebraic input still to be stated
cleanly.
:::
