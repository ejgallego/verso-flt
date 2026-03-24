import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.Citations

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Fujisaki's Lemma" =>

:::group "fujisaki_project"
Fujisaki's lemma packages the adelic compactness statement that underlies the
finiteness of many spaces of quaternionic automorphic forms.
:::

The TeX chapter treats this as a noncommutative analogue of very classical
compactness results in algebraic number theory: class-group finiteness and
Dirichlet's theorem on units.

It also treats this as a genuinely adelic theorem rather than a purely
algebraic one. The input is a division algebra `D/K`, but the compactness lives
on a quotient of the norm-one part of the adelic unit group `D_A^×`.

# Goal

:::theorem "fujisaki_lemma_goal" (parent := "fujisaki_project")
For a finite-dimensional central simple algebra over a number field, the
quotient of the norm-one adelic units by the global units should be compact.
This is the compactness statement later used in {uses "finite_dimensional_quaternionic_forms"}[].
:::

:::proof "fujisaki_lemma_goal"
The old blueprint highlights this as the noncommutative compactness statement
that simultaneously generalizes class-group finiteness and Dirichlet's unit
theorem; it explicitly follows Voight's presentation {Informal.citep voightBook}[].
:::

:::theorem "commutative_prototype_for_fujisaki" (parent := "fujisaki_project")
The compact quotient theorem for a division algebra is meant to be the
noncommutative analogue of the classical compactness of
$`K \backslash \mathbf{A}_K`.
:::

:::proof "commutative_prototype_for_fujisaki"
The TeX chapter uses this analogy repeatedly. The quotient
{uses "adele_discrete_cocompact_embedding"}[] is the model case: a global field
embedded discretely in its adeles with compact quotient. Fujisaki's lemma asks
for the same style of compactness after replacing the commutative additive group
by the norm-one units in an adelic division algebra.
:::

# Initial definitions

The TeX chapter begins by reviewing the algebraic input. A central simple
algebra over a field has center exactly the base field and no nontrivial
two-sided ideals. Quaternion algebras are the four-dimensional examples, and
division algebras are the cases in which every nonzero element is invertible.

It then stresses that matrix algebras are the basic examples, that central
simple algebras behave well under base change, and that over algebraically
closed fields matrix algebras are essentially the only finite-dimensional
examples. The point is not just classification: it is to prepare the reader for
why the adelic algebra attached to a division algebra still has enough linear
structure for a compactness argument.

The TeX chapter is concrete here. It mentions Hamilton's quaternions over `ℝ`
as the motivating division-algebra example, contrasts them with matrix algebras
that are central simple but never division rings, and notes that quaternion
algebras over a general field play the same formal role later in the project.

:::definition "division_algebra_hypothesis_for_fujisaki" (parent := "fujisaki_project")
The final compactness theorem is stated for division algebras, not just arbitrary
central simple algebras, because nonzero elements then form a genuine group and
the difference set arguments in the proof land inside `D^×`.
:::

:::proof "division_algebra_hypothesis_for_fujisaki"
This distinction matters in the proof. Several steps start by producing a
nonzero element of `D` from adelic intersections and then immediately
reinterpret it as a unit. That shortcut is available only because the theorem is
specialized to division algebras.
:::

# Enter the adeles

:::definition "adelic_division_algebra_setup" (parent := "fujisaki_project")
The argument studies the adelic algebra $`D \otimes_K \mathbf{A}_K`$ together
with the Haar-character kernel inside its unit group, using {uses "adele_base_change"}[] and the API goal recorded in {uses "haar_character_goal"}[].
:::

The TeX chapter explains why the Haar-character package is exactly the right
input here. Once `D_A := D ⊗_K A_K` is viewed as a finite `A_K`-algebra with the
module topology, it becomes a locally compact topological ring, and the kernel
of its Haar character gives the norm-one part of the adelic unit group.

