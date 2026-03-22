import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Frobenius Elements" =>

:::group "frobenius_project"
This miniproject records the general existence theorem for Frobenius elements
through decomposition groups and residue-field automorphisms.
:::

# Status

:::definition "frobenius_project_status" (parent := "frobenius_project")
The TeX blueprint marks this miniproject as a success: the core result is
sorry-free and has already been merged into mathlib.
:::

# The theorem

:::definition "stabilizer_hom_definition" (parent := "frobenius_project")
Given a finite group acting on a commutative ring, a prime of the big ring, and
the induced residue-field extension, one gets a natural homomorphism from the
decomposition group to the automorphism group of the residue-field extension.
:::

:::theorem "stabilizer_hom_surjective" (parent := "frobenius_project")
The main theorem says that this stabilizer homomorphism is surjective.
This is the abstract engine behind Frobenius elements in local and global
Galois settings.
:::

:::proof "stabilizer_hom_surjective"
The old blueprint presents this as a very general Bourbaki theorem whose field
theory applications are only a corollary.
:::
