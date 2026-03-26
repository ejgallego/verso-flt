import Verso
import VersoManual
import VersoBlueprint
import Mathlib.RingTheory.Invariant.Basic

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Frobenius Elements" =>

:::group "frobenius_project"
This miniproject has been a success: the main results are sorry-free and merged
into mathlib. As a result there will be no more work on this miniproject in the
FLT repo. Below is a fairly detailed sketch of the argument used.
:::

# Status

:::definition "frobenius_project_status" (parent := "frobenius_project")
This miniproject has been a success: the main results are sorry-free and merged
into mathlib. As a result there will be no more work on this miniproject in the
FLT repo. Below is a fairly detailed sketch of the argument used.
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

```tex "Introduction and goal/section"
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

When this project started, I had thought that the existence of Frobenius
elements was specific to the theory of local and global fields, and a slightly
more general result held for Dedekind domains. Then Joel Riou pointed out on
the Lean Zulip an extremely general result from from Bourbaki's Commutative
Algebra (Chapter V, Section 2, number 2, theorem 2, part (ii)). This beautiful
result is surely what we want to see in mathlib. Before we state Bourbaki's
theorem, let us set the scene.

```tex "Introduction and goal/main_paragraph"
\section{Introduction and goal}

When this project started, I had thought that the existence of Frobenius elements was
specific to the theory of local and global fields, and a slightly more general result
held for Dedekind domains. Then Joel Riou pointed out on the Lean Zulip
an extremely general result from from Bourbaki's Commutative Algebra
(Chapter V, Section 2, number 2, theorem 2, part (ii)). This beautiful
result is surely what we want to see in mathlib. Before we state Bourbaki's
theorem, let us set the scene.
```

The goal of the mini-project is to get this theorem formalised and ideally into
mathlib.

```tex "Examples/goal/intro"
The goal of the mini-project is to get this theorem formalised and ideally into mathlib.
```

In particular, `Aut(L/K)` is finite as a corollary. What is so striking about
this theorem to me is that the only finiteness hypothesis is on the group `G`
which acts; there are no finiteness or Noetherian hypotheses on the rings at
all.

```tex "Examples/goal/restate"
The goal of the mini-project is to get this theorem formalised and ideally into mathlib.

In particular, $\Aut(L/K)$ is finite
as a corollary. What is so striking about this theorem to me is that the only finiteness hypothesis
is on the group $G$ which acts; there are no finiteness or Noetherian
hypotheses on the rings at all.
```

```tex "Statement of the theorem/setup"
\section{Statement of the theorem}

The set-up throughout this project:
$G$ is a finite group acting (via ring isomorphisms) on a commutative ring $B$,
and $A$ is the subring of $G$-invariants.
```

# Statement Of The Theorem

The set-up throughout this project:
`G` is a finite group acting (via ring isomorphisms) on a commutative ring `B`,
and `A` is the subring of `G`-invariants.

```tex "Statement of the theorem/decomposition_group"
\section{Statement of the theorem}

