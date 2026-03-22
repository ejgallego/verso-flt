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

# Goals

:::definition "totally_definite_quaternion_algebra_setup" (parent := "quaternion_algebra_project")
Fix a totally real field and a totally definite quaternion algebra over it.
Because the associated symmetric space is zero-dimensional, the resulting
automorphic-form theory is far more algebraic than the classical
$`\mathrm{GL}_2`$ theory.
:::

:::definition "weight_two_quaternionic_forms" (parent := "quaternion_algebra_project")
The chapter defines spaces of weight-2 automorphic forms valued in an arbitrary
additive commutative group, then specializes to level-$`U`$ invariants.
:::

:::theorem "finite_dimensional_quaternionic_forms" (parent := "quaternion_algebra_project")
The main result is that these spaces are finite-dimensional over a field.
:::

:::proof "finite_dimensional_quaternionic_forms"
The old blueprint reduces the finite-dimensionality statement to Fujisaki's
lemma by proving that only finitely many double cosets contribute.
:::
