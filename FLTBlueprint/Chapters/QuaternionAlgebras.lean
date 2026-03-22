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

The TeX chapter introduces this material as a practical substitute for
classical modular forms. Since mathlib does not yet prove the finite
dimensionality of classical modular-form spaces, the project turns to the
quaternionic setting, where finite-dimensionality can be approached through
adelic compactness.

# Goals

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

:::definition "weight_two_quaternionic_forms" (parent := "quaternion_algebra_project")
The chapter defines spaces of weight-2 automorphic forms valued in an arbitrary
additive commutative group, then specializes to level-$`U`$ invariants.
Those spaces are the input for the concrete Hecke constructions in {uses "concrete_hecke_action"}[].
:::

The TeX chapter is explicit that the totally definite setting removes a large
amount of analytic baggage. There is no upper half-plane, no holomorphicity
condition, and no cusp condition. That is what makes the resulting theory
algebraic enough to define with arbitrary coefficient groups, including
mod-`p^n` and `p`-adic coefficients.

:::definition "weight_two_quaternionic_forms_of_level" (parent := "quaternion_algebra_project")
Fixing a compact open level subgroup yields the level-$`U`$ space of
quaternionic automorphic forms.
This is the specific target space acted on by {uses "concrete_hecke_action"}[].
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
uses compactness to show there are only finitely many of them, and then evaluates
an automorphic form on representatives to embed the space into a finite power of
the coefficient field.
:::
