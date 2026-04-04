import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude
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

```tex
\section{Status}

This miniproject has been a success: the main results
are sorry-free and merged into mathlib
(see \href{https://github.com/leanprover-community/mathlib4/pull/19926}{this PR}).
As a result there will be no more work
on this miniproject in the FLT repo. Below is a fairly
detailed sketch of the argument used.
```

```tex
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

```tex
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

```tex
The goal of the mini-project is to get this theorem formalised and ideally into mathlib.
```

In particular, $`\Aut(L/K)` is finite as a corollary. What is so striking about
this theorem to me is that the only finiteness hypothesis is on the group `G`
which acts; there are no finiteness or Noetherian hypotheses on the rings at
all.

```tex
The goal of the mini-project is to get this theorem formalised and ideally into mathlib.

In particular, $\Aut(L/K)$ is finite
as a corollary. What is so striking about this theorem to me is that the only finiteness hypothesis
is on the group $G$ which acts; there are no finiteness or Noetherian
hypotheses on the rings at all.
```

```tex
\section{Statement of the theorem}
```

# Statement Of The Theorem

The set-up throughout this project:
$`G` is a finite group acting (via ring isomorphisms) on a commutative ring
$`B`, and $`A` is the subring of $`G`-invariants.

```tex
The set-up throughout this project:
$G$ is a finite group acting (via ring isomorphisms) on a commutative ring $B$,
and $A$ is the subring of $G$-invariants.
```

:::definition "decomposition_group_definition" (parent := "frobenius_project")
Say $`Q` is a prime ideal of $`B`, whose pullback to $`A` is the prime ideal
$`P`. Note that $`G` naturally acts on the ideals of $`B`. Let the
decomposition group $`D_Q` of $`Q` be the subgroup of $`G` which stabilizes
$`Q` (just to be clear: $`g \in D_Q` means $`\{g \cdot q \,:\, q \in Q\}=Q`,
not $`\forall q \in Q, g \cdot q = q`).
:::

```tex
Say $Q$ is a prime ideal of $B$, whose pullback to $A$ is the prime ideal $P$.
Note that $G$ naturally acts on the ideals of $B$. Let's define the
\emph{decomposition group} $D_Q$ of $Q$ to be the subgroup of $G$ which
stabilizes $Q$ (just to be clear: $g\in D_Q$ means
$\{g\cdot q\, :\, q \in Q\}=Q$, not $\forall q\in Q, g\cdot q=q$).
```

Let $`L` be the field of fractions of the integral domain $`B/Q`, and let
$`K` be the field of fractions of the subring $`A/P`. Then $`L` is naturally
a $`K`-algebra. In this generality $`L/K` may not even be finite or Galois,
but we can still talk about $`\Aut(L/K)`.

```tex
Let $L$ be the field of fractions of the integral domain $B/Q$, and let $K$ be the
field of fractions of the subring $A/P$. Then $L$ is naturally a $K$-algebra.
In this generality $L/K$ may not even be finite or Galois, but we can still talk about
$\Aut(L/K)$.
```

In the next definition we write down a group homomorphism $`\phi` from $`D_Q`
to $`\Aut(L/K)`.

```tex
In the next definition we write down a group homomorphism $\phi$ from $D_Q$ to $\Aut(L/K)$.
```

:::definition "IsFractionRing.stabilizerHom" (parent := "frobenius_project") (lean := "IsFractionRing.stabilizerHom")
Choose $`g \in D_Q`. Then the action of $`g` on $`B` gives us an induced
$`A/P`-algebra automorphism of $`B/Q` which extends to a $`K`-algebra
automorphism $`\phi(g)` of $`L`. This construction $`g \mapsto \phi(g)`
defines a group homomorphism from $`D_Q` to $`\Aut(L/K)` (all the proofs
implicit in the definition here are straightforward).
:::

