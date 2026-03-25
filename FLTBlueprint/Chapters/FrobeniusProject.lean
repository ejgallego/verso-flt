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

```tex "Status"
\section{Status}

This miniproject has been a success: the main results
are sorry-free and merged into mathlib
(see \href{https://github.com/leanprover-community/mathlib4/pull/19926}{this PR}).
As a result there will be no more work
on this miniproject in the FLT repo. Below is a fairly
detailed sketch of the argument used.
```

The old LaTeX chapter explains why this was a satisfying surprise. The original
project expectation was that Frobenius elements would need a specialized
development for Dedekind domains or local/global fields. Instead, the eventual
formalization followed a Bourbaki theorem pointed out by Joel Riou: once a
finite group acts on a commutative ring and one passes to a prime ideal and its
residue field, the Frobenius-surjectivity statement drops out in great
generality.

So the miniproject is a genuine success story of the FLT blueprint: it isolated
an algebraic lemma, formalized it cleanly, and then upstreamed it to mathlib.

```tex "Introduction and goal"
\section{Introduction and goal}

When this project started, I had thought that the existence of Frobenius elements was
specific to the theory of local and global fields, and a slightly more general result
held for Dedekind domains. Then Joel Riou pointed out on the Lean Zulip
an extremely general result from from Bourbaki's Commutative Algebra
(Chapter V, Section 2, number 2, theorem 2, part (ii)). This beautiful
result is surely what we want to see in mathlib. Before we state Bourbaki's
theorem, let us set the scene.
```

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

```tex "IsFractionRing.stabilizerHom"
\begin{definition}
  \label{IsFractionRing.stabilizerHom}
  \lean{IsFractionRing.stabilizerHom}
  Choose $g\in D_Q$. Then the action of $g$ on $B$ gives us an induced
  $A/P$-algebra automorphism of $B/Q$ which extends to a $K$-algebra automorphism $\phi(g)$ of $L$.
  This construction $g\mapsto \phi(g)$ defines a group homomorphism from $D_Q$
  to $\Aut(L/K)$ (all the proofs implicit in the definition here are straightforward).
  \mathlibok
\end{definition}
```

:::theorem "stabilizer_hom_surjective" (parent := "frobenius_project") (lean := "IsFractionRing.stabilizerHom_surjective")
The main theorem says that this stabilizer homomorphism is surjective.
This is the abstract engine behind Frobenius elements in local and global
Galois settings.
:::

The goal of the mini-project is to get exactly this theorem formalized and,
ideally, into mathlib. The TeX chapter emphasizes how striking it is that one
deduces finiteness of `Aut(L/K)` from nothing more than finiteness of the group
`G` acting on `B`.

```tex "IsFractionRing.stabilizerHom_surjective"
\begin{theorem}
  \label{IsFractionRing.stabilizerHom_surjective}
  \lean{IsFractionRing.stabilizerHom_surjective}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  The map $g\mapsto \phi_g$ from $D_Q$ to $\Aut(L/K)$ defined above is surjective.
\end{theorem}
```

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

```tex "MulSemiringAction.charpoly"
\begin{definition}
  \label{MulSemiringAction.charpoly}
  \lean{MulSemiringAction.charpoly}
  \mathlibok
  If $b\in B$ then define the \emph{characteristic polynomial}
  $F_b(X) \in B[X]$ of $b$ to be $\prod_{g\in G}(X-g\cdot b)$.
\end{definition}
```

```tex "MulSemiringAction.monic_charpoly"
\begin{lemma}
  \label{MulSemiringAction.monic_charpoly}
  \lean{MulSemiringAction.monic_charpoly}
  \uses{MulSemiringAction.charpoly}
  \mathlibok
  $F_b$ is monic.
\end{lemma}
\begin{proof}
  \mathlibok
  Obvious.
\end{proof}
```

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
{uses "group_action_characteristic_polynomial"}[]
The coefficients of the polynomial are symmetric expressions in the orbit
`{g • b}`, so acting by any element of `G` merely permutes the factors and
fixes every coefficient. By the invariant-ring hypothesis, those fixed
coefficients come from `A`.
:::

