import FLTBlueprint.Citations
import FLT.EllipticCurve.Torsion
import FLT.Assumptions.Mazur
import FLT.Basic.FreyPackage
import FLT.Basic.Reductions
import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude

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

In the reductions chapter we explained how, given a counterexample to
Fermat's Last Theorem, we could construct a Frey package and thus a Frey curve,
which is an elliptic curve with some interesting properties. In this chapter
we start with an overview of parts of the theory of the arithmetic of elliptic
curves. Following this we sketch proofs of the two main results of this
chapter: firstly that the `p`-torsion $`\rho` in the Frey curve is "hardly
ramified", and secondly that Mazur's result on the possible torsion of
elliptic curves implies that $`\rho` must be irreducible.

```tex
In Chapter~\ref{ch_reductions} we explained how, given a counterexample to Fermat's Last Theorem, we could construct a Frey package and thus a Frey curve, which is an elliptic curve with some interesting properties. In this chapter we start with an overview of parts of the theory of the arithmetic of elliptic curves. Following
this we sketch proofs of the two main results of this chapter: firstly that the $p$-torsion $\rho$ in the Frey curve is ``hardly ramified'', and secondly that Mazur's result on the possible torsion of elliptic curves implies that $\rho$ must be irreducible.
```

Everything here follows from standard results about elliptic curves. Almost
none of these results were in `mathlib` when the chapter was drafted, so there
is still plenty to be done here.

```tex
Everything here follows from standard results about elliptic curves, however almost none of these results are in {\tt mathlib} as I am writing this, so there is plenty to be done here.
```

# The Arithmetic Of Elliptic Curves

We give an overview of the results we need, citing the literature for proofs.
Everything here is standard, and most of it dates back to the 1970s or before.

```tex
\section{The arithmetic of elliptic curves}

We give an overview of the results we need, citing the literature for proofs. Everything here is
 standard, and most of it dates back to the 1970s or before.
```

:::theorem "WeierstrassCurve.n_torsion_card" (parent := "elliptic_frey_bridge") (lean := "WeierstrassCurve.n_torsion_card")
Let $`n` be a positive integer, let $`F` be a separably closed field with
$`n` nonzero in $`F`, and let $`E` be an elliptic curve over $`F`. Then the
$`n`-torsion $`E(F)[n]` in the $`F`-points of $`E` is a finite group of
size $`n^2`.
:::

```tex "WeierstrassCurve.n_torsion_card" (slot := statement)
\begin{theorem}\label{WeierstrassCurve.n_torsion_card}\lean{WeierstrassCurve.n_torsion_card}\notready
  Let $n$ be a positive integer, let $F$ be a separably closed
  field with $n$ nonzero in $F$, and let $E$ be an elliptic curve over $F$.
  Then the $n$-torsion $E(K)[n]$
  in the $F$-points of $E$ is a finite group of size $n^2$.
\end{theorem}
```

:::proof "WeierstrassCurve.n_torsion_card"
There are several proofs in the textbooks. The proof being worked on uses the
theory of division polynomials; the formalisation is ongoing work of David
Angdinata, and it will be part of his PhD thesis.
:::

```tex "WeierstrassCurve.n_torsion_card" (slot := proof)
\begin{proof}
  There are several proofs in the textbooks. The proof being worked on uses the theory of division polynomials; the formalisation is ongoing work of David Angdinata, and it will be part of his PhD thesis.
\end{proof}
```

This theorem actually tells us the structure of the `n`-torsion, because of the
following purely group-theoretic result:

```tex
This theorem actually tells us the structure of the $n$-torsion, because of the following
purely group-theoretic result:
```

:::lemma_ "group_theory_lemma" (parent := "elliptic_frey_bridge") (lean := "group_theory_lemma")
Say `n` is a positive integer, `r` is a natural, and `A` is an abelian group.
Assume that for all $`d \mid n`, the `d`-torsion `A[d]` of `A` has size $`d^r`.
Then $`A[n] \cong (\Z/n\Z)^r`.
:::

```tex "group_theory_lemma" (slot := statement)
\begin{lemma}\label{group_theory_lemma}\lean{group_theory_lemma}
  Say $n$ is a positive integer, $r$ is a natural, and $A$ is an abelian group.
  Assume that for all $d\mid n$, the $d$-torsion $A[d]$ of $A$ has size $d^r$.
  Then $A[n]\cong (\Z/n\Z)^r$.
\end{lemma}
```

:::proof "group_theory_lemma"
The result is obvious if $`n = 1`, so we may assume $`n > 1`. One proof would be
to write `A` as $`\prod_{i=1}^t(\Z/a_i\Z)` with $`a_i \mid a_{i+1}` (this is
possible by the structure theorem for finite abelian groups), and then to
apply our hypothesis firstly with $`d = a_1` to deduce $`t = r` and then with
$`d = a_t` to deduce $`a_1 = a_t`.
:::

```tex "group_theory_lemma" (slot := proof)
\begin{proof}
  The result is obvious if $n=1$, so we may assume $n>1$. One proof would be to write $A$ as $\prod_{i=1}^t(\Z/a_i\Z)$
  with $a_i\mid a_{i+1}$ (this is possible by the structure theorem for finite abelian groups), and then to apply our hypothesis firstly with $d=a_1$ to deduce $t=r$ and then with $d=a_t$ to deduce $a_1=a_t$.
\end{proof}
```

:::corollary "Elliptic_curve_n_torsion_2d" (parent := "elliptic_frey_bridge") (lean := "WeierstrassCurve.n_torsion_dimension")
Let $`n` be a positive integer, let $`F` be a separably closed field with
$`n` nonzero in $`F`, and let $`E` be an elliptic curve over $`F`. Then the
$`n`-torsion $`E(F)[n]` in the $`F`-points of $`E` is a finite group
isomorphic to $`(\Z/n\Z)^2`.
:::

```tex "Elliptic_curve_n_torsion_2d" (slot := statement)
\begin{corollary}\label{Elliptic_curve_n_torsion_2d}\lean{WeierstrassCurve.n_torsion_dimension}\leanok
  Let $n$ be a positive integer, let $F$ be a separably closed
  field with $n$ nonzero in $F$, and let $E$ be an elliptic curve over $F$.
  Then the $n$-torsion $E(F)[n]$
  in the $F$-points of $E$ is a finite group isomorphic to $(\Z/n\Z)^2$.
\end{corollary}
```

:::proof "Elliptic_curve_n_torsion_2d"
This follows from the previous group-theoretic lemma
{uses "group_theory_lemma"}[] and theorem
{uses "WeierstrassCurve.n_torsion_card"}[].
:::

```tex "Elliptic_curve_n_torsion_2d" (slot := proof)
\begin{proof}\uses{group_theory_lemma,WeierstrassCurve.n_torsion_card}\leanok
  This follows from the previous group-theoretic lemma~\ref{group_theory_lemma} and
  theorem~\ref{WeierstrassCurve.n_torsion_card}.
\end{proof}
```

We saw in section `twopointfour` that if $`E` is an elliptic curve over a
field $`k` and if $`k^{\sep}` is a separable closure of $`k`, then the group
$`\Gal(k^{\sep}/k)` acts on $`E(k^{\sep})[n]`. Now let $`n` be a positive
integer which is nonzero in $`k`. We have just seen that
$`E(k^{\sep})[n]` is isomorphic to $`(\Z/n\Z)^2`, and it inherits an action
of $`\Gal(k^{\sep}/k)`. If we fix an isomorphism
$`E(k^{\sep})[n]\cong(\Z/n\Z)^2` then we get a representation
$`\Gal(k^{\sep}/k)\to\GL_2(\Z/n\Z)`. A fundamental fact about this Galois
representation is that its determinant is the cyclotomic character.