```tex "IsFractionRing.stabilizerHom" (slot := statement)
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

The theorem we want in this mini-project is

```tex
The theorem we want in this mini-project is
```

:::theorem "IsFractionRing.stabilizerHom_surjective" (parent := "frobenius_project") (lean := "IsFractionRing.stabilizerHom_surjective")
{uses "IsFractionRing.stabilizerHom"}[]
The map $`g \mapsto \phi_g` from $`D_Q` to $`\Aut(L/K)` defined above is
surjective.
:::

```tex "IsFractionRing.stabilizerHom_surjective" (slot := statement)
\begin{theorem}
  \label{IsFractionRing.stabilizerHom_surjective}
  \lean{IsFractionRing.stabilizerHom_surjective}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  The map $g\mapsto \phi_g$ from $D_Q$ to $\Aut(L/K)$ defined above is surjective.
\end{theorem}
```

The goal of this mini-project is to get this theorem formalised and ideally into
mathlib.

```tex
The goal of this mini-project is to get this theorem formalised and ideally into mathlib.
```

In particular, $`\Aut(L/K)` is finite as a corollary. What is so striking about
this theorem to me is that the only finiteness hypothesis is on the group $`G`
which acts; there are no finiteness or Noetherian hypotheses on the rings at
all.

```tex
In particular, $\Aut(L/K)$ is finite
as a corollary. What is so striking about this theorem to me is that the only finiteness hypothesis
is on the group $G$ which acts; there are no finiteness or Noetherian
hypotheses on the rings at all.
```

# Examples

As a trivial consequence we get Frobenius elements for finite Galois extensions
in both the local and global field setting, as $`\Aut(L/K)` is just a Galois
group of finite fields in these cases, so by surjectivity we can lift a
Frobenius element.

```tex
As a trivial consequence we get Frobenius elements for finite Galois extensions in both
the local and global field setting, as $\Aut(L/K)$ is just a Galois group of finite fields
in these cases, so by surjectivity we can lift a Frobenius element.
```

Even though `G` is finite, it is possible in characteristic $`p > 0` for the
extension $`L/K` to be infinite (and mostly inseparable). The theorem implies
that $`\Aut(L/K)` is always finite; what is actually happening is that $`L/K` is
algebraic and normal, and its maximal separable subextension is finite of degree
at most `|G|`. However, we can prove surjectivity directly without reference to
this maximal separable subextension.

```tex
Even though $G$ is finite, it is possible in characteristic $p>0$ for the
extension $L/K$ to be infinite (and mostly inseparable). The theorem implies
that $\Aut(L/K)$ is always finite; what is actually happening is that $L/K$ is
algebraic and normal, and its maximal separable subextension is finite of degree
at most $|G|$. However, we can prove surjectivity directly without reference to
this maximal separable subextension.
```

# The Extension B/A

The precise set-up we'll work in is the following. We fix $`G` a finite group
acting on $`B` a commutative ring, and we have another commutative ring $`A`
such that $`B` is an $`A`-algebra and the image of $`A` in $`B` is
precisely the $`G`-invariant elements of $`B`. We do not ever need the map
$`A \to B` to be injective so we do not assume this.

```tex
The precise set-up we'll work in is the following. We fix $G$ a finite group acting
on $B$ a commutative ring, and we have another commutative ring $A$ such
that $B$ is an $A$-algebra and the image of $A$ in $B$ is precisely the $G$-invariant
elements of $B$. We don't ever need the map $A\to B$ to be injective so we don't assume this.
```

We start with a construction which is fundamental to everything, and which
explains why we need $`G` to be finite.

```tex
We start with a construction which is fundamental to everything,
and which explains why we need $G$ to be finite.
```

:::definition "MulSemiringAction.charpoly" (parent := "frobenius_project") (lean := "MulSemiringAction.charpoly")
If $`b \in B` then define the characteristic polynomial $`F_b(X) \in B[X]`
of $`b` to be $`\prod_{g \in G}(X - g \cdot b)`.
:::

```tex "MulSemiringAction.charpoly" (slot := statement)
\begin{definition}
  \label{MulSemiringAction.charpoly}
  \lean{MulSemiringAction.charpoly}
  \mathlibok
  If $b\in B$ then define the \emph{characteristic polynomial}
  $F_b(X) \in B[X]$ of $b$ to be $\prod_{g\in G}(X-g\cdot b)$.
