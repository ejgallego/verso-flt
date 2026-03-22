import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Elliptic Curves And The Frey Curve" =>

:::group "elliptic_frey_bridge"
This chapter fills the gap between the raw Frey-curve construction and the
later representation-theoretic reduction. It packages the standard elliptic
curve facts needed for both the Mazur-side irreducibility argument and the
local analysis behind hardly ramified representations.
:::

The old TeX blueprint treated this material as classical background whose
formalization would still take serious work. That remains a good description for
the Verso port: most of the results are standard, but they are exactly the
standard results that explain why the Frey curve is such a rigid arithmetic
input.

# Elliptic curve torsion

:::theorem "elliptic_curve_torsion_two_dimensional" (parent := "elliptic_frey_bridge")
For an elliptic curve over a field of characteristic prime to $`n`, the
`n`-torsion over a separable closure is a two-dimensional `\mathbf{Z}/n\mathbf{Z}`
module.
:::

:::proof "elliptic_curve_torsion_two_dimensional"
The TeX chapter presents this as one of the first basic structural facts about
elliptic curves: the `n`-torsion has size `n²`, hence is isomorphic to
`(\mathbf{Z}/n\mathbf{Z})²`.

In the FLT story, this is the point where the Frey curve stops being just an
elliptic curve and starts producing a two-dimensional Galois representation.
:::

:::theorem "elliptic_curve_torsion_determinant_cyclotomic" (parent := "elliptic_frey_bridge")
The determinant of the Galois action on elliptic-curve torsion is the
cyclotomic character.
This is the determinant input later repackaged in
{uses "hardly_ramified_definition"}[].
:::

:::proof "elliptic_curve_torsion_determinant_cyclotomic"
The classical proof runs through the Weil pairing, and the TeX chapter treats it
as standard elliptic-curve background; see
{Informal.citep silvermanArithmeticEllipticCurves}[].

+For the blueprint, the strategic point is simple: once the determinant is known
to be cyclotomic, any later local or global constraint on the representation
must be compatible with that fixed determinant.
:::

# Reduction theory of the Frey curve

:::definition "good_reduction_definition" (parent := "elliptic_frey_bridge")
Good reduction means that an elliptic curve admits an integral model whose
reduction modulo the maximal ideal is still smooth.
:::

:::theorem "frey_curve_good_reduction_away_from_abc" (parent := "elliptic_frey_bridge")
For the Frey curve attached to a Frey package, any odd prime not dividing
`abc` is a prime of good reduction.
:::

:::proof "frey_curve_good_reduction_away_from_abc"
The cubic defining the Frey curve has roots `0`, `a^ℓ`, and `-b^ℓ`. If a prime
does not divide `abc`, then these roots remain distinct modulo that prime, so
the reduced cubic is smooth.

This is the easy half of the local analysis: away from the explicitly bad
primes, the Frey curve behaves like a well-behaved elliptic curve.
:::

:::definition "multiplicative_reduction_definition" (parent := "elliptic_frey_bridge")
Multiplicative reduction means that the reduced cubic has an ordinary double
point rather than remaining smooth.
:::

:::theorem "frey_curve_multiplicative_reduction_at_bad_prime" (parent := "elliptic_frey_bridge")
If an odd prime divides `abc`, then the Frey curve has multiplicative reduction
at that prime.
:::

:::proof "frey_curve_multiplicative_reduction_at_bad_prime"
When `p | abc`, exactly two of the three roots `0`, `a^ℓ`, and `-b^ℓ` coincide
modulo `p`. The reduced cubic therefore acquires an ordinary double point.

So outside `ℓ`, the bad odd primes of the Frey curve are not mysterious at all:
they are precisely the primes dividing `abc`, and they are all multiplicative.
:::

:::theorem "frey_curve_multiplicative_reduction_at_two" (parent := "elliptic_frey_bridge")
The Frey curve always has multiplicative reduction at `2`.
:::

:::proof "frey_curve_multiplicative_reduction_at_two"
The TeX chapter gives an explicit change of variables using the Frey-package
normalizations `a ≡ 3 mod 4` and `b` even. After that change of variables, the
equation reduces modulo `2` to a cubic with an ordinary double point.

This is the special local place where the later “hardly ramified” package is
forced to use a weaker upper-triangular statement rather than complete
unramifiedness.
:::

:::theorem "tate_curve_local_torsion_shape" (parent := "elliptic_frey_bridge")
For an elliptic curve with multiplicative reduction over a nonarchimedean local
field, the Tate-curve description shows that torsion is controlled by an
extension of a cyclotomic character by an unramified character of order at most
`2`.
:::

