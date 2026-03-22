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
conjectures in that setting.
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

:::definition "slowly_increasing_gln_function" (parent := "gln_langlands_program")
The growth condition is factored into a separate notion of slowly-increasing
function on GLn(R).
:::

The TeX chapter introduces an explicit size function on `GL_n(ℝ)` built from
`MM^T` and `(M^{-1})(M^{-T})`, so that slowly-increasing means polynomial growth
with respect to that size. The point is to isolate the growth condition from the
rest of the automorphic-form definition.

:::definition "weight_at_infinity_gln" (parent := "gln_langlands_program")
The weight at infinity is modeled by a finite-dimensional continuous
representation of a maximal compact subgroup such as On(R).
:::

The corresponding TeX explanation notes that the Lean definition is deliberately
incomplete: it does not yet insist on irreducibility, because the category-theory
and continuity packaging for those representations was still unsettled.

:::definition "centre_action_gln" (parent := "gln_langlands_program")
The center of the universal enveloping algebra acts by differential operators,
encoding the infinite-level conditions in the automorphic-form definition.
:::

The TeX chapter builds this in three steps: first the Lie algebra acts on smooth
complex-valued functions on `GL_n(ℝ)`, then its complexification acts, and then
the universal enveloping algebra and its center act. This is the algebraic
encoding of the differential-equation side of automorphic forms.

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

:::theorem "hecke_operator_action_gln" (parent := "gln_langlands_program")
The finite adelic group acts on these spaces, giving the usual Hecke operators
after passing to fixed compact open level.
:::

:::proof "hecke_operator_action_gln"
The TeX chapter phrases this in the standard adelic way: a finite adelic element
acts by right translation on the finite coordinate, and double-coset averaging
then produces the familiar Hecke operators on the fixed-level subspaces.
:::
