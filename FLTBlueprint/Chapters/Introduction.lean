import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Introduction" =>

:::group "flt_main_story"
The top-level route from the classical statement of Fermat's Last Theorem to
the formal reduction currently implemented in Lean.
:::

:::author "kevin_buzzard" (name := "Kevin Buzzard")
:::

:::author "flt_contributors" (name := "FLT contributors")
:::

:::theorem "flt_classical_statement" (parent := "flt_main_story") (owner := "flt_contributors")
Fermat's Last Theorem states that there are no non-trivial positive integer
solutions to $`x^n + y^n = z^n`$ for $`n >= 3`$.
The public-facing theorem exported by the project is still tracked separately;
the first Verso port keeps the informal statement here without forcing the
blueprint build through the monolithic root import.
:::

:::proof "flt_classical_statement"
The project exports the classical positive-integer formulation directly, so the
rendered blueprint can point at the same theorem that downstream users see.
:::

:::theorem "flt_modern_reduction" (parent := "flt_main_story") (owner := "kevin_buzzard")
The current formal route proves Fermat's Last Theorem by showing that a
counterexample would yield a Frey package, then deriving incompatible
properties of the associated Galois representation.
The contradiction is assembled from {uses "mazur_frey_irreducible"}[] and
{uses "wiles_frey_not_irreducible"}[].
:::

:::proof "flt_modern_reduction"
This is the project-level endpoint for the reduction chain. The detailed steps
are tracked in the following chapters, starting with
{uses "counterexample_yields_frey_package"}[] and ending with
{uses "no_frey_package"}[].
:::

:::definition "verso_port_scope" (parent := "flt_main_story")
This Verso port replaces the old `leanblueprint` build with the reference
`verso-blueprint` structure. The initial migration keeps the central reduction
nodes, the currently axiomatized historical inputs, and a map of the
mini-project chapters that still need fuller informal migration.
:::
