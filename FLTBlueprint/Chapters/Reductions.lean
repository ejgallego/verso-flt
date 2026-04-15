import FLTBlueprint.Citations
import FLT.Basic.FreyPackage
import FLT.Basic.Reductions
import Mathlib.NumberTheory.FLT.Four
import Mathlib.NumberTheory.FLT.Three
import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "First Reductions Of The Problem" =>

:::group "first_reductions"
Initial reductions of Fermat's Last Theorem.
:::

```tex
\chapter{First reductions of the problem}\label{ch_reductions}
```

# Goal

The goal of this chapter is to reduce FLT to a deep theorem of Mazur and a deep
theorem of Wiles about a Galois representation.

```tex
The goal of this chapter is to reduce FLT to a deep theorem of Mazur and a deep theorem of Wiles
about a Galois representation.
```

# Overview

The proof of Fermat's Last Theorem is by contradiction. We assume that we have
a counterexample $`a^n+b^n=c^n`, and manipulate it until it satisfies the
axioms of a Frey package, a basic concept which we will explain below. From the
Frey package we build a Frey curve, an elliptic curve defined over $`\Q`. We
then look at a certain representation of a Galois group coming from this
elliptic curve, and finally, using two very deep and independent theorems, one
due to Mazur and the other due to Wiles, we show that this representation is
both reducible and irreducible, the contradiction we seek.

```tex
The proof of Fermat's Last Theorem is by contradiction. We assume that we have a counterexample
$a^n+b^n=c^n$, and manipulate it until it satisfies the axioms of a ``Frey package'', a basic
concept which we will explain below. From the
Frey package we build a Frey curve -- an elliptic curve defined over the rationals. We then look at
a certain representation of a Galois group coming from this elliptic curve, and finally using two
very deep and independent theorems (one due to Mazur, the other due to Wiles) we show that this
representation is both reducible and irreducible, the contradiction we seek.
```

# Reduction To `n >= 5` And Prime

:::lemma_ "FermatLastTheorem.of_odd_primes" (parent := "first_reductions") (lean := "FermatLastTheorem.of_odd_primes")
If there is a counterexample to Fermat's Last Theorem, then there is a
counterexample $`a^p+b^p=c^p` with `p` an odd prime.
:::

```tex "FermatLastTheorem.of_odd_primes" (slot := statement)
\begin{lemma}\label{FermatLastTheorem.of_odd_primes}\lean{FermatLastTheorem.of_odd_primes}\leanok
  If there is a counterexample to Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$
  with $p$ an odd prime.
\end{lemma}
```

:::proof "FermatLastTheorem.of_odd_primes"
This proof is already in mathlib, but the TeX blueprint spells it out for
completeness.

Say $`a^n + b^n = c^n` is a counterexample to Fermat's Last Theorem. Every
positive integer is either a power of `2` or has an odd prime factor. If
$`n = kp` has an odd prime factor `p`, then
$`(a^k)^p + (b^k)^p = (c^k)^p`, which is the counterexample we seek.

It remains to deal with the case where `n` is a power of `2`, so let us assume
this. We have $`3 \le n` by assumption, so $`n = 4k` is a multiple of `4`, and
thus $`(a^k)^4 + (b^k)^4 = (c^k)^4`, giving a counterexample to Fermat's Last
Theorem for $`n = 4`. But Fermat's theorem for exponent `4`, already in mathlib,
says that this is impossible.
:::

```tex "FermatLastTheorem.of_odd_primes" (slot := proof)
\begin{proof}\leanok
  Note: this proof is \href{https://leanprover-community.github.io/mathlib4_docs/Mathlib/NumberTheory/FLT/Four.html#FermatLastTheorem.of_odd_primes}{in mathlib already};
  we run through it for completeness' sake.

  Say $a^n + b^n = c^n$ is a counterexample to Fermat's Last Theorem. Every positive integer is either
  a power of 2 or has an odd prime factor. If $n=kp$ has an odd prime factor $p$ then
  $(a^k)^p+(b^k)^p=(c^k)^p$ is the counterexample we seek. It remains to deal with the case where
  $n$ is a power of 2, so let's assume this. We have $3\leq n$ by assumption, so
  $n=4k$ must be a multiple of~4, and thus $(a^k)^4+(b^k)^4=(c^k)^4$, giving us a counterexample
  to Fermat's Last Theorem for $n=4$. But Fermat's theorem for exponent `4`, already in mathlib,
  says that this is impossible.
\end{proof}
```