```tex "Algebra.IsInvariant.charpoly_mem_lifts"
\begin{lemma}
  \label{Algebra.IsInvariant.charpoly_mem_lifts}
  \lean{Algebra.IsInvariant.charpoly_mem_lifts}
  \uses{MulSemiringAction.charpoly}
  \mathlibok
  $F_b$ is the lift of some monic polynomial $M_b$ in $A[X]$.
\end{lemma}
\begin{proof}
  \mathlibok
  The coefficients of $F_b$ are $G$-invariant, and thus lie in the image of $A$.
\end{proof}
```

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

```tex "Algebra.IsInvariant.isIntegral"
\begin{theorem}
  \label{Algebra.IsInvariant.isIntegral}
  \lean{Algebra.IsInvariant.isIntegral}
  \mathlibok
  $B/A$ is integral.
\end{theorem}
\begin{proof}
  \uses{MulSemiringAction.monic_charpoly, Algebra.IsInvariant.charpoly_mem_lifts}
  \mathlibok
  Use $M_b$.
\end{proof}
```

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

```tex "fixed_of_fixed1_aux1"
\begin{lemma}
  \label{fixed_of_fixed1_aux1}
  \mathlibok
  There exist elements $a,b \in B$, with $a \notin Q$ and $a$ in the image of $A$ such that
  for all $g\in G$,
  \begin{itemize}
    \item If $g \cdot Q = Q$, then $g \cdot b \equiv a \pmod{Q}$.
    \item If $g \cdot Q \neq Q$, then $g \cdot b \equiv 0 \pmod{Q}$.
  \end{itemize}
\end{lemma}
\begin{proof}
  \uses{Algebra.IsInvariant.charpoly_mem_lifts}
  The ideals $g \cdot Q \neq Q$ are not contained in $Q$.
  Since $Q$ is a prime ideal, this implies that the intersection of all $g \cdot Q \neq Q$ is
  still not contained in $Q$.
  Then we can find an element $c \notin Q$ with $c \in g \cdot Q$ for all $g \cdot Q \neq Q$.
  Let $F_c$ be the characteristic polynomial of $c$, and write $F_c(X) \equiv X^j R(X) \pmod{Q}$.
  Let $a$ be the coefficient of $X^j$ in $F_c(X)$, and choose $R(X)$ so that $R(0) = a$.
  Let $b = R(0) - R(c)$.
  Note that $F_c(c) = 0$ and $c \not\equiv 0 \pmod{Q}$, so $R(c) \equiv 0 \pmod{Q}$.
  Then $b \equiv a \pmod{Q}$, so $g \cdot b \equiv a \pmod{Q}$ whenever $g \cdot Q = Q$.
  But if $g \cdot Q \neq Q$, then $c \equiv 0 \pmod {g \cdot Q}$.
  Then $b \equiv 0 \pmod {g \cdot Q}$, so $g \cdot b \equiv 0 \pmod{Q}$
  whenever $g \cdot Q \neq Q$.
  \mathlibok
\end{proof}
```

```tex "fixed_of_fixed1_aux2"
\begin{lemma}
  \label{fixed_of_fixed1_aux2}
  \mathlibok
  Let $b_0 \in B$.
  Suppose that the image of $b_0$ in the quotient $B/Q$ is fixed by the stabilizer subgroup
  $D_Q$.
  Then there exist elements $a,b \in B$, with $a\notin Q$ and $a$ in the image of $A$ such that
  for all $g\in G$,
  \begin{itemize}
    \item If $g \cdot Q = Q$, then $g \cdot b \equiv ab_0 \pmod{Q}$.
    \item If $g \cdot Q \neq Q$, then $g \cdot b \equiv 0 \pmod{Q}$.
  \end{itemize}
\end{lemma}
\begin{proof}
  \uses{fixed_of_fixed1_aux1}
  Multiply the $b$ from~\ref{fixed_of_fixed1_aux1} by $b_0$.
  \mathlibok
\end{proof}
```

```tex "fixed_of_fixed1"
\begin{proposition}
  \label{fixed_of_fixed1}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  Let $b_0 \in B/Q$.
  Suppose that $b_0$ is fixed by the stabilizer subgroup $D_Q$.
  Then $b_0$ is fixed by $\Aut(L/K)$.
\end{proposition}
\begin{proof}
  \uses{fixed_of_fixed1_aux1, fixed_of_fixed1_aux2}
  Let $a,b\in B$ be elements from~\ref{fixed_of_fixed1_aux2}.
  Let $M_b \in A[X]$ be the characteristic polynomial of $b$.
  We can map $M_b$ to $L[X]$ in two different ways: via $B[X]$ and via $K[X]$.
  Going via $B[X]$ tells us that the image of $M_b(X)$ in $L[X]$ is exactly
  $$(X - ab_0)^{\lvert D_Q\rvert}X^{\lvert G\rvert-\lvert D_Q\rvert}.$$
  But going via $K[X]$ tells us that this image lies in $K[X]$, so we must have $ab_0\in K$.
  Then $ab_0$ is fixed by $\Aut(L/K)$, and $a$ is nonzero in $L$ (since $a\notin Q$),
  so $b_0$ is fixed by $\Aut(L/K)$.
  \mathlibok
\end{proof}
```

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