At that point the project’s compactness statement is a genuine quotient-space
claim about `Dˣ \ D_A^{(1)}`. The chapter is careful to note that this is a
subspace of the full unit group, equipped with the quotient topology coming from
the Haar-character kernel.

:::theorem "adelic_module_topologies_coincide" (parent := "fujisaki_project")
If a finite-dimensional `K`-algebra is tensored with the adeles, the resulting
`A_K`-module topology agrees with the `A_{\mathbf{Q}}`-module topology coming
from scalar restriction.
:::

:::proof "adelic_module_topologies_coincide"
The TeX chapter pauses to note this because `D_A` is often viewed both as
`D \otimes_K A_K` and as a finite module over `A_{\mathbf{Q}}` via a choice of
`K/\mathbf{Q}`-structure. The point is that no ambiguity of topology is being
introduced when switching between those viewpoints.
:::

# The proof

:::theorem "large_compact_set_mod_d_exists" (parent := "fujisaki_project")
There is a compact subset `E ⊆ D_A` such that for every
$`\beta \in D_A^{(1)}`, the translated set `βE` cannot inject into the quotient
$`D \backslash D_A`.
:::

:::proof "large_compact_set_mod_d_exists"
The TeX proof begins with the commutative comparison from
{uses "commutative_prototype_for_fujisaki"}[]. After choosing a `\mathbf{Q}`-basis
of `D`, one identifies `D_A` with a finite power of `\mathbf{A}_{\mathbf{Q}}`,
so the quotient `D \backslash D_A` inherits compactness from
`ℚ \backslash \mathbf{A}_{\mathbf{Q}}`.

One then chooses a compact set whose Haar measure is larger than the measure of
the quotient. Any translate of that set must then intersect two points mapping
to the same quotient class.
:::

:::definition "difference_set_x_for_fujisaki" (parent := "fujisaki_project")
From the compact set `E`, define the difference set `X = E - E`.
:::

:::definition "product_set_y_for_fujisaki" (parent := "fujisaki_project")
Define `Y = X · X`, the product of the difference set with itself.
:::

:::proof "product_set_y_for_fujisaki"
The TeX proof immediately takes these closures under subtraction and
multiplication because later steps need one set capturing additive
collisions and another capturing multiplicative combinations of those
collisions.
:::

:::theorem "difference_and_product_sets_compact" (parent := "fujisaki_project")
Both `X` and `Y` are compact subsets of the adelic algebra.
:::

:::proof "difference_and_product_sets_compact"
Each set is the continuous image of a compact product: `X` comes from `E × E`
under subtraction, and `Y` comes from `X × X` under multiplication.
:::

:::theorem "difference_set_meets_d_units" (parent := "fujisaki_project")
For every $`\beta \in D_A^{(1)}`, the translate `βX` meets `D^×`, and likewise
`Xβ⁻¹` meets `D^×`.
:::

:::proof "difference_set_meets_d_units"
This is the first real use of {uses "large_compact_set_mod_d_exists"}[]. If
`βE` fails to inject into the quotient, then two distinct points of `βE`
differ by an element of `D`. Because `D` is a division algebra, that nonzero
difference lies in `D^×`. Since the original points differed by an element of
`X`, the translated set `βX` meets `D^×`.

The TeX chapter repeats the same argument on the right using the compatibility
of left and right Haar characters, which is why the Haar-character chapter had
to prove {uses "central_simple_algebra_left_right_same_haar"}[] first.
:::

:::definition "finite_intersection_set_t" (parent := "fujisaki_project")
Let `T = Y ∩ D^×`.
:::

:::theorem "finite_intersection_set_t_finite" (parent := "fujisaki_project")
The set `T` is finite.
:::

:::proof "finite_intersection_set_t_finite"
The TeX proof uses only general topology. `Y` is compact, `D` is a discrete
additive subgroup of `D_A`, hence closed, so `Y ∩ D` is compact and discrete and
therefore finite. Since `T ⊆ Y ∩ D`, the set `T` is finite as well.
:::

