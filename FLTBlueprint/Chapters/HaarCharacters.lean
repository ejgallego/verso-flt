import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Haar Characters" =>

:::group "haar_character_project"
This miniproject develops the API around how additive Haar measure changes under
linear automorphisms, especially on locally compact topological rings.
:::

# Goal

:::definition "haar_character_goal" (parent := "haar_character_project")
The main application is adelic: for a finite-dimensional algebra over a number
field, the adelic units should lie in the kernel of the associated Haar
character.
:::

# Initial definitions

:::definition "additive_haar_character" (parent := "haar_character_project")
For a locally compact additive group and an additive automorphism, the Haar
character measures the positive scalar by which Haar measure is rescaled.
:::

:::theorem "haar_character_independent_of_measure" (parent := "haar_character_project")
This scaling factor is independent of the chosen regular Haar measure.
:::

:::proof "haar_character_independent_of_measure"
The proof is the usual uniqueness-of-Haar-measure argument: changing the Haar
measure by a positive scalar cancels on both sides of the defining relation.
:::

:::theorem "adelic_units_in_kernel_of_haar_character" (parent := "haar_character_project")
The key intended application is that adelic unit groups coming from
finite-dimensional algebras over a number field land in the kernel of the Haar
character.
:::