Say $Q$ is a prime ideal of $B$, whose pullback to $A$ is the prime ideal $P$.
Note that $G$ naturally acts on the ideals of $B$. Let's define the
\emph{decomposition group} $D_Q$ of $Q$ to be the subgroup of $G$ which
stabilizes $Q$ (just to be clear: $g\in D_Q$ means
$\{g\cdot q\, :\, q \in Q\}=Q$, not $\forall q\in Q, g\cdot q=q$).
```

:::definition "decomposition_group_definition" (parent := "frobenius_project")
Given a finite group `G` acting on a commutative ring `B`, a prime ideal `Q` of
`B`, and the induced prime `P` of the invariant subring `A`, the decomposition
group `D_Q` is the subgroup of elements `g ∈ G` such that `g · Q = Q`.
:::

```tex "Statement of the theorem/fraction_fields"
Say $Q$ is a prime ideal of $B$, whose pullback to $A$ is the prime ideal $P$.
Note that $G$ naturally acts on the ideals of $B$. Let's define the
\emph{decomposition group} $D_Q$ of $Q$ to be the subgroup of $G$ which
stabilizes $Q$ (just to be clear: $g\in D_Q$ means
$\{g\cdot q\, :\, q \in Q\}=Q$, not $\forall q\in Q, g\cdot q=q$).
```

Let `L` be the field of fractions of the integral domain `B/Q`, and let `K` be
the field of fractions of the subring `A/P`. Then `L` is naturally a `K`-algebra.
In this generality `L/K` may not even be finite or Galois, but we can still talk
about `Aut(L/K)`.

```tex "Statement of the theorem"
Let $L$ be the field of fractions of the integral domain $B/Q$, and let $K$ be the
field of fractions of the subring $A/P$. Then $L$ is naturally a $K$-algebra.
In this generality $L/K$ may not even be finite or Galois, but we can still talk about
$\Aut(L/K)$.
```

:::definition "stabilizer_hom_definition" (parent := "frobenius_project") (lean := "IsFractionRing.stabilizerHom")
Given a finite group acting on a commutative ring, a prime of the big ring, and
the induced residue-field extension, one gets a natural homomorphism from the
decomposition group to the automorphism group of the residue-field extension.
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

:::proof "stabilizer_hom_definition"
Choose `g ∈ D_Q`. Then the action of `g` on `B` gives us an induced
`A/P`-algebra automorphism of `B/Q` which extends to a `K`-algebra automorphism
`φ(g)` of `L`. This construction `g ↦ φ(g)` defines a group homomorphism from
`D_Q` to `Aut(L/K)` (all the proofs implicit in the definition here are
straightforward).
:::

```tex "IsFractionRing.stabilizerHom/2"
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
The map `g ↦ φ_g` from `D_Q` to `Aut(L/K)` defined above is surjective.
:::

```tex "IsFractionRing.stabilizerHom_surjective"
\begin{theorem}
  \label{IsFractionRing.stabilizerHom_surjective}
  \lean{IsFractionRing.stabilizerHom_surjective}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  The map $g\mapsto \phi_g$ from $D_Q$ to $\Aut(L/K)$ defined above is surjective.
\end{theorem}
```

The goal of the mini-project is to get exactly this theorem formalized and,
ideally, into mathlib. The TeX chapter emphasizes how striking it is that one
deduces finiteness of `Aut(L/K)` from nothing more than finiteness of the group
`G` acting on `B`.

```tex "Examples/goal"
The goal of the mini-project is to get this theorem formalised and ideally into mathlib.

In particular, $\Aut(L/K)$ is finite
as a corollary. What is so striking about this theorem to me is that the only finiteness hypothesis
is on the group $G$ which acts; there are no finiteness or Noetherian
hypotheses on the rings at all.
```

# Examples

:::theorem "frobenius_elements_classical_corollary" (parent := "frobenius_project")
In the classical setting where `B` is the ring of integers of a finite Galois
extension of number fields, the theorem above produces Frobenius elements for
primes of `B` lying above a rational prime `p`.
:::

```tex "Examples/frobenius"
As a trivial consequence we get Frobenius elements for finite Galois extensions in both
the local and global field setting, as $\Aut(L/K)$ is just a Galois group of finite fields
in these cases, so by surjectivity we can lift a Frobenius element.
```

:::proof "frobenius_elements_classical_corollary"
In that arithmetic example, the residue-field extension is finite, so
`Aut(L/K)` is just the Galois group of a finite field extension and is generated
by a Frobenius automorphism. Surjectivity of
{uses "stabilizer_hom_surjective"}[] lifts that residue-field Frobenius back to
an element of the decomposition group.
:::

```tex "Examples/positive_characteristic"
Even though $G$ is finite, it is possible in characteristic $p>0$ for the
extension $L/K$ to be infinite (and mostly inseparable). The theorem implies
that $\Aut(L/K)$ is always finite; what is actually happening is that $L/K$ is
algebraic and normal, and its maximal separable subextension is finite of degree
at most $|G|$. However, we can prove surjectivity directly without reference to
this maximal separable subextension.
```

Even though `G` is finite, it is possible in characteristic `p>0` for the
extension `L/K` to be infinite (and mostly inseparable). The theorem implies
that `Aut(L/K)` is always finite; what is actually happening is that `L/K` is
algebraic and normal, and its maximal separable subextension is finite of degree
at most `|G|`. However, we can prove surjectivity directly without reference to
this maximal separable subextension.