:::proof "tate_curve_local_torsion_shape"
This is the central local input behind the TeX chapter's reduction-theoretic
arguments. After an unramified quadratic twist, multiplicative reduction becomes
split and the Tate-curve uniformization describes the torsion explicitly in
terms of roots of unity and the Tate parameter `q`.

For the FLT blueprint, that one package has several consequences at once:
unramifiedness away from `2` and `ℓ`, the special upper-triangular shape at
`2`, and the finite-flat description at `ℓ`.
:::

:::theorem "frey_curve_unramified_away_from_two_and_l" (parent := "elliptic_frey_bridge")
The Frey-curve `ℓ`-torsion representation is unramified at every prime
`p ≠ 2, ℓ`.
This is the main ramification input later used in
{uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "frey_curve_unramified_away_from_two_and_l"
There are two cases. If `p` does not divide `abc`, use
{uses "frey_curve_good_reduction_away_from_abc"}[] together with the standard
fact that good reduction away from `ℓ` gives unramified torsion. If `p` is an
odd divisor of `abc`, use
{uses "frey_curve_multiplicative_reduction_at_bad_prime"}[] and the Tate-curve
analysis from {uses "tate_curve_local_torsion_shape"}[].

The TeX chapter also tracks the `p`-adic valuation of the `j`-invariant to show
that, at these bad odd primes, the Tate parameter forces no extra `ℓ`-adic
ramification.
:::

:::theorem "frey_curve_local_shape_at_two" (parent := "elliptic_frey_bridge")
At the prime `2`, the semisimplification of the Frey-curve `ℓ`-torsion
representation is unramified.
This is the `2`-adic input used in {uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "frey_curve_local_shape_at_two"
Apply {uses "frey_curve_multiplicative_reduction_at_two"}[] and then the
Tate-curve description {uses "tate_curve_local_torsion_shape"}[]. After the
unramified quadratic twist needed to split multiplicative reduction, the local
representation is an extension of the trivial character by the cyclotomic
character, so its semisimplification is unramified.
:::

:::theorem "frey_curve_flat_at_l" (parent := "elliptic_frey_bridge")
At the prime `ℓ`, the Frey-curve `ℓ`-torsion comes from a finite flat group
scheme.
This is the local-flatness input used in {uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "frey_curve_flat_at_l"
The TeX chapter splits into the same two cases that appear throughout the local
theory. If the Frey curve has good reduction at `ℓ`, then its `ℓ`-torsion is
finite flat on the integral model. If it has multiplicative reduction, the
Tate-curve description again shows that the relevant extension is finite flat.

So the `ℓ`-adic local condition in the definition of “hardly ramified” is not
an extra hypothesis invented for convenience; it is genuinely one of the local
properties of the Frey curve.
:::

# The Mazur side

:::theorem "reducible_frey_representation_has_trivial_character" (parent := "elliptic_frey_bridge")
If the Frey-curve `ℓ`-torsion representation were reducible, then one of the
resulting one-dimensional characters would have to be trivial.
:::

:::proof "reducible_frey_representation_has_trivial_character"
The TeX chapter argues by analyzing the two characters in the semisimplification
of a reducible representation. Using
{uses "frey_curve_unramified_away_from_two_and_l"}[] and
{uses "frey_curve_local_shape_at_two"}[], these characters are unramified away
from `ℓ`; and the `ℓ`-adic analysis shows that one of them is also unramified
at `ℓ`. A one-dimensional character unramified everywhere cuts out a number
field unramified everywhere, so Minkowski forces it to be trivial.
:::

:::theorem "reducible_frey_representation_conflicts_with_mazur" (parent := "elliptic_frey_bridge")
A reducible Frey-curve `ℓ`-torsion representation would force too much rational
torsion, contradicting {uses "mazur_torsion_bound"}[].
This is the arithmetic content behind {uses "mazur_frey_irreducible"}[].
:::

:::proof "reducible_frey_representation_conflicts_with_mazur"
By {uses "reducible_frey_representation_has_trivial_character"}[], reducibility
would leave either a trivial subrepresentation or a trivial quotient. In the
first case the Frey curve itself has a rational point of order `ℓ`; in the
second case an `ℓ`-isogenous quotient elliptic curve does.

In either case one gets an elliptic curve over `\mathbf{Q}` with at least three
points of order `2` and also a point of order `ℓ`, so the torsion subgroup has
order at least `4ℓ ≥ 20`. That contradicts Mazur's theorem, whose project-level
role is recorded in {uses "mazur_torsion_bound"}[] and whose original source is
{Informal.citep mazurTorsion}[].
:::