```tex
We saw in section~\ref{twopointfour} that if $E$ is an elliptic curve over a field $k$ and if $k^{\sep}$ is a separable closure of~$k$, then the group $\Gal(k^{\sep}/k)$ acts on $E(k^{\sep})[n]$. Now let $n$ be a positive integer which is nonzero in $k$. We have just seen that $E(k^{\sep})[n]$ is isomorphic to $(\Z/n\Z)^2$, and it inherits an action of $\Gal(k^{\sep}/k)$. If we fix an isomorphism $E(k^{\sep})[n]\cong(\Z/n\Z)^2$ then we get a representation $\Gal(k^{\sep}/k)\to\GL_2(\Z/n\Z)$. A fundamental fact about this Galois representation is that its determinant is the cyclotomic character.
```

:::theorem "Elliptic_curve_det_n_torsion" (parent := "elliptic_frey_bridge")
{uses "Elliptic_curve_n_torsion_2d"}[]
If `E` is an elliptic curve over a field `k`, and `n` is a positive integer
which is nonzero in `k`, then the determinant of the 2-dimensional
representation of $`\Gal(k^{\sep}/k)` on $`E(k^{\sep})[n]` is the mod `n`
cyclotomic character.
:::

```tex "Elliptic_curve_det_n_torsion" (slot := statement)
\begin{theorem}\label{Elliptic_curve_det_n_torsion}\uses{Elliptic_curve_n_torsion_2d} If $E$ is an elliptic curve over a field $k$, and $n$ is a positive integer which is nonzero in $k$, then the determinant of the 2-dimensional representation of $\Gal(k^{\sep}/k)$ on $E(k^{\sep})[n]$ is the mod $n$ cyclotomic character.
\end{theorem}
```

:::proof "Elliptic_curve_det_n_torsion"
This presumably should be done via the Weil pairing. I have not yet put any
thought into a feasible way to formalise this.
:::

```tex "Elliptic_curve_det_n_torsion" (slot := proof)
\begin{proof}
  This presumably should be done via the Weil pairing. I have not yet put any thought into a feasible way to formalise this.
\end{proof}
```

# Good Reduction

We give a brief overview of the theory of good and multiplicative reduction of
elliptic curves. For more details one can consult the standard sources
such as {Informal.citep silvermanArithmeticEllipticCurves}[]. We stick with the low-level approach, thinking of
elliptic curves as plane cubics; whilst we cannot do this forever, it will
suffice for these initial results.

```tex
We give a brief overview of the theory of good and multiplicative reduction of elliptic curves.
For more details one can consult the standard sources such as~\cite{silverman1}. We stick with the low-level approach, thinking of elliptic curves as plane cubics; whilst we cannot do this forever, it will suffice for these initial results.
```

:::definition "EllipticCurve.GoodReduction" (parent := "elliptic_frey_bridge")
Let `E` be an elliptic curve over the field of fractions `K` of a valuation ring
`R` with maximal ideal $`\m`. We say `E` has good reduction over `R` if `E` has a
model with coefficients in `R` and the reduction mod $`\m` is still non-singular.
If `E` is an elliptic curve over a number field `N` and `P` is a maximal ideal
of its integer ring $`\calO_N`, then one says that `E` has good reduction at `P`
if `E` has good reduction over the $`\calO_{N,P}`, the localisation of $`\calO_N`
at `P`.
:::

```tex "EllipticCurve.GoodReduction" (slot := statement)
\begin{definition}\label{EllipticCurve.GoodReduction} Let $E$ be an elliptic curve over the field of fractions $K$ of a valuation ring $R$ with maximal ideal $\m$. We say $E$ has \emph{good reduction over $R$} if $E$ has a model with
coefficients in $R$ and the reduction mod $\m$ is still non-singular. If $E$ is an elliptic curve
over a number field $N$ and $P$ is a maximal ideal of its integer ring $\calO_N$, then one says that $E$ has \emph{good reduction at $P$} if $E$ has good reduction over the $\calO_{N,P}$, the localisation of $\calO_N$ at $P$.
\end{definition}
```

From this point on, our Frey curves and Frey packages will use notation
$`(a,b,c,\ell)`, with $`\ell\geq 5` a prime number, rather than `p`. This frees up
`p` for use as another prime.

```tex
\begin{remark} From this point on, our Frey curves and Frey packages will use notation $(a,b,c,\ell)$, with $\ell\geq 5$ a prime number, rather than $p$. This frees up $p$ for use as another prime.
\end{remark}
```

:::lemma_ "Frey_curve_good_reduction" (parent := "elliptic_frey_bridge")
{uses "FreyCurve"}[]
{uses "EllipticCurve.GoodReduction"}[]
If `E` is the Frey curve $`Y^2=X(X-a^\ell)(X+b^\ell)` associated to a
Frey package $`(a,b,c,\ell)`, and if `p` is a prime
not dividing `abc` (and in particular if $`p>2`), then `E` has good reduction
at `p`.
:::

```tex "Frey_curve_good_reduction" (slot := statement)
\begin{lemma}\label{Frey_curve_good_reduction}\uses{FreyCurve, EllipticCurve.GoodReduction} If $E$ is the Frey curve $Y^2=X(X-a^\ell)(X+b^\ell)$ associated to a
  Frey package $(a,b,c,\ell)$, and if $p$ is a prime
  not dividing $abc$ (and in particular if $p>2$), then $E$ has good reduction at~$p$.
\end{lemma}
```

:::proof "Frey_curve_good_reduction"
The reduction mod `p` of the equation defining the Frey curve is still a smooth
plane cubic, because the three roots `0`, $`a^\ell` and $`-b^\ell` are distinct
modulo `p` (note that the difference between $`a^\ell` and $`-b^\ell` is
$`c^\ell`).
:::

```tex "Frey_curve_good_reduction" (slot := proof)
\begin{proof} The reduction mod $p$ of the equation defining the Frey curve is still a smooth
  plane cubic, because the three roots $0$, $a^\ell$ and $-b^\ell$ are distinct modulo $p$
  (note that the difference between $a^\ell$ and $-b^\ell$ is $c^\ell$).
\end{proof}
```

If `E` is an elliptic curve over a number field `N` and if $`\rho` is the representation
of $`\mathrm{Gal}(\overline{N}/N)` on the `n`-torsion of `E` then $`\rho` is continuous and its image is finite,
so by the fundamental theorem of (infinite) Galois theory the representation factors through an
injection $`\mathrm{Gal}(L/N)\to\mathrm{GL}_2(\Z/n\Z)` where $`L/N` is a finite Galois extension of
number fields. One says that $`\rho` is unramified at a maximal ideal `P` of $`\calO_N`
if the extension $`L/N` is unramified at `P` (or in other words, if the factorization
of $`P\calO_L` into prime ideals is squarefree).

```tex
If $E$ is an elliptic curve over a number field $N$ and if $\rho$ is the representation
of $\Gal(\overline{N}/N)$ on the $n$-torsion of $E$ then $\rho$ is continuous and its image is finite,
so by the fundamental theorem of (infinite) Galois theory the representation factors through an
injection $\Gal(L/N)\to\GL_2(\Z/n\Z)$ where $L/N$ is a finite Galois extension of
number fields. One says that $\rho$ is \emph{unramified} at a maximal ideal $P$ of $\calO_N$
if the extension $L/N$ is unramified at $P$ (or in other words, if the factorization
of $P\calO_L$ into prime ideals is squarefree).
```

At some point we will need a theory of finite flat group schemes over an affine
base. Here is a working definition.

```tex
At some point we will need a theory of finite flat group schemes over an affine base. Here
is a working definition.
```

:::definition "finite_flat_group_scheme" (parent := "elliptic_frey_bridge")
For the purposes of the FLT strategy, a finite flat group scheme over a
commutative ring `R` is the spectrum of a commutative Hopf algebra $`H/R` that
is finite and flat as an `R`-module.
:::