\end{definition}
```

Clearly $`F_b` is a monic polynomial.

```tex
Clearly $F_b$ is a monic polynomial.
```

:::lemma_ "MulSemiringAction.monic_charpoly" (parent := "frobenius_project") (lean := "MulSemiringAction.monic_charpoly")
{uses "MulSemiringAction.charpoly"}[]
$`F_b` is monic.
:::

```tex "MulSemiringAction.monic_charpoly" (slot := statement)
\begin{lemma}
  \label{MulSemiringAction.monic_charpoly}
  \lean{MulSemiringAction.monic_charpoly}
  \uses{MulSemiringAction.charpoly}
  \mathlibok
  $F_b$ is monic.
\end{lemma}
```

:::proof "MulSemiringAction.monic_charpoly"
Obvious.
:::

```tex "MulSemiringAction.monic_charpoly" (slot := proof)
\begin{proof}
  \mathlibok
  Obvious.
\end{proof}
```

It is also clear that $`F_b` has degree $`|G|` and has $`b` as a root. Also
$`F_b` is $`G`-invariant, because acting by some $`\gamma \in G` just
permutes the order of the factors. Hence we can descend $`F_b` to a monic
polynomial $`M_b(X)` of degree $`|G|` in $`A[X]`. We will also refer to
$`M_b` as the characteristic polynomial of $`b`, even though it is not even
well-defined if the map $`A \to B` is not injective.

```tex
It's also clear that $F_b$ has degree $|G|$ and has $b$ as a root.
Also $F_b$ is $G$-invariant, because acting by some $\gamma\in G$
just permutes the order of the factors. Hence we can descend $F_b$
to a monic polynomial $M_b(X)$ of degree $|G|$ in $A[X]$. We will
also refer to $M_b$ as the characteristic polynomial of $b$, even though
it's not even well-defined if the map $A\to B$ isn't injective.
```

:::lemma_ "Algebra.IsInvariant.charpoly_mem_lifts" (parent := "frobenius_project") (lean := "Algebra.IsInvariant.charpoly_mem_lifts")
{uses "MulSemiringAction.charpoly"}[]
$`F_b` is the lift of some monic polynomial $`M_b` in $`A[X]`.
:::

```tex "Algebra.IsInvariant.charpoly_mem_lifts" (slot := statement)
\begin{lemma}
  \label{Algebra.IsInvariant.charpoly_mem_lifts}
  \lean{Algebra.IsInvariant.charpoly_mem_lifts}
  \uses{MulSemiringAction.charpoly}
  \mathlibok
  $F_b$ is the lift of some monic polynomial $M_b$ in $A[X]$.
\end{lemma}
```

:::proof "Algebra.IsInvariant.charpoly_mem_lifts"
The coefficients of $`F_b` are $`G`-invariant, and thus lie in the image of
$`A`.
:::

```tex "Algebra.IsInvariant.charpoly_mem_lifts" (slot := proof)
\begin{proof}
  \mathlibok
  The coefficients of $F_b$ are $G$-invariant, and thus lie in the image of $A$.
\end{proof}
```

:::theorem "Algebra.IsInvariant.isIntegral" (parent := "frobenius_project") (lean := "Algebra.IsInvariant.isIntegral")
$`B/A` is integral.
:::

```tex "Algebra.IsInvariant.isIntegral" (slot := statement)
\begin{theorem}
  \label{Algebra.IsInvariant.isIntegral}
  \lean{Algebra.IsInvariant.isIntegral}
  \mathlibok
  $B/A$ is integral.
\end{theorem}
```

:::proof "Algebra.IsInvariant.isIntegral"
{uses "MulSemiringAction.monic_charpoly"}[]
{uses "Algebra.IsInvariant.charpoly_mem_lifts"}[]
Use $`M_b`.
:::

```tex "Algebra.IsInvariant.isIntegral" (slot := proof)
\begin{proof}
  \uses{MulSemiringAction.monic_charpoly, Algebra.IsInvariant.charpoly_mem_lifts}
  \mathlibok
  Use $M_b$.
\end{proof}
```

If `Q` and `Q'` are two primes above `p` then there is some $`g \in G` such that
$`gQ = Q'`, and one can deduce from this that `Frob_Q` and `Frob_{Q'}` are
conjugate. In particular if `G` is abelian then `Frob_Q` and `Frob_{Q'}` are
equal, so we can call them both `Frob_p`.

