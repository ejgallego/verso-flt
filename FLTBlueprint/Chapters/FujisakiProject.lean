import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Fujisaki's Lemma" =>

:::group "fujisaki_project"
Fujisaki's lemma packages the adelic compactness statement that underlies the
finiteness of many spaces of quaternionic automorphic forms.
:::

# Goal

:::theorem "fujisaki_lemma_goal" (parent := "fujisaki_project")
For a finite-dimensional central simple algebra over a number field, the
quotient of the norm-one adelic units by the global units should be compact.
This is the compactness statement later used in {uses "finite_dimensional_quaternionic_forms"}[].
:::

:::proof "fujisaki_lemma_goal"
The old blueprint highlights this as the noncommutative compactness statement
that simultaneously generalizes class-group finiteness and Dirichlet's unit
theorem.
:::

# Proof outline

:::definition "adelic_division_algebra_setup" (parent := "fujisaki_project")
The argument studies the adelic algebra $`D \otimes_K \mathbf{A}_K`$ together
with the Haar-character kernel inside its unit group, using {uses "adele_base_change"}[] and the API goal recorded in {uses "haar_character_goal"}[].
:::

:::theorem "compact_quotient_for_division_algebra" (parent := "fujisaki_project")
The compactness theorem for the adelic quotient is the final output of the
chapter and the input needed by the quaternion algebra miniproject.
:::
