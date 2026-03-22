import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Quaternion Algebras" =>

:::group "quaternion_algebra_project"
This chapter develops the spaces of quaternionic automorphic forms whose Hecke
algebras supply the `T` side of the `R = T` theorems in the FLT strategy.
:::

# Goal

The TeX chapter introduces this material as a practical substitute for
classical modular forms. Since mathlib does not yet prove the finite
dimensionality of classical modular-form spaces, the project turns to the
quaternionic setting, where finite-dimensionality can be approached through
adelic compactness.

The main result of the TeX chapter is finite-dimensionality of spaces of
quaternionic modular forms. The Hecke algebras acting on those spaces are the
`T`s that later appear in the modularity-lifting story.

# Initial definitions

:::definition "totally_definite_quaternion_algebra_setup" (parent := "quaternion_algebra_project")
Fix a totally real field and a totally definite quaternion algebra over it.
Because the associated symmetric space is zero-dimensional, the resulting
automorphic-form theory is far more algebraic than the classical
GL2 theory. This chapter sits on top of {uses "compact_quotient_for_division_algebra"}[].
:::

:::proof "totally_definite_quaternion_algebra_setup"
The TeX chapter starts by recalling that quaternion algebras are central simple
algebras of dimension `4`. Over a totally real field `F`, one fixes a
quaternion algebra `D/F` that is totally definite, meaning that every real
embedding lands in Hamilton's quaternions. Because `F` has a real place, that
forces `D` to be a division algebra, which is why the Fujisaki compactness
theorem applies.
:::

:::theorem "zero_dimensional_symmetric_space_quaternionic" (parent := "quaternion_algebra_project")
In the totally definite quaternionic setting, the archimedean symmetric space
is zero-dimensional, so the usual analytic conditions from classical modular
forms disappear.
:::

:::proof "zero_dimensional_symmetric_space_quaternionic"
The TeX chapter stresses this as the decisive simplification. There is no upper
half-plane, no holomorphicity condition, and no cusp condition to impose.
Instead, one works directly with adelic functions satisfying invariance and
level conditions.

This is exactly why the later definitions can be made for automorphic forms
valued in an arbitrary additive commutative group, not just in `ℂ`.
:::

# Brief introduction to automorphic forms in this setting

The TeX chapter is explicit that the totally definite setting removes a large
amount of analytic baggage. There is no upper half-plane, no holomorphicity
condition, and no cusp condition. That is what makes the resulting theory
algebraic enough to define with arbitrary coefficient groups, including
mod-`p^n` and `p`-adic coefficients.

The adelic language is still essential, though. The chapter regards the finite
adeles `A_F^∞` as a central subring of `D ⊗_F A_F^∞`, regards `Dˣ` as sitting in
the same unit group via `d ↦ d ⊗ 1`, and then defines automorphic forms as
functions on the adelic units satisfying left invariance, central-character
triviality, and compact-open right invariance.

:::theorem "quaternionic_forms_allow_general_coefficients" (parent := "quaternion_algebra_project")
Because no differential equations are imposed in the totally definite setting,
quaternionic automorphic forms can be defined with values in any additive
commutative group, including mod-`p^n` and `p`-adic coefficient objects.
:::

:::proof "quaternionic_forms_allow_general_coefficients"
This is a methodological point the TeX chapter makes very strongly. In the
general automorphic theory, analytic conditions at infinity usually force one to
work with complex-valued or analytically structured coefficient spaces. Here the
vanishing of the archimedean analytic complexity removes that obstacle.

So the coefficient flexibility is not accidental convenience; it is one of the
main reasons this quaternionic route is attractive for the FLT project.
:::

# Definition of spaces of automorphic forms

:::definition "weight_two_quaternionic_forms" (parent := "quaternion_algebra_project")
The chapter defines spaces of weight-2 automorphic forms valued in an arbitrary
additive commutative group, then specializes to level-$`U`$ invariants.
Those spaces are the input for the concrete Hecke constructions in {uses "concrete_hecke_action"}[].
:::