```tex
If $Q$ and $Q'$ are two primes above $p$ then there's some $g\in G$ such that
$gQ=Q'$ and one can deduce from this that $\Frob_Q$ and $\Frob_{Q'}$ are conjugate. In particular
if $G$ is abelian then $\Frob_Q$ and $\Frob_{Q'}$ are equal, so we can call them both $\Frob_p$.
```

```tex
\section{The extension \texorpdfstring{$(B/Q)/(A/P)$}{(B/Q)/(A/P)}.}
```

# The Extension (B/Q)/(A/P)

Note that $`P` and $`Q` are primes, so the quotients $`A/P` and $`B/Q` are
integral domains.

```tex
Note that $P$ and $Q$ are primes, so the quotients $A/P$ and $B/Q$ are integral domains.
```

The following technical lemma constructs an element of $`B` with nice
characteristic polynomial modulo $`Q`.

```tex
The following technical lemma constructs an element of $B$ with nice characteristic polynomial
modulo $Q$.
```

:::lemma_ "fixed_of_fixed1_aux1" (parent := "frobenius_project")
There exist elements $`a,b \in B`, with $`a \notin Q` and $`a` in the image
of $`A`, such that for all $`g \in G`:
- If $`g \cdot Q = Q`, then $`g \cdot b \equiv a \pmod{Q}`.
- If $`g \cdot Q \neq Q`, then $`g \cdot b \equiv 0 \pmod{Q}`.
:::

```tex "fixed_of_fixed1_aux1" (slot := statement)
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

:::proof "fixed_of_fixed1_aux1"
{uses "Algebra.IsInvariant.charpoly_mem_lifts"}[]
The ideals $`g \cdot Q \neq Q` are not contained in $`Q`. Since $`Q` is a
prime ideal, this implies that the intersection of all $`g \cdot Q \neq Q` is
still not contained in $`Q`. Then we can find an element $`c \notin Q` with
$`c \in g \cdot Q` for all $`g \cdot Q \neq Q`. Let $`F_c` be the
characteristic polynomial of $`c`, and write
$`F_c(X) \equiv X^j R(X) \pmod{Q}`. Let $`a` be the coefficient of $`X^j` in
$`F_c(X)`, and choose $`R(X)` so that $`R(0) = a`. Let $`b = R(0) - R(c)`.
Note that $`F_c(c) = 0` and $`c \not\equiv 0 \pmod{Q}`, so
$`R(c) \equiv 0 \pmod{Q}`. Then $`b \equiv a \pmod{Q}`, so
$`g \cdot b \equiv a \pmod{Q}` whenever $`g \cdot Q = Q`. But if
$`g \cdot Q \neq Q`, then $`c \equiv 0 \pmod{g \cdot Q}`. Then
$`b \equiv 0 \pmod{g \cdot Q}`, so $`g \cdot b \equiv 0 \pmod{Q}` whenever
$`g \cdot Q \neq Q`.
:::

```tex "fixed_of_fixed1_aux1" (slot := proof)
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

A slight modification allows us to take an element of $`B` fixed by $`D_Q` as
input.

```tex
A slight modification allows us to take an element of $B$ fixed by $D_Q$ as input.
```

:::lemma_ "fixed_of_fixed1_aux2" (parent := "frobenius_project")
Let $`b_0 \in B`. Suppose that the image of $`b_0` in the quotient $`B/Q` is
fixed by the stabilizer subgroup $`D_Q`. Then there exist elements
$`a,b \in B`, with $`a \notin Q` and $`a` in the image of $`A`, such that
for all $`g \in G`:
- If $`g \cdot Q = Q`, then $`g \cdot b \equiv a b_0 \pmod{Q}`.
- If $`g \cdot Q \neq Q`, then $`g \cdot b \equiv 0 \pmod{Q}`.
:::

```tex "fixed_of_fixed1_aux2" (slot := statement)
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
```

:::proof "fixed_of_fixed1_aux2"
{uses "fixed_of_fixed1_aux1"}[]
Multiply the $`b` from `fixed_of_fixed1_aux1` by $`b_0`.
:::

