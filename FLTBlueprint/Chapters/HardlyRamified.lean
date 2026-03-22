import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Hardly Ramified Representations" =>

:::group "hardly_ramified_program"
The representation-theoretic spine of the FLT strategy: the Frey curve gives a
hardly ramified representation, and the rest of the argument studies the
consequences of belonging to that class.
:::

:::definition "hardly_ramified_definition" (parent := "hardly_ramified_program")
A two-dimensional Galois representation is hardly ramified if it has
cyclotomic determinant, controlled ramification away from $`2`$ and $`p`$, is
flat at $`p`$, and is suitably upper-triangular at $`2`$.
This is the organizing definition behind the modern reduction strategy.
:::

:::theorem "frey_torsion_hardly_ramified" (parent := "hardly_ramified_program")
The mod $`p`$ representation on the torsion of the Frey curve is hardly
ramified.
This is the formal bridge from {uses "frey_curve_definition"}[] to the
modularity package.
:::

:::proof "frey_torsion_hardly_ramified"
This step packages the local properties of the Frey curve into the single
definition {uses "hardly_ramified_definition"}[].
:::

:::theorem "hardly_ramified_lifts" (parent := "hardly_ramified_program")
An irreducible mod $`p`$ hardly ramified representation lifts to a $`p`$-adic
hardly ramified representation.
This is the first deformation-theoretic input needed after establishing
{uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "hardly_ramified_lifts"
The formal statement isolates the existence of a characteristic-zero lift while
keeping the hardly ramified local conditions intact.
:::

:::theorem "hardly_ramified_compatible_family" (parent := "hardly_ramified_program")
A $`p`$-adic hardly ramified representation belongs to a compatible family.
This is the step that makes it possible to move from a prime $`p`$ coming from
the Frey package to a controlled specialization at $`3`$.
:::

:::proof "hardly_ramified_compatible_family"
The compatible-family theorem is the gateway from one local deformation problem
to a global family where the switch to $`3`$ can be analyzed.
:::

:::theorem "frey_torsion_not_irreducible" (parent := "hardly_ramified_program")
The Frey curve torsion representation is not irreducible.
This is the current Lean endpoint of the modularity side of the contradiction
used in {uses "no_frey_package"}[].
:::

:::proof "frey_torsion_not_irreducible"
In the legacy blueprint this conclusion sits downstream of potential
modularity, compatible families, and the $`3`$-adic analysis. The Verso port
keeps that dependency story visible even before all of the informal exposition
has been migrated.
:::