```tex "finite_flat_group_scheme" (slot := statement)
\begin{definition}\label{finite_flat_group_scheme} If $R$ is a commutative ring, then
  a \emph{finite flat group scheme} over $R$ is the spectrum of a commutative Hopf algebra $H/R$
  which is finite and flat as an $R$-module.
\end{definition}
```

Probably this is not the correct definition in the non-Noetherian case; one
should instead ask for locally free, which is equivalent in the Noetherian case
and enables you to reduce to the Noetherian case in general.

```tex
(Probably this is not the correct definition in the non-Noetherian case; one should instead ask for locally free, which is equivalent in the Noetherian case and enables you to reduce to the Noetherian case in general)
```

Some facts we will need are:

```tex
Some facts we will need are:
```

:::theorem "good_reduction_implies_unramified" (parent := "elliptic_frey_bridge")
If `E` is an elliptic curve over a number field `N` and `E` has good reduction
at a maximal ideal `P` of $`\mathcal O_N`, and if furthermore $`n \notin P`,
then the Galois representation on the `n`-torsion of `E` is unramified.
:::

```tex "good_reduction_implies_unramified" (slot := statement)
\begin{theorem}\label{good_reduction_implies_unramified}\notready If $E$ is an elliptic curve over a number
  field $N$ and $E$ has good reduction at a maximal ideal $P$ of $\calO_N$, and if furthermore
  $n\not\in P$, then the Galois representation on the $n$-torsion of $E$ is unramified.
\end{theorem}
```

:::proof "good_reduction_implies_unramified"
One approach would be by showing that the `n`-torsion in the integral model of
`E` over $`\mathcal O_{N,P}` is an etale finite flat group scheme. There might
be simpler approaches however. It's worth looking to see what Silverman does.
:::

```tex "good_reduction_implies_unramified" (slot := proof)
\begin{proof}
  One approach would be by showing that the $n$-torsion in the integral model of $E$ over $\calO_{N,P}$
  is an etale finite flat group scheme. There might be simpler approaches however. It's worth looking to see what Silverman does.
\end{proof}
```

:::theorem "good_reduction_implies_flat" (parent := "elliptic_frey_bridge")
If `E` is an elliptic curve over a number field `N` and `E` has good reduction
at a maximal ideal `P` of $`\mathcal O_N` containing the prime number `p`,
then the Galois representation on the `p`-torsion of `E` comes from a finite
flat group scheme over $`\mathcal O_{N,P}`. This packages
{uses "finite_flat_group_scheme"}[].
:::

```tex "good_reduction_implies_flat" (slot := statement)
\begin{theorem}\label{good_reduction_implies_flat}\uses{finite_flat_group_scheme}\notready If $E$ is an elliptic curve over a number field
  $N$ and $E$ has good reduction at a maximal ideal $P$ of $\calO_N$ containing the prime number $p$,
  then the Galois representation on the $p$-torsion of $E$ comes from a finite flat group scheme
  over the localisation $\calO_{N,P}$.
\end{theorem}
```

:::proof "good_reduction_implies_flat"
Indeed, the kernel of the `p`-torsion on a good integral model is finite and
flat. Checking this claim formally will probably involve a fair amount of work.
:::

```tex "good_reduction_implies_flat" (slot := proof)
\begin{proof}
  Indeed, the kernel of the $p$-torsion on a good integral model is finite and flat.
  Checking this claim formally will probably involve a fair amount of work.
\end{proof}
```

# Multiplicative Reduction

:::definition "EllipticCurve.MultiplicativeReduction" (parent := "elliptic_frey_bridge")
Let $`E` be an elliptic curve over the field of fractions $`K` of a valuation
ring $`R` with maximal ideal $`\m`. We say $`E` has multiplicative
reduction over $`R` if $`E` has a model with coefficients in $`R` and which
reduces mod $`R/\m` to a plane cubic with one singularity, which is an
ordinary double point. We say that the reduction is split if the two tangent
lines at the ordinary double point are both defined over $`R/\m`, and
non-split otherwise.
:::

```tex "EllipticCurve.MultiplicativeReduction" (slot := statement)
\begin{definition}\label{EllipticCurve.MultiplicativeReduction} Let $E$ be an elliptic curve over the field of fractions $K$ of a valuation ring $R$ with maximal ideal $\m$. We say $E$ has \emph{multiplicative reduction over $R$} if $E$ has a model with coefficients in $R$ and which reduces mod $R/\m$ to a plane cubic with one singularity, which is an ordinary double point.
  We say that the reduction is \emph{split} if the two tangent lines at the ordinary double point
  are both defined over $R/\m$, and \emph{non-split} otherwise.
\end{definition}
```

If `E` is an elliptic curve over a number field `N` and `P` is a maximal ideal
of its integer ring $`\mathcal O_N`, then one says that `E` has multiplicative
reduction at `P` if `E` has multiplicative reduction over the localization
$`\mathcal O_{N,P}`.

```tex
  If $E$ is an elliptic curve
  over a number field $N$ and $P$ is a maximal ideal of its integer ring $\calO_N$, then one says that $E$ has \emph{multiplicative reduction at $P$} if $E$ has multiplicative reduction over the $\calO_{N,P}$, the localisation of $\calO_N$ at $P$.
```

:::lemma_ "Frey_curve_mult_reduction" (parent := "elliptic_frey_bridge")
{uses "EllipticCurve.MultiplicativeReduction"}[]
If $`E` is the Frey curve $`Y^2=X(X-a^\ell)(X+b^\ell)` associated to a Frey
package $`(a,b,c,\ell)`, and if $`p` is an odd prime which divides $`abc`,
then $`E` has multiplicative reduction at $`p`.
:::

```tex "Frey_curve_mult_reduction" (slot := statement)
\begin{lemma}\label{Frey_curve_mult_reduction}\uses{EllipticCurve.MultiplicativeReduction} If $E$ is the Frey curve $Y^2=X(X-a^\ell)(X+b^\ell)$ associated to a Frey
  package $(a,b,c,\ell)$, and if $p$ is an odd prime
  which divides $abc$, then $E$ has multiplicative reduction at~$p$.
\end{lemma}
```

:::proof "Frey_curve_mult_reduction"
The hypothesis $`p \mid abc` implies that precisely two of the three roots
$`0`, $`a^\ell` and $`-b^\ell` of the cubic are equal mod $`p`. Call
$`x \in \Z/p\Z` this common value. Then the reduction mod $`p` of the curve
is smooth away from the point $`(x,0)`, and has an ordinary double point at
$`(x,0)`. Hence the Frey curve has multiplicative reduction at $`p`.
:::

```tex "Frey_curve_mult_reduction" (slot := proof)
\begin{proof} The hypothesis $p\mid abc$ implies that precisely two of the three roots $0$, $a^\ell$ and $-b^\ell$
  of the cubic are equal mod~$p$. Call $x\in\Z/p\Z$ this common value. Then the reduction mod $p$ of
  the curve is smooth away from the point $(x,0)$,
  and has an ordinary double point at $(x,0)$. Hence the Frey curve has
  multiplicative reduction at $p$.
\end{proof}
```

If the third root reduces mod `p` to $`y \ne x`, then the reduction is split
multiplicative iff $`x-y` is a square mod `p`. We shall not need this fact.

```tex
\begin{remark} If the third root reduces mod $p$ to $y\not=x$, then the reduction
  is split multiplicative iff $x-y$ is a square mod $p$. We shall not need this fact.
\end{remark}
```

:::lemma_ "Frey_curve_mult_reduction_at_two" (parent := "elliptic_frey_bridge")
{uses "EllipticCurve.MultiplicativeReduction"}[]
If $`E` is the Frey curve $`Y^2=X(X-a^\ell)(X+b^\ell)` associated to a Frey
package $`(a,b,c,\ell)` then $`E` has multiplicative reduction at `2`.
:::

