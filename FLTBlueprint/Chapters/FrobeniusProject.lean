import Verso
import VersoManual
import VersoBlueprint
import Mathlib.RingTheory.Invariant.Basic

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Frobenius Elements" =>

:::group "frobenius_project"
This miniproject records the general existence theorem for Frobenius elements
through decomposition groups and residue-field automorphisms. The key point is
that the existence theorem is not specific to local or global fields: it comes
from a very general invariant-theoretic statement about finite group actions on
commutative rings.
:::

# Status

:::definition "frobenius_project_status" (parent := "frobenius_project")
The TeX blueprint marks this miniproject as a success: the core result is
sorry-free and has already been merged into mathlib.
:::

The old LaTeX chapter explains why this was a satisfying surprise. The original
project expectation was that Frobenius elements would need a specialized
development for Dedekind domains or local/global fields. Instead, the eventual
formalization followed a Bourbaki theorem pointed out by Joel Riou: once a
finite group acts on a commutative ring and one passes to a prime ideal and its
residue field, the Frobenius-surjectivity statement drops out in great
generality.

So the miniproject is a genuine success story of the FLT blueprint: it isolated
an algebraic lemma, formalized it cleanly, and then upstreamed it to mathlib.

# The Set-Up

:::definition "decomposition_group_definition" (parent := "frobenius_project")
Given a finite group `G` acting on a commutative ring `B`, a prime ideal `Q` of
`B`, and the induced prime `P` of the invariant subring `A`, the decomposition
group `D_Q` is the stabilizer of `Q` under the action of `G`.
:::

The TeX chapter is explicit that this is set-theoretic stabilization, not
pointwise fixing of elements. From `Q` and `P` one forms the quotient domains
`B/Q` and `A/P`, then their fraction fields `L` and `K`. Even if `L/K` is not
finite or Galois, the group `Aut(L/K)` still makes sense, and that is enough
for the argument.

What makes the theorem striking is precisely the lack of finiteness hypotheses
on the rings. The only finite object in the set-up is the acting group `G`.

# Integrality From The Group Action

:::definition "group_action_characteristic_polynomial" (parent := "frobenius_project")
  (lean := "MulSemiringAction.charpoly")
For an element `b` of the big ring, the characteristic polynomial attached to
the finite group action is the finite product of the linear factors
`X - g • b` as `g` ranges over `G`.
:::

This finite product is monic for the obvious reason: each linear factor is
monic. The chapter
emphasizes this because the later integrality theorem is built by showing that
every element of `B` satisfies such a monic polynomial with coefficients
descending to the invariant ring. This is also the first place where finiteness
of the acting group is genuinely essential.

:::theorem "invariant_characteristic_polynomial_descends" (parent := "frobenius_project")
  (lean := "Algebra.IsInvariant.charpoly_mem_lifts")
If the image of the base ring `A` in `B` is exactly the fixed-point ring of the
action, then the characteristic polynomial of any `b ∈ B` descends from `B[X]`
to a monic polynomial over `A`.
:::

:::proof "invariant_characteristic_polynomial_descends"
The coefficients of the polynomial are symmetric expressions in the orbit
`{g • b}`, so acting by any element of `G` merely permutes the factors and fixes
every coefficient. By the invariant-ring hypothesis, those fixed coefficients
come from `A`.
:::

:::theorem "invariant_extension_integral" (parent := "frobenius_project")
  (lean := "Algebra.IsInvariant.isIntegral")
Under the same invariant-ring hypothesis, the extension `B/A` is integral.
This is the first structural theorem in the miniproject and it feeds directly
into the later residue-field argument.
:::

:::proof "invariant_extension_integral"
This is the clean formal payoff of the characteristic-polynomial construction
and {uses "invariant_characteristic_polynomial_descends"}[]: each `b ∈ B`
satisfies a monic polynomial with coefficients in `A`.

In the TeX chapter, this is the moment when the argument stops looking like
number theory and starts looking like invariant theory.
:::

:::theorem "primes_over_same_prime_are_conjugate" (parent := "frobenius_project")
  (lean := "Algebra.IsInvariant.exists_smul_of_under_eq")
Prime ideals of `B` lying above the same prime of `A` lie in one orbit of the
group action.
This is the transitivity statement that lets one compare different primes above
the same base prime in the classical Frobenius setting.
:::

:::proof "primes_over_same_prime_are_conjugate"
The TeX chapter treats this orbit statement as part of the same invariant
extension package. In the arithmetic examples, it is the formal reason that
Frobenius elements attached to different primes above `p` are conjugate, and
hence coincide when the ambient Galois group is abelian.
:::

# The Stabilizer Map

:::definition "stabilizer_hom_definition" (parent := "frobenius_project") (lean := "IsFractionRing.stabilizerHom")
Given a finite group acting on a commutative ring, a prime of the big ring, and
the induced residue-field extension, one gets a natural homomorphism from the
decomposition group to the automorphism group of the residue-field extension.
:::

:::proof "stabilizer_hom_definition"
Choose `g ∈ D_Q`. Because `g` stabilizes `Q`, it acts on the quotient `B/Q`,
and hence on its fraction field `L`. Since the invariant ring descends to `A/P`,
this induced automorphism is `K`-linear, so one gets an element of `Aut(L/K)`.

The blueprint stresses that all of the hidden verifications here are
straightforward. The real substance is not defining the map, but proving that it
hits every automorphism.
:::

:::theorem "stabilizer_hom_surjective" (parent := "frobenius_project") (lean := "IsFractionRing.stabilizerHom_surjective")
The main theorem says that this stabilizer homomorphism is surjective.
This is the abstract engine behind Frobenius elements in local and global
Galois settings.
:::

:::proof "stabilizer_hom_surjective"
The old blueprint presents this as a very general Bourbaki theorem whose field
theory applications are only a corollary.

The proof strategy is also worth recording. One studies the fixed field
`L^{D_Q}` and shows that every element fixed by the decomposition group already
comes from `K`. The hard part is building, from an element fixed modulo `Q`, an
element of the original ring with a characteristic polynomial tailored to the
orbit of `Q`. That is exactly where the invariant-theoretic characteristic
polynomial from {uses "group_action_characteristic_polynomial"}[] reenters the
argument.

So surjectivity is ultimately proved by combining the integrality package
{uses "invariant_extension_integral"}[] with a careful residue-field
construction, not by any specialized local-field computation.
:::

# Classical Consequences

:::theorem "frobenius_elements_classical_corollary" (parent := "frobenius_project")
In the classical setting where `B` is the ring of integers of a finite Galois
extension of number fields, the theorem above produces Frobenius elements for
primes of `B` lying above a rational prime `p`.
:::

:::proof "frobenius_elements_classical_corollary"
In that arithmetic example, the residue-field extension is finite, so
`Aut(L/K)` is just the Galois group of a finite field extension and is generated
by a Frobenius automorphism. Surjectivity of
{uses "stabilizer_hom_surjective"}[] lifts that residue-field Frobenius back to
an element of the decomposition group.

The TeX chapter also uses this point to explain the arithmetic versus geometric
Frobenius normalization issue. The formal theorem is neutral about that choice:
it gives the stabilizer-to-residue-field surjection, and the user decides which
generator of the finite field Galois group to lift.
:::
