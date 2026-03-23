import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Elliptic Curves And The Frey Curve" =>

:::group "elliptic_frey_bridge"
This chapter packages the elliptic-curve input behind the two main outputs of
the Frey-curve analysis: that the torsion representation is hardly ramified and
that Mazur's theorem forces it to be irreducible.
:::

# Overview

In the reductions chapter we explained how a counterexample to Fermat's Last
Theorem gives a Frey package and hence a Frey curve, an elliptic curve with
some remarkable properties. This chapter starts with an overview of the
arithmetic of elliptic curves and then sketches proofs of the two main
conclusions needed later: first, that the `\ell`-torsion in the Frey curve is
hardly ramified, and second, that Mazur's theorem on torsion in elliptic curves
forces that same `\ell`-torsion representation to be irreducible.

Everything here follows from standard results about elliptic curves. The TeX
chapter is explicit that almost none of this was in mathlib when the chapter
was first drafted, so this part of the blueprint remains a large reservoir of
future formalization work.

# The Arithmetic Of Elliptic Curves

We begin with the standard arithmetic facts needed later, citing the
literature for proofs. Most of this material dates back to the `1970`s or
earlier.

:::theorem "elliptic_curve_torsion_cardinality" (parent := "elliptic_frey_bridge")
For an elliptic curve over a separably closed field of characteristic prime to
`n`, the `n`-torsion has cardinality `n²`.
:::

:::proof "elliptic_curve_torsion_cardinality"
The TeX chapter treats this as classical. One proof runs through division
polynomials; the original blueprint notes that this route was being formalized
as part of David Angdinata's PhD work.
:::

This theorem determines the structure of the `n`-torsion once one adds the
following purely group-theoretic lemma.

:::theorem "torsion_group_structure_lemma" (parent := "elliptic_frey_bridge")
If the `d`-torsion in an abelian group has size `d^r` for every divisor `d` of
`n`, then the `n`-torsion is isomorphic to `(\mathbf{Z}/n\mathbf{Z})^r`.
:::

:::proof "torsion_group_structure_lemma"
The TeX proof argues by writing the finite abelian group in invariant-factor
form. The case `n = 1` is trivial, so assume `n > 1` and write the relevant
torsion subgroup as
$`\prod_{i=1}^t \mathbf{Z}/a_i\mathbf{Z}` with `a_i \mid a_{i+1}`. Applying the
hypothesis first with `d = a_1` forces `t = r`, and then applying it with
`d = a_t` forces all the `a_i` to be equal to `n`.
:::

:::theorem "elliptic_curve_torsion_two_dimensional" (parent := "elliptic_frey_bridge")
For an elliptic curve over a field of characteristic prime to `n`, the
`n`-torsion over a separable closure is a two-dimensional
`\mathbf{Z}/n\mathbf{Z}` module.
:::

:::proof "elliptic_curve_torsion_two_dimensional"
This is the corollary the TeX chapter draws from
{uses "elliptic_curve_torsion_cardinality"}[] and
{uses "torsion_group_structure_lemma"}[]: the `n`-torsion has size `n²`, hence
is isomorphic to `(\mathbf{Z}/n\mathbf{Z})²`.

In the FLT story, this is the point where the Frey curve stops being just an
elliptic curve and starts producing a two-dimensional Galois representation.
:::

If `E` is an elliptic curve over a field `k` and `k^{\mathrm{sep}}` is a
separable closure of `k`, then `\mathrm{Gal}(k^{\mathrm{sep}} / k)` acts on the
torsion group `E(k^{\mathrm{sep}})[n]`. Once we know that this group is
two-dimensional over `\mathbf{Z}/n\mathbf{Z}`, fixing a basis turns it into a
representation to `\GL_2(\mathbf{Z}/n\mathbf{Z})`.

:::theorem "elliptic_curve_torsion_determinant_cyclotomic" (parent := "elliptic_frey_bridge")
The determinant of the Galois action on elliptic-curve torsion is the
cyclotomic character.
This is the determinant input later repackaged in
{uses "hardly_ramified_definition"}[].
:::

:::proof "elliptic_curve_torsion_determinant_cyclotomic"
The TeX chapter expects this to be proved via the Weil pairing and treats it as
standard elliptic-curve background; see
{Informal.citep silvermanArithmeticEllipticCurves}[].

