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

The TeX chapter is explicit that this appendix is temporary and unorganized. It
is meant as a task map for the community rather than a polished mathematical
text, and it repeatedly warns that several of the listed “definitions” are not
yet formalized well enough even to begin theorem statements seriously.

:::definition "appendix_role_definition" (parent := "bestiary_appendix")
The appendix is project-management infrastructure: it is where the blueprint
records the missing background stack before that material has been migrated into
dedicated chapters or promoted to explicit assumptions.
:::

# Class field theory

The TeX appendix begins with the local case and, for simplicity, speaks only
about finite extensions of `ℚ_p`. The point is not that the global theory is
absent, but that local class field theory and local Galois cohomology already
contain most of the background phenomena the FLT project eventually needs.

Let `K` be such a finite extension of `ℚ_p`. The TeX appendix begins by fixing
notation for the profinite completion `\widehat{ℤ}` because arithmetic and
geometric Frobenius are stated there in terms of explicit maps to
`\widehat{ℤ}`.

:::theorem "maximal_unramified_extension_placeholder" (parent := "bestiary_appendix")
For a finite extension `K / ℚ_p`, the maximal unramified extension should be
Galois with Galois group canonically identifiable with `\widehat{ℤ}` in the two
normalizations corresponding to arithmetic and geometric Frobenius.
:::

:::proof "maximal_unramified_extension_placeholder"
The TeX appendix is explicit about the normalization issue here: there are two
equally natural identifications, one sending `1` to arithmetic Frobenius and
the other to geometric Frobenius. The point of recording both is not pedantry;
later local-global statements genuinely depend on the chosen normalization.
:::

:::definition "local_weil_group_placeholder" (parent := "bestiary_appendix")
The appendix records the local Weil group and local class field theory among
the core background items still waiting for polished Lean-facing statements.
The Weil group is introduced by pulling back the surjection to
`\widehat{ℤ}` from {uses "maximal_unramified_extension_placeholder"}[] along
the discrete integers.
:::

:::theorem "local_class_field_theory_placeholder" (parent := "bestiary_appendix")
Local class field theory is one of the major background theorems still waiting
to be integrated into the main project narrative from this appendix.
It is stated in the appendix as the reciprocity isomorphism attached to
{uses "local_weil_group_placeholder"}[].
:::

:::proof "local_class_field_theory_placeholder"
In the TeX appendix this is stated for finite extensions of `ℚ_p`, not because
the function-field case is irrelevant in principle, but because the FLT project
only needs the p-adic case and even that already carries most of the relevant
phenomena.
:::

:::theorem "local_galois_cohomology_package" (parent := "bestiary_appendix")
The local cohomology package includes finiteness, cohomological dimension two,
top-degree identifications, Poincare duality, and Euler-Poincare formulas.
These are exactly the inputs referenced abstractly by {uses "s_good_lift_condition"}[]; the old appendix cites Serre's Galois cohomology text {Informal.citep serreGalCoh}[] throughout this package.
:::

:::theorem "local_galois_cohomology_finiteness" (parent := "bestiary_appendix")
For finite coefficients `M`, the local Galois cohomology groups `H^i(G_K,M)` are
finite.
:::

:::theorem "local_galois_cohomology_dimension_two" (parent := "bestiary_appendix")
For torsion coefficients, local Galois cohomology vanishes above degree `2`.
:::

:::theorem "local_galois_cohomology_top_degree" (parent := "bestiary_appendix")
The top-degree group `H^2(G_K,\mu_n)` should be canonically identifiable with
`\mathbf{Z}/n\mathbf{Z}`.
:::

:::theorem "local_galois_cohomology_poincare_duality" (parent := "bestiary_appendix")
Local Galois cohomology should satisfy a Poincare-duality pairing between degree
`i` and degree `2-i`.
:::

:::theorem "local_galois_cohomology_euler_characteristic" (parent := "bestiary_appendix")
The local Galois cohomology groups satisfy an Euler-Poincare characteristic
formula.
:::

The appendix then explicitly summarizes the package by analogy: cohomology of a
local Galois group behaves like the cohomology of a compact connected
2-manifold.