:::theorem "automorphic_forms_additive_group" (parent := "quaternion_algebra_project")
Pointwise addition makes the space of quaternionic automorphic forms into an
additive abelian group.
:::

:::theorem "automorphic_forms_module" (parent := "quaternion_algebra_project")
If the coefficient object is a commutative ring, then the space of quaternionic
automorphic forms is naturally a module over that ring.
:::

:::theorem "adelic_right_action_on_quaternionic_forms" (parent := "quaternion_algebra_project")
The finite adelic unit group acts on the space of quaternionic automorphic
forms by right translation on the argument.
This is the action whose `U`-fixed vectors define
{uses "weight_two_quaternionic_forms_of_level"}[].
:::

:::proof "adelic_right_action_on_quaternionic_forms"
The TeX chapter places this immediately after the additive and module
structures, since it is the action from which levels and Hecke operators are
cut out.
:::

:::definition "weight_two_quaternionic_forms_of_level" (parent := "quaternion_algebra_project")
Fixing a compact open level subgroup yields the level-$`U`$ space of
quaternionic automorphic forms.
This is the specific target space acted on by {uses "concrete_hecke_action"}[].
:::

The level construction is deliberately simple: one first defines the full space
`S^D(R)` of automorphic forms, then level `U` means just taking the `U`-fixed
points for the right action of the finite adelic unit group.

:::theorem "levels_are_compact_open_subgroups" (parent := "quaternion_algebra_project")
A level is, by definition, a compact open subgroup of the finite adelic unit
group `D_{\mathbf{A}^\infty}^×`.
:::

:::proof "levels_are_compact_open_subgroups"
The TeX chapter emphasizes that such subgroups are plentiful because the adelic
unit group is locally profinite. This is the same topological input that later
supports the double-coset finiteness criterion in the Hecke-operator chapter.
:::

:::theorem "fujisaki_implies_finite_double_cosets_quaternionic" (parent := "quaternion_algebra_project")
For a fixed compact open level `U`, the quotient
`Dˣ \ D_{\mathbf{A}^\infty}^× / U` is finite.
This is the compactness-to-finiteness step behind
{uses "finite_dimensional_quaternionic_forms"}[].
:::

:::proof "fujisaki_implies_finite_double_cosets_quaternionic"
This is the central use of {uses "compact_quotient_for_division_algebra"}[] in
the chapter. The quotient by `Dˣ` is compact, the right `U`-translates form an
open cover, and compactness forces only finitely many double cosets to appear.

So the finite-dimensionality theorem is not proved by analysis on functions
directly; it is proved by first collapsing the adelic geometry to finitely many
orbits.
:::

:::theorem "finite_dimensional_quaternionic_forms" (parent := "quaternion_algebra_project")
The main result is that these spaces are finite-dimensional over a field.
:::

:::proof "finite_dimensional_quaternionic_forms"
The old blueprint reduces the finite-dimensionality statement to Fujisaki's
lemma by proving that only finitely many double cosets contribute.
The corresponding Lean theorem exists in the FLT fork, but its import path still
needs explicit rc6 validation before we attach it here.

The TeX proof is conceptually straightforward once the compactness theorem is in
place. One writes the adelic quotient as a union of double cosets `Dˣ g_i U`,
uses {uses "fujisaki_implies_finite_double_cosets_quaternionic"}[] to show
there are only finitely many of them, and then evaluates an automorphic form on
representatives to embed the space into a finite power of the coefficient
field.

The two real inputs are therefore disjoint and clean:

- compactness of the adelic quotient from {uses "compact_quotient_for_division_algebra"}[]
- linear algebra on finitely many orbit representatives once the quotient is
  finite

That clean split is exactly what makes this chapter such a good bridge from the
adelic miniprojects to the Hecke algebra story.
:::
