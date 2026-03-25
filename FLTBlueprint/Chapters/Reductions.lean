import FLTBlueprint.Citations
import FLT.Basic.FreyPackage
import FLT.Basic.Reductions
import Mathlib.NumberTheory.FLT.Four
import Mathlib.NumberTheory.FLT.Three
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "First Reductions Of The Problem" =>

:::group "first_reductions"
This chapter reduces a hypothetical counterexample to Fermat's Last Theorem to
two incompatible statements about the `p`-torsion Galois representation of the
Frey curve.
:::

# Goal

The goal of this chapter is to reduce Fermat's Last Theorem to one deep theorem
of Mazur and one deep theorem of Wiles about a Galois representation.

# Overview

The proof of Fermat's Last Theorem is by contradiction. We assume that we have
a counterexample $`a^n+b^n=c^n`, and manipulate it until it satisfies the
axioms of a Frey package, a basic concept which we will explain below. From the
Frey package we build a Frey curve, an elliptic curve defined over $`\Q`. We
then look at a certain representation of a Galois group coming from this
elliptic curve, and finally, using two very deep and independent theorems, one
due to Mazur and the other due to Wiles, we show that this representation is
both reducible and irreducible, the contradiction we seek.

# Reduction To `p >= 5` And Prime

:::theorem "counterexample_reduces_to_odd_prime" (parent := "first_reductions") (lean := "FermatLastTheorem.of_odd_primes")
Any counterexample to Fermat's Last Theorem can be reduced to one of odd prime exponent.
This is the first exponent-normalization step in the chapter.
:::

```tex "FermatLastTheorem.of_odd_primes"
\begin{lemma}\label{FermatLastTheorem.of_odd_primes}\lean{FermatLastTheorem.of_odd_primes}\leanok
  If there is a counterexample to Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$
  with $p$ an odd prime.
\end{lemma}
```

:::proof "counterexample_reduces_to_odd_prime"
This proof is already in mathlib, but the TeX blueprint spells it out for
completeness.

Say $`a^n + b^n = c^n` is a counterexample to Fermat's Last Theorem. Every
positive integer is either a power of `2` or has an odd prime factor. If
`n = kp` has an odd prime factor `p`, then
$`(a^k)^p + (b^k)^p = (c^k)^p`, which is the counterexample we seek.

It remains to deal with the case where `n` is a power of `2`, so let us assume
this. We have $`3 \le n` by assumption, so `n = 4k` is a multiple of `4`, and
thus $`(a^k)^4 + (b^k)^4 = (c^k)^4`, giving a counterexample to Fermat's Last
Theorem for `n = 4`. But Fermat's theorem for exponent `4`, already in mathlib,
says that this is impossible.
:::

```tex "FermatLastTheorem.of_odd_primes/proof"
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

Euler proved Fermat's Last Theorem for `p = 3`.

:::theorem "fermat_last_theorem_three" (parent := "first_reductions") (lean := "fermatLastTheoremThree")
Fermat's Last Theorem holds for exponent `3`.
This removes the only odd prime exponent below `5`.
:::

```tex "fermatLastTheoremThree"
\begin{lemma}\label{fermatLastTheoremThree}\lean{fermatLastTheoremThree}\leanok
\discussion{16}
  There are no solutions in positive integers to $a^3+b^3=c^3$.