```tex "The extension $B/A$/setup"
The precise set-up we'll work in is the following. We fix $G$ a finite group acting
on $B$ a commutative ring, and we have another commutative ring $A$ such
that $B$ is an $A$-algebra and the image of $A$ in $B$ is precisely the $G$-invariant
elements of $B$. We don't ever need the map $A\to B$ to be injective so we don't assume this.
```

# The Extension B/A

The precise set-up we'll work in is the following. We fix `G` a finite group
acting on `B` a commutative ring, and we have another commutative ring `A`
such that `B` is an `A`-algebra and the image of `A` in `B` is precisely the
`G`-invariant elements of `B`. We don't ever need the map `A → B` to be
injective so we don't assume this.

```tex "The extension $B/A$/charpoly_intro"
We start with a construction which is fundamental to everything,
and which explains why we need $G$ to be finite.
```

:::definition "group_action_characteristic_polynomial" (parent := "frobenius_project") (lean := "MulSemiringAction.charpoly")
For an element `b` of the big ring, the characteristic polynomial attached to
the finite group action is the finite product
`F_b(X) = ∏_{g ∈ G} (X - g • b)`.
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

```tex "MulSemiringAction.monic_charpoly/lemma"
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

Clearly `F_b` is a monic polynomial.

```tex "MulSemiringAction.monic_charpoly/comment"
Clearly $F_b$ is a monic polynomial.
```

:::theorem "invariant_characteristic_polynomial_descends" (parent := "frobenius_project") (lean := "Algebra.IsInvariant.charpoly_mem_lifts")
If the image of the base ring `A` in `B` is exactly the fixed-point ring of the
action, then the characteristic polynomial of any `b ∈ B` descends from `B[X]`
to a monic polynomial over `A`.
:::

```tex "Algebra.IsInvariant.charpoly_mem_lifts/restate"
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

:::proof "invariant_characteristic_polynomial_descends"
{uses "group_action_characteristic_polynomial"}[]
The coefficients of `F_b` are `G`-invariant, and thus lie in the image of `A`.
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

:::theorem "invariant_extension_integral" (parent := "frobenius_project") (lean := "Algebra.IsInvariant.isIntegral")
`B/A` is integral.
:::

```tex "Algebra.IsInvariant.isIntegral/restate"
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

:::proof "invariant_extension_integral"
Use `M_b`.
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

:::theorem "primes_over_same_prime_are_conjugate" (parent := "frobenius_project") (lean := "Algebra.IsInvariant.exists_smul_of_under_eq")
If `Q` and `Q'` are two primes above `p`, then there is some `g ∈ G` such that
`gQ = Q'`, and one can deduce from this that `Frob_Q` and `Frob_{Q'}` are
conjugate. In particular if `G` is abelian then `Frob_Q` and `Frob_{Q'}` are
equal, so we can call them both `Frob_p`.
:::

```tex "The extension $(B/Q)/(A/P)/section"
\section{The extension \texorpdfstring{$(B/Q)/(A/P)$}{(B/Q)/(A/P)}.}

Note that $P$ and $Q$ are primes, so the quotients $A/P$ and $B/Q$ are integral domains.
```

:::proof "primes_over_same_prime_are_conjugate"
This is the formal reason that Frobenius elements attached to different primes
above `p` are conjugate, and hence coincide when the ambient Galois group is
abelian.
:::

```tex "The extension $(B/Q)/(A/P)/technical_intro"
The following technical lemma constructs an element of $B$ with nice characteristic polynomial
modulo $Q$.
```

# The Extension (B/Q)/(A/P)

The following technical lemma constructs an element of `B` with nice
characteristic polynomial modulo `Q`.

```tex "The extension $(B/Q)/(A/P)/fixed_of_fixed1_aux1"
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
```

:::theorem "fixed_residue_class_fixed_by_stabilizer" (parent := "frobenius_project")
Let `b₀ ∈ B/Q`. Suppose that `b₀` is fixed by the stabilizer subgroup `D_Q`.
Then `b₀` is fixed by `Aut(L/K)`.
:::

```tex "fixed_of_fixed1_aux1/lemma"
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
```

