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

For the blueprint, the strategic point is simple: once the determinant is known
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

:::definition "finite_flat_group_scheme_definition" (parent := "elliptic_frey_bridge")
For the purposes of the FLT strategy, a finite flat group scheme over a ring is
the algebro-geometric object that packages torsion in good or multiplicative
integral models in a form compatible with local Galois representations.
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

:::theorem "frey_curve_j_invariant_formula" (parent := "elliptic_frey_bridge")
The `j`-invariant of the Frey curve admits an explicit formula in terms of
`A = a^ℓ`, `B = b^ℓ`, and `C = c^ℓ`.
:::

:::proof "frey_curve_j_invariant_formula"
The TeX chapter writes this formula down because it makes the bad-prime
analysis completely concrete. Once the valuation of `j` can be read off
explicitly, the Tate parameter `q` is no longer mysterious: its valuation is
forced by that `j`-invariant formula.
:::

:::theorem "frey_curve_j_bad_prime_valuation" (parent := "elliptic_frey_bridge")
If an odd prime `p` divides `abc`, then the `p`-adic valuation of the
Frey-curve `j`-invariant is a multiple of `ℓ`.
:::

:::proof "frey_curve_j_bad_prime_valuation"
The TeX proof is a direct valuation computation from the explicit
`j`-invariant formula. At a bad odd prime dividing `abc`, the numerator stays a
unit while the denominator contributes a valuation divisible by `ℓ`.

This is the key numerical input that upgrades the Tate-curve description into
actual unramifiedness at those primes.
:::

:::theorem "good_reduction_implies_unramified_torsion" (parent := "elliptic_frey_bridge")
For primes away from `ℓ`, good reduction implies that elliptic-curve torsion is
unramified.
:::

:::proof "good_reduction_implies_unramified_torsion"
The TeX chapter treats this as a standard theorem from the arithmetic of
elliptic curves: once the elliptic curve has a smooth integral model at a prime
not equal to `ℓ`, the corresponding `ℓ`-torsion carries no wild local
monodromy there.

This is the theorem that makes
{uses "frey_curve_good_reduction_away_from_abc"}[] useful for the Galois side.
:::

