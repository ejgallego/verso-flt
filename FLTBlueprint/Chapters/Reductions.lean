import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "First Reductions" =>

:::group "first_reductions"
The core reduction from a hypothetical counterexample to an impossible Frey
package, isolating the two deep external inputs of the first phase: Mazur on
torsion and the Wiles-side reducibility theorem.
:::

:::definition "frey_package_data" (parent := "first_reductions")
A Frey package packages the normalized Diophantine data attached to a
hypothetical counterexample to Fermat's Last Theorem. It is the formal entry
point for the arithmetic reduction.
:::

:::theorem "counterexample_reduces_to_p_ge_5" (parent := "first_reductions")
If Fermat's Last Theorem were false, then there would be a counterexample of
prime exponent $`p \ge 5`.
This isolates the classical Diophantine reduction before any elliptic-curve
input appears.
:::

:::proof "counterexample_reduces_to_p_ge_5"
The old TeX blueprint breaks this into two standard steps. First, any
counterexample can be reduced to one with odd prime exponent by factoring the
exponent. Second, one excludes the case $`p=3` by Euler and the powers-of-two
case by Fermat's theorem for exponent $`4`, which is already in mathlib.

So the modern FLT strategy really begins only once the exponent has been
normalized to a prime at least `5`.
:::

:::theorem "prime_counterexample_yields_frey_package" (parent := "first_reductions")
Any counterexample of prime exponent $`p \ge 5` can be normalized to a Frey
package.
This is the arithmetic normalization step immediately preceding
{uses "frey_curve_definition"}[].
:::

:::proof "prime_counterexample_yields_frey_package"
Given $`a^p+b^p=c^p`, one first divides out the common gcd and then uses the
equation to show the resulting triple is pairwise coprime. Parity considerations
show that exactly one of the three integers is even, and by permuting or
negating the triple one may arrange the conventional normalizations `b` even and
`a ≡ 3 mod 4`.

Those normalizations are not cosmetic: they are exactly the hypotheses used in
the definition of {uses "frey_package_data"}[] and later in the local analysis
of the Frey curve at `2`.
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
construction by synthesizing {uses "counterexample_reduces_to_p_ge_5"}[] and
{uses "prime_counterexample_yields_frey_package"}[].
:::

:::proof "counterexample_yields_frey_package"
Combine {uses "counterexample_reduces_to_p_ge_5"}[] with
{uses "prime_counterexample_yields_frey_package"}[].
:::

:::theorem "mazur_frey_irreducible" (parent := "first_reductions")
The $`p`$-torsion representation attached to the Frey curve is irreducible.
This is the formal placeholder for the Mazur input
{uses "mazur_torsion_bound"}[] specialized to the Frey curve.
:::

:::proof "mazur_frey_irreducible"
Historically this step uses Mazur's theorem on torsion in elliptic curves over
$`\\mathbf{Q}`$ together with the special structure of the Frey curve. The old
blueprint cites Mazur's original paper {Informal.citep mazurTorsion}[] and
Serre's later FLT notes {Informal.citep serreModularityConjecture}[] for a
pre-1990 route from the general torsion theorem to this Frey-specific
irreducibility statement.
:::

:::theorem "wiles_frey_not_irreducible" (parent := "first_reductions")
The same $`p`$-torsion representation cannot be irreducible.
This is the point where the modularity-lifting side of the strategy meets the
Frey curve; the chapter {uses "frey_torsion_not_irreducible"}[] supplies the
intermediate reduction through hardly ramified representations.
:::

:::proof "wiles_frey_not_irreducible"
The formal project routes this statement through the harder modularity input,
using the chain
{uses "frey_torsion_hardly_ramified"}[],
{uses "hardly_ramified_reducible"}[], and
{uses "frey_torsion_not_irreducible"}[].
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
