import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Automorphic Forms And The Langlands Conjectures" =>

:::group "gln_langlands_program"
This chapter ports the TeX discussion of automorphic forms on
GLn over Q and the shape of the global Langlands reciprocity
conjectures in that setting. Its immediate goal is modest: make the automorphic
side precise enough that the later conjectural reciprocity statement can at
least be formulated cleanly.
:::

The old TeX chapter explains that this material came out of conversations in
Bonn and had a deliberately modest but precise goal: not to prove the global
Langlands conjectures for `GL_n/ℚ`, but to reach a mathematically serious formal
statement of the conjectural objects on the automorphic side.

# Definition for GLn over Q

:::definition "automorphic_form_for_gln" (parent := "gln_langlands_program")
The old chapter specializes the general theory to GLn over Q,
where the dual group is again GLn(C) and many technical
obstructions disappear.
:::

:::proof "automorphic_form_for_gln"
The TeX source says explicitly that this follows the Corvallis exposition of
Borel and Jacquet {Informal.citep corvallisAutomorphicForms}[]. The point is not
that `GL_n/ℚ` is the final destination of the project, but that it is the first
place where one can write down a serious automorphic-form definition without
first building the full formal apparatus of dual groups for arbitrary connected
reductive groups.
:::

The TeX discussion begins by explaining why `GL_n` is the natural first testing
ground. For a general connected reductive group one needs the Langlands dual
group and a large amount of surrounding Lie theory. For `GL_n/ℚ`, the dual group
is simply `GL_n(C)`, so many of those technical issues disappear.

:::definition "finite_adeles_of_q_gln" (parent := "gln_langlands_program")
The finite adeles of `ℚ` appear as the coefficient ring for the finite part of
the automorphic variable.
:::

:::proof "finite_adeles_of_q_gln"
The TeX chapter notes that mathlib already knows the finite adeles of `ℚ` as a
commutative `ℚ`-algebra and already proves that they form a topological ring.
:::

:::definition "adelic_general_linear_group" (parent := "gln_langlands_program")
The adelic general linear group is the product of the finite adelic `GL_n` with
the real Lie group `GL_n(ℝ)`.
:::

:::proof "adelic_general_linear_group"
The old blueprint is explicit that this is morally just `GL_n(A_Q^f) × GL_n(ℝ)`,
using the product decomposition of the adeles into finite and infinite parts.
:::

:::definition "smooth_gln_function" (parent := "gln_langlands_program")
Smoothness is split into three conditions: continuity, smoothness in the real
direction, and local constancy on the finite adelic direction.
:::

The TeX chapter emphasizes that this is a mixed definition: the infinite part is
handled with manifold smoothness, while the finite adelic direction is handled
by local constancy. This is exactly the kind of hybrid analytic/algebraic object
that makes automorphic forms awkward to formalize in full generality.

:::theorem "finite_level_condition_gln" (parent := "gln_langlands_program")
The finite-adelic part of an automorphic form should factor through some compact
open level subgroup, so the resulting object is locally constant in the finite
direction and genuinely finite-level.
:::

:::proof "finite_level_condition_gln"
The TeX definition does not treat local constancy as mere regularity. It uses
local constancy together with compact openness to package the finite-level
condition that later produces Hecke operators by double-coset averaging.

This is the `GL_n` analogue of the fixed-level structure already emphasized in
the quaternionic chapters.
:::

:::definition "slowly_increasing_gln_function" (parent := "gln_langlands_program")
The growth condition is factored into a separate notion of slowly-increasing
function on GLn(R).
:::

The TeX chapter introduces an explicit size function on `GL_n(ℝ)` built from
`MM^T` and `(M^{-1})(M^{-T})`, so that slowly-increasing means polynomial growth
with respect to that size. The point is to isolate the growth condition from the
rest of the automorphic-form definition.

:::theorem "slow_growth_size_function_gln" (parent := "gln_langlands_program")
The size function on `GL_n(ℝ)` is designed to detect both very large and very
small singular values, so polynomial bounds in that size encode the standard
moderate-growth condition.
:::

:::proof "slow_growth_size_function_gln"
The TeX chapter defines the size as the trace of
`MM^T + M⁻¹M^{-T}`. This is a neat package: the first term sees large
eigenvalues, the second sees small ones, and together they rule out both kinds
of escape to infinity.

So the slowly-increasing condition is really the analytic growth control that
replaces the more classical “moderate growth” language.
:::

