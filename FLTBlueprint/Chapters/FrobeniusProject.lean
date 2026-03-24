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

# Introduction And Goal

When this project started, the expectation was that Frobenius elements were a
special feature of local and global fields, perhaps with a slightly more
general Dedekind-domain statement. The TeX chapter explains that Bourbaki's
theorem is much broader than that: the only finiteness hypothesis is on the
group action, not on the rings.

The goal of the miniproject is therefore to formalize and upstream the
surjectivity theorem for the stabilizer map. The classical Frobenius elements
for arithmetic Galois extensions then appear as an easy corollary.

# Statement Of The Theorem

Throughout the chapter, a finite group `G` acts by ring automorphisms on a
commutative ring `B`, and `A` denotes the subring of `G`-invariants.

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

The goal of the mini-project is to get exactly this theorem formalized and,
ideally, into mathlib. The TeX chapter emphasizes how striking it is that one
deduces finiteness of `Aut(L/K)` from nothing more than finiteness of the group
`G` acting on `B`.

# Examples

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

The TeX chapter also uses this point to explain the arithmetic-versus-geometric
Frobenius normalization issue. The formal theorem is neutral about that choice:
it gives the stabilizer-to-residue-field surjection, and the user decides which
generator of the finite field Galois group to lift.
:::

The TeX chapter also includes characteristic-`p` examples showing that the
residue-field extension `L/K` need not be finite or separable in general, even
though `Aut(L/K)` is always finite. The point of those examples is to justify
why the proof is organized directly around the stabilizer map rather than
through a naive finite-Galois-field picture.

# The Extension B/A

The precise setup used in the proof is that the image of `A` in `B` is exactly
the invariant subring. The first structural theorem is that `B/A` is integral.

:::definition "group_action_characteristic_polynomial" (parent := "frobenius_project")
  (lean := "MulSemiringAction.charpoly")
For an element `b` of the big ring, the characteristic polynomial attached to
the finite group action is the finite product of the linear factors
`X - g • b` as `g` ranges over `G`.
:::

This finite product is monic for the obvious reason: each linear factor is
monic. The chapter emphasizes this because the later integrality theorem is
built by showing that every element of `B` satisfies such a monic polynomial
with coefficients descending to the invariant ring. This is also the first
place where finiteness of the acting group is genuinely essential.

:::theorem "invariant_characteristic_polynomial_descends" (parent := "frobenius_project")
  (lean := "Algebra.IsInvariant.charpoly_mem_lifts")
If the image of the base ring `A` in `B` is exactly the fixed-point ring of the
action, then the characteristic polynomial of any `b ∈ B` descends from `B[X]`
to a monic polynomial over `A`.
:::

:::proof "invariant_characteristic_polynomial_descends"
The coefficients of the polynomial are symmetric expressions in the orbit
`{g • b}`, so acting by any element of `G` merely permutes the factors and
fixes every coefficient. By the invariant-ring hypothesis, those fixed
coefficients come from `A`.
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

# The Extension (B/Q)/(A/P)

The TeX chapter next builds an element of `B` whose characteristic polynomial
has a controlled shape modulo `Q`, first in a bare orbit-sensitive form and
then in a form adapted to an element already fixed by the decomposition group.
Those technical lemmas feed the first real fixed-point proposition.

:::theorem "fixed_residue_class_fixed_by_stabilizer" (parent := "frobenius_project")
If an element of `B/Q` is fixed by the stabilizer subgroup `D_Q`, then it is
already fixed by `Aut(L/K)`.
:::

:::proof "fixed_residue_class_fixed_by_stabilizer"
The TeX proof constructs elements `a, b ∈ B` with a characteristic polynomial
whose image in `L[X]` has the special form
`(X - a b₀)^{|D_Q|} X^{|G|-|D_Q|}`.
Viewed through `B[X]`, this polynomial reflects exactly the orbit of `Q`; viewed
through `K[X]`, it shows that `ab₀` lies in `K`. Since `a` is nonzero modulo
`Q`, the element `b₀` itself is fixed by `Aut(L/K)`.
:::

# The Extension L/K

The final proof writes the stabilizer map as a composition
`D_Q -> Aut(L/L^{D_Q}) -> Aut(L/K)`.

:::theorem "fixed_field_galois_surjectivity" (parent := "frobenius_project")
If a finite group `H` acts on a field `F`, then the natural map
`H -> Aut(F/F^H)` is surjective.
:::

:::proof "fixed_field_galois_surjectivity"
The TeX chapter treats this as a standard fact from Galois theory. In the Lean
development, this ingredient was already available in mathlib.
:::

:::theorem "algebraic_fraction_denominator_lift" (parent := "frobenius_project")
If `R/S` is an algebraic extension of integral domains, then any fraction
`a/b` with `a, b ∈ R` can be rewritten as `c/d` with `c ∈ R` and `d ∈ S`.
:::

:::proof "algebraic_fraction_denominator_lift"
The TeX proof uses an algebraic relation for `b` over `S`: if `f(b) = 0` for a
polynomial `f ∈ S[X]`, then the constant term of `f` is divisible by `b`. That
lets one clear the denominator using an element of the base domain.
:::

:::theorem "fixed_fraction_field_element_fixed_by_stabilizer" (parent := "frobenius_project")
If an element of `L` is fixed by the stabilizer subgroup `D_Q`, then it is
fixed by `Aut(L/K)`.
:::

:::proof "fixed_fraction_field_element_fixed_by_stabilizer"
Because `(B/Q)/(A/P)` is algebraic by
{uses "invariant_extension_integral"}[], the denominator-lifting theorem
{uses "algebraic_fraction_denominator_lift"}[] lets one write any such element
of `L` as `b/a` with `b ∈ B/Q` and `a ∈ A/P`. The numerator `b` is then fixed
by `D_Q`, so {uses "fixed_residue_class_fixed_by_stabilizer"}[] shows it is
fixed by `Aut(L/K)`, and hence the original fraction is fixed as well.
:::

:::proof "stabilizer_hom_surjective"
The old blueprint presents this as a very general Bourbaki theorem whose field
theory applications are only a corollary.

The proof strategy is to study the fixed field `L^{D_Q}`. The map
`D_Q -> Aut(L/L^{D_Q})` is surjective by
{uses "fixed_field_galois_surjectivity"}[]. For the second arrow, every element
fixed by the decomposition group already comes from `K` by
{uses "fixed_fraction_field_element_fixed_by_stabilizer"}[]. Thus the natural
map `Aut(L/L^{D_Q}) -> Aut(L/K)` is also surjective, and their composition is
exactly the stabilizer homomorphism.

So surjectivity is ultimately proved by combining the integrality package
{uses "invariant_extension_integral"}[] with a careful residue-field
construction, not by any specialized local-field computation.
:::
