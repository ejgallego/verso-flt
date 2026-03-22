import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Hardly Ramified Representations" =>

:::group "hardly_ramified_program"
This chapter is the representation-theoretic spine of the FLT strategy. After
the Diophantine reductions have produced a Frey curve, the remaining task is to
show that its mod-p Galois representation cannot simultaneously satisfy the
very restrictive local conditions forced by that curve and remain irreducible.
The TeX chapter organizes this through three deeper inputs: lifting,
compatible families, and the reduction at `3`.
:::

The old TeX blueprint makes the reduction pattern explicit. One first proves
that Frey-curve torsion is hardly ramified, then proves a general reducibility
theorem for hardly ramified mod $`p` representations, and finally feeds that
back into the contradiction from the reductions chapter.

What matters is not just that the Frey curve gives a two-dimensional
representation, but that the local conditions at $`2` and $`p` are so rigid
that the representation can be moved through deformation theory and compatible
families. The reduction is designed to replace an arbitrary mod $`p`
representation by one in a very small and structured class.

# Coefficient rings

:::definition "coefficient_ring_definition" (parent := "hardly_ramified_program")
The local conditions are phrased over profinite local coefficient rings with
finite residue field, so the same definition covers finite-field
representations, $`p`-adic lifts, and the coefficient rings that naturally
appear in deformation theory.
:::

The TeX blueprint pauses here because this generality is not cosmetic. The
lifting theorem does not stay inside finite fields, and the compatible-family
theorem moves between different completions of a number field. So the right
framework is broad enough to talk uniformly about residual representations,
integral $`p`-adic lifts, and inverse limits of finite local objects.

:::definition "hardly_ramified_definition" (parent := "hardly_ramified_program")
A two-dimensional Galois representation is hardly ramified if it satisfies four
local conditions:

- its determinant is cyclotomic
- it is unramified outside $`2\ell`
- at $`2` it admits a $`G_{\mathbf{Q}_2}`-stable filtration with
  one-dimensional unramified quotient whose square is trivial
- at $`\ell` every finite quotient comes from a finite flat group scheme

This is the organizing definition behind the modern reduction strategy.
:::

The point of the definition is that it packages four distinct local facts into
one reusable hypothesis. The determinant condition comes from the Weil pairing,
the ramification condition records the minimal bad places of the Frey curve,
the upper-triangular behavior at $`2` reflects semistability there, and the
finite-flat condition at $`\ell` is the local input that lets deformation
theory see the representation as geometric rather than arbitrary.

The TeX chapter also notes that for hardly ramified mod $`\ell`
representations, irreducible and absolutely irreducible coincide: because
$`\ell \ge 3` and the determinant is cyclotomic, complex conjugation already
has two distinct eigenvalues over the ground field. This removes an annoying
field-of-definition ambiguity from the deformation theory.

# The Frey curve enters the class

:::theorem "frey_torsion_hardly_ramified" (parent := "hardly_ramified_program")
The mod $`p` representation on the torsion of the Frey curve is hardly
ramified.
This is the formal bridge from {uses "frey_curve_definition"}[] to the
modularity package.
:::

:::proof "frey_torsion_hardly_ramified"
This theorem is where the arithmetic of the Frey curve is compressed into the
single definition {uses "hardly_ramified_definition"}[].

The determinant is cyclotomic for general elliptic-curve torsion
representations, while the Frey-specific work is in the local conditions. The
old blueprint points to Serre's discussion of the Frey curve and Serre's
conjecture {Informal.citep serreModularityConjecture}[] for the bad-reduction
analysis. For the general elliptic-curve facts on torsion and the Weil pairing,
the standard reference is Silverman {Informal.citep silvermanArithmeticEllipticCurves}[]:
outside $`2` and $`p` the representation is unramified, at
$`2` semistability forces the required one-dimensional quotient, and at
$`p` the torsion is finite flat.

This is the first place where the Frey curve stops being a geometric object and
starts being an input to the deformation-theoretic part of the argument. The
intermediate arithmetic bridge is now spelled out in the new chapter through
{uses "elliptic_curve_torsion_determinant_cyclotomic"}[],
{uses "frey_curve_unramified_away_from_two_and_l"}[],
{uses "frey_curve_local_shape_at_two"}[], and
{uses "frey_curve_flat_at_l"}[].
:::

# Three bridges out of characteristic `p`

:::theorem "hardly_ramified_lifts" (parent := "hardly_ramified_program")
An irreducible mod $`p` hardly ramified representation lifts to a $`p`-adic
hardly ramified representation.
This is the first deformation-theoretic input needed after establishing
{uses "frey_torsion_hardly_ramified"}[], and the first of the three ingredients
used in {uses "hardly_ramified_reducible"}[].
:::

:::proof "hardly_ramified_lifts"
The formal statement isolates the existence of a characteristic-zero lift while
keeping the hardly ramified local conditions intact.

Conceptually, this is the first bridge away from the original residual
representation. The lift theorem says that the relevant local deformation
problem is nonempty: irreducibility does not trap us in characteristic
$`p`, but instead produces a genuinely $`p`-adic representation with the same
determinant, the same ramification restrictions, the same condition at $`2`,
and the same flatness condition at $`p`.