:::definition "compact_constraint_set_c" (parent := "fujisaki_project")
Define the compact constraint set
$`C = (T^{-1} X) \times X \subseteq D_A \times D_A`.
:::

:::proof "compact_constraint_set_c"
The TeX proof introduces `C` only after all previous compact and finiteness
lemmas are in place. The point is to create one compact set that simultaneously
controls an adelic element and its inverse.
:::

:::theorem "antidiagonal_hits_compact_constraint_set" (parent := "fujisaki_project")
For every $`\beta \in D_A^{(1)}`, there exist `b ∈ D^×` and `ν ∈ D_A^{(1)}`
such that `β = bν` and `(ν, ν⁻¹) ∈ C`.
:::

:::proof "antidiagonal_hits_compact_constraint_set"
This is the heart of the TeX argument. Using
{uses "difference_set_meets_d_units"}[] twice, one writes `βx₁ = b₁` and
`x₂β⁻¹ = b₂` with `x_i ∈ X` and `b_i ∈ D^×`. Multiplying those equations shows
that `x₂x₁` lands in the finite set `T`, so `x₁⁻¹` belongs to `T^{-1}X`. Setting
`ν = x₁⁻¹` produces a factorization `β = bν` with controlled antidiagonal point
`(ν, ν⁻¹)`.
:::

:::theorem "compact_quotient_for_division_algebra" (parent := "fujisaki_project")
The compactness theorem for the adelic quotient is the final output of the
chapter and the input needed by the quaternion algebra miniproject.
:::

:::proof "compact_quotient_for_division_algebra"
The proof now has a clear internal graph:
{uses "large_compact_set_mod_d_exists"}[],
{uses "difference_set_x_for_fujisaki"}[],
{uses "product_set_y_for_fujisaki"}[],
{uses "difference_and_product_sets_compact"}[],
{uses "difference_set_meets_d_units"}[],
{uses "finite_intersection_set_t_finite"}[],
{uses "compact_constraint_set_c"}[], and
{uses "antidiagonal_hits_compact_constraint_set"}[].

The final step is topological. The compact set `C` controls the antidiagonal
image of a representative `ν` of every class in `D^× \ D_A^{(1)}`. Taking the
preimage of `C` under the map `ν ↦ (ν, ν⁻¹)` gives a compact set surjecting onto
the quotient. Therefore the quotient itself is compact.

This is exactly the compactness input used later in
{uses "finite_dimensional_quaternionic_forms"}[].
:::

The TeX chapter closes by recording two useful consequences of Fujisaki's
lemma, both for the finite adelic unit group.

:::theorem "finite_adele_units_cocompact_for_division_algebra" (parent := "fujisaki_project")
The quotient
$`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times`
is compact.
:::

:::proof "finite_adele_units_cocompact_for_division_algebra"
The TeX proof constructs a natural map from the compact quotient
{uses "compact_quotient_for_division_algebra"}[] to the finite-adelic unit
quotient and proves that this map is surjective. The key point is that any
finite-adelic unit can be extended by a suitable archimedean unit to land in
the Haar-character kernel; the archimedean correction is possible because
scalars in `\mathbf{R}^\times` scale Haar measure by an explicit positive power.
:::

:::theorem "finite_double_coset_for_open_subgroup" (parent := "fujisaki_project")
If `U` is an open subgroup of
$`(D \otimes_K \mathbf{A}_K^\infty)^\times`, then the double coset space
$`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times / U`
is finite.
:::

:::proof "finite_double_coset_for_open_subgroup"
The TeX chapter observes that the double cosets define a disjoint open cover of
the compact quotient from
{uses "finite_adele_units_cocompact_for_division_algebra"}[]. A compact space
cannot admit an infinite disjoint open cover, so only finitely many double
cosets occur.
:::