:::proof "fixed_residue_class_fixed_by_stabilizer"
{uses "fixed_of_fixed1_aux1"}[]
{uses "fixed_of_fixed1_aux2"}[]
Let `a, b ∈ B` be the elements from `fixed_of_fixed1_aux2`. Let `M_b ∈ A[X]`
be the characteristic polynomial of `b`. We can map `M_b` to `L[X]` in two
different ways: via `B[X]` and via `K[X]`. Going via `B[X]` tells us that the
image of `M_b(X)` in `L[X]` is exactly
$`(X - a b_0)^{|D_Q|} X^{|G|-|D_Q|}`$. But going via `K[X]` tells us that this
image lies in `K[X]`, so we must have $`a b_0 \in K`$. Then $`a b_0`$ is fixed
by `Aut(L/K)`, and `a` is nonzero in `L` because `a ∉ Q`, so `b_0` is fixed by
`Aut(L/K)`.
:::

```tex "fixed_of_fixed1_aux1/proof"
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

```tex "fixed_of_fixed1_aux1/restate"
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

Let `L^{D_Q}` denote the fixed field of the action `D_Q` on `L`.
Our strategy for proving surjectivity of `D_Q -> Aut(L/K)` will be to write
this map as the composition `D_Q -> Aut(L/L^{D_Q}) -> Aut(L/K)`.

```tex "The extension $L/K/section"
\section{The extension \texorpdfstring{$L/K$}{L/K}.}

Let $L^{D_Q}$ denote the fixed field of the action $D_Q$ on $L$.
Our strategy for proving surjectivity of $D_Q \to \Aut(L/K)$ will be to write this map as the
composition $D_Q \to \Aut(L/L^{D_Q}) \to \Aut(L/K)$.
```

:::theorem "fixed_field_galois_surjectivity" (parent := "frobenius_project")
If a finite group `H` acts on a field `F`, then the natural map
`H -> Aut(F/F^H)` is surjective.
:::

```tex "FixedPoints.toAlgAut_surjective/restate"
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

:::proof "fixed_field_galois_surjectivity"
This is a general fact of Galois theory and was already in mathlib.
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

```tex "IsAlgebraic.exists_smul_eq_mul/lemma"
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

:::proof "algebraic_fraction_denominator_lift"
If `f ∈ S[X]` satisfies `f(b) = 0`, then `f(0) ∈ S` is a multiple of `b`.
If `f(0) = bx ∈ S`, then `a/b = (ax)/(bx)` as desired.
:::

```tex "The extension $L/K/denominator_intro"
Now we upgrade this to elements of $L$ fixed by $D_Q$.
The following lemma will allow us to lift the denominator from $B/Q$ to $A/P$.
```

```tex "IsAlgebraic.exists_smul_eq_mul/restate"
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

:::proof "fixed_fraction_field_element_fixed_by_stabilizer"
Since `(B/Q)/(A/P)` is algebraic, the denominator-lifting theorem lets us write
`x = b/a` for `b ∈ B/Q` and `a ∈ A/P`. Then `b` is fixed by the stabilizer
subgroup `D_Q`, and it is enough to show that `b` is fixed by the automorphism
group `Aut(L/K)`. But this is exactly the preceding result.
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
  Since $(B/Q)/(A/P)$ is algebraic by~\ref{Algebra.IsInvariant.isIntegral},
  ~\ref{IsAlgebraic.exists_smul_eq_mul} lets us write $x=b/a$ for $b \in B/Q$ and $a \in A/P$.
  Then $b$ is fixed by the stabilizer subgroup $D_Q$, and it suffices to show that
  $b$ is fixed by the automorphism group $\Aut(L/K)$.
  But this is exactly~\ref{fixed_of_fixed1}.
  \mathlibok
\end{proof}
```

:::proof "stabilizer_hom_surjective"
{uses "FixedPoints.toAlgAut_surjective"}[]
{uses "fixed_of_fixed2"}[]
The map `D_Q -> Aut(L/L^{D_Q})` is surjective by
`FixedPoints.toAlgAut_surjective`. For surjectivity of
`Aut(L/L^{D_Q}) -> Aut(L/K)`, let `σ` be a field
automorphism of `L` fixing `K` pointwise. We must show that `σ` automatically
fixes `L^{D_Q}` pointwise. But this is exactly `fixed_of_fixed2`. Thus, the
composition `D_Q -> Aut(L/L^{D_Q}) -> Aut(L/K)` is surjective.
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