```tex "Frey_curve_mult_reduction_at_two" (slot := statement)
\begin{lemma}\label{Frey_curve_mult_reduction_at_two}\uses{EllipticCurve.MultiplicativeReduction}  If $E$ is the Frey curve $Y^2=X(X-a^\ell)(X+b^\ell)$ associated to a Frey package
  $(a,b,c,\ell)$ then $E$ has multiplicative reduction at 2.
\end{lemma}
```

:::proof "Frey_curve_mult_reduction_at_two"
Indeed, the change of variables $`X=4X'` and $`Y=8Y'+4X'` transforms the
equation to
$`64Y'^2+64X'Y'=64X'^3+16X'^2(b^\ell-a^\ell-1)-4X'a^\ell b^\ell` and, because
$`\ell\geq5`, $`b` is even and $`a=3` mod `4`, we see that the `64`s cancel,
giving an equation over $`\Z` which reduces mod `2` to
$`Y'^2+X'Y'=X'^3+cX'^2` for some $`c\in\{0,1\}`. This cubic is smooth away
from an ordinary double point at $`(0,0)`. Hence the Frey curve has
multiplicative reduction at `2`.
:::

```tex "Frey_curve_mult_reduction_at_two" (slot := proof)
\begin{proof} Indeed, the change of variables $X=4X'$
  and $Y=8Y'+4X'$ transforms the equation to
  $64Y'^2+64X'Y'=64X'^3+16X'^2(b^\ell-a^\ell-1)-4X'a^\ell b^\ell$ and, because $\ell\geq5$,
  $b$ is even and $a=3$ mod 4, we see that the 64s cancel, giving an equation over $\Z$ which reduces mod 2 to
  $Y'^2+X'Y'=X'^3+cX'^2$ for some $c\in\{0,1\}$. This cubic is smooth away from an ordinary
  double point at $(0,0)$. Hence the Frey curve has multiplicative reduction at~2.
\end{proof}
```

Note that $`E` has split multiplicative reduction iff $`c=0`, which happens
iff $`a^\ell=7` mod `8`. We shall not need this fact.

```tex
\begin{remark} Note that $E$ has split multiplicative reduction iff $c=0$, which happens iff $a^\ell=7$ mod $8$. We shall not need this fact.
\end{remark}
```

In particular, the Frey curve attached to a Frey package is semistable: it has
good or multiplicative reduction at every prime.

```tex
In particular, the Frey curve associated to a Frey package is \emph{semistable} -- it has good or
 multiplicative reduction at all primes.
```

The main thing we need about elliptic curves with multiplicative reduction over
nonarchimedean local fields is the uniformisation theorem, originally due to
Tate.

```tex
The main thing we need about elliptic curves with multiplicative reduction over nonarchimedean
local fields is the \emph{uniformisation theorem}, originally due to Tate.
```

:::theorem "Tate_curve_uniformisation" (parent := "elliptic_frey_bridge")
{uses "EllipticCurve.MultiplicativeReduction"}[]
If an elliptic curve over a field complete with respect to a nontrivial
nonarchimedean real-valued norm has split multiplicative reduction, then there
is a Galois-equivariant injection
$`(K^{\sep})^\times / q^{\mathbf Z} \to E(K^{\sep})`, where $`q \in K^\times`
satisfies $`|q| = |j(E)|^{-1}`.
:::

```tex "Tate_curve_uniformisation" (slot := statement)
\begin{theorem}\label{Tate_curve_uniformisation}\uses{EllipticCurve.MultiplicativeReduction}\notready If $E$ is an elliptic curve over a field
  complete with respect to a nontrivial nonarchimedean (real-valued) norm $K$ and if $E$ has split
  multiplicative reduction, then there is a Galois-equivariant injection
  $(K^{\sep})^\times/q^{\mathbb{Z}}\to E(K^{\sep})$, where $q\in K^\times$ satisfies
  $|q|=|j(E)|^{-1}$.
\end{theorem}
```