For the blueprint, the strategic point is simple: once the determinant is known
to be cyclotomic, every later local or global constraint on the representation
must be compatible with that fixed determinant.
:::

# Good Reduction

We now give a brief overview of good reduction for elliptic curves. The TeX
chapter deliberately works in a low-level plane-cubic language here, because it
is enough for the first Frey-curve calculations.

:::definition "good_reduction_definition" (parent := "elliptic_frey_bridge")
Good reduction means that an elliptic curve admits an integral model whose
reduction modulo the maximal ideal is still smooth.
:::

From this point on, the TeX chapter switches Frey-package notation from
`(a,b,c,p)` to `(a,b,c,\ell)`, keeping `p` free for other primes. We follow the
same convention in the discussion below.

:::theorem "frey_curve_good_reduction_away_from_abc" (parent := "elliptic_frey_bridge")
For the Frey curve attached to a Frey package, any odd prime not dividing
`abc` is a prime of good reduction.
:::

:::proof "frey_curve_good_reduction_away_from_abc"
The cubic defining the Frey curve has roots `0`, `a^\ell`, and `-b^\ell`. If a
prime does not divide `abc`, then these roots remain distinct modulo that
prime, because the difference between `a^\ell` and `-b^\ell` is `c^\ell`.
Hence the reduced cubic is smooth.
:::

If `E` is an elliptic curve over a number field and `\rho` is the Galois
representation on its `n`-torsion, then `\rho` is said to be unramified at a
prime exactly when the finite extension cut out by the torsion is unramified
there.

The TeX chapter also introduces a working notion of finite flat group scheme,
since later local conditions at `\ell` are phrased in those terms.

:::definition "finite_flat_group_scheme_definition" (parent := "elliptic_frey_bridge")
For the purposes of the FLT strategy, a finite flat group scheme over a ring is
the algebro-geometric object that packages torsion in good or multiplicative
integral models in a form compatible with local Galois representations.
:::

The original TeX notes immediately remark that in the genuinely non-Noetherian
case one should probably ask for locally free rather than flat, but that this
distinction is irrelevant for the first reductions they need.

Some basic consequences of good reduction are then recorded.

:::theorem "good_reduction_implies_unramified_torsion" (parent := "elliptic_frey_bridge")
For primes away from `\ell`, good reduction implies that elliptic-curve torsion
is unramified.
:::

:::proof "good_reduction_implies_unramified_torsion"
The TeX chapter treats this as a standard theorem from the arithmetic of
elliptic curves: once the elliptic curve has a smooth integral model at a prime
not equal to `\ell`, the corresponding `\ell`-torsion carries no local
ramification there.

This is the theorem that makes
{uses "frey_curve_good_reduction_away_from_abc"}[] useful on the Galois side.
:::

:::theorem "good_reduction_implies_finite_flat_torsion" (parent := "elliptic_frey_bridge")
At a prime above `p`, good reduction implies that the `p`-torsion comes from a
finite flat group scheme on the local integral model.
:::

:::proof "good_reduction_implies_finite_flat_torsion"
This is the good-reduction half of the finite-flat analysis in the TeX chapter.
The kernel of multiplication by `p` on a good integral model is the expected
finite flat group scheme.
:::

# Multiplicative Reduction

:::definition "multiplicative_reduction_definition" (parent := "elliptic_frey_bridge")
Multiplicative reduction means that the reduced cubic has an ordinary double
point rather than remaining smooth.
:::

For elliptic curves over number fields, the corresponding local definition is
obtained by passing to the localization at the prime in question.

:::theorem "frey_curve_multiplicative_reduction_at_bad_prime" (parent := "elliptic_frey_bridge")
If an odd prime divides `abc`, then the Frey curve has multiplicative reduction
at that prime.
:::

:::proof "frey_curve_multiplicative_reduction_at_bad_prime"
When `p \mid abc`, exactly two of the three roots `0`, `a^\ell`, and `-b^\ell`
coincide modulo `p`. The reduced cubic therefore acquires an ordinary double
point.

So outside `\ell`, the bad odd primes of the Frey curve are exactly the primes
dividing `abc`, and they are all multiplicative.
:::

The TeX chapter notes that one can also characterize when this reduction is
split, but that the split/non-split distinction is not needed at this stage.