:::definition "weight_at_infinity_gln" (parent := "gln_langlands_program")
The weight at infinity is modeled by a finite-dimensional continuous
representation of a maximal compact subgroup such as On(R).
:::

The corresponding TeX explanation notes that the Lean definition is deliberately
incomplete: it does not yet insist on irreducibility, because the category-theory
and continuity packaging for those representations was still unsettled.

:::theorem "infinite_level_condition_gln" (parent := "gln_langlands_program")
The infinite-level condition is expressed through the action of the center of
the universal enveloping algebra: an automorphic form should be annihilated by
an ideal of finite codimension.
:::

:::proof "infinite_level_condition_gln"
The TeX chapter explains why this is really a differential-equation condition.
For classical modular forms, one can think of the Cauchy--Riemann equations as
the model example. In the general `GL_n(ℝ)` setting, the center of the
universal enveloping algebra packages the corresponding infinitesimal character
constraint.
:::

:::definition "centre_action_gln" (parent := "gln_langlands_program")
The center of the universal enveloping algebra acts by differential operators,
encoding the infinite-level conditions in the automorphic-form definition.
:::

The TeX chapter builds this in three steps: first the Lie algebra acts on smooth
complex-valued functions on `GL_n(ℝ)`, then its complexification acts, and then
the universal enveloping algebra and its center act. This is the algebraic
encoding of the differential-equation side of automorphic forms.

:::theorem "automorphic_forms_fixed_data_finite_dimensional" (parent := "gln_langlands_program")
After fixing the weight, a compact open finite level, and the infinite-level
ideal, the resulting space of automorphic forms should be finite-dimensional.
The TeX chapter attributes this to Harish-Chandra.
:::

:::proof "automorphic_forms_fixed_data_finite_dimensional"
This theorem is not on the immediate FLT critical path, but it explains why the
definition has exactly the five conditions it does. The finite-level and
infinite-level packages are not decorative; together with the weight and growth
condition they cut down the huge smooth-function space to a manageable
finite-dimensional one.

That is also why the chapter treats Hecke operators only after all five
conditions have been stated.
:::

:::definition "full_automorphic_form_definition_gln" (parent := "gln_langlands_program")
Combining periodicity, finite level, weight, infinitesimal character, and
growth yields the intended definition of an automorphic form for
GLn(AQ).
:::

The old TeX definition lists five conditions explicitly:

- periodicity under `GL_n(ℚ)`
- invariance under some compact open finite level
- a finite-dimensional weight condition at infinity
- finite codimension for the annihilator of the center action
- the slowly-increasing growth condition

It also points out that, once a weight, finite level, and infinite level are
fixed, the resulting space should be finite-dimensional by Harish-Chandra's
theorem.

:::theorem "cuspidal_automorphic_form_gln_placeholder" (parent := "gln_langlands_program")
There is also a cuspidal refinement of the definition, obtained by imposing the
vanishing of appropriate adelic integrals.
This is the version that should ultimately interact with the conjectural
Langlands correspondence.
:::

:::proof "cuspidal_automorphic_form_gln_placeholder"
The TeX chapter only mentions cusp forms briefly, but the mathematical reason is
clear: the global Langlands conjectures are meant to attach Galois
representations to automorphic representations of the right kind, and the
cuspidal spectrum is the natural home for the irreducible arithmetic objects.
:::

:::theorem "hecke_operator_action_gln" (parent := "gln_langlands_program")
The finite adelic group acts on these spaces, giving the usual Hecke operators
after passing to fixed compact open level.
:::

:::proof "hecke_operator_action_gln"
The TeX chapter phrases this in the standard adelic way: a finite adelic element
acts by right translation on the finite coordinate, and double-coset averaging
then produces the familiar Hecke operators on the fixed-level subspaces.
:::

# Langlands target

:::theorem "global_langlands_reciprocity_target_gln" (parent := "gln_langlands_program")
The ultimate target of the chapter is a clean statement of the global Langlands
reciprocity conjecture for `GL_n/ℚ`: algebraic automorphic representations on
the automorphic side should correspond to Galois representations with matching
local and global properties.
:::

:::proof "global_langlands_reciprocity_target_gln"
The separate `global_langlands.tex` notes make clear why this remains only a
target. Even once the `GL_n` automorphic objects are stated, the conjecture
still hides a large amount of infrastructure: connected reductive groups, dual
groups, local-global compatibility, and the correct de Rham conditions on the
Galois side.

So the current chapter deliberately stops after building the automorphic side in
the first nontrivial case. That is already enough to make the scope of the
future conjectural statement mathematically serious rather than purely
aspirational.
:::