The TeX notes also remark, more than once, that the word “canonical” is doing a
lot of work in these statements. In a Lean-facing treatment many of the claimed
equalities will have to become explicitly constructed maps or chosen
identifications rather than informal appeals to canonicality.

:::theorem "global_class_field_theory_placeholder" (parent := "bestiary_appendix")
Global class field theory should identify the connected components of
`A_N^× / N^×` with the abelianized absolute Galois group of a number field `N`,
compatibly with the local reciprocity maps.
This is the global continuation of {uses "local_class_field_theory_placeholder"}[].
:::

:::proof "global_class_field_theory_placeholder"
This is the global backdrop for the local reciprocity package above and the
Skinner--Wiles class-field-theory trick below. The appendix uses it to explain
why the relevant solvable extensions can be constructed with prescribed local
behavior.
:::

:::theorem "skinner_wiles_cft_trick_placeholder" (parent := "bestiary_appendix")
The appendix isolates a global class-field-theoretic construction that produces
finite solvable extensions with prescribed local behavior and optional
disjointness from an auxiliary field.
This is recorded as a consequence of {uses "global_class_field_theory_placeholder"}[].
:::

:::proof "skinner_wiles_cft_trick_placeholder"
This is the background theorem later referenced in the modularity lifting story
as the class-field-theory part of the Skinner--Wiles trick.
:::

:::theorem "poitou_tate_duality_placeholder" (parent := "bestiary_appendix")
The project will also eventually need Poitou--Tate duality, but the appendix
records it only at the level of dependencies because even the surrounding
Galois-cohomology language is still being assembled.
:::

# Structures on the points of an affine variety

The TeX appendix now switches from class field theory to a different kind of
background problem: how to put topological and manifold structures on points of
algebraic varieties.

:::definition "topology_on_affine_variety_points_placeholder" (parent := "bestiary_appendix")
If `X = Spec(A)` is affine of finite type over a field `K` and `R` is a
topological `K`-algebra, then the `R`-points of `X` should inherit the subspace
topology coming from the product topology on maps `A → R`.
:::

:::theorem "affine_variety_point_topology_computation" (parent := "bestiary_appendix")
When an affine variety is embedded as a closed subscheme of affine space, the
point-set topology described above should agree with the induced subspace
topology from the ambient finite-dimensional `R`-space.
This is the first check on {uses "topology_on_affine_variety_points_placeholder"}[].
:::

:::proof "affine_variety_point_topology_computation"
The appendix treats this as the key sanity check on the abstract definition of
the topology on `X(R)`: once an affine scheme is concretely embedded in affine
space, the formal topology should recover the one a working mathematician would
write down by hand.
:::

:::definition "manifold_on_affine_variety_points_placeholder" (parent := "bestiary_appendix")
For smooth affine varieties over `ℝ`, `ℂ`, or finite extensions of `ℚ_p`, the
point set should carry a natural manifold structure.
:::

:::theorem "lie_group_from_algebraic_group_placeholder" (parent := "bestiary_appendix")
For affine algebraic groups over `ℝ` or `ℂ`, the real or complex points should
form Lie groups.
:::

:::proof "lie_group_from_algebraic_group_placeholder"
The TeX appendix treats this as the concrete corollary of the manifold
construction on algebraic-variety points.
:::

:::proof "manifold_on_affine_variety_points_placeholder"
The appendix presents this as the conjectural bridge from algebraic geometry to
the analytic spaces on which automorphic forms live.
:::

The TeX appendix adds that the smooth case is the only one relevant in
applications, and even then the right generality for the manifold statement is
not yet settled.

# Algebraic groups and automorphic forms

Here the appendix becomes very candid: even stating the definitions correctly in
Lean is expected to be a substantial project, and some of the draft
generalizations may still contain imprecision.

The TeX source is also frank that, for the actual FLT project, one only needs
these definitions in much narrower settings: abelian algebraic groups and inner
forms of `GL₂` over totally real fields. The appendix works in greater
generality only to keep the long-term target visible.

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

:::definition "slowly_increasing_placeholder" (parent := "bestiary_appendix")
The appendix also isolates the slowly-increasing growth condition used in the
general definition of an automorphic form.
:::