:::theorem "frey_curve_multiplicative_reduction_at_two" (parent := "elliptic_frey_bridge")
The Frey curve always has multiplicative reduction at `2`.
:::

:::proof "frey_curve_multiplicative_reduction_at_two"
The TeX proof makes the explicit change of variables `X = 4X'` and
`Y = 8Y' + 4X'`. Because `\ell \ge 5`, `b` is even, and `a \equiv 3 \pmod 4`,
the transformed equation reduces modulo `2` to a cubic with an ordinary double
point at `(0,0)`.

This is the special local place where the later hardly ramified package is
forced to use a weaker semisimplified statement rather than complete
unramifiedness.
:::

In particular, the Frey curve attached to a Frey package is semistable: it has
good or multiplicative reduction at every prime.

The main local input for multiplicative reduction is Tate's uniformization
theorem. In the current blueprint, we record only the consequence actually used
for torsion representations.

:::theorem "tate_curve_local_torsion_shape" (parent := "elliptic_frey_bridge")
For an elliptic curve with multiplicative reduction over a nonarchimedean local
field, the Tate-curve description shows that torsion is controlled by an
extension of a cyclotomic character by an unramified character of order at most
`2`.
:::

:::proof "tate_curve_local_torsion_shape"
After an unramified quadratic twist, multiplicative reduction becomes split and
the Tate-curve uniformization describes the torsion explicitly in terms of
roots of unity and the Tate parameter `q`.

For the FLT blueprint, this one package has several consequences at once:
unramifiedness away from `2` and `\ell`, the special semisimplified shape at
`2`, and the finite-flat description at `\ell`.
:::

:::theorem "frey_curve_j_invariant_formula" (parent := "elliptic_frey_bridge")
The `j`-invariant of the Frey curve admits an explicit formula in terms of
`A = a^\ell`, `B = b^\ell`, and `C = c^\ell`.
:::

:::proof "frey_curve_j_invariant_formula"
The TeX chapter writes this formula down because it makes the bad-prime
analysis completely explicit. Once the valuation of `j` can be read off
directly, the Tate parameter `q` is no longer mysterious: its valuation is
forced by that `j`-invariant formula.
:::

:::theorem "frey_curve_j_bad_prime_valuation" (parent := "elliptic_frey_bridge")
If an odd prime `p` divides `abc`, then the `p`-adic valuation of the
Frey-curve `j`-invariant is a multiple of `\ell`.
:::

:::proof "frey_curve_j_bad_prime_valuation"
The TeX proof is a direct valuation computation from the explicit
`j`-invariant formula. At a bad odd prime dividing `abc`, the numerator stays a
unit while the denominator contributes a valuation divisible by `\ell`.

This is the key numerical input that upgrades the Tate-curve description into
actual unramifiedness at those odd bad primes.
:::