```tex "fixed_of_fixed1_aux2" (slot := proof)
\begin{proof}
  \uses{fixed_of_fixed1_aux1}
  Multiply the $b$ from~\ref{fixed_of_fixed1_aux1} by $b_0$.
  \mathlibok
\end{proof}
```

```tex
\section{The extension \texorpdfstring{$L/K$}{L/K}.}
```

# The Extension L/K

Let $`L^{D_Q}` denote the fixed field of the action $`D_Q` on $`L`. Our
strategy for proving surjectivity of $`D_Q \to \Aut(L/K)` will be to write
this map as the composition $`D_Q \to \Aut(L/L^{D_Q}) \to \Aut(L/K)`.

```tex
Let $L^{D_Q}$ denote the fixed field of the action $D_Q$ on $L$.
Our strategy for proving surjectivity of $D_Q \to \Aut(L/K)$ will be to write this map as the
composition $D_Q \to \Aut(L/L^{D_Q}) \to \Aut(L/K)$.
```

The surjectivity of the first map is a general fact of Galois theory.

```tex
The surjectivity of the first map is a general fact of Galois theory.
```

:::theorem "FixedPoints.toAlgAut_surjective" (parent := "frobenius_project") (lean := "FixedPoints.toAlgAut_surjective")
If a finite group $`H` acts on a field $`F` by field automorphisms, then the
map $`H \to \Aut(F/F^H)` is surjective.
:::

```tex "FixedPoints.toAlgAut_surjective" (slot := statement)
\begin{theorem}
  \label{FixedPoints.toAlgAut_surjective}
  \lean{FixedPoints.toAlgAut_surjective}
  Let $H$ be a finite group acting on a field $F$ by field automorphisms.
  Then the map $H \to \Aut(F/F^H)$ is surjective.
  \mathlibok
\end{theorem}
```

:::proof "FixedPoints.toAlgAut_surjective"
This is a general fact of Galois theory and was already in mathlib.
:::

```tex "FixedPoints.toAlgAut_surjective" (slot := proof)
\begin{proof}
  This is a general fact of Galois theory and was already in mathlib.
  \mathlibok
\end{proof}
```

For surjectivity of the second map, we need to know that every element of
$`L^{D_Q}` is fixed by $`\Aut(L/K)`. We first show this for elements of
$`B/Q` fixed by $`D_Q`.

```tex
For surjectivity of the second map, we need to know that every element of $L^{D_Q}$ is fixed by
$\Aut(L/K)$.
We first show this for elements of $B/Q$ fixed by $D_Q$.
```

:::theorem "fixed_of_fixed1" (parent := "frobenius_project")
{uses "IsFractionRing.stabilizerHom"}[]
Let $`b_0 \in B/Q`. Suppose that $`b_0` is fixed by the stabilizer subgroup
$`D_Q`. Then $`b_0` is fixed by $`\Aut(L/K)`.
:::

```tex "fixed_of_fixed1" (slot := statement)
\begin{proposition}
  \label{fixed_of_fixed1}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  Let $b_0 \in B/Q$.
  Suppose that $b_0$ is fixed by the stabilizer subgroup $D_Q$.
  Then $b_0$ is fixed by $\Aut(L/K)$.
\end{proposition}
```

:::proof "fixed_of_fixed1"
{uses "fixed_of_fixed1_aux1"}[]
{uses "fixed_of_fixed1_aux2"}[]
Let $`a,b \in B` be elements from `fixed_of_fixed1_aux2`. Let
$`M_b \in A[X]` be the characteristic polynomial of $`b`. We can map
$`M_b` to $`L[X]` in two different ways: via $`B[X]` and via $`K[X]`.
Going via $`B[X]` tells us that the image of $`M_b(X)` in $`L[X]` is exactly
$`(X - a b_0)^{|D_Q|} X^{|G|-|D_Q|}`. But going via $`K[X]` tells us that
this image lies in $`K[X]`, so we must have $`a b_0 \in K`. Then
$`a b_0` is fixed by $`\Aut(L/K)`, and $`a` is nonzero in $`L` (since
$`a \notin Q`), so $`b_0` is fixed by $`\Aut(L/K)`.
:::