That makes the representation accessible to the modularity-lifting and
potential-modularity technology outlined in {uses "potential_modularity_step"}[]
and {uses "modularity_lifting_theorem"}[].
:::

:::theorem "hardly_ramified_compatible_family" (parent := "hardly_ramified_program")
A $`p`-adic hardly ramified representation belongs to a compatible family.
This is the step that makes it possible to move from a prime $`p` coming from
the Frey package to a controlled specialization at $`3`, and it is the second
major ingredient in {uses "hardly_ramified_reducible"}[].
:::

:::proof "hardly_ramified_compatible_family"
The compatible-family theorem is the gateway from one local deformation problem
to a global family where the switch to $`3` can be analyzed.

The role of this theorem is easy to miss if one only looks at the endpoints.
The original Frey package chooses one prime $`p`, but the later contradiction
is most effective at $`3`. A compatible family is what makes that comparison
legal: Frobenius characteristic polynomials agree across the family away from
the finitely many excluded primes, so information proved for the $`3`-adic
member propagates back to the original $`p`-adic member.

This is the precise version, inside the chapter, of the strategy already
signaled by {uses "compatible_family_step"}[].
:::

# Specialization at `3`

:::theorem "hardly_ramified_mod_three" (parent := "hardly_ramified_program")
A hardly ramified mod $`3` representation is forced into a two-step filtration
whose Jordan-Hölder factors are the trivial and cyclotomic characters.
This is the residual input behind {uses "hardly_ramified_three_adic"}[].
:::

:::proof "hardly_ramified_mod_three"
This is the first place where the prime $`3` becomes special rather than just
convenient. The local conditions are rigid enough in characteristic $`3` that
there is essentially no room for exotic irreducible behavior.

The old blueprint phrases the conclusion as an almost complete classification of
the mod $`3` case. For the later contradiction, the key point is that the
semisimplification is already the expected reducible object.
:::

:::theorem "hardly_ramified_three_adic" (parent := "hardly_ramified_program")
A hardly ramified $`3`-adic representation has the same semisimple Frobenius
data as $`1 \oplus \chi_3`; in particular, away from $`2` and $`3` the trace
at Frobenius is $`1+p`.
This packages the final local contradiction used in
{uses "hardly_ramified_reducible"}[].
:::

:::proof "hardly_ramified_three_adic"
In the TeX blueprint this is presented as the easiest of the three deep inputs.
It is the stage where the Fontaine-style discriminant argument enters: the mod
$`3` classification and the local flatness/tameness hypotheses force any
would-be irreducible extension to cut out a number field with impossibly small
root discriminant.

So this theorem is the point where the chapter uses the historical input
recorded as {uses "odlyzko_root_discriminant_bound"}[], ultimately in the
numerical form developed by Poitou and Odlyzko
{Informal.citep poitouOdlyzkoBounds}[].
:::

# The reducibility contradiction

:::theorem "hardly_ramified_reducible" (parent := "hardly_ramified_program")
If $`\ell \ge 3` is prime, then every hardly ramified mod $`\ell`
representation is reducible.
This is the general theorem that turns the Frey-curve local analysis into a
contradiction by combining {uses "hardly_ramified_lifts"}[],
{uses "hardly_ramified_compatible_family"}[], and
{uses "hardly_ramified_three_adic"}[].
:::

:::proof "hardly_ramified_reducible"
Assume a hardly ramified mod $`\ell` representation were irreducible. By
{uses "hardly_ramified_lifts"}[] it lifts to a hardly ramified $`\ell`-adic
representation, and by {uses "hardly_ramified_compatible_family"}[] that lift
belongs to a compatible family. Moving to the place above $`3` and applying
{uses "hardly_ramified_three_adic"}[] shows that for primes $`p \nmid 6\ell`
the Frobenius characteristic polynomial is forced to be $`(X-p)(X-1)`.

Compatibility carries the same characteristic polynomials back to the original
$`\ell`-adic and then mod $`\ell` representation. Chebotarev and
Brauer--Nesbitt then force the semisimplification to be $`1 \oplus \chi_\ell`,
contradicting irreducibility.

The old blueprint emphasizes that this is a very special case of Serre's
conjecture {Informal.citep serreModularityConjecture}[], and therefore now a
theorem by Khare and Wintenberger {Informal.citep khareWintenbergerII}[]; the
point of the chapter is to isolate a route to this special case that matches
the project's preferred modularity-lifting infrastructure.
:::

:::theorem "frey_torsion_not_irreducible" (parent := "hardly_ramified_program")
The Frey curve torsion representation is not irreducible.
This is the modularity-side endpoint used in {uses "wiles_frey_not_irreducible"}[]
and therefore in {uses "no_frey_package"}[]; it is the direct Frey-curve
specialization of {uses "hardly_ramified_reducible"}[].
:::

:::proof "frey_torsion_not_irreducible"
This is now a short deduction inside the blueprint narrative: combine
{uses "frey_torsion_hardly_ramified"}[] with
{uses "hardly_ramified_reducible"}[].

The point of the Verso port is to restore the intermediate story from the TeX
blueprint: lift, spread out to a compatible family, specialize at $`3`, and
push the resulting Frobenius constraints back to the original mod $`p`
representation.
:::