:::theorem "frey_curve_unramified_away_from_two_and_l" (parent := "elliptic_frey_bridge")
The Frey-curve `\ell`-torsion representation is unramified at every prime
`p \ne 2, \ell`.
This is the main ramification input later used in
{uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "frey_curve_unramified_away_from_two_and_l"
There are two cases. If `p` does not divide `abc`, use
{uses "frey_curve_good_reduction_away_from_abc"}[] together with
{uses "good_reduction_implies_unramified_torsion"}[]. If `p` is an odd divisor
of `abc`, use {uses "frey_curve_multiplicative_reduction_at_bad_prime"}[] and
the Tate-curve analysis from {uses "tate_curve_local_torsion_shape"}[].

The TeX chapter also tracks the `p`-adic valuation of the `j`-invariant to show
that, at these bad odd primes, the Tate parameter produces no extra
`\ell`-adic ramification; this is exactly the role of
{uses "frey_curve_j_bad_prime_valuation"}[].
:::

:::theorem "frey_curve_local_shape_at_two" (parent := "elliptic_frey_bridge")
At the prime `2`, the semisimplification of the Frey-curve `\ell`-torsion
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
At the prime `\ell`, the Frey-curve `\ell`-torsion comes from a finite flat
group scheme.
This is the local-flatness input used in {uses "frey_torsion_hardly_ramified"}[].
:::

:::proof "frey_curve_flat_at_l"
The TeX chapter splits into the same two cases that appear throughout the local
theory. If the Frey curve has good reduction at `\ell`, then its `\ell`-torsion
is finite flat on the integral model. If it has multiplicative reduction, the
Tate-curve description again shows that the relevant extension is finite flat.

So the `\ell`-adic local condition in the definition of hardly ramified is not
an auxiliary hypothesis invented for convenience; it is genuinely one of the
local properties of the Frey curve. The TeX chapter points to Edixhoven and
Katz--Mazur for this local finite-flat input
{Informal.citep edix}[] {Informal.citep katzMazurArithmeticModuli}[].
:::

# Hardly Ramified Representations

At this point the TeX chapter introduces a simplified notion of hardly
ramified mod `\ell` representation tailored to the Frey-curve situation. In
the current blueprint, we use the broader chapter-level definition from the
hardly ramified chapter and simply verify that the Frey curve satisfies it.

:::theorem "frey_curve_hardly_ramified_bridge" (parent := "elliptic_frey_bridge")
The `\ell`-torsion Galois representation of the Frey curve coming from a Frey
package is hardly ramified.
This is the first main conclusion of the TeX chapter.
:::

:::proof "frey_curve_hardly_ramified_bridge"
This follows by combining
{uses "elliptic_curve_torsion_determinant_cyclotomic"}[],
{uses "frey_curve_unramified_away_from_two_and_l"}[],
{uses "frey_curve_local_shape_at_two"}[], and
{uses "frey_curve_flat_at_l"}[].
:::

# The ℓ-Torsion In The Frey Curve Is Irreducible

The chapter closes by showing that Mazur's theorem on rational torsion forces
the `\ell`-torsion in the Frey curve to be irreducible. The theorem itself is
recorded in the historical-inputs chapter; here we use it as a black box and
follow the local character analysis from Serre's 1972 paper.

Let `(a,b,c,\ell)` be a Frey package, with associated Frey curve `E` and mod
`\ell` Galois representation `\rho = E[\ell]`. We know that `\rho` is
two-dimensional. Suppose for contradiction that it is reducible, so its
semisimplification is the direct sum of two characters `\alpha` and `\beta`.

The next two results are the ones the TeX chapter attributes to Serre's Lemme
6 in his 1972 paper on torsion points.

:::theorem "reducible_frey_characters_unramified_away_from_l" (parent := "elliptic_frey_bridge")
If the Frey-curve `\ell`-torsion representation were reducible with characters
`\alpha` and `\beta`, then both characters would be unramified at every prime
`p \ne \ell`.
:::

:::proof "reducible_frey_characters_unramified_away_from_l"
Away from `2` and `\ell`, this follows from
{uses "frey_curve_unramified_away_from_two_and_l"}[]. At `2`, use
{uses "frey_curve_local_shape_at_two"}[] to see that the semisimplification is
already unramified.
:::

:::theorem "reducible_frey_character_unramified_at_l" (parent := "elliptic_frey_bridge")
In the reducible case, at least one of the two one-dimensional characters is
also unramified at `\ell`.
:::

:::proof "reducible_frey_character_unramified_at_l"
In the multiplicative-reduction case, this follows immediately from the
Tate-curve picture. In the good-reduction case, the `\ell`-torsion is finite
flat at `\ell` by {uses "frey_curve_flat_at_l"}[], and the local theory of
ordinary and supersingular reduction forces one character to be unramified.

This is the last local input needed before Minkowski's theorem can be applied.
:::

:::theorem "reducible_frey_representation_has_trivial_character" (parent := "elliptic_frey_bridge")
If the Frey-curve `\ell`-torsion representation were reducible, then one of the
resulting one-dimensional characters would have to be trivial.
:::

:::proof "reducible_frey_representation_has_trivial_character"
By {uses "reducible_frey_characters_unramified_away_from_l"}[] and
{uses "reducible_frey_character_unramified_at_l"}[], one of the characters is
unramified everywhere. A one-dimensional character unramified everywhere cuts
out a number field unramified everywhere, so Minkowski forces it to be trivial.
:::

To summarize, the reducible case has the following very restricted shape.

:::theorem "reducible_frey_representation_structure" (parent := "elliptic_frey_bridge")
If the Frey-curve `\ell`-torsion representation were reducible, then it would
have either a trivial one-dimensional subrepresentation or a trivial
one-dimensional quotient.
:::

:::proof "reducible_frey_representation_structure"
This is the representation-theoretic reformulation of
{uses "reducible_frey_representation_has_trivial_character"}[].
:::

We now split into those two cases.

:::theorem "trivial_submodule_yields_rational_l_torsion" (parent := "elliptic_frey_bridge")
If the Frey-curve `\ell`-torsion representation has a trivial one-dimensional
submodule, then the Frey curve has a rational point of order `\ell`.
:::

:::proof "trivial_submodule_yields_rational_l_torsion"
A trivial subrepresentation is exactly a Galois-stable line inside `E[\ell]`,
and that line corresponds to a rational torsion point of order `\ell`.
:::

:::theorem "no_trivial_submodule_by_mazur" (parent := "elliptic_frey_bridge")
The Frey-curve `\ell`-torsion representation cannot have a trivial
one-dimensional subrepresentation.
:::

:::proof "no_trivial_submodule_by_mazur"
By {uses "trivial_submodule_yields_rational_l_torsion"}[], a trivial submodule
would give a rational point of order `\ell`. The Frey curve already has three
points of order `2`, so the torsion subgroup would have order at least
`4\ell \ge 20`, contradicting {uses "mazur_torsion_bound"}[].
:::

It remains to rule out the case of a trivial quotient. The TeX chapter brings
in the geometric fact that one can quotient an elliptic curve by a Galois-stable
subgroup of order `\ell`.

:::theorem "quotient_by_galois_stable_l_subgroup" (parent := "elliptic_frey_bridge")
If an elliptic curve has a Galois-stable subgroup of order `\ell` in its
`\ell`-torsion, then there is an `\ell`-isogenous quotient elliptic curve
obtained by dividing out by that subgroup.
:::

:::proof "quotient_by_galois_stable_l_subgroup"
The TeX chapter presents this as the geometric input needed to turn the trivial
quotient case into the trivial submodule case on an isogenous curve. A full
formal proof would require substantial algebro-geometric machinery, but the
mathematical role of the theorem inside the Mazur argument is clear.
:::

:::theorem "trivial_quotient_reduces_to_isogenous_submodule_case" (parent := "elliptic_frey_bridge")
If the Frey-curve `\ell`-torsion representation has a trivial one-dimensional
quotient, then an `\ell`-isogenous quotient curve has a trivial one-dimensional
subrepresentation.
:::

:::proof "trivial_quotient_reduces_to_isogenous_submodule_case"
Apply {uses "quotient_by_galois_stable_l_subgroup"}[] to the Galois-stable
kernel of the quotient map. On the new elliptic curve, the dual isogeny
repackages the same reducibility into the submodule case.
:::

:::theorem "no_trivial_quotient_by_mazur" (parent := "elliptic_frey_bridge")
The Frey-curve `\ell`-torsion representation cannot have a trivial
one-dimensional quotient.
:::

:::proof "no_trivial_quotient_by_mazur"
The TeX chapter handles this by passing to the `\ell`-isogenous quotient curve
from {uses "quotient_by_galois_stable_l_subgroup"}[]. That quotient curve then
has a trivial subrepresentation and still has the inherited `2`-torsion needed
to contradict {uses "mazur_torsion_bound"}[].
:::

:::theorem "reducible_frey_representation_conflicts_with_mazur" (parent := "elliptic_frey_bridge")
A reducible Frey-curve `\ell`-torsion representation would force too much
rational torsion, contradicting {uses "mazur_torsion_bound"}[].
This is the arithmetic content behind {uses "mazur_frey_irreducible"}[].
:::

:::proof "reducible_frey_representation_conflicts_with_mazur"
By {uses "reducible_frey_representation_structure"}[], reducibility would leave
either a trivial subrepresentation or a trivial quotient. The first case is
ruled out by {uses "no_trivial_submodule_by_mazur"}[], and the second by
{uses "no_trivial_quotient_by_mazur"}[].
:::

:::theorem "frey_curve_irreducible_via_mazur" (parent := "elliptic_frey_bridge")
The `\ell`-torsion representation of the Frey curve is irreducible.
This is the bridge from the geometric chapter back to
{uses "mazur_frey_irreducible"}[] in the reduction spine.
:::

:::proof "frey_curve_irreducible_via_mazur"
This is now immediate from
{uses "reducible_frey_representation_conflicts_with_mazur"}[]: reducibility
would contradict Mazur's torsion bound, so irreducibility follows.
:::