\end{lemma}
```

:::proof "fermat_last_theorem_three"
The proof in mathlib was formalized by a team from the Lean For the Curious
Mathematician conference held in Luminy in March `2024`.
:::

```tex "fermatLastTheoremThree/proof"
\begin{proof}
  \leanok
  The proof in mathlib was formalized by a team from the ``Lean For the Curious Mathematician'' conference held in Luminy in March 2024
  (its dependency graph can be visualised \href{https://pitmonticone.github.io/FLT3/blueprint/dep_graph_document.html}{\underline{here}}).
\end{proof}
```

:::theorem "counterexample_reduces_to_p_ge_5" (parent := "first_reductions") (lean := "FermatLastTheorem.of_p_ge_5")
Any counterexample to Fermat's Last Theorem can be reduced to prime exponent at least `5`.
This is the final exponent reduction before Frey packages appear.
:::

```tex "FermatLastTheorem.of_p_ge_5"
\begin{corollary}\label{FermatLastTheorem.of_p_ge_5}\lean{FermatLastTheorem.of_p_ge_5}\leanok If there is a counterexample to
  Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$ with $p$ prime and $p\geq 5$.
\end{corollary}
```

:::proof "counterexample_reduces_to_p_ge_5"
This is exactly the corollary deduced in the TeX source from
{uses "counterexample_reduces_to_odd_prime"}[] and
{uses "fermat_last_theorem_three"}[].
:::

```tex "FermatLastTheorem.of_p_ge_5/proof"
\begin{proof}\uses{fermatLastTheoremThree, FermatLastTheorem.of_odd_primes}\leanok Follows from the
  previous two lemmas.\end{proof}
```

# Frey Packages

For convenience we make the following definition.

:::definition "frey_package_data" (parent := "first_reductions")
A Frey package $`(a,b,c,p)` is three nonzero pairwise-coprime integers `a`,
`b`, and `c`, with $`a \equiv 3 \pmod 4` and $`b \equiv 0 \pmod 2`, together
with a prime $`p \ge 5`, such that $`a^p+b^p=c^p`.
:::

```tex "FreyPackage"
\begin{definition}\label{FreyPackage}\lean{FreyPackage}\leanok A \emph{Frey package} $(a,b,c,p)$
is three nonzero pairwise-coprime integers $a$, $b$, $c$, with $a\equiv3\pmod4$ and $b\equiv0\pmod2$,
and a prime $p\geq5$, such that $a^p+b^p=c^p$.\end{definition}
```

Our next reduction is as follows.

:::theorem "prime_counterexample_yields_frey_package" (parent := "first_reductions") (lean := "FreyPackage.of_not_FermatLastTheorem_p_ge_5")
If Fermat's Last Theorem is false for `p` prime and $`p \ge 5`, then there
exists a Frey package.
:::

```tex "FreyPackage.of_not_FermatLastTheorem_p_ge_5"
\begin{lemma}
  \label{FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \lean{FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \leanok
  \discussion{19}
  If Fermat's Last Theorem is false for $p \ge 5$ and prime, then there exists a Frey package.
\end{lemma}
```

:::proof "prime_counterexample_yields_frey_package"
Suppose we have a counterexample $`a^p+b^p=c^p`; we now build a Frey package
from this data, following the arithmetic normalization recorded in
{uses "frey_package_data"}[].

If the greatest common divisor of `a`, `b`, and `c` is `d`, then
$`a^p+b^p=c^p` implies $`(a/d)^p+(b/d)^p=(c/d)^p`. Dividing through, we may
thus assume that no prime divides all of `a`, `b`, and `c`. Under this
assumption, the three integers are pairwise coprime, because if some prime
divides two of them then the equation forces it to divide the third as well.
In particular, not all of `a`, `b`, and `c` are even, and reducing modulo `2`
shows that precisely one of them must be even.

Next we arrange that `b` is the even one. If `a` is even, we switch `a` and
`b`. If `c` is even, we replace `c` by `-b` and `b` by `-c`, using that `p` is
odd.

The last thing to ensure is that `a` is `3` modulo `4`. Because `b` is even,
we know that `a` is odd, so it is either `1` or `3` modulo `4`. If `a` is
already `3` modulo `4` then we are done; if `a` is `1` modulo `4`, we replace
`a`, `b`, and `c` by their negatives, and this gives the Frey package we seek.
:::

```tex "FreyPackage.of_not_FermatLastTheorem_p_ge_5/proof"
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

To continue, we need some of the theory of elliptic curves over $`\Q`. Let
`f(X)` denote a monic cubic polynomial with rational coefficients whose three
complex roots are distinct, and consider the equation $`E : Y^2 = f(X)`. This
defines a curve in the `(X,Y)`-plane, and more precisely its projectivization
is an elliptic curve over $`\Q`.

If $`E : Y^2 = f(X)` is an elliptic curve over $`\Q`, and if `K` is any field
of characteristic zero, then `E(K)` denotes the set of solutions to
$`y^2=f(x)` with $`x,y \in K`, together with a point at infinity. It is an
extraordinary fact, and not at all obvious, that `E(K)` naturally has the
structure of an additive abelian group with the point at infinity as identity.
This group law is already in mathlib. It has the further property that three
distinct points `P`, `Q`, and `R` of `E(K)` sum to zero if and only if they are
collinear.

The group structure behaves well under change of field: if `E` is an elliptic
curve over $`\Q` and `K -> L` is a homomorphism of characteristic-zero fields,
then the induced map `E(K) -> E(L)` is a group homomorphism. If `K -> L` is an
isomorphism, then the induced map is an isomorphism with inverse obtained from
the inverse field map. This gives an action of the multiplicative group
$`\Aut(K)` of automorphisms of `K` on `E(K)`, and hence on the `n`-torsion
subgroup `E(K)[n]`.

In particular, if $`\Qbar` denotes an algebraic closure of $`\Q` and $`\GQ`
denotes the group of field automorphisms $`\Qbar \to \Qbar`, then for any
elliptic curve `E` over $`\Q` we obtain an action of $`\GQ` on `E(\Qbar)` and
hence on `E(\Qbar)[n]`.

If furthermore `n = p` is prime, then `E(\Qbar)[p]` is naturally a vector space
over $`\Z/p\Z`, and therefore it inherits the structure of a mod `p`
representation of $`\GQ`. This is the mod `p` Galois representation attached to
the elliptic curve `E`, and it is well-known to be `2`-dimensional. We call it
$`\rho_{E,p}`.

In the next section we apply this theory to the elliptic curve coming from a
counterexample to Fermat's Last Theorem.

# The Frey Curve

Recall that a Frey package $`(a,b,c,p)` is a prime $`p \ge 5` and nonzero
pairwise-coprime integers `a`, `b`, and `c` satisfying $`a^p+b^p=c^p` and the
congruences $`a \equiv 3 \pmod 4` and $`b \equiv 0 \pmod 2`. We have shown
above that if Fermat's Last Theorem is false, then a Frey package exists.

:::definition "frey_curve_definition" (parent := "first_reductions") (lean := "FreyPackage.freyCurve")
Given a Frey package $`(a,b,c,p)`, the corresponding Frey curve is the elliptic
curve over $`\Q` defined by the equation
$`Y^2 = X(X-a^p)(X+b^p)`.
:::

```tex "FreyCurve"
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

Given a Frey package $`(a,b,c,p)` with corresponding Frey curve `E`, the mod
`p` Galois representation $`\rho_{E,p}` attached to this package is the
`2`-dimensional representation of $`\GQ` on `E(\Qbar)[p]` described above.
Frey's observation is that this representation has some very surprising
properties. We will make this more explicit in the next chapter. Here we show
how those properties can be used to finish the job.

# Reduction To Two Big Theorems

Recall that a representation of a group `G` on a vector space `W` is said to be
irreducible if there are precisely two `G`-stable subspaces of `W`, namely `0`
and `W`. The representation is said to be reducible otherwise.

Now let $`(a,b,c,p)` be a Frey package. Consider the mod `p` representation of
$`\GQ` coming from the `p`-torsion in the Frey curve associated to the package,
and call this representation $`\rho`. Is $`\rho` irreducible or not?

:::theorem "mazur_frey_irreducible" (parent := "first_reductions") (lean := "Mazur_Frey")
The mod `p` Galois representation attached to a Frey package is irreducible.
This is the Mazur-side half of the contradiction.
:::

:::proof "mazur_frey_irreducible"
This is the Frey-curve irreducibility theorem attached to
{uses "frey_curve_definition"}[] and ultimately to Mazur's torsion bound
{uses "mazur_torsion_bound"}[].

The TeX source explains that this follows from Mazur's profound theorem on
torsion in elliptic curves over $`\Q`, cited in
{Informal.citep mazurTorsion}[], together with a little more work specific to
the Frey curve. A pre-1990 reference for the full argument is Proposition `6`
in Section `4.1` of {Informal.citep serreModularityConjecture}[].

In the current port, the arithmetic bridge from Mazur's theorem to this
Frey-specific irreducibility statement is isolated in
{uses "reducible_frey_representation_conflicts_with_mazur"}[].
:::

Note that in the first, pre-`2029` phase of the FLT project, we are not
planning to formalize this result itself, because it was already known in the
`1980`s. We will, however, have much more to say about the next theorem, which
says the exact opposite.

:::theorem "wiles_frey_not_irreducible" (parent := "first_reductions") (lean := "Wiles_Frey")
The mod `p` Galois representation attached to a Frey package is reducible.
This is the Wiles-side half of the contradiction.
:::

:::proof "wiles_frey_not_irreducible"
This is the Wiles-side theorem attached to {uses "frey_curve_definition"}[].
The TeX chapter describes it as the main content of Wiles' magnum opus and
omits the proof at this stage.

In the current Verso port, the route to this theorem is made explicit through
{uses "frey_torsion_hardly_ramified"}[],
{uses "hardly_ramified_reducible"}[], and
{uses "frey_torsion_not_irreducible"}[].
:::

:::theorem "no_frey_package" (parent := "first_reductions") (lean := "FreyPackage.false")
There is no Frey package.
:::

:::proof "no_frey_package"
This follows immediately from {uses "mazur_frey_irreducible"}[] and
{uses "wiles_frey_not_irreducible"}[] for the representation attached to
{uses "frey_curve_definition"}[].
:::

We deduce the desired contradiction.

:::theorem "fermats_last_theorem_true" (parent := "first_reductions") (lean := "Wiles_Taylor_Wiles")
Fermat's Last Theorem is true. In other words, there are no positive integers
`a`, `b`, and `c` and natural numbers `n >= 3` such that $`a^n+b^n=c^n`.
:::

:::proof "fermats_last_theorem_true"
Assume there is a counterexample $`a^n+b^n=c^n`. By
{uses "counterexample_reduces_to_p_ge_5"}[], we may assume that there is also a
counterexample of the form $`a^p+b^p=c^p`, where $`p` is prime and $`p \ge 5`.
Then
{uses "prime_counterexample_yields_frey_package"}[] produces a Frey package,
contradicting {uses "no_frey_package"}[].
:::

Because we are, for now at least, assuming Mazur's theorem, we now turn our
attention to a proof of the Wiles-side theorem. The next chapter starts that
reduction.