```tex "FixedPoints.toAlgAut_surjective"
\begin{theorem}
  \label{FixedPoints.toAlgAut_surjective}
  \lean{FixedPoints.toAlgAut_surjective}
  Let $H$ be a finite group acting on a field $F$ by field automorphisms.
  Then the map $H \to \Aut(F/F^H)$ is surjective.
  \mathlibok
\end{theorem}
\begin{proof}
  This is a general fact of Galois theory and was already in mathlib.
  \mathlibok
\end{proof}
```

:::theorem "algebraic_fraction_denominator_lift" (parent := "frobenius_project")
If `R/S` is an algebraic extension of integral domains, then any fraction
`a/b` with `a, b ∈ R` can be rewritten as `c/d` with `c ∈ R` and `d ∈ S`.
:::

:::proof "algebraic_fraction_denominator_lift"
The TeX proof uses an algebraic relation for `b` over `S`: if `f(b) = 0` for a
polynomial `f ∈ S[X]`, then the constant term of `f` is divisible by `b`. That
lets one clear the denominator using an element of the base domain.
:::

```tex "IsAlgebraic.exists_smul_eq_mul"
\begin{lemma}
  \label{IsAlgebraic.exists_smul_eq_mul}
  \lean{IsAlgebraic.exists_smul_eq_mul}
  \mathlibok
  If $R/S$ is an algebraic extension of integral domains, then any fraction $a/b$ with $a,b\in R$
  can be written as $c/d$ with $c\in R$ and $d\in S$.
\end{lemma}
\begin{proof}
  If $f\in S[X]$ satisfies $f(b)=0$, then $f(0)\in S$ is a multiple of $b$.
  If $f(0)=bx\in S$, then $a/b=(ax)/(bx)$ as desired.
  \mathlibok
\end{proof}
```

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

```tex "fixed_of_fixed2"
\begin{proposition}
  \label{fixed_of_fixed2}
  \mathlibok
  Let $x \in L$.
  Suppose that $x$ is fixed by the stabilizer subgroup $D_Q$.
  Then $x$ is fixed by the automorphism group $\Aut(L/K)$.
\end{proposition}
\begin{proof}
  \uses{fixed_of_fixed1, Algebra.IsInvariant.isIntegral,
    IsAlgebraic.exists_smul_eq_mul}
  Since $(B/Q)/(A/Q)$ is algebraic by~\ref{Algebra.IsInvariant.isIntegral},
  ~\ref{IsAlgebraic.exists_smul_eq_mul} let's us write $x=b/a$ for $b \in B/Q$ and $a \in A/P$.
  Then $b$ is fixed by the stabilizer subgroup $D_Q$, and it suffices to show that
  $b$ is fixed by the automorphism group $\Aut(L/K)$.
  But this is exactly~\ref{fixed_of_fixed1}.
  \mathlibok
\end{proof}
```

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

```tex "Proof of main theorem"
\begin{proof}[Proof of main theorem]
  \proves{IsFractionRing.stabilizerHom_surjective}
  \uses{fixed_of_fixed2, FixedPoints.toAlgAut_surjective}
  The map $D_Q \to \Aut(L/L^{D_Q})$ is surjective by~\ref{FixedPoints.toAlgAut_surjective}.
  For surjectivity of $\Aut(L/L^{D_Q}) \to \Aut(L/K)$, let $\sigma$ be a field automorphism of $L$
  fixing $K$ pointwise.
  We must show that $\sigma$ automatically fixes $L^{D_Q}$ pointwise.
  But this is exactly~\ref{fixed_of_fixed2}.
  Thus, the composition $D_Q \to \Aut(L/L^{D_Q}) \to \Aut(L/K)$ is surjective.
  \mathlibok
\end{proof}
```