Euler proved Fermat's Last Theorem for $`p = 3`.

```tex
Euler proved Fermat's Last Theorem for $p=3$;
```

:::lemma_ "fermatLastTheoremThree" (parent := "first_reductions") (lean := "fermatLastTheoremThree")
There are no solutions in positive integers to $`a^3+b^3=c^3`.
:::

```tex "fermatLastTheoremThree" (slot := statement)
\begin{lemma}\label{fermatLastTheoremThree}\lean{fermatLastTheoremThree}\leanok
\discussion{16}
  There are no solutions in positive integers to $a^3+b^3=c^3$.
\end{lemma}
```

:::proof "fermatLastTheoremThree"
The proof in mathlib was formalized by a team from the "Lean For the Curious
Mathematician" conference held in Luminy in March `2024` (its dependency graph
can be visualised [here](https://pitmonticone.github.io/FLT3/blueprint/dep_graph_document.html)).
:::

```tex "fermatLastTheoremThree" (slot := proof)
\begin{proof}
  \leanok
  The proof in mathlib was formalized by a team from the ``Lean For the Curious Mathematician'' conference held in Luminy in March 2024
  (its dependency graph can be visualised \href{https://pitmonticone.github.io/FLT3/blueprint/dep_graph_document.html}{\underline{here}}).
\end{proof}
```

:::corollary "FermatLastTheorem.of_p_ge_5" (parent := "first_reductions") (lean := "FermatLastTheorem.of_p_ge_5")
If there is a counterexample to Fermat's Last Theorem, then there is a
counterexample $`a^p+b^p=c^p` with `p` prime and $`p \ge 5`.
:::

```tex "FermatLastTheorem.of_p_ge_5" (slot := statement)
\begin{corollary}\label{FermatLastTheorem.of_p_ge_5}\lean{FermatLastTheorem.of_p_ge_5}\leanok If there is a counterexample to
  Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$ with $p$ prime and $p\geq 5$.
\end{corollary}
```

:::proof "FermatLastTheorem.of_p_ge_5"
{uses "fermatLastTheoremThree"}[]
{uses "FermatLastTheorem.of_odd_primes"}[]
Follows from the previous two lemmas.
:::

```tex "FermatLastTheorem.of_p_ge_5" (slot := proof)
\begin{proof}\uses{fermatLastTheoremThree, FermatLastTheorem.of_odd_primes}\leanok Follows from the
  previous two lemmas.\end{proof}
```

# Frey Packages

For convenience we make the following definition.

```tex
For convenience we make the following definition.
```

:::definition "FreyPackage" (parent := "first_reductions") (lean := "FreyPackage")
A Frey package $`(a,b,c,p)` is three nonzero pairwise-coprime integers `a`,
`b`, and `c`, with $`a \equiv 3 \pmod 4` and $`b \equiv 0 \pmod 2`, together
with a prime $`p \ge 5`, such that $`a^p+b^p=c^p`.
:::

```tex "FreyPackage" (slot := statement)
\begin{definition}\label{FreyPackage}\lean{FreyPackage}\leanok A \emph{Frey package} $(a,b,c,p)$
is three nonzero pairwise-coprime integers $a$, $b$, $c$, with $a\equiv3\pmod4$ and $b\equiv0\pmod2$,
and a prime $p\geq5$, such that $a^p+b^p=c^p$.\end{definition}
```

Our next reduction is as follows.

```tex
Our next reduction is as follows:
```

:::lemma_ "FreyPackage.of_not_FermatLastTheorem_p_ge_5" (parent := "first_reductions") (lean := "FreyPackage.of_not_FermatLastTheorem_p_ge_5")
If Fermat's Last Theorem is false for `p` prime and $`p \ge 5`, then there
exists a Frey package.
:::

```tex "FreyPackage.of_not_FermatLastTheorem_p_ge_5" (slot := statement)
\begin{lemma}
  \label{FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \lean{FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \leanok
  \discussion{19}
  If Fermat's Last Theorem is false for $p \ge 5$ and prime, then there exists a Frey package.
\end{lemma}
```

:::proof "FreyPackage.of_not_FermatLastTheorem_p_ge_5"
{uses "FreyPackage"}[]
Suppose we have a counterexample $`a^p+b^p=c^p` for the given `p`; we now build
a Frey package from this data.

If the greatest common divisor of $`a,b,c` is `d`, then $`a^p+b^p=c^p` implies
$`(a/d)^p+(b/d)^p=(c/d)^p`. Dividing through, we can thus assume that no prime
divides all of $`a,b,c`. Under this assumption we must have that $`a,b,c` are
pairwise coprime, as if some prime divides two of the integers $`a,b,c` then by
$`a^p+b^p=c^p` and unique factorization it must divide all three of them. In
particular we may assume that not all of $`a,b,c` are even, and now reducing
modulo `2` shows that precisely one of them must be even.

Next we show that we can find a counterexample with `b` even. If `a` is the
even one, then we can just switch `a` and `b`. If `c` is the even one, then we
can replace `c` by `-b` and `b` by `-c`, using that `p` is odd.

The last thing to ensure is that `a` is `3` mod `4`. Because `b` is even, we
know that `a` is odd, so it is either `1` or `3` mod `4`. If `a` is `3` mod `4`
then we are home; if however `a` is `1` mod `4`, we replace $`a,b,c` by their
negatives, and this is the Frey package we seek.
:::

```tex "FreyPackage.of_not_FermatLastTheorem_p_ge_5" (slot := proof)
\begin{proof}
  \uses{FreyPackage}
  \leanok
  Suppose we have a counterexample $a^p+b^p=c^p$ for the given $p$; we now build a Frey package from this data.

  If the greatest common divisor of $a,b,c$ is $d$ then $a^p+b^p=c^p$ implies $(a/d)^p+(b/d)^p=(c/d)^p$.
  Dividing through, we can thus assume that no prime divides all of $a,b,c$. Under this assumption we
  must have that $a,b,c$ are pairwise coprime, as if some prime divides two of the integers $a,b,c$
  then by $a^p+b^p=c^p$ and unique factorization it must divide all three of them.
  In particular we may assume that not all of $a,b,c$ are even, and now reducing modulo~2 shows
  that precisely one of them must be even.

  Next we show that we can find a counterexample with $b$ even. If $a$ is the even one then we can
  just switch $a$ and $b$. If $c$ is the even one then we can replace $c$ by $-b$ and $b$ by $-c$
  (using that $p$ is odd).

  The last thing to ensure is that $a$ is 3 mod~4. Because $b$ is even, we know that $a$ is odd,
  so it is either~1 or~3 mod~4. If $a$ is 3 mod~4 then we are home; if however $a$ is 1 mod~4 we
  replace $a,b,c$ by their negatives and this is the Frey package we seek.
\end{proof}
```

# Galois Representations And Elliptic Curves

To continue, we need some of the theory of elliptic curves over $`\Q`. So let
`f(X)` denote any monic cubic polynomial with rational coefficients and whose
three complex roots are distinct, and let us consider the equation
$`E : Y^2 = f(X)`, which defines a curve in the `(X,Y)`-plane. This curve, or
strictly speaking its projectivization, is a so-called elliptic curve over
$`\Q`.

```tex
To continue, we need some of the theory of elliptic curves over $\Q$. So let $f(X)$ denote any
monic cubic polynomial with rational coefficients and whose three complex roots are distinct,
and let us consider the equation $E:Y^2=f(X)$, which defines a curve in the $(X,Y)$ plane.
This curve (or strictly speaking its projectivisation) is a so-called elliptic curve
(or an elliptic curve over $\Q$ if we want to keep track of the field where the coefficients
of $f(X)$ lie).
```

If $`E : Y^2 = f(X)` is an elliptic curve over $`\Q`, and if `K` is any
characteristic zero field, and hence a $`\Q`-algebra, then we write `E(K)` for
the set of solutions to $`y^2=f(x)` with $`x,y \in K`, together with an
additional "point at infinity" corresponding morally to $`x=y=\infty`. It is an
extraordinary fact, and not at all obvious, that `E(K)` naturally has the
structure of an additive abelian group, with the point at infinity being the
zero element, the identity. Fortunately this fact is already in `mathlib`. This
additive group structure has the property that three distinct points `P`, `Q`,
`R` in $`K^2` which are in `E(K)` will sum to zero if and only if they are
collinear.

```tex
If $E:Y^2=f(X)$ is an elliptic curve over $\Q$, and if $K$ is any characteristic zero field (and
hence a $\Q$-algebra), then we write $E(K)$ for the set of solutions to $y^2=f(x)$ with $x,y\in K$,
together with an additional ``point at infinity'' corresponding morally to $x=y=\infty$.
It is an extraordinary fact,
and not at all obvious, that $E(K)$ naturally has the structure of an additive abelian group,
with the point at infinity being the zero element (the identity). Fortunately this fact is
already in {\tt mathlib}. This additive group structure has
the property that three distinct points $P,Q,R\in K^2$ which are in $E(K)$ will sum to zero
if and only if they are collinear.
```

The group structure behaves well under change of field: if `E` is an elliptic
curve over $`\Q` and if $`K\to L` is a homomorphism of characteristic zero
fields, then the induced map $`E(K)\to E(L)` is a group homomorphism. Thus if
$`f:K\to L` is an isomorphism of characteristic zero fields, the induced map
$`E(K)\to E(L)` is an isomorphism of groups, with the inverse isomorphism being
the map $`E(L)\to E(K)` induced by $`f^{-1}`. This construction thus gives us an
action of the multiplicative group $`\Aut(K)` of automorphisms of the field `K`
on the additive abelian group $`E(K)`, and hence also on the `n`-torsion of this
group for any positive integer `n`. In particular, if $`\Qbar` denotes an
algebraic closure of the rationals, for example the algebraic numbers in
$`\bbC`, and if $`\GQ` denotes the group of field isomorphisms
$`\Qbar\to\Qbar`, then for any elliptic curve `E` over $`\Q` we have an action
of $`\GQ` on the additive abelian group $`E(\Qbar)`, and hence on its
`n`-torsion subgroup $`E(\Qbar)[n]`.

```tex
The group structure behaves well under change of field: if $E$ is an elliptic curve over $\Q$
and if $K\to L$ is a homomorphism of
characteristic zero fields then the induced map $E(K)\to E(L)$ is a group homomorphism.
Thus if $f:K\to L$ is an isomorphism of characteristic zero fields, the induced map $E(K)\to E(L)$
is an isomorphism of groups, with the inverse isomorphism being the map $E(L)\to E(K)$ induced
by $f^{-1}$. This construction thus gives us an action of the multiplicative group $\Aut(K)$
of automorphisms of the field $K$ on the additive abelian group $E(K)$, and hence also
on the $n$-torsion of this group for any positive integer~$n$.
In particular, if $\Qbar$ denotes an algebraic closure of the
rationals (for example, the algebraic numbers in $\bbC$) and if $\GQ$ denotes the group of field
isomorphisms $\Qbar\to\Qbar$, then for any elliptic curve $E$ over $\Q$ we have an action
of $\GQ$ on the additive abelian group $E(\Qbar)$, and hence on its $n$-torsion subgroup
$E(\Qbar)[n]$.
```

If furthermore $`n = p` is prime, then $`E(\Qbar)[p]` is naturally a vector space
over $`\Z/p\Z`, and therefore it inherits the structure of a mod `p`
representation of $`\GQ`. This is the mod `p` Galois representation attached to
the elliptic curve `E`, and it is well-known to be `2`-dimensional. We call it
$`\rho_{E,p}`.

```tex
If furthermore $n=p$ is prime, then $E(\Qbar)[p]$ is naturally a vector space over the
field $\Z/p\Z$, and thus it inherits the structure of a mod $p$ representation of $\GQ$.
This is the \emph{mod $p$ Galois representation} attached to the elliptic curve $E$.
It is well-known to be 2-dimensional. We call this representation $\rho_{E,p}$.
```

In the next section we apply this theory to the elliptic curve coming from a
counterexample to Fermat's Last Theorem.

```tex
In the next section we apply this theory to an elliptic curve coming from a counterexample to
Fermat's Last theorem.
```

# The Frey Curve

Recall that a Frey package $`(a,b,c,p)` is a prime $`p \ge 5` and nonzero
pairwise-coprime integers `a`, `b`, and `c` satisfying $`a^p+b^p=c^p` and the
congruences $`a \equiv 3 \pmod 4` and $`b \equiv 0 \pmod 2`. We have shown
above that if Fermat's Last Theorem is false, then a Frey package exists.

```tex
Recall that a \emph{Frey package} $(a,b,c,p)$ is simply a prime $p\geq5$ and nonzero
pairwise-coprime integers $a,b,c$ satisfying $a^p+b^p=c^p$ and satisfying the congruences
$a\equiv3\pmod4$ and $b\equiv0\pmod2$. We have shown above that if Fermat's Last Theorem is false,
then a Frey package exists.
```

:::definition "FreyCurve" (parent := "first_reductions") (lean := "FreyPackage.freyCurve")
{uses "FreyPackage"}[]
Given a Frey package $`(a,b,c,p)`, the corresponding Frey curve is the elliptic
curve over $`\Q` (considered by Frey and, before him, Hellegouarch) defined by the equation
$`Y^2 = X(X-a^p)(X+b^p)`.
:::

```tex "FreyCurve" (slot := statement)
\begin{definition}[Frey]
  \label{FreyCurve}
  \lean{FreyPackage.freyCurve}
  \uses{FreyPackage}\discussion{21}
  \leanok
  Given a Frey package $(a,b,c,p)$, the corresponding \emph{Frey curve} (considered by Frey and,
  before him, Hellegouarch) is the elliptic curve over $\Q$ defined by the equation
  $Y^2=X(X-a^p)(X+b^p).$
\end{definition}
```

Note that the roots of the cubic $`X(X-a^p)(X+b^p)` are distinct because `a`,
`b`, and `c` are nonzero and $`a^p+b^p=c^p`.

```tex
Note that the roots of the cubic $X(X-a^p)(X+b^p)$ are distinct because $a,b,c$ are nonzero and
$a^p+b^p=c^p$.
```

Given a Frey package $`(a,b,c,p)` with corresponding Frey curve `E`, the mod
`p` Galois representation $`\rho_{E,p}` attached to this package is the
`2`-dimensional representation of $`\GQ` on $`E(\Qbar)[p]` described above.
Frey's observation is that this representation has some very surprising
properties. We will make this remark more explicit in the next chapter. Here we
shall show how these properties can be used to finish the job.

```tex
Given a Frey package $(a,b,c,p)$ with corresponding Frey curve $E$, the mod $p$ Galois
representation $\rho_{E,p}$ associated to this package is the 2-dimensional representation of
$\GQ$ on $E(\Qbar)[p]$ described above. Frey's observation is that this mod $p$ Galois
representation has some very surprising properties. We will make this remark more explicit
in the next chapter. Here we shall show how these properties can be used to finish the job.
```

# Reduction To Two Big Theorems

Recall that a representation of a group `G` on a vector space `W` is said to be
irreducible if there are precisely two `G`-stable subspaces of `W`, namely `0`
and `W`. The representation is said to be reducible otherwise.

```tex
Recall that a representation of a group $G$ on a vector space $W$ is said to be \emph{irreducible}
if there are precisely two $G$-stable subspaces of $W$, namely $0$ and $W$.
The representation is said to be \emph{reducible} otherwise.
```

Now say $`(a,b,c,p)` is a Frey package. Consider the mod `p` representation of
$`\GQ` coming from the `p`-torsion in the Frey curve
$`Y^2=X(x-a^p)(X+b^p)` associated to the package. Let's call this representation
$`\rho`, and we say that $`\rho` is the mod `p` representation associated to the
Frey package $`(a,b,c,p)`. Is $`\rho` irreducible or not?

```tex
Now say $(a,b,c,p)$ is a Frey package.
Consider the mod $p$ representation of $\GQ$ coming from the $p$-torsion in the Frey
curve $Y^2=X(x-a^p)(X+b^p)$ associated to the package. Let's call this representation $\rho$,
and we say that $\rho$ is the mod $p$ representation associated to the Frey package $(a,b,c,p)$.
Is it irreducible or not?
```

:::theorem "Mazur_Frey" (parent := "first_reductions") (lean := "Mazur_Frey")
{uses "FreyCurve"}[]
If $`\rho` is the mod `p` Galois representation associated to a Frey package
`(a,b,c,p)` then $`\rho` is irreducible.
:::

```tex "Mazur_Frey" (slot := statement)
\begin{theorem}[Mazur]
  \label{Mazur_Frey}
  \lean{Mazur_Frey}
  \uses{FreyCurve}
  \leanok
  If $\rho$ is the mod $p$ Galois representation associated to a Frey package $(a,b,c,p)$ then
  $\rho$ is irreducible.
\end{theorem}
```

:::proof "Mazur_Frey"
This follows from a profound and long result of Mazur
{Informal.citep mazurTorsion}[] from `1977`, namely the fact that the torsion
subgroup of an elliptic curve over $`\Q` can have size at most `16`. In fact
there is still a little more work which needs to be done to deduce the theorem
from Mazur's result. A pre-`1990` reference for the full proof of this claim is
Proposition `6` in Section `4.1` of
{Informal.citep serreModularityConjecture}[].
:::

```tex "Mazur_Frey" (slot := proof)
\begin{proof}
  \uses{Frey_curve_irreducible}
  \notready
  This follows from a profound and long result of Mazur \cite{mazur-torsion} from 1977,
  namely the fact that the torsion subgroup of an elliptic curve over $\Q$ can have size at most~16.
  In fact there is still a little more work which needs to be done to deduce the theorem from
  Mazur's result. A pre-1990 reference for the full proof of this claim is Proposition~6
  in~\S4.1 of~\cite{serreconj}.
\end{proof}
```

Note that in the first (pre-2029) phase of the FLT project, we will not be
working on a formalization of this result, as it was known in the `1980`s. We
will however be thinking a lot about the next result, which says the exact
opposite.

```tex
Note that in the first (pre-2029) phase of the FLT project, we will not be working on
a formalization of this result, as it was known in the 1980s. We will however be thinking
a lot about the next result, which says the exact opposite.
```

:::theorem "Wiles_Frey" (parent := "first_reductions") (lean := "Wiles_Frey")
{uses "FreyCurve"}[]
If $`\rho` is the mod `p` Galois representation associated to a Frey package
`(a,b,c,p)` then $`\rho` is reducible.
:::

```tex "Wiles_Frey" (slot := statement)
\begin{theorem}[Wiles,Taylor--Wiles, Ribet,\ldots]
  \label{Wiles_Frey}
  \lean{Wiles_Frey}
  \uses{FreyCurve}
  \leanok
  If $\rho$ is the mod $p$ Galois representation associated to a Frey package $(a,b,c,p)$ then
  $\rho$ is reducible.
\end{theorem}
```

:::proof "Wiles_Frey"
{uses "Frey_curve_hardly_ramified"}[]
{uses "hardly_ramified_reducible"}[]
This follows from theorem `Frey_curve_hardly_ramified`, which shows that the
Frey representation is hardly ramified, together with theorem
`hardly_ramified_reducible`, which shows that any hardly ramified mod `p`
representation is reducible.
:::

```tex "Wiles_Frey" (slot := proof)
\begin{proof}
  \uses{Frey_curve_hardly_ramified,hardly_ramified_reducible}
  This follows from theorem~\ref{Frey_curve_hardly_ramified}, which shows that
  the Frey representation is hardly ramified, together with
  theorem~\ref{hardly_ramified_reducible}, which shows that any hardly
  ramified mod~$p$ representation is reducible.
\end{proof}
```

:::corollary "FreyPackage.false" (parent := "first_reductions") (lean := "FreyPackage.false")
{uses "Mazur_Frey"}[]
{uses "Wiles_Frey"}[]
There is no Frey package.
:::

```tex "FreyPackage.false" (slot := statement)
\begin{corollary}
  \label{FreyPackage.false}
  \lean{FreyPackage.false}
  \uses{Mazur_Frey, Wiles_Frey}
  \leanok
  There is no Frey package.
\end{corollary}
```

:::proof "FreyPackage.false"
Follows immediately from the previous two theorems.
:::

```tex "FreyPackage.false" (slot := proof)
\begin{proof}\leanok Follows immediately from the previous two
  theorems~\ref{Mazur_Frey} and~\ref{Wiles_Frey}.
\end{proof}
```

We deduce.

```tex
We deduce
```

:::corollary "FLT" (parent := "first_reductions") (lean := "Wiles_Taylor_Wiles")
Fermat's Last Theorem is true. In other words, there are no positive integers
`a`, `b`, and `c` and natural numbers `n >= 3` such that $`a^n+b^n=c^n`.
:::

```tex "FLT" (slot := statement)
\begin{corollary}
  \label{FLT}
  \lean{Wiles_Taylor_Wiles}
  \leanok
  Fermat's Last Theorem is true. In other words, there are no positive integers $a,b,c$ and
  natural $n\geq3$ such that $a^n+b^n=c^n$.
\end{corollary}
```

:::proof "FLT"
Assume there is a there is a counterexample $`a^n+b^n=c^n`. By Corollary
{uses "FermatLastTheorem.of_p_ge_5"}[], we may assume that there is also a
counterexample $`a^p+b^p=c^p` with $`p\geq 5` and prime. Then
{uses "FreyPackage.of_not_FermatLastTheorem_p_ge_5"}[] produces a Frey package,
contradicting {uses "FreyPackage.false"}[].
:::

```tex "FLT" (slot := proof)
\begin{proof}
  \uses{FermatLastTheorem.of_p_ge_5, FreyPackage.false, FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \leanok
  Assume there is a there is a counterexample $a^n+b^n=c^n$.
  By Corollary \ref{FermatLastTheorem.of_p_ge_5} we may assume that there is also a counterexample
  $a^p+b^p=c^p$ with $p\geq 5$ and prime.
  Then there is a Frey package $(a,b,c,p)$ by~\ref{FreyPackage.of_not_FermatLastTheorem_p_ge_5},
  contradicting Corollary~\ref{FreyPackage.false}.
\end{proof}
```

Because we are, for now at least, assuming Mazur's theorem, we now turn our
attention to a proof of theorem `Wiles_Frey`. We start on this proof
in the next chapter.

```tex
Because we are (for now at least) assuming Mazur's theorem, we now need to turn our attention
to a proof of theorem~\ref{Wiles_Frey}. We start on this proof in Chapter~\ref{ch_freyreduction}.
```