:::theorem "frey_curve_unramified_away_from_two_and_l" (parent := "elliptic_frey_bridge")
The Frey-curve `ℓ`-torsion representation is unramified at every prime
`p ≠ 2, ℓ`.
This is the main ramification input later used in
{uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "frey_curve_unramified_away_from_two_and_l"
There are two cases. If `p` does not divide `abc`, use
{uses "frey_curve_good_reduction_away_from_abc"}[] together with
{uses "good_reduction_implies_unramified_torsion"}[]. If `p` is an
odd divisor of `abc`, use
{uses "frey_curve_multiplicative_reduction_at_bad_prime"}[] and the Tate-curve
analysis from {uses "tate_curve_local_torsion_shape"}[].

The TeX chapter also tracks the `p`-adic valuation of the `j`-invariant to show
that, at these bad odd primes, the Tate parameter forces no extra `ℓ`-adic
ramification; this is exactly the role of
{uses "frey_curve_j_bad_prime_valuation"}[].
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
properties of the Frey curve. The TeX chapter points to Edixhoven and
Katz--Mazur for the local finite-flat input
{Informal.citep edix}[] {Informal.citep katzMazurArithmeticModuli}[].
:::

# The Mazur side

:::theorem "reducible_frey_characters_unramified_away_from_l" (parent := "elliptic_frey_bridge")
If the Frey-curve `ℓ`-torsion representation were reducible with characters
`α` and `β`, then both characters would be unramified at every prime
`p ≠ ℓ`.
:::

:::proof "reducible_frey_characters_unramified_away_from_l"
This is the semisimple form of the local analysis already carried out above.
Away from `2` and `ℓ`, it follows from
{uses "frey_curve_unramified_away_from_two_and_l"}[]. At `2`, one uses
{uses "frey_curve_local_shape_at_two"}[].

The old TeX chapter attributes this step to Serre's 1972 paper on the Galois
properties of torsion points {Informal.citep serreGaloisPointsEllipticCurves}[].
:::

:::theorem "reducible_frey_character_unramified_at_l" (parent := "elliptic_frey_bridge")
In the reducible case, at least one of the two one-dimensional characters is
also unramified at `ℓ`.
:::

:::proof "reducible_frey_character_unramified_at_l"
The multiplicative-reduction case is immediate from the Tate-curve picture. In
the good-reduction case, the finite-flat description from
{uses "frey_curve_flat_at_l"}[] constrains the local shape strongly enough that
one character must still be unramified.

This is the last missing local input before Minkowski's theorem can be applied.
:::

:::theorem "reducible_frey_representation_has_trivial_character" (parent := "elliptic_frey_bridge")
If the Frey-curve `ℓ`-torsion representation were reducible, then one of the
resulting one-dimensional characters would have to be trivial.
:::

:::proof "reducible_frey_representation_has_trivial_character"
The TeX chapter argues by analyzing the two characters in the semisimplification
of a reducible representation. Using
{uses "reducible_frey_characters_unramified_away_from_l"}[] and
{uses "reducible_frey_character_unramified_at_l"}[], one character is
unramified everywhere. A one-dimensional character unramified everywhere cuts
out a number field unramified everywhere, so Minkowski forces it to be trivial.
:::

:::theorem "reducible_frey_representation_structure" (parent := "elliptic_frey_bridge")
If the Frey-curve `ℓ`-torsion representation were reducible, then it would have
either a trivial one-dimensional subrepresentation or a trivial
one-dimensional quotient.
:::

:::proof "reducible_frey_representation_structure"
This is just the representation-theoretic reformulation of
{uses "reducible_frey_representation_has_trivial_character"}[].
It is useful because Mazur's contradiction naturally splits into those two
cases.
:::

:::theorem "trivial_submodule_yields_rational_l_torsion" (parent := "elliptic_frey_bridge")
If the Frey-curve `ℓ`-torsion representation has a trivial one-dimensional
submodule, then the Frey curve has a rational point of order `ℓ`.
:::

:::proof "trivial_submodule_yields_rational_l_torsion"
A trivial subrepresentation is exactly a Galois-stable line inside `E[ℓ]`, and
that line corresponds to a rational torsion point of order `ℓ`.
:::

:::theorem "quotient_by_galois_stable_l_subgroup" (parent := "elliptic_frey_bridge")
If an elliptic curve has a Galois-stable subgroup of order `ℓ` in its
`ℓ`-torsion, then there is an `ℓ`-isogenous quotient elliptic curve obtained by
dividing out by that subgroup.
:::

:::proof "quotient_by_galois_stable_l_subgroup"
The TeX chapter presents this as the geometric input needed to turn a trivial
quotient case into a trivial submodule case on an isogenous curve. The full
formal proof would require substantial algebro-geometric infrastructure, but the
mathematical role of the theorem inside the Mazur argument is completely clear.
:::

:::theorem "trivial_quotient_reduces_to_isogenous_submodule_case" (parent := "elliptic_frey_bridge")
If the Frey-curve `ℓ`-torsion representation has a trivial one-dimensional
quotient, then an `ℓ`-isogenous quotient curve has a trivial one-dimensional
subrepresentation.
:::

:::proof "trivial_quotient_reduces_to_isogenous_submodule_case"
Apply {uses "quotient_by_galois_stable_l_subgroup"}[] to the Galois-stable
kernel of the quotient map. On the new elliptic curve, the dual isogeny
repackages the same reducibility into the submodule case.
:::

:::theorem "reducible_frey_representation_conflicts_with_mazur" (parent := "elliptic_frey_bridge")
A reducible Frey-curve `ℓ`-torsion representation would force too much rational
torsion, contradicting {uses "mazur_torsion_bound"}[].
This is the arithmetic content behind {uses "mazur_frey_irreducible"}[].
:::

:::proof "reducible_frey_representation_conflicts_with_mazur"
By {uses "reducible_frey_representation_structure"}[], reducibility would leave
either a trivial subrepresentation or a trivial quotient. In the first case,
use {uses "trivial_submodule_yields_rational_l_torsion"}[]. In the second case,
use {uses "trivial_quotient_reduces_to_isogenous_submodule_case"}[].

In either case one gets an elliptic curve over `\mathbf{Q}` with at least three
points of order `2` and also a point of order `ℓ`, so the torsion subgroup has
order at least `4ℓ ≥ 20`. That contradicts Mazur's theorem, whose project-level
role is recorded in {uses "mazur_torsion_bound"}[] and whose original source is
{Informal.citep mazurTorsion}[].
:::

:::theorem "frey_curve_irreducible_via_mazur" (parent := "elliptic_frey_bridge")
The `ℓ`-torsion representation of the Frey curve is irreducible.
This is the bridge from the geometric chapter back to
{uses "mazur_frey_irreducible"}[] in the reduction spine.
:::

:::proof "frey_curve_irreducible_via_mazur"
This is now immediate from
{uses "reducible_frey_representation_conflicts_with_mazur"}[]: reducibility
would contradict Mazur's torsion bound, so irreducibility follows.
:::