:::theorem "slowly_increasing_well_defined_placeholder" (parent := "bestiary_appendix")
The slowly-increasing condition should be independent of the auxiliary choice
of finite-dimensional representation used to define the norm at infinity.
:::

:::definition "cuspidal_automorphic_representation_placeholder" (parent := "bestiary_appendix")
The eventual automorphic-representation theory is meant to include cusp forms,
their decomposition into irreducible pieces, and the local tensor-product
decomposition of admissible representations.
:::

:::definition "automorphic_form_actions_placeholder" (parent := "bestiary_appendix")
The spaces of automorphic forms and cusp forms should carry the natural
`(G(\mathbf{A}_N^f)\times U_\infty,\mathfrak g)`-module structures coming from
right translation and differential operators.
:::

:::theorem "automorphic_representation_local_decomposition_placeholder" (parent := "bestiary_appendix")
An admissible automorphic representation should decompose as a restricted tensor
product of local representations, unramified at almost all finite places.
:::

:::proof "automorphic_representation_local_decomposition_placeholder"
This is the global representation-theoretic package behind later chapters such
as {uses "automorphic_form_for_gln"}[]. The TeX appendix cites Flath's theorem
for this decomposition and uses it to explain why restricted products appear so
inevitably in automorphic representation theory.
:::

# Galois representations

At this point the TeX appendix records that the compatible-family definition was
already formalized modulo Frobenius elements. The surrounding Galois-side
theorem remains a much more distant target.

The appendix specifically credits Ivan Farabella for the compatible-family
definition and Jou Glasheen for the Frobenius existence input that makes such a
definition usable.

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

:::proof "automorphic_to_galois_representation_placeholder"
The appendix is very clear that this is far beyond the current Lean frontier.
But it is also one of the decisive theorems for the FLT strategy, because it is
the place where automorphic information is converted back into compatible
families of Galois representations.
:::

# Algebraic geometry

The appendix becomes sharply concrete again here. It points out that the proof
of Mazur's torsion theorem starts with algebraic-geometry language that Lean was
still far from handling, and uses that as a benchmark for how much surrounding
infrastructure is still missing.

The TeX chapter is especially pointed here: at the time of writing, Lean's
algebraic geometry could not even get through the first sentence of Mazur's
paper, and it recommends that sentence itself as a natural first milestone for
anyone who wants to formalize Mazur's theorem seriously.

:::definition "shimura_varieties_placeholder" (parent := "bestiary_appendix")
The project still needs precise Lean definitions of the compact Shimura curves
and surfaces attached to suitable inner forms of GL2.
:::

:::proof "shimura_varieties_placeholder"
The appendix emphasizes that even stating the right Shimura-theoretic objects is
nontrivial. They are not decorative geometry; they are the source of the Galois
representations that later chapters want to attach to automorphic forms.
:::

:::theorem "moret_bailly_placeholder" (parent := "bestiary_appendix")
Moret--Bailly's theorem on points with prescribed local behavior is one of the
major geometric inputs still tracked from the appendix.
:::

:::proof "moret_bailly_placeholder"
The TeX appendix presents this theorem as a key input to potential modularity;
see {Informal.citep moretBailly1990}[].
:::

The theorem is recorded there with all of the local prescribed-behavior and
linearly-disjointness data visible, precisely because that is the form needed
later in potential modularity arguments.

# Algebra

The appendix closes with one deliberately elementary-looking but strategically
useful classification theorem: finite subgroups of `PGL₂`.

:::theorem "finite_subgroups_of_pgl2_placeholder" (parent := "bestiary_appendix")
The appendix records the classification of finite subgroups of
`PGL₂(\overline{𝔽}_p)` as a background algebraic input still to be stated
cleanly.
:::

:::proof "finite_subgroups_of_pgl2_placeholder"
The appendix gives the usual list: cyclic, dihedral, `A₄`, `S₄`, `A₅`, and the
finite groups of Lie type `PSL₂(k)` and `PGL₂(k)`. The point of keeping this in
the appendix is not because the classification is obscure, but because the
surrounding representation-theoretic infrastructure is still being assembled.

The TeX appendix closes with the aside that this one should at least be easy to
state, even if the surrounding project is not.
:::