```tex "fixed_of_fixed1" (slot := proof)
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

Now we upgrade this to elements of $`L` fixed by $`D_Q`. The following lemma
will allow us to lift the denominator from $`B/Q` to $`A/P`.

```tex
Now we upgrade this to elements of $L$ fixed by $D_Q$.
The following lemma will allow us to lift the denominator from $B/Q$ to $A/P$.
```

:::lemma_ "IsAlgebraic.exists_smul_eq_mul" (parent := "frobenius_project") (lean := "IsAlgebraic.exists_smul_eq_mul")
If $`R/S` is an algebraic extension of integral domains, then any fraction
$`a/b` with $`a,b \in R` can be written as $`c/d` with $`c \in R` and
$`d \in S`.
:::

```tex "IsAlgebraic.exists_smul_eq_mul" (slot := statement)
\begin{lemma}
  \label{IsAlgebraic.exists_smul_eq_mul}
  \lean{IsAlgebraic.exists_smul_eq_mul}
  \mathlibok
  If $R/S$ is an algebraic extension of integral domains, then any fraction $a/b$ with $a,b\in R$
  can be written as $c/d$ with $c\in R$ and $d\in S$.
\end{lemma}
```

:::proof "IsAlgebraic.exists_smul_eq_mul"
If $`f \in S[X]` satisfies $`f(b) = 0`, then $`f(0) \in S` is a multiple of
$`b`. If $`f(0)=bx \in S`, then $`a/b=(ax)/(bx)` as desired.
:::

```tex "IsAlgebraic.exists_smul_eq_mul" (slot := proof)
\begin{proof}
  If $f\in S[X]$ satisfies $f(b)=0$, then $f(0)\in S$ is a multiple of $b$.
  If $f(0)=bx\in S$, then $a/b=(ax)/(bx)$ as desired.
  \mathlibok
\end{proof}
```

:::theorem "fixed_of_fixed2" (parent := "frobenius_project")
Let $`x \in L`. Suppose that $`x` is fixed by the stabilizer subgroup $`D_Q`.
Then $`x` is fixed by the automorphism group $`\Aut(L/K)`.
:::

```tex "fixed_of_fixed2" (slot := statement)
\begin{proposition}
  \label{fixed_of_fixed2}
  \mathlibok
  Let $x \in L$.
  Suppose that $x$ is fixed by the stabilizer subgroup $D_Q$.
  Then $x$ is fixed by the automorphism group $\Aut(L/K)$.
\end{proposition}
```

:::proof "fixed_of_fixed2"
{uses "Algebra.IsInvariant.isIntegral"}[]
{uses "IsAlgebraic.exists_smul_eq_mul"}[]
{uses "fixed_of_fixed1"}[]
Since $`(B/Q)/(A/P)` is algebraic by `Algebra.IsInvariant.isIntegral`,
`IsAlgebraic.exists_smul_eq_mul` lets us write $`x=b/a` for $`b \in B/Q` and
$`a \in A/P`. Then $`b` is fixed by the stabilizer subgroup $`D_Q`, and it
suffices to show that $`b` is fixed by the automorphism group
$`\Aut(L/K)`. But this is exactly `fixed_of_fixed1`.
:::

```tex "fixed_of_fixed2" (slot := proof)
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

Combining this with `FixedPoints.toAlgAut_surjective` finishes the proof.

```tex
Combining this with~\ref{FixedPoints.toAlgAut_surjective} finishes the proof.
```

:::proof "IsFractionRing.stabilizerHom_surjective"
{uses "fixed_of_fixed2"}[]
{uses "FixedPoints.toAlgAut_surjective"}[]
The map $`D_Q \to \Aut(L/L^{D_Q})` is surjective by
`FixedPoints.toAlgAut_surjective`. For surjectivity of
$`\Aut(L/L^{D_Q}) \to \Aut(L/K)`, let $`\sigma` be a field automorphism of
$`L` fixing $`K` pointwise. We must show that $`\sigma` automatically fixes
$`L^{D_Q}` pointwise. But this is exactly `fixed_of_fixed2`. Thus, the
composition $`D_Q \to \Aut(L/L^{D_Q}) \to \Aut(L/K)` is surjective.
:::

```tex "IsFractionRing.stabilizerHom_surjective" (slot := proof)
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
