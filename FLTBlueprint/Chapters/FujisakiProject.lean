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

# Proof outline

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

:::theorem "compact_quotient_for_division_algebra" (parent := "fujisaki_project")
The compactness theorem for the adelic quotient is the final output of the
chapter and the input needed by the quaternion algebra miniproject.
:::

:::proof "compact_quotient_for_division_algebra"
The TeX proof works through a chain of compact auxiliary subsets `E`, `X = E-E`,
and `Y = X·X`. Their role is to force intersections with the Haar-character
kernel and then to show that the quotient can be covered by the image of a
compact set. Once that covering statement is in place, compactness of the
quotient follows.

The very first step in that proof is already informative: identify `D` with
`ℚ^d` using a basis, identify the adelic algebra with `A_ℚ^d`, and note that
`D \ D_A` inherits compactness from `ℚ \ A_ℚ`. The rest of the proof turns that
commutative compactness input into the noncommutative statement needed for the
quaternionic automorphic-form spaces.
:::