:::proof "Tate_curve_uniformisation"
See {Informal.citep silvermanArithmeticEllipticCurves}[], Theorems `V.3.1`,
Remark `V.3.1.2` (we don't need surjectivity), and Theorem `V.5.3`. This is a
lot of work and is a good target for breaking down into many smaller lemmas.
:::

```tex "Tate_curve_uniformisation" (slot := proof)
\begin{proof}
  See~\cite{silverman2}, Theorems V.3.1, Remark V.3.1.2 (we don't need surjectivity),
  and Theorem V.5.3. This is a lot of work and is a good target for breaking down into many smaller lemmas.
\end{proof}
```

:::corollary "multiplicative_reduction_torsion" (parent := "elliptic_frey_bridge")
If an elliptic curve over a field complete with respect to a nontrivial
nonarchimedean real-valued norm and with perfect residue field has
multiplicative reduction, then there is an unramified character $`\chi` of the
local Galois group with $`\chi^2 = 1` such that, for all positive integers `n`
with $`n \not= 0` in the field, the `n`-torsion is an extension of $`\chi` by
$`\epsilon \chi`, where $`\epsilon` is the cyclotomic character. Furthermore, the
element of $`K^\times/(K^\times)^\ell` corresponding to this extension is given
by the `q`-invariant of the curve.
:::

```tex "multiplicative_reduction_torsion" (slot := statement)
\begin{corollary}\label{multiplicative_reduction_torsion} If $E$ is an elliptic curve
  over a field $K$ complete with respect to a nontrivial nonarchimedean (real-valued) norm
  and with perfect residue field, and if $E$ has multiplicative reduction, then there's
  an unramified character $\chi$ of $\Gal(K^{\sep}/K)$ whose square is 1, such that for
  all positive integers $n$ with $n\not=0$ in $K$, the
  $n$-torsion $E(K^{\sep})[n]$ is an extension of $\chi$ by $\epsilon\chi$, where $\epsilon$ is the
  cyclotomic character. Furthermore, the element of $K^\times/(K^\times)^\ell$ corresponding
  to this extension is given by the $q$-invariant of the curve.
\end{corollary}
```

:::proof "multiplicative_reduction_torsion"
After a quadratic twist we may assume that the curve has split multiplicative
reduction. The result then follows from
{uses "Tate_curve_uniformisation"}[] and an explicit computation. Note that
even if we do not prove surjectivity of Tate's uniformization, we still know
that it's surjective on the `n`-torsion, because we know that there are $`n^2`
points in the `n`-torsion of the curve over the separable closure, and they are
all accounted for by the `n`-torsion in $`(K^{\sep})^\times/q^{\mathbf Z}`.
:::

```tex "multiplicative_reduction_torsion" (slot := proof)
\begin{proof}\uses{Tate_curve_uniformisation} After a quadratic twist we may assume that the curve has split multiplicative
  reduction. The result then follows from the uniformisation theorem and an explicit computation. Note that
  even if we do not prove surjectivity of Tate's uniformization, we still know
  that it's surjective on the `n`-torsion, because we know that there are `n^2`
  points in the `n`-torsion of the curve over the separable closure, and they are
  all accounted for by the `n`-torsion in `(K^{\sep})^\times/q^{\mathbf Z}`.
\end{proof}
```

We have now proved the first main result of this chapter.

```tex
We have now proved the first main result of this chapter.
```

```tex
\begin{definition}\label{hardly_ramified}\notready Let $\ell\geq5$ be a prime and let $V$ be a
  2-dimensional vector space over $\Z/\ell\Z$. A representation
  $\rho: \GQ\to \GL(V)$ is said to be \emph{hardly ramified} if it satisfies the following four axioms:
  \begin{enumerate}
  \item $\det(\rho)$ is the mod $\ell$ cyclotomic character;
  \item $\rho$ is unramified outside 2$\ell$;
  \item The semisimplification of the restriction of $\rho$ to $\Gal(\Qbar_2/\Q_2)$ is unramified;
  \item The restriction of $\rho$ to $\GQl$ comes from a finite flat group scheme.
  \end{enumerate}
\end{definition}
```

We are interested in hardly ramified representations for several reasons. One
is that by using some deep theorems, we will be able to prove that all hardly
ramified representations are potentially automorphic, which will give us our
first foothold into the world of modular forms. We shall come back to these
ideas later.

```tex
We are interested in hardly ramified representations for several reasons. One is that by using some
deep theorems, we will be able to prove that all hardly ramified representations are
\emph{potentially automorphic}, which will give us our first foothold into the world of modular
forms. We shall come back to these ideas later.
```

# The ℓ-Torsion In The Frey Curve Is Hardly Ramified.

Let $`(a,b,c,\ell)` be a Frey package, with associated Frey curve `E` and mod
$`\ell` Galois representation $`\rho = E[\ell]`. We now work through a proof that
$`\rho` is hardly ramified.

```tex
\section[The l-torsion in the Frey curve is hardly ramified.]{The $\ell$-torsion in the Frey curve is hardly ramified.}

Let $(a,b,c,\ell)$ be a Frey package, with associated Frey curve $E$ and mod $\ell$ Galois
 representation $\rho=E[\ell]$. We now work through a proof that $\rho$ is hardly ramified.
```

:::theorem "Frey_curve_good" (parent := "elliptic_frey_bridge")
If $`p \ne \ell` is a prime not dividing `abc`, then $`\rho` is unramified at
`p`.
:::

```tex "Frey_curve_good" (slot := statement)
\begin{theorem}\label{Frey_curve_good}\notready If $p\not=\ell$ is a prime not dividing $abc$ then
  $\rho$ is unramified at~$p$.
\end{theorem}
```

:::proof "Frey_curve_good"
{uses "Frey_curve_good_reduction"}[]
{uses "good_reduction_implies_unramified"}[]
Indeed, `E` has good reduction at `p`, and hence $`\rho` is unramified at `p`
by theorem `good_reduction_implies_unramified`.
:::

```tex "Frey_curve_good" (slot := proof)
\begin{proof}\uses{Frey_curve_good_reduction,good_reduction_implies_unramified} Indeed, $E$ has good reduction at $p$, and hence $\rho$ is unramified at $p$
  by~\ref{good_reduction_implies_unramified}.
\end{proof}
```

:::theorem "Frey_curve_j" (parent := "elliptic_frey_bridge") (lean := "FreyCurve.j")
The `j`-invariant of the Frey curve is $`2^8(C^2 - AB)^3/(A^2B^2C^2)`, where
$`A = a^\ell`, $`B = b^\ell`, and $`C = c^\ell`. This is the explicit formula for
{uses "FreyCurve"}[].
:::

```tex "Frey_curve_j" (slot := statement)
\begin{theorem}\label{Frey_curve_j}\lean{FreyCurve.j}\leanok\uses{FreyCurve} If $(a,b,c,\ell)$ is a Frey package then the $j$-invariant of the corresponding Frey curve is $2^8(C^2-AB)^3/A^2B^2C^2$, where $A=a^\ell$, $B=b^\ell$ and $C=c^\ell$.
\end{theorem}
```

:::proof "Frey_curve_j"
Apply the explicit formula (presumably already in mathlib).
:::

```tex "Frey_curve_j" (slot := proof)
\begin{proof}
  \leanok
  Apply the explicit formula (presumably already in mathlib)
\end{proof}
```

:::corollary "FreyCurve.j_valuation_of_bad_prime" (parent := "elliptic_frey_bridge") (lean := "FreyCurve.j_valuation_of_bad_prime")
{uses "Frey_curve_j"}[]
If $`(a,b,c,\ell)` is a Frey package and the `j`-invariant of the corresponding Frey curve is `j`, and if $`2<p∣abc`, then the `p`-adic valuation $`v_p(j)` of `j` is a multiple of $`\ell`.
:::

```tex "FreyCurve.j_valuation_of_bad_prime" (slot := statement)
\begin{corollary}
  \label{FreyCurve.j_valuation_of_bad_prime}
  \lean{FreyCurve.j_valuation_of_bad_prime}
  \uses{Frey_curve_j}\leanok
  If $(a,b,c,\ell)$ is a Frey package and the $j$-invariant of the corresponding Frey curve is $j$, and if $2<p\mid abc$, then the $p$-adic valuation $v_p(j)$ of $j$ is a multiple of $\ell$.
\end{corollary}
```

:::proof "FreyCurve.j_valuation_of_bad_prime"
{uses "Frey_curve_j"}[]
Indeed `p` does not divide $`2^8` as $`p>2`, and (using the notation of the
previous theorem) `p` does not divide $`C^2-AB` either, because it divides
precisely one of `A`, `B` and `C`. Hence $`v_p(j)=-2v_p(a^\ell b^\ell c^\ell)
=-2\ell v_p(abc)` is a multiple of $`\ell`.
:::

```tex "FreyCurve.j_valuation_of_bad_prime" (slot := proof)
\begin{proof}
  \uses{Frey_curve_j}\leanok
  Indeed $p$ does not divide $2^8$ as $p>2$, and (using the notation of the previous theorem) $p$ does not divide $C^2-AB$ either, because it divides precisely one of $A$, $B$ and $C$. Hence $v_p(j)=-2v_p(a^\ell b^\ell c^\ell)=-2\ell v_p(abc)$ is a multiple of $\ell$.
\end{proof}
```

:::corollary "frey_curve_unramified" (parent := "elliptic_frey_bridge")
If $`(a,b,c,\ell)` is a Frey package, then the $`\ell`-torsion in the Frey curve is unramified at all primes $`p\not=2,\ell`.
:::

```tex "frey_curve_unramified" (slot := statement)
\begin{corollary}\label{frey_curve_unramified}\notready If $(a,b,c,\ell)$ is a Frey package, then the $\ell$-torsion in the Frey curve is unramified at all primes $p\not=2,\ell$.
\end{corollary}
```

:::proof "frey_curve_unramified"
{uses "Frey_curve_good"}[]
{uses "Frey_curve_unram"}[]
Follows from theorem {uses "Frey_curve_good"}[] and theorem
{uses "Frey_curve_unram"}[].
:::

```tex "frey_curve_unramified" (slot := proof)
\begin{proof}\uses{Frey_curve_good, Frey_curve_unram} Follows from~\ref{Frey_curve_good} and~\ref{Frey_curve_unram}.
\end{proof}
```

This analysis needs to be slightly modified if $`p=2`, because the `j`-invariant
of the Frey curve may not have `2`-adic valuation a multiple of $`\ell`. We
obtain the following weaker result.

```tex
This analysis needs to be slightly modified if $p=2$, because the $j$-invariant of
the Frey curve may not have 2-adic valuation a multiple of $\ell$. We obtain the
following weaker result.
```

:::corollary "frey_curve_at_2" (parent := "elliptic_frey_bridge")
If $`(a,b,c,\ell)` is a Frey package, then the
semisimplification of the restriction of the $`\ell`-torsion $`\rho` in the associated Frey curve
to $`\mathrm{Gal}(\Qbar_2/\Q_2)` is unramified.
:::

```tex "frey_curve_at_2" (slot := statement)
\begin{corollary}\label{frey_curve_at_2}\notready If $(a,b,c,\ell)$ is a Frey package, then the
  semisimplification of the restriction of the $\ell$-torsion $\rho$ in the associated Frey curve
  to $\Gal(\Qbar_2/\Q_2)$ is unramified.
\end{corollary}
```

:::proof "frey_curve_at_2"
{uses "multiplicative_reduction_torsion"}[]
After a quadratic twist to make the curve have split multiplicative
reduction, the theory of the Tate curve shows us that $`\rho` is an extension
of the trivial character by the cyclotomic character. Hence the
semisimplification of this representation is the direct sum of two
unramified characters and is hence unramified.
:::

```tex "frey_curve_at_2" (slot := proof)
\begin{proof}\uses{multiplicative_reduction_torsion} After a quadratic twist to make the curve have split multiplicative
  reduction, the theory of the Tate curve shows us that $\rho$ is an extension
  of the trivial character by the cyclotomic character. Hence the semisimplification of this representation is the direct sum of two
  unramified characters and is hence unramified.
\end{proof}
```

:::theorem "Frey_curve_mod_ell_rep_at_ell" (parent := "elliptic_frey_bridge")
{uses "finite_flat_group_scheme"}[]
Let $`\rho` be the $`\ell`-torsion in the
Frey curve associated to a Frey package $`(a,b,c,\ell)`. Then the restriction of $`\rho` to $`\GQl` comes from a finite flat group scheme.
:::

```tex "Frey_curve_mod_ell_rep_at_ell" (slot := statement)
\begin{theorem}\label{Frey_curve_mod_ell_rep_at_ell}\uses{finite_flat_group_scheme}\notready Let $\rho$ be the $\ell$-torsion in the
  Frey curve associated to a Frey package $(a,b,c,\ell)$. Then the restriction of $\rho$ to $\GQl$ comes from a finite flat group scheme.
\end{theorem}
```

:::proof "Frey_curve_mod_ell_rep_at_ell"
{uses "good_reduction_implies_flat"}[]
{uses "multiplicative_reduction_torsion"}[]
The Frey curve either has good reduction at $`\ell` (case 1 of FLT) or
multiplicative reduction at $`\ell` (case 2 of FLT). In the first case the
$`\ell`-torsion is finite and flat at $`\ell` by the former theorem.
In the second case the theory of the Tate curve shows that the $`\ell`-torsion
is (up to quadratic twist) an extension of the trivial character by the
cyclotomic character corresponding (via Hilbert 90) to the $`\ell`th power of
an $`\ell`-adic unit. This extension is known to be finite and flat; see for
example Proposition `8.2` of {Informal.citep edixWeightInSerreConjectures}[].
Note that the proof there uses fppf cohomology, although one can write down a
much more elementary proof using arguments in
{Informal.citep katzMazurArithmeticModuli}[].
:::

```tex "Frey_curve_mod_ell_rep_at_ell" (slot := proof)
\begin{proof}\uses{good_reduction_implies_flat, multiplicative_reduction_torsion} The Frey curve either has good reduction at $\ell$ (case 1 of FLT) or multiplicative
  reduction at $\ell$ (case 2 of FLT). In the first case the $\ell$-torsion is finite and flat
  at $\ell$ by theorem~\ref{good_reduction_implies_flat}. In the second case the theory of the Tate
   curve shows that the $\ell$-torsion is (up to quadratic twist) an extension of
    the trivial character by the cyclotomic character corresponding (via Hilbert 90)
    to the $\ell$th power of an $\ell$-adic unit. This extension is known to be finite and flat;
  see for example Proposition~8.2 of~\cite{edix}. Note that the proof in~\cite{edix} uses
  fppf cohomology, although one can write down a much more elementary proof of this using
  arguments in~\cite{katz-mazur}.
\end{proof}
```

# Hardly Ramified Representations

We make the following definition; this is not in the literature but it is a
useful concept for us.

```tex
We make the following definition; this is not in the literature but it is a useful concept for us.
```

:::theorem "frey_curve_hardly_ramified" (parent := "elliptic_frey_bridge")
{uses "hardly_ramified"}[]
The $`\ell`-torsion Galois representation of the Frey curve coming from a Frey
package is hardly ramified.
:::

```tex "frey_curve_hardly_ramified" (slot := statement)
\begin{theorem}\label{frey_curve_hardly_ramified}\uses{hardly_ramified}\notready Let $\rho$ be the Galois representation on the
  $\ell$-torsion of the Frey curve coming from a Frey package $(a,b,c,\ell)$. Then $\rho$ is hardly
  ramified.
\end{theorem}
```

:::proof "frey_curve_hardly_ramified"
{uses "Elliptic_curve_det_n_torsion"}[]
{uses "frey_curve_unramified"}[]
{uses "frey_curve_at_2"}[]
{uses "Frey_curve_mod_ell_rep_at_ell"}[]
This follows from the results above. The fact that $`\ell\geq 5` follows from
the definition of a Frey package. The first condition is the determinant
statement, and the second is `frey_curve_unramified`. The third condition is
`frey_curve_at_2`, and the fourth is `Frey_curve_mod_ell_rep_at_ell`.
:::

```tex "frey_curve_hardly_ramified" (slot := proof)
\begin{proof}\uses{Elliptic_curve_det_n_torsion, frey_curve_unramified, frey_curve_at_2, Frey_curve_mod_ell_rep_at_ell}
  This follows from the results above. The fact that $\ell\geq 5$ follows from the definition of
  a Frey package. The first condition is theorem~\ref{Elliptic_curve_det_n_torsion},
  and the second is theorem~\ref{frey_curve_unramified}. The third condition is
  theorem~\ref{frey_curve_at_2}, and the fourth is theorem~\ref{Frey_curve_mod_ell_rep_at_ell}.
\end{proof}
```

# The ℓ-Torsion In The Frey Curve Is Irreducible

We finish this chapter by showing that Mazur's theorem implies that the
$`\ell`-torsion in the Frey curve is irreducible. We start by stating Mazur's
theorem.

```tex
We finish this chapter by showing that Mazur's theorem implies that the $\ell$-torsion in the Frey
 curve is irreducible. We start by stating Mazur's theorem.
```

:::theorem "mazur" (parent := "elliptic_frey_bridge")
Let `E` be an elliptic curve over $`\Q`. Then the torsion subgroup of `E` has
size at most `16`.
:::

```tex "mazur" (slot := statement)
\begin{theorem}\label{mazur}\notready Let $E$ be an elliptic curve over $\Q$. Then the torsion subgroup
  of $E$ has size at most 16.
\end{theorem}
```

:::proof "mazur"
This is the main theorem of {Informal.citep mazurTorsion}[]. Formalising this result will
be a highly non-trivial project; note that this theorem is used in all known
proofs of FLT, so there seems to be no way around it.
:::

```tex "mazur" (slot := proof)
\begin{proof}\notready
  This is the main theorem of~\cite{mazur-torsion}. Formalising this result will be a highly
  non-trivial project; note that this theorem is used in all known proofs of FLT, so there
  seems to be no way around it.
\end{proof}
```

Let $`(a,b,c,\ell)` be a Frey package, with associated Frey curve `E` and mod
$`\ell` Galois representation $`\rho = E[\ell]`. We know that $`\rho` is
two-dimensional. Suppose for contradiction that it is reducible, so its
semisimplification is the direct sum of two characters $`\alpha` and $`\beta`.

```tex
Let $(a,b,c,\ell)$ be a Frey package, with associated Frey curve $E$ and mod $\ell$ Galois
 representation $\rho=E[\ell]$. We know that $\rho$ is 2-dimensional; let's suppose for a
 contradiction that that it is
 reducible, so in particular its semisimplification is the direct sum of two characters $\alpha$
 and $\beta$.
```

The next two results are Lemme `6` on page `307` of
{Informal.citep serreGaloisPointsEllipticCurves}[].

```tex
 The next two results are Lemme 6 on p307 of~\cite{serrepropgal}.
```

:::theorem "Frey_characters_are_unramified" (parent := "elliptic_frey_bridge")
With notation as above, the characters $`\alpha` and $`\beta` are unramified
at $`p` for all primes $`p\not=\ell`.
:::

```tex "Frey_characters_are_unramified" (slot := statement)
\begin{theorem}\label{Frey_characters_are_unramified}\notready With notation as above, the characters
  $\alpha$ and $\beta$ are unramified at $p$ for all primes $p\not=\ell$.
\end{theorem}
```

:::proof "Frey_characters_are_unramified"
{uses "frey_curve_unramified"}[]
{uses "frey_curve_at_2"}[]
We have seen in `frey_curve_unramified` that $`\rho` is unramified
at all primes $`p\not=2,\ell`, so the characters $`\alpha` and $`\beta` are
unramified at all such primes. If $`p=2` then the semisimplification of the
restriction of $`\rho` to $`\Gal(\Qbar_2/\Q_2)` is unramified by
`frey_curve_at_2`, so $`\alpha` and $`\beta` are unramified at `2`.
:::

```tex "Frey_characters_are_unramified" (slot := proof)
\begin{proof}\uses{frey_curve_unramified, frey_curve_at_2} We have seen in theorem~\ref{frey_curve_unramified} that $\rho$ is unramified at all
  primes $p\not=2,\ell$, so the
  characters $\alpha$ and $\beta$ are unramified at all such primes. If $p=2$ then the
  semisimplification of the restriction of $\rho$ to $\Gal(\Qbar_2/\Q_2)$ is unramified
  by corollary~\ref{frey_curve_at_2}, so $\alpha$ and $\beta$ are unramified at 2.
\end{proof}
```

:::theorem "Frey_characters_at_ell" (parent := "elliptic_frey_bridge")
One of $`\alpha` and $`\beta` is unramified at $`\ell`.
:::

```tex "Frey_characters_at_ell" (slot := statement)
\begin{theorem}\label{Frey_characters_at_ell}\notready One of $\alpha$ and $\beta$ is unramified at $\ell$.
\end{theorem}
```

:::proof "Frey_characters_at_ell"
{uses "multiplicative_reduction_torsion"}[]
{uses "Frey_curve_mod_ell_rep_at_ell"}[]
In the multiplicative case this follows immediately from the theory of the
Tate curve. In the good reduction case, the $`\ell`-torsion is finite and flat
at $`\ell` by `Frey_curve_mod_ell_rep_at_ell`, so we now need to
understand what such representations look like. If the reduction is
supersingular, then $`\rho` is necessarily irreducible, contradicting our
assumption. If however the reduction is ordinary, then the theory of the
canonical subgroup shows that the $`\ell`-torsion is an extension of an
unramified character by an unramified twist of the cyclotomic character (see
Proposition `11` on p273 of
{Informal.citep serreGaloisPointsEllipticCurves}[]).
:::

```tex "Frey_characters_at_ell" (slot := proof)
\begin{proof}\uses{multiplicative_reduction_torsion, Frey_curve_mod_ell_rep_at_ell}
In the multiplicative case this follows immediately from the theory of the Tate curve.
In the good reduction case, the $\ell$-torsion is finite and flat at $\ell$ by theorem~\ref{Frey_curve_mod_ell_rep_at_ell}, so we now need to understand what such representations
look like. If the reduction is supersingular, then $\rho$ is necessarily irreducible,
contradicting our assumption. If however the reduction is ordinary, then the theory of the
canonical subgroup shows that the $\ell$-torsion is an extension of an unramified character by
an unramified twist of the cyclotomic character (see Proposition 11 on p273 of~\cite{serrepropgal}).
\end{proof}
```

:::corollary "Frey_characters_trivial" (parent := "elliptic_frey_bridge")
One of $`\alpha` and $`\beta` is trivial.
:::

```tex "Frey_characters_trivial" (slot := statement)
\begin{corollary}\label{Frey_characters_trivial} One of $\alpha$ and $\beta$ is trivial.
\end{corollary}
```

:::proof "Frey_characters_trivial"
{uses "Frey_characters_are_unramified"}[]
{uses "Frey_characters_at_ell"}[]
The previous two theorems show that one of $`\alpha` and $`\beta` is a
character unramified at all primes, and hence cuts out an extension unramified
at all primes, so by Minkowski's theorem this character is trivial.
:::

```tex "Frey_characters_trivial" (slot := proof)
\begin{proof}\uses{Frey_characters_are_unramified, Frey_characters_at_ell}
The previous two theorems show that one of $\alpha$ and $\beta$ is a character unramified at all
primes, and hence cuts out an extension unramified at all primes, so by Minkowski's theorem this character
is trivial.
\end{proof}
```

To summarise, we have shown the following.

```tex
To summarise, we have shown the following.
```

:::theorem "Frey_curve_reducible_structure" (parent := "elliptic_frey_bridge")
If $`\rho` is reducible, then either $`\rho` has a trivial 1-dimensional
submodule or a trivial 1-dimensional quotient (here "trivial" means that the
Galois group $`\GQ` acts trivially).
:::

```tex "Frey_curve_reducible_structure" (slot := statement)
\begin{theorem}\label{Frey_curve_reducible_structure}\notready If $\rho$ is reducible, then either $\rho$
  has a trivial 1-dimensional submodule or a trivial 1-dimensional quotient (here ``trivial'' means
  that the Galois group $\GQ$ acts trivially).
\end{theorem}
```

:::proof "Frey_curve_reducible_structure"
{uses "Frey_characters_trivial"}[]
Follows from the above.
:::

```tex "Frey_curve_reducible_structure" (slot := proof)
\begin{proof}\uses{Frey_characters_trivial} Follows from the above.
\end{proof}
```

We now split into two cases, depending on whether $`\rho` has a trivial
submodule or a trivial quotient.

```tex
We now split into two cases, depending on whether $\rho$ has a trivial submodule or a trivial quotient.
```

:::lemma_ "Frey_curve_trivial_submodule" (parent := "elliptic_frey_bridge")
If the Frey-curve $`\ell`-torsion representation has a trivial one-dimensional
submodule, then the Frey curve has a rational point of order $`\ell`.
:::

```tex "Frey_curve_trivial_submodule" (slot := statement)
\begin{lemma}\label{Frey_curve_trivial_submodule} If $\rho$ has a trivial 1-dimensional submodule then the
  Frey curve has a non-trivial point of order $\ell$.
\end{lemma}
```

:::proof "Frey_curve_trivial_submodule"
Indeed, the trivial 1-dimensional submodule is a Galois-invariant subgroup of
$`E[\ell]`, so it corresponds to a Galois-stable point of order $`\ell`.
:::

```tex "Frey_curve_trivial_submodule" (slot := proof)
\begin{proof} Indeed, the trivial 1-dimensional submodule is a Galois-invariant subgroup of $E[\ell]$, so
  it corresponds to a Galois-stable point of order $\ell$.
\end{proof}
```

:::corollary "Frey_curve_no_trivial_submodule" (parent := "elliptic_frey_bridge")
$`\rho` cannot have a trivial 1-dimensional submodule.
:::

```tex "Frey_curve_no_trivial_submodule" (slot := statement)
\begin{corollary}\label{Frey_curve_no_trivial_submodule} $\rho$ cannot have a trivial 1-dimensional submodule.
\end{corollary}
```

:::proof "Frey_curve_no_trivial_submodule"
{uses "mazur"}[]
{uses "Frey_curve_trivial_submodule"}[]
We have just seen that in this case, the Frey curve has a point of order
$`\ell`. It also has three points of order $`2`, meaning that its torsion
subgroup has order at least $`4\ell \geq 20`, contradicting Mazur's theorem.
:::

```tex "Frey_curve_no_trivial_submodule" (slot := proof)
\begin{proof}\uses{mazur, Frey_curve_trivial_submodule}
  We have just seen that in this case, the Frey curve has a point of order $\ell$.
  It also has three points of order 2, meaning that its torsion subgroup has order at least
  $4\ell\geq 20$, contradicting Mazur's theorem~\ref{mazur}.
\end{proof}
```

It remains to rule out the case where $`\rho` is reducible and has a trivial
quotient. To do this, we need to quotient out $`\rho` by its 1-dimensional
Galois-stable submodule.

```tex
It remains to rule out the case where $\rho$ is reducible and has a trivial quotient. To do this, we need
to quotient out $\rho$ by its 1-dimensional Galois-stable submodule.
```

:::theorem "Elliptic_curve_quotient_by_finite_subgroup" (parent := "elliptic_frey_bridge")
If $`p` is a prime and if $`E` is an elliptic curve over a field $`K` of
characteristic not equal to $`p`, and if $`C \subseteq E(K^{\sep})[p]` is a
Galois-stable subgroup of order $`p`, then there is an elliptic curve
$`E' := E/C` over $`K` and an isogeny of elliptic curves $`E \to E'` over
$`K` inducing a Galois-equivariant surjection
$`E(K^{\sep}) \to E'(K^{\sep})` with kernel precisely $`C`.
:::

```tex "Elliptic_curve_quotient_by_finite_subgroup" (slot := statement)
\begin{theorem}\label{Elliptic_curve_quotient_by_finite_subgroup}\notready If $p$ is a prime and
  if $E$ is an elliptic curve over a field $K$ of characteristic not equal to $p$,
   and if $C\subseteq E(K^{\sep})[p]$ is a Galois-stable
  subgroup of order $p$, then there's an elliptic curve $E':=$``E/C$'' over $K$ and an isogeny of elliptic
  curves $E\to E'$ over $K$ inducing a Galois-equivariant surjection $E(K^{\sep})\to E'(K^{\sep})$
  with kernel precisely $C$.
\end{theorem}
```

:::proof "Elliptic_curve_quotient_by_finite_subgroup"
Brian Conrad suggested the following approach, applicable as well for abelian
schemes $`A \to S` over a base. Let $`G` be a finite locally free
$`S`-subgroup of $`A`, say $`G` with constant rank $`n > 0` by working
locally on the base, so $`G` is contained in $`A[n]`. Then
$`n : A \to A` is the fppf quotient of the source by $`A[n]`, so it expresses
$`A` as an $`A[n]`-torsor over itself. The problem of building $`A/G` as an
abelian scheme is then seen to be the same as that of constructing the quotient
of this $`A[n]`-torsor by the $`G`-action.

In other words, the problem then becomes one having nothing specific to do with
abelian schemes, at the cost of working over a base (such as the original
target $`A`) even when $`S` was the spectrum of a field in the application.
The question is now: for a finite locally free commutative $`S`-group $`H`
and a closed locally free $`S`-subgroup $`G`, build a reasonable quotient
$`H/G`. One approach is to look at the Cartier dual $`H^\vee \to G^\vee`,
show that it is faithfully flat, and then deduce that the Cartier dual of the
kernel of this map does the job. Note that one input for this proof is the
claim that inclusions of Hopf algebras over fields are flat, proved nicely in
Waterhouse's book.
:::

```tex "Elliptic_curve_quotient_by_finite_subgroup" (slot := proof)
\begin{proof}
  Brian Conrad suggested the following approach, applicable as well for abelian schemes $A\to S$
  over a base.  Let $G$ be a finite locally free $S$-subgroup of $A$, say $G$ with constant
  rank $n > 0$ by working locally on the base, so $G$ is contained in $A[n]$.  Then
  $n: A \to A$ is the fppf quotient of the source by $A[n]$, so it expresses $A$ as an
  $A[n]$-torsor over itself.  The problem of building $A/G$ as an abelian scheme is then
  seen to be the “same” as that of constructing the quotient of this $A[n]$-torsor by the G-action.

  In other words, the problem them becomes one having nothing specific to do with abelian schemes,
  at the cost of working over a base (such as the original target $A$) even when $S$ was the
  spectrum of a field in the application. The question is now: for a finite locally free
  commutative $S$-group $H$ and a closed locally free $S$-subgroup $G$, build a reasonable quotient
  $H/G$. One approach is to look at the Cartier dual $H^\vee\to G^\vee$, show that it's faithfully
  flat, and then deduce that the Cartier dual of the kernel of this map does the job. Note that
  one input for this proof is the claim that inclusions of Hopf algebras over fields are flat,
  proved nicely in Waterhouse’s book.
\end{proof}
```

I suspect that the proof above is a no-go right now; there will presumably be a
much easier proof of this result in Silverman though. Note also that this
approach will not give us a plane cubic, but rather a smooth proper group
scheme so we would need Riemann-Roch to turn it into a plane cubic, although it
is unlikely that one will be able to prove Mazur's theorem without developing
all of this machinery and much more.

```tex
I suspect that the proof above is a no-go right now; there will presumably be a much easier proof of this result in Silverman though. Note also that this approach will not
give us a plane cubic, but rather a smooth proper group scheme so we would need Riemann-Roch
to turn it into a plane cubic, although it's unlikely that one will be able to prove Mazur's
theorem without developing all of this machinery and much more.
```

:::corollary "Frey_curve_no_trivial_quotient" (parent := "elliptic_frey_bridge")
$`\rho` cannot have a trivial 1-dimensional quotient.
:::

```tex "Frey_curve_no_trivial_quotient" (slot := statement)
\begin{corollary}\label{Frey_curve_no_trivial_quotient} $\rho$ cannot have a trivial 1-dimensional quotient.
\end{corollary}
```

:::proof "Frey_curve_no_trivial_quotient"
{uses "Elliptic_curve_quotient_by_finite_subgroup"}[]
{uses "mazur"}[]
$`\rho` has a Galois-stable submodule $`C`. The quotient curve $`E/C` now
has a trivial 1-dimensional submodule, and also three points of order $`2`
(the images of the three $`2`-torsion points in $`E`). Hence the torsion
subgroup of $`E/C` has order at least $`4\ell \geq 20`, again contradicting
Mazur's theorem.
:::

```tex "Frey_curve_no_trivial_quotient" (slot := proof)
\begin{proof}\uses{Elliptic_curve_quotient_by_finite_subgroup, mazur} $\rho$ has a Galois-stable submodule $C$. The quotient curve $E/C$ now has
  a trivial 1-dimensional submodule, and also three points of order~2 (the images of the three
  2-torsion points in $E$). Hence the torsion subgroup of $E/C$ has order at least $4\ell\geq 20$,
  again contradicting Mazur's theorem.
\end{proof}
```

:::theorem "Frey_curve_irreducible" (parent := "elliptic_frey_bridge")
The $`\ell`-torsion in the Frey curve associated to a Frey package
$`(a,b,c,\ell)` is irreducible.
:::

```tex "Frey_curve_irreducible" (slot := statement)
\begin{theorem}\label{Frey_curve_irreducible} The $\ell$-torsion in the Frey curve associated to a Frey package $(a,b,c,\ell)$ is irreducible.
\end{theorem}
```

:::proof "Frey_curve_irreducible"
{uses "Frey_curve_reducible_structure"}[]
{uses "Frey_curve_no_trivial_submodule"}[]
{uses "Frey_curve_no_trivial_quotient"}[]
{uses "Elliptic_curve_n_torsion_2d"}[]
Follows from theorem {uses "Frey_curve_reducible_structure"}[], corollary
{uses "Frey_curve_no_trivial_submodule"}[] and corollary
{uses "Frey_curve_no_trivial_quotient"}[].
:::

```tex "Frey_curve_irreducible" (slot := proof)
\begin{proof}\uses{Frey_curve_reducible_structure, Frey_curve_no_trivial_submodule, Frey_curve_no_trivial_quotient,Elliptic_curve_n_torsion_2d} Follows from theorem~\ref{Frey_curve_reducible_structure}, corollary~\ref{Frey_curve_no_trivial_submodule}
  and corollary~\ref{Frey_curve_no_trivial_quotient}.
\end{proof}
```
