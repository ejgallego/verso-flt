import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "First Reductions" =>

:::group "first_reductions"
The core reduction from a hypothetical counterexample to an impossible Frey
package.
:::

:::definition "frey_package_data" (parent := "first_reductions")
A Frey package packages the normalized Diophantine data attached to a
hypothetical counterexample to Fermat's Last Theorem. It is the formal entry
point for the arithmetic reduction.
:::

:::definition "frey_curve_definition" (parent := "first_reductions")
From a Frey package one constructs a distinguished elliptic curve over
$`\\mathbf{Q}`$. The associated mod $`p`$ representation is the bridge from the
Diophantine problem to modularity.
This curve is built from {uses "frey_package_data"}[].
:::

:::theorem "counterexample_yields_frey_package" (parent := "first_reductions")
If Fermat's Last Theorem were false, then there would exist a Frey package.
This isolates the entire Diophantine input of the argument in one formal
construction.
:::

:::proof "counterexample_yields_frey_package"
The proof normalizes a counterexample, reduces to the prime case, and packages
the resulting data with the congruence and coprimality hypotheses needed to
define the Frey curve.
:::

:::theorem "mazur_frey_irreducible" (parent := "first_reductions")
The $`p`$-torsion representation attached to the Frey curve is irreducible.
This is the formal placeholder for the Mazur input that rules out reducibility
coming from large rational torsion.
:::

:::proof "mazur_frey_irreducible"
Historically this step uses Mazur's theorem on torsion in elliptic curves over
$`\\mathbf{Q}`$ together with the special structure of the Frey curve.
:::

:::theorem "wiles_frey_not_irreducible" (parent := "first_reductions")
The same $`p`$-torsion representation cannot be irreducible.
This is the point where the modularity-lifting side of the strategy meets the
Frey curve.
:::

:::proof "wiles_frey_not_irreducible"
The formal project routes this statement through the harder modularity input,
which is expanded in the hardly ramified chapter beginning at
{uses "frey_torsion_hardly_ramified"}[].
:::

:::theorem "no_frey_package" (parent := "first_reductions")
There is no Frey package.
Combined with {uses "counterexample_yields_frey_package"}[], this closes the
reduction from Fermat's Last Theorem to incompatible properties of one Galois
representation.
:::

:::proof "no_frey_package"
The proof is the contradiction between {uses "mazur_frey_irreducible"}[] and
{uses "wiles_frey_not_irreducible"}[] for the representation attached to
{uses "frey_curve_definition"}[].
:::
