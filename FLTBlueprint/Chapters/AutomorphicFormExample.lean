import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude
import FLT.Data.Hurwitz
import FLT.Data.HurwitzRatHat
import FLT.Data.QHat

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "An Example Of An Automorphic Form" =>

:::group "automorphic_example_program"
A worked example of a quaternionic automorphic form.
:::

# Introduction

The key ingredient in Wiles' proof of Fermat's Last Theorem is a modularity
lifting theorem, sometimes called an $`R=T` theorem. For Wiles, the $`R` came
from elliptic curves, the $`T` came from classical modular forms, and the fact
that they're equal is basically the Shimura--Taniyama--Weil conjecture, now
known as the Breuil--Conrad--Diamond--Taylor modularity theorem: any elliptic
curve over the rationals is modular.

```tex
The key ingredient in Wiles' proof of Fermat's Last Theorem is a \emph{modularity lifting theorem},
sometimes called an $R=T$ theorem. For Wiles, the $R$ came from elliptic curves, the $T$ came from
classical modular forms, and the fact that they're equal is basically the Shimura--Taniyama--Weil
conjecture, now known as the Breuil--Conrad--Diamond--Taylor modularity theorem: any elliptic
curve over the rationals is modular.
```

At the heart of the proof we shall formalise is also an $`R=T` theorem,
however the $`T` which we shall use will be associated not to classical modular
forms, but to spaces of more general automorphic forms called quaternionic
modular forms. Those of you who know something about classical modular forms
might well know that the groups $`\SL_2(\R)` and $`\SL_2(\Z)` are intimately
involved; these are the norm `1` units in the matrix rings $`M_2(\R)` and
$`M_2(\Z)`. In the theory of quaternionic modular forms, the analogous groups
are the norm `1` units in rings such as Hamilton's quaternions
$`\R\oplus\R i\oplus\R j\oplus\R k`, and subrings such as
$`\Z\oplus\Z i\oplus\Z j\oplus\Z k`.

```tex
At the heart of the proof we shall formalise is also an $R=T$ theorem, however the $T$ which we
shall use will be associated not to classical modular forms, but to spaces of more general
automorphic forms called quaternionic modular forms. Those of you who know something about
classical modular forms might well know that the groups $\SL_2(\R)$ and $\SL_2(\Z)$ are
intimately involved; these are the norm 1 units in the matrix rings $M_2(\R)$ and $M_2(\Z)$.
In the theory of quaternionic modular forms, the analogous groups are the norm 1 units
in rings such as Hamilton's quaternions $\R\oplus\R i\oplus\R j\oplus\R k$, and subrings
such as $\Z\oplus\Z i\oplus\Z j\oplus\Z k$.
```

One of the main goals of the FLT project at the time of writing this sentence,
is formalising the statement of the modularity lifting theorem which we shall
use. So we are going to need to develop the theory of quaternionic modular
forms, which is rather different to the theory of classical modular forms (for
example, in the cases we need, the definition is completely algebraic; there
are no holomorphic functions in sight, and the analogue of the upper half plane
in the quaternionic theory is a finite set of points).

```tex
One of the main goals of the FLT project at the time of writing this sentence, is formalising
the \emph{statement} of the modularity lifting theorem which we shall use. So we are going
to need to develop the theory of quaternionic modular forms, which is rather different
to the theory of classical modular forms (for example, in the cases we need, the definition
is completely algebraic; there are no holomorphic functions in sight, and the analogue
of the upper half plane in the quaternionic theory is a finite set of points).
```

We could just launch into the general theory over totally real fields, which
will be the generality which we'll need. But when I was a PhD student, I learnt
about these objects by playing with explicit examples. So, whilst not logically
necessary for the proof, I thought it would be fun, and perhaps also
instructional, to compute a concrete example of a space of quaternionic modular
forms. The process of constructing the example might even inform what kind of
machinery we should be developing in general. Let's begin by discussing the
quaternion algebra we shall use.

```tex
We could just launch into the general theory over totally real fields, which will be the generality
which we'll need. But when I was a PhD student, I learnt about
these objects by playing with explicit examples. So, whilst not logically necessary for the proof,
I thought it would be fun, and perhaps also instructional, to compute a concrete example of a space
of quaternionic modular forms. The process of constructing the example might even inform what kind
of machinery we should be developing in general. Let's begin by discussing the quaternion algebra
we shall use.
```

# A quaternion algebra

Let's define $`D` to be the quaternion algebra
$`\Q\oplus\Q i\oplus\Q j\oplus\Q k`. As a vector space, $`D` is `4`-dimensional
over $`\Q` with $`[1,i,j,k]` giving a basis. It has a
(non-commutative) ring structure, with multiplication satisfying the usual
quaternion algebra relations $`i^2=j^2=k^2=ijk=-1`. You can think of $`D` as
an analogue of `2 × 2` matrices with rational coefficients, hence its units
$`D^\times` are an analogue of the group $`\GL_2(\Q)`.

```tex
Let's define $D$ to be the quaternion algebra $\Q\oplus\Q i\oplus\Q j\oplus\Q k$. As a vector
space, $D$ is 4-dimensional over $\Q$ with $[1,i,j,k]$ giving a basis. It has a (non-commutative)ring structure,
with multiplication satisfying the usual quaternion algebra relations $i^2=j^2=k^2=ijk=-1$.
You can think of~$D$ as an analogue of $2\times 2$
matrices with rational coefficients, hence its units $D^\times$ are an analogue of the
group $\GL_2(\Q)$.
```

We will also need an analogue of the group $`\GL_2(\Z)`, which will come from
an integral structure on $`D`. We choose the Hurwitz order, namely the subring
$`\calO:=\Z\oplus\Z i\oplus\Z j\oplus\Z \omega`, where
$`\omega=\frac{-1+(i+j+k)}{2}`, a cube root of unity, as
$`(i+j+k)^2=-3`. The simplest way to understand $`\calO` is that it's
quaternions $`a+bi+cj+dk` where either $`a,b,c,d` are all integers or are all
in $`\frac{1}{2}+\Z`.

```tex
We will also need an analogue of the group $\GL_2(\Z)$, which will come from an integral structure
on~$D$. We choose the Hurwitz order, namely the subring $\calO:=\Z\oplus\Z i\oplus\Z j\oplus\Z \omega$,
where $\omega=\frac{-1+(i+j+k)}{2}$, a cube root of unity, as $(i+j+k)^2=-3$. The simplest way
to understand $\calO$ is that it's quaternions $a+bi+cj+dk$ where either $a,b,c,d$ are all integers
or are all in $\frac{1}{2}+\Z$.
```

Note that $`\calO` is a maximal order and a Euclidean domain, which is why we
prefer it over the more obvious sublattice
$`\Z\oplus\Z i\oplus\Z j\oplus\Z k`.

```tex
Note that $\calO$ is a maximal order and a Euclidean domain, which is why we prefer it over the
more obvious sublattice $\Z\oplus\Z i\oplus\Z j\oplus\Z k.$
```

In this chapter, we are going to compute a complex vector space which could be
called something like the "weight `2` level `2` modular forms for $`D^\times`".
The main result will be that this space is `1`-dimensional.

```tex
In this chapter, we are going to compute a complex vector space which could be called something
like the ``weight 2 level 2 modular forms for $D^\times$''. The main result will be that this
space is 1-dimensional.
```

Note that mathlib has modular forms, but it doesn't have enough complex
analysis to deduce that the space of modular forms of a given weight and level
is finite-dimensional. If all the `sorry`s in this chapter are completed before
mathlib gets the necessary complex analysis, then the first nonzero space of
modular forms to be proved finite-dimensional in Lean will be a space of
quaternionic modular forms.

```tex
Note that mathlib has modular forms, but it doesn't have enough complex analysis to deduce
that the space of modular forms of a given weight and level is finite-dimensional. If all
the `sorry`s in this chapter are completed
before mathlib gets the necessary complex analysis, then the first nonzero space of modular forms
to be proved finite-dimensional in Lean will be a space of quaternionic modular forms.
```

We will use a modern "adelic" definition of our modular forms, so the first
thing we need to do is to talk about profinite completions.

```tex
We will use a modern "adelic" definition of our modular forms, so the first thing we need
to do is to talk about profinite completions.
```

# Zhat

:::definition "ZHat" (parent := "automorphic_example_program") (lean := "ZHat")
The profinite completion $`\Zhat` of $`\Z` is the set of all compatible
collections $`c=(c_N)_N` of elements of $`\Z/N\Z` indexed by
$`\N^+ := \{1,2,3,\ldots\}`.
A collection is said to be compatible if for all positive integers
$`D \mid N`, we have $`c_N` mod $`D` equals $`c_D`.
:::

```tex
\section{\texorpdfstring{$\Zhat$}{Zhat}}

\begin{definition}\label{ZHat}\lean{ZHat}\leanok The profinite completion $\Zhat$ of $\Z$ is the set of
    all compatible collections $c=(c_N)_N$ of elements of $\Z/N\Z$ indexed by $\N^+:=\{1,2,3,\ldots\}$.
    A collection is said to be \emph{compatible} if for all positive integers
    $D\mid N$, we have $c_N$ mod $D$ equals $c_D$.
\end{definition}
```

Classically automorphic forms were defined as functions on symmetric spaces
(like the upper half plane) which transformed well under the action of certain
discrete groups (for example $`\SL_2(\Z)`). However such definitions became
combinatorially problematic when generalised to number fields with nontrivial
class group, because the classical theory needed a number $`p` to define
the Hecke operator $`T_p`, and in the case where $`p` was a non-principal prime
ideal in a number field, there was no appropriate number. One fix is to take
disjoint unions of symmetric spaces indexed by the ideal class group of the
field in question, but it is easier to work adelically, which is morally what
we shall do. However we are able to avoid introducing the adeles explicitly; we
can work instead with the conceptually simpler object $`\Zhat`, the profinite
completion of $`\Z`. So what is $`\Zhat`? We offer a low-level definition of
this object.

```tex
Classically automorphic forms were defined as functions on symmetric spaces (like the upper half
plane) which transformed well under the action of certain discrete groups (for example $\SL_2(\Z)$).
However such definitions became combinatorially problematic when generalised to number fields
with nontrivial class group, because the classical theory needed a \emph{number} $p$ to define
the Hecke operator $T_p$, and in the case where $p$ was a non-principal prime ideal in a number
field, there was no appropriate number. One fix is to take disjoint unions of symmetric spaces
indexed by the ideal class group of the field in question, but it is easier to work adelically,
which is morally what we shall do. However we are able to avoid introducing the adeles
explicitly; we can work instead with the conceptually simpler object $\Zhat$,
the profinite completion of $\Z$. So what is $\Zhat$? We offer a low-level definition of this object.
```

:::lemma_ "ZHat.commRing" (parent := "automorphic_example_program") (lean := "ZHat.commRing")
{uses "ZHat"}[]
$`\Zhat` is a subring of $`\prod_{N\geq1}(Z/N\Z)` and in particular is a ring.
:::

```tex "ZHat.commRing" (slot := statement)
\begin{lemma}
    \label{ZHat.commRing}
    \lean{ZHat.commRing}
    \uses{ZHat}
    \leanok
    $\Zhat$ is a subring of $\prod_{N\geq1}(Z/N\Z)$ and in particular is a ring.
\end{lemma}
```

:::proof "ZHat.commRing"
Follow your nose.
:::

```tex "ZHat.commRing" (slot := proof)
\begin{proof} \leanok Follow your nose.
\end{proof}
```

:::lemma_ "ZHat.nontrivial" (parent := "automorphic_example_program") (lean := "ZHat.nontrivial")
{uses "ZHat.commRing"}[]
$`0\not=1` in $`\Zhat`.
:::

```tex "ZHat.nontrivial" (slot := statement)
\begin{lemma}
    \label{ZHat.nontrivial}
    \lean{ZHat.nontrivial}
    \uses{ZHat.commRing}
    \leanok
    $0\not=1$ in $\Zhat$.
\end{lemma}
```

:::proof "ZHat.nontrivial"
Recall that you can evaluate an element of $`\Zhat` at a positive integer.
Evaluating $`0` at `2` gives $`0`, and evaluating $`1` at `2` gives $`1`, and
these are distinct elements of $`\Z/2\Z`, so $`0\not=1` in $`\Zhat`.
:::

```tex "ZHat.nontrivial" (slot := proof)
\begin{proof}
    \leanok
    Recall that you can evaluate an element of $\Zhat$ at a positive integer.
    Evaluating $0$ at 2 gives $0$, and evaluating $1$ at $2$ gives $1$, and these
    are distinct elements of $\Z/2\Z$, so $0\not=1$ in $\Zhat$.
\end{proof}
```

:::lemma_ "ZHat.charZero" (parent := "automorphic_example_program") (lean := "ZHat.charZero")
The map from the naturals into $`\Zhat` sending $`n` to $`n` is injective.
:::

```tex "ZHat.charZero" (slot := statement)
\begin{lemma}
    \label{ZHat.charZero}
    \lean{ZHat.charZero}
    \leanok
    The map from the naturals into $\Zhat$ sending $n$ to $n$ is injective.
\end{lemma}
```

:::proof "ZHat.charZero"
Generalise the above idea. Feel free to write up a LaTeX proof and PR it.
:::

```tex "ZHat.charZero" (slot := proof)
\begin{proof}
    \leanok
    Generalise the above idea. Feel free to write up a LaTeX proof and PR it.
\end{proof}
```

Note that it follows easily that that the map from the integers to $`\Zhat` is
injective.

```tex
Note that it follows easily that that the map from the integers to $\Zhat$ is injective.
```

But $`\Zhat` is *much* larger than $`\Z`; it has the same cardinality as
the reals in fact. Let's write down an explicit example of an element of
$`\Zhat` which isn't obviously in $`\Z`.

```tex
But $\Zhat$
is \emph{much} larger than $\Z$; it has the same cardinality as the reals in fact.
Let's write down an explicit example of an element of $\Zhat$ which isn't obviously in $\Z$.
```

:::definition "ZHat.e" (parent := "automorphic_example_program") (lean := "ZHat.e")
{uses "ZHat.commRing"}[]
The infinite sum $`0!+1!+2!+3!+4!+5!+\cdots` looks like it makes no sense at
all; it is the sum of an infinite series of larger and larger positive numbers.
However, the sum is finite modulo $`N` for every positive integer $`N`, because
all the terms from $`N!` onwards are multiples of $`N` and thus are zero in
$`\Z/N\Z`.
Thus it makes sense to define $`e_N` to be the value of the finite sum modulo
$`N`.
Explicitly, $`e_N=0!+1!+\cdots+(N-1)!` modulo $`N`.
:::

```tex "ZHat.e" (slot := statement)
\begin{definition}
    \label{ZHat.e}
    \lean{ZHat.e}
    \uses{ZHat.commRing}
    \leanok
    The infinite sum $0!+1!+2!+3!+4!+5!+\cdots$ looks
    like it makes no sense at all; it is the sum of an infinite series of larger and larger
    positive numbers.
    However, the sum is \emph{finite} modulo $N$ for every positive integer $N$, because
    all the terms from $N!$ onwards are multiples of $N$ and thus are zero in $\Z/N\Z$.
    Thus it makes sense to define $e_N$ to be the value of the finite sum modulo $N$.
    Explicitly, $e_N=0!+1!+\cdots+(N-1)!$ modulo $N$.
\end{definition}
```
:::lemma_ "ZHat.e_def" (parent := "automorphic_example_program") (lean := "ZHat.e_def")
{uses "ZHat.e"}[]
The collection $`(e_N)_N` is an element of $`\Zhat`.
:::

```tex "ZHat.e_def" (slot := statement)
\begin{lemma}
    \label{ZHat.e_def}
    \lean{ZHat.e_def}
    \uses{ZHat.e}
    \leanok
    The collection $(e_N)_N$ is an element of $\Zhat$.
\end{lemma}
```

:::proof "ZHat.e_def"
This boils down to checking that $`D!+(D+1)!+\cdots+(N-1)!` is a multiple of
$`D`.
:::

```tex "ZHat.e_def" (slot := proof)
\begin{proof}
    \leanok
    This boils down to checking that $D!+(D+1)!+\cdots+(N-1)!$ is a multiple of~$D$.
\end{proof}
```

:::lemma_ "ZHat.e_not_in_Int" (parent := "automorphic_example_program") (lean := "ZHat.e_not_in_Int")
{uses "ZHat.e"}[]
The element $`(e_N)_N` of $`\Zhat` is not in $`\Z`.
:::

```tex "ZHat.e_not_in_Int" (slot := statement)
\begin{lemma}
    \label{ZHat.e_not_in_Int}
    \lean{ZHat.e_not_in_Int}
    \uses{ZHat.e}
    \leanok
    The element $(e_N)_N$ of $\Zhat$ is not in $\Z$.
\end{lemma}
```

:::proof "ZHat.e_not_in_Int"
First imagine that $`e=n` with $`n\in\Z` and $`0\leq n`. In this case, choose
$`j` such that $`0!+1!+2!+\cdots+j!>n` and check also that the sum is less than
$`(j+1)!`. Now set $`N=(j+1)!` and let's compare $`e_N` and $`n_N=n`. The trick
is that $`e_N` must be $`0!+1!+\cdots+j!` mod $`N`, because all the terms
beyond this are multiples not just of $`(j+1)` but of $`(j+1)!=N`. Thus mod
$`N` we have $`0\leq n<e_N<N` so $`n\not=e`.

Now we deal with $`n=-t<0`; choose $`j` large such that
$`(j+1)!-(0!+1!+\cdots+j!)>t` (possible because the sum is at most $`2\times
j!`) and then set $`N=(j+1)!` and we have $`0 < e_N<N-t<N` so we cannot have
$`e_N=-t` in $`\Z/N\Z`, so again $`e\not=n`.
:::

```tex "ZHat.e_not_in_Int" (slot := proof)
\begin{proof}
    \leanok
    First imagine that $e=n$ with $n\in\Z$ and $0\leq n$. In this case, choose $j$
    such that $0!+1!+2!+\cdots+j!>n$ and check also that the sum is less
    than $(j+1)!$. Now set $N=(j+1)!$ and let's compare $e_N$
    and $n_N=n$. The trick is that $e_N$ must be $0!+1!+\cdots+j!$ mod $N$,
    because all the terms beyond this are multiples not just of $(j+1)$ but
    of $(j+1)!=N$. Thus mod $N$ we have $0\leq n<e_N<N$ so $n\not=e$.

    Now we deal with $n=-t<0$; choose $j$ large such that
    $(j+1)!-(0!+1!+\cdots+j!)>t$ (possible because the sum is at most $2\times j!$)
    and then set $N=(j+1)!$ and we have $0 < e_N<N-t<N$ so we cannot have $e_N=-t$ in $\Z/N\Z$,
    so again $e\not=n$.
\end{proof}
```

:::lemma_ "ZHat.torsionfree" (parent := "automorphic_example_program") (lean := "ZHat.torsionfree")
{uses "ZHat.commRing"}[]
{uses "ZHat.charZero"}[]
If $`0<N` is an integer then multiplication by $`N` is injective on $`\Zhat`.
:::

```tex "ZHat.torsionfree" (slot := statement)
\begin{lemma}
    \label{ZHat.torsionfree}
    \lean{ZHat.torsionfree}
    \uses{ZHat.commRing, ZHat.charZero}
    \leanok
    If $0<N$ is an integer then multiplication by $N$ is injective on $\Zhat$.
\end{lemma}
```

:::proof "ZHat.torsionfree"
Suppose that $`(z_i)_i\in\Zhat` and $`Nz=0`. This means that $`Nz_i=0\in\Z/i\Z`
for all $`i`. Let us fix an arbitrary positive integer~$`j`; we need to prove
that $`z_j=0\in\Z/j\Z`. Consider the element $`z_{Nj}\in\Z/Nj\Z`. By
assumption, we have $`Nz_{Nj}=0`, meaning that if we lift $`z_{Nj}` to an
integer, we have $`Nj\mid Nz_{Nj}`, and thus $`j\mid z_{Nj}`. Thus by the
compatibility assumption on the $`z_i` we have that $`z_j\in\Z/j\Z` is the
mod~$`j` reduction of $`z_{Nj}` and hence is zero.
:::

```tex "ZHat.torsionfree" (slot := proof)
\begin{proof}
    \leanok
    Suppose that $(z_i)_i\in\Zhat$ and $Nz=0$. This means that $Nz_i=0\in\Z/i\Z$ for all $i$.
    Let us fix an arbitrary positive integer~$j$; we need to prove that $z_j=0\in\Z/j\Z$.
    Consider the element $z_{Nj}\in\Z/Nj\Z$. By assumption, we have $Nz_{Nj}=0$, meaning that
    if we lift $z_{Nj}$ to an integer, we have $Nj\mid Nz_{Nj}$, and thus $j\mid z_{Nj}$.
    Thus by the compatibility assumption on the $z_i$ we have that $z_j\in\Z/j\Z$ is the
    mod~$j$ reduction of $z_{Nj}$ and hence is zero.
\end{proof}
```

:::lemma_ "ZHat.multiples" (parent := "automorphic_example_program") (lean := "ZHat.multiples")
{uses "ZHat.commRing"}[]
The multiples of~$`N` in $`\Zhat` are precisely the compatible collections
$`(z_i)_i\in\Zhat` with $`z_N=0`.
:::

```tex "ZHat.multiples" (slot := statement)
\begin{lemma}
    \label{ZHat.multiples}
    \lean{ZHat.multiples}
    \uses{ZHat.commRing}
    \leanok
    The multiples of~$N$ in $\Zhat$ are precisely the compatible collections $(z_i)_i\in\Zhat$
    with $z_N=0$.
\end{lemma}
```

:::proof "ZHat.multiples"
Clearly $`z_N=0` is a necessary condition to be a multiple of~$`N`. To see it
is sufficient, take a general $`(z_i)\in\Zhat` such that $`z_N=0`, and now
define a new element $`(y_j)_j` of $`\Zhat` by $`y_j=z_{Nj}/N`. Just to clarify
what this means: $`z_{Nj}\in\Z/Nj\Z` reduces mod~$`N` to $`z_N=0` by the
compatibility assumption, so it is in the subgroup $`N\Z/Nj\Z` of $`\Z/Nj\Z`,
which is isomorphic (via "division by $`N`") to the group $`\Z/j\Z`; this is
how we construct $`y_j`. It is easily checked that the $`y_j` are compatible
and that $`Ny=z`.
:::

```tex "ZHat.multiples" (slot := proof)
\begin{proof} \leanok
    Clearly $z_N=0$ is a necessary condition to be a multiple of~$N$. To see it is sufficient,
    take a general $(z_i)\in\Zhat$ such that $z_N=0$,
    and now define a new element $(y_j)_j$ of $\Zhat$
    by $y_j=z_{Nj}/N$. Just to clarify what this means: $z_{Nj}\in\Z/Nj\Z$ reduces mod~$N$
    to $z_N=0$ by the compatibility assumption, so it is in the subgroup $N\Z/Nj\Z$ of $\Z/Nj\Z$,
    which is isomorphic (via "division by $N$") to the group $\Z/j\Z$; this is how we construct
    $y_j$. It is easily checked that the $y_j$ are compatible and that $Ny=z$.
\end{proof}
```

# More Advanced Remarks On Zhat Versus Q

This section can be skipped on first reading.

```tex
This section can be skipped on first reading.
```

People who have seen some more advanced algebra might recognise this construction of $`\Zhat`
as being the profinite completion of the additive abelian group $`\Z`, so it is a fundamental
object of mathematics in some sense. But usually, when building mathematics, after $`\Z` we
go to $`\Q`, a multiplicative localisation of $`\Z`, and only complete after that (to get $`\R`).
The process of "completing before localising" gives us a far more arithmetic completion
of $`\Z`.

```tex
People who have seen some more advanced algebra might recognise this construction of $\Zhat$
as being the profinite completion of the additive abelian group $\Z$, so it is a fundamental
object of mathematics in some sense. But usually, when building mathematics, after $\Z$ we
go to $\Q$, a multiplicative localisation of $\Z$, and only complete after that (to get $\R$).
The process of ``completing before localising'' gives us a far more arithmetic completion
of $\Z$.
```

Even though $`\Q` is a divisible abelian group and hence its profinite completion vanishes,
we can still attempt to "locally profinitely complete it" by defining $`\Qhat:=\Q\otimes_{\Z}\Zhat`.
This object is more commonly known as the finite adeles of $`\Q`. More generally if $`F` is
any number field then $`F\otimes_{\Z}\Zhat` is the ring of finite adeles of $`F`. To get to
the full ring of adeles of a number field $`F` you need to take the product with the
ring of infinite adeles of $`F`, which is $`F\otimes_{\Q}\R`: some kind of universal
archimedean completion of $`F`. I don't know a reference which develops the theory of adeles
in this way, so this is what we shall do here.

```tex
Even though $\Q$ is a divisible abelian group and hence its profinite completion vanishes,
we can still attempt to "locally profinitely complete it" by defining $\Qhat:=\Q\otimes_{\Z}\Zhat$.
This object is more commonly known as the \emph{finite adeles} of $\Q$. More generally if $F$ is
any number field then $F\otimes_{\Z}\Zhat$ is the ring of finite adeles of $F$. To get to
the full ring of adeles of a number field~$F$ you need to take the product with the
ring of infinite adeles of $F$, which is $F\otimes_{\Q}\R$: some kind of universal
archimedean completion of $F$. I don't know a reference which develops the theory of adeles
in this way, so this is what we shall do here.
```

# Qhat and tensor products.

The definition of $`\Qhat` is easy if you know about tensor products of
additive abelian groups.

```tex
The definition of $\Qhat$ is easy if you know about tensor products
of additive abelian groups.
```

:::definition "QHat" (parent := "automorphic_example_program") (lean := "QHat")
{uses "ZHat"}[]
The profinite completion $`\Qhat` of $`\Q` is the tensor product
$`\Q\otimes_{\Z}\Zhat`, or $`\Qhat=\Q\otimes\Zhat` for short.
:::

```tex "QHat" (slot := statement)
\begin{definition}
    \label{QHat}
    \lean{QHat}
    \uses{ZHat}
    \leanok
    % blue node
    The profinite completion $\Qhat$ of $\Q$ is the tensor product $\Q\otimes_{\Z}\Zhat$,
    or $\Qhat=\Q\otimes\Zhat$ for short.
\end{definition}
```

# A crash course in tensor products

We've defined $`\Qhat` to be $`\Q\otimes\Zhat`. Whatever does this mean? Well
just to orient yourself, if $`A` and $`B` are additive abelian groups, then
$`A\otimes B` is also an abelian group. And if $`A` and $`B` are commutative
rings (as they are in our case), then $`A\otimes B` is also a commutative ring.

```tex
We've defined $\Qhat$ to be $\Q\otimes\Zhat$. Whatever does this mean? Well just to orient yourself,
if $A$ and $B$ are additive abelian groups, then $A\otimes B$ is also an abelian group.
And if $A$ and $B$ are commutative rings (as they are in our case), then $A\otimes B$ is also
a commutative ring.
```

Even if $`A` and $`B` are completely concrete commutative rings, their tensor
product $`A\otimes B` might be incomprehensible. For example
$`\bbC\otimes\bbC` is completely incomprehensible (note that we are tensoring
over the integers). It is not like the product of groups or the disjoint union
of two sets, where you have a completely explicit unambiguous formula for each
element.

```tex
Even if $A$ and $B$ are completely concrete commutative rings, their tensor product $A\otimes B$
might be incomprehensible. For example $\bbC\otimes\bbC$ is completely incomprehensible (note that we are
tensoring over the integers). It is not like the product of groups or the disjoint union of
two sets, where you have a completely explicit unambiguous formula for each element.
```

In this sense, the theory of tensor products is a bit like the theory of
continuous functions. Humanity started off studying concrete polynomial
equations such as $`x^2+1` and then moved on to concrete analytic functions
such as $`\log(x)` and $`\sin(x)`, but eventually the abstract concept of a
continuous function from the reals to the reals was born. There is no "formula"
for a general continuous function, and continuous functions such as
$`e^{-1/x^2}` or $`|x|` have no power series. Even if there were a formula for
a specific continuous function of interest, it is not clear in general how to
make sense of the claim that it's the "best" formula. In other words, there is
no "canonical form" for a general continuous function, and yet we prove things
about them anyway. We shall adopt the same attitude for elements of
$`A\otimes B`.

```tex
In this sense, the theory of tensor products is a bit like the theory of continuous functions.
Humanity started off studying concrete polynomial equations such as $x^2+1$ and then moved on to
concrete analytic functions such as $\log(x)$ and $\sin(x)$, but eventually the abstract concept
of a continuous function from the reals to the reals was born. There is no ``formula'' for a general
continuous function, and continuous functions such as $e^{-1/x^2}$ or $|x|$ have no power series.
Even if there \emph{were} a formula for a specific continuous function of interest, it is not clear
in general how to make sense of the claim that it's the ``best'' formula. In other words, there is
no "canonical form" for a general continuous function, and yet we prove things about them anyway.
We shall adopt the same attitude for elements of $A\otimes B$.
```

The first thing to know about the tensor product $`A\otimes B` of two abelian
groups $`A` and $`B` is a "constructor" for the type. In other words, how can
we make elements $`A\otimes B`? Well, it turns out that given elements
$`a\in A` and $`b\in B`, we can form the element $`a\otimes_t b\in A\otimes B`.

```tex
The first thing to know about the tensor product $A\otimes B$ of two abelian groups $A$ and $B$
is a ``constructor'' for the type. In other words, how can we make elements $A\otimes B$?
Well, it turns out that given elements $a\in A$ and $b\in B$, we can form the element
$a\otimes_t b\in A\otimes B$.
```

Recall that the sum of all the factorials is an element $`e\in\Zhat`, and
$`22/7` is certainly a rational number, so we can make the element
$`\frac{22}{7}\otimes_te\in\Qhat`.

```tex
\begin{example} Recall that the sum of all the factorials is an element $e\in\Zhat$, and $22/7$ is certainly
a rational number, so we can make the element $\frac{22}{7}\otimes_te\in\Qhat$.
\end{example}
```

This example is in the Lean code.

```tex
This example is in the Lean code.
```

Elements of the form $`a\otimes_t b\in A\otimes B` are known as pure tensors.
In the literature, pure tensors are often written $`a\otimes b`, but we shall
follow `mathlib`'s convention in reserving the $`\otimes` symbol for groups
like $`A \otimes B`, and adorning it with a $`t` when using it on elements of
the groups (or, as Lean calls them, terms, which explains the notation).

```tex
Elements of the form $a\otimes_t b\in A\otimes B$ are known as \emph{pure tensors}. In the
literature, pure tensors
are often written $a\otimes b$, but we shall follow {\tt mathlib}'s convention in reserving
the $\otimes$ symbol for \emph{groups} like $A \otimes B$, and adorning it with a $t$ when
using it on \emph{elements} of the groups (or, as Lean calls them, \emph{terms}, which explains
the notation).
```

Addition of pure tensors obeys the "distributivity" rules
$`a\otimes_t b_1+a\otimes_t b_2=a\otimes_t(b_1+b_2)` and
$`a_1\otimes_t b+a_2\otimes_t b=(a_1+a_2)\otimes_t b`, but there is no rule
which simplifies a general sum $`a\otimes_t b + c\otimes_t d` into a pure
tensor. Indeed, in general it is not the case that every element of a tensor
product $`A\otimes B` is of the form $`a\otimes_t b`; there can be tensors
which aren't pure. However every element of $`A\otimes B` is a finite sum of
pure tensors, with the result that one can attempt to define additive maps from
$`A\otimes B` by saying what they do on pure tensors, and then extending
linearly.

```tex
Addition of pure tensors obeys the ``distributivity'' rules
$a\otimes_t b_1+a\otimes_t b_2=a\otimes_t(b_1+b_2)$ and
$a_1\otimes_t b+a_2\otimes_t b=(a_1+a_2)\otimes_t b$, but there is no rule which simplifies
a general sum $a\otimes_t b + c\otimes_t d$ into a pure tensor. Indeed, in general it is \emph{not}
the case that every element of a tensor product $A\otimes B$ is of the form $a\otimes_t b$; there can be
tensors which aren't pure. However every element of $A\otimes B$ is a finite sum of pure tensors,
with the result that one can attempt to define additive maps from $A\otimes B$ by saying what they
do on pure tensors, and then extending linearly.
```

Another thing worth understanding is that just like how rational numbers can be
written as quotients of integers in several ways (for example
$`1/2=2/4=3/6=\cdots`), a general pure tensor in $`A\otimes B` can be
represented as $`a\otimes_t b` in many ways. For example, in $`\Qhat` we have
$`1\otimes_t 2=2\otimes_t 1`. A general rule for equality of pure tensors is
that if $`a\in A` and $`b\in B` and $`z\in\Z`, then
$`za\otimes_tb=a\otimes_tzb`; integers can move over the tensor symbol. But
equality is hard: in general there may not be an algorithm to decide whether
two pure tensors $`a\otimes_t b` and $`c\otimes_t d` are equal in
$`A\otimes B`.

```tex
Another thing worth understanding is that just like how rational numbers can be written as
quotients of integers in several ways (for example $1/2=2/4=3/6=\cdots$), a general pure tensor
in $A\otimes B$ can be represented as $a\otimes_t b$ in many ways. For example, in $\Qhat$
we have $1\otimes_t 2=2\otimes_t 1$. A general rule for equality of pure tensors is that if
$a\in A$ and $b\in B$ and $z\in\Z$, then $za\otimes_tb=a\otimes_tzb$; integers can move over the
tensor symbol. But equality is hard: in general there may not be an algorithm to decide
whether two pure tensors $a\otimes_t b$ and $c\otimes_t d$ are equal in $A\otimes B$.
```

A summary of the situation: if $`A` and $`B` are abelian groups, then every
element of $`A\otimes B` can be written in the form
$`\sum_{i=1}^Na_i\otimes_tb_i`. It's just that this representation is highly
nonunique, and furthermore given explicit elements $`a_1,a_2\in A` and
$`b_1,b_2\in B` it might be a hard problem to figure out if
$`a_1\otimes_t b_1=a_2\otimes_t b_2`.

```tex
\begin{remark} A summary of the situation: if $A$ and $B$ are abelian groups, then every element
    of $A\otimes B$ can be written in the form $\sum_{i=1}^Na_i\otimes_tb_i$. It's just that this
    representation is highly nonunique, and furthermore given explicit elements $a_1,a_2\in A$
    and $b_1,b_2\in B$ it might be a hard problem to figure out if
    $a_1\otimes_t b_1=a_2\otimes_t b_2$.
```

For example, it turns out that $`(\Z/2\Z)\otimes(\Z/3\Z)=0` and so in this
tensor product all the $`a\otimes_t b` are equal to each other and to
$`0\otimes 0`.

```tex
    For example, it turns out that $(\Z/2\Z)\otimes(\Z/3\Z)=0$
    and so in this tensor product all the $a\otimes_t b$ are equal to each other and to $0\otimes 0$.
\end{remark}
```

Having said all of that, one nice property of $`\Qhat` is that every tensor is
pure; let's prove this now.

```tex
Having said all of that, one nice property of $\Qhat$ is that every tensor \emph{is} pure;
let's prove this now.
```

:::lemma_ "QHat.canonicalForm" (parent := "automorphic_example_program") (lean := "QHat.canonicalForm")
{uses "QHat"}[]
{uses "ZHat.commRing"}[]
Every element of $`\Qhat:=\Q\otimes\Zhat` can be written as $`q\otimes_t z`
with $`q\in\Q` and $`z\in\Zhat`. Furthermore one can even assume that
$`q=\frac{1}{N}` for some positive integer $`N`.
:::

```tex "QHat.canonicalForm" (slot := statement)
\begin{lemma}
    \label{QHat.canonicalForm}
    \lean{QHat.canonicalForm}
    \uses{QHat,ZHat.commRing}
    \leanok
    Every element of $\Qhat:=\Q\otimes\Zhat$ can be written as $q\otimes_t z$ with $q\in\Q$ and $z\in\Zhat$.
    Furthermore one can even assume that $q=\frac{1}{N}$ for some positive integer $N$.
\end{lemma}
```

:::proof "QHat.canonicalForm"
A proof I would write on the board would look like the following. Take a
general element of $`\Qhat`; we know it can be expressed as a finite sum
$`\sum_i q_i\otimes_t z_i` with $`q_i\in\Q` and $`z_i\in\Zhat`. Now choose a
large positive integer $`N`, the lowest common multiple of all the denominators
showing up in the $`q_i`, and then rewrite
$`\sum_i q_i\otimes_t z_i` as $`\sum_i \frac{n_i}{N}\otimes z_i` with
$`n_i\in\Z`. Now using the fundamental fact that
$`na\otimes_t b=a\otimes_t nb` for $`n\in\Z`, we can rewrite the sum as
$`\sum_i \frac{1}{N}\otimes_t n_i z_i` which is equal to the pure tensor
$`\frac{1}{N}\otimes(\sum_i n_i z_i)`.

In Lean I would prove this using `TensorProduct.induction_on`, which quickly
reduces us to the claim that the sum of two pure tensors is pure, which we can
prove using the above technique whilst avoiding the general theory of finite
sums.
:::

```tex "QHat.canonicalForm" (slot := proof)
\begin{proof} \leanok
    A proof I would write on the board would look like the following. Take a general
    element of $\Qhat$; we know it can be expressed as a finite sum
    $\sum_i q_i\otimes_t z_i$ with $q_i\in\Q$ and $z_i\in\Zhat$. Now choose a large
    positive integer $N$, the lowest common multiple of all the denominators showing up in the
    $q_i$, and then rewrite $\sum_i q_i\otimes_t z_i$ as $\sum_i \frac{n_i}{N}\otimes z_i$ with
    $n_i\in\Z$. Now using the fundamental fact that $na\otimes_t b=a\otimes_t nb$ for $n\in\Z$,
    we can rewrite the sum as $\sum_i \frac{1}{N}\otimes_t n_i z_i$
    which is equal to the pure tensor $\frac{1}{N}\otimes(\sum_i n_i z_i)$.

    In Lean I would prove this using {\tt TensorProduct.induction\_on}, which quickly
    reduces us to the claim that the sum of two pure tensors is pure, which we can prove
    using the above technique whilst avoiding the general theory of finite sums.
\end{proof}
```

Be careful though: just because every element of $`\Qhat` can be written as
$`q\otimes z`, this representation may not be unique. For example
$`2\otimes 1=1\otimes 2`. However, writing $`\frac{1}{N}\otimes_t z` as
$`z/N` does tempt us into the following definition.

```tex
Be careful though: just because every element of $\Qhat$ can be written as $q\otimes z$, this
representation may not be unique. For example $2\otimes 1=1\otimes 2$. However, writing
$\frac{1}{N}\otimes_t z$ as $z/N$ does tempt us into the following definition.
```

:::definition "QHat.IsCoprime" (parent := "automorphic_example_program") (lean := "QHat.IsCoprime")
{uses "ZHat.commRing"}[]
If $`N\in\N^+` and $`z\in\Zhat` then we say that $`N` and $`z` are coprime if
$`z_N\in(\Z/N\Z)^\times`. We write $`z/N` as notation for the element
$`\frac{1}{N}\otimes_tz`.
:::

```tex "QHat.IsCoprime" (slot := statement)
\begin{definition}
    \label{QHat.IsCoprime}
    \lean{QHat.IsCoprime}
    \uses{ZHat.commRing}
    \leanok
    If $N\in\N^+$ and $z\in\Zhat$ then we say that $N$ and $z$ are \emph{coprime} if
    $z_N\in(\Z/N\Z)^\times$. We write $z/N$ as notation
    for the element $\frac{1}{N}\otimes_tz$.
\end{definition}
```

:::lemma_ "QHat.lowestTerms" (parent := "automorphic_example_program") (lean := "QHat.lowestTerms")
{uses "QHat.IsCoprime"}[]
Every element of $`\Qhat` can be uniquely written as $`z/N` with $`z\in\Zhat`,
$`N\in\N^+`, and with $`N` and $`z` coprime.
:::

```tex "QHat.lowestTerms" (slot := statement)
\begin{lemma}
    \label{QHat.lowestTerms}
    \lean{QHat.lowestTerms}
    \uses{QHat.IsCoprime}
    \leanok
    Every element of $\Qhat$ can be uniquely written as $z/N$ with $z\in\Zhat$, $N\in\N^+$,
    and with $N$ and $z$ coprime.
\end{lemma}
```

:::proof "QHat.lowestTerms"
Existence: by the previous lemma, an arbitrary element can be written as
$`z/N`; let $`D` be the greatest common divisor of $`N` and $`z_N` (lifted to a
natural). If $`D=1` then the fraction is by definition in lowest terms. However
if $`1<D\mid N` then $`z_D` is the reduction of $`z_N` and is hence `0`. By
lemma `ZHat.multiples` we deduce that $`z=Dy` is a multiple of $`D`,
and hence $`z/N=\frac{1}{N}\otimes_tDy=\frac{1}{E}\otimes y`, where
$`E=N/D`. Now if a natural divided both $`y_E` and $`E` then this natural would
divide both $`z_N/D` and $`N/D`, contradicting the fact that $`D` is the
greatest common divisor.

Uniqueness: if $`z/N=w/M`, we deduce $`1\otimes_t Mz=1\otimes_t Nw`, and by
injectivity of $`\Zhat\to\Qhat` we deduce that $`Mz=Nw=y`. In particular, if
$`L` is the lowest common multiple of $`M` and $`N` then $`y_L` is a multiple
of both $`M` and $`N` and is hence zero, so $`y=Lx` is a multiple of $`L` by
`ZHat.multiples`, and we deduce from torsionfreeness that
$`z=(L/M)x` and $`w=(L/N)x`. If some prime divided $`L/M` then it would have to
divide $`N` which means that $`z` is not in lowest terms; similarly if some
prime divided $`L/N` then $`w/M` would not be in lowest terms. We deduce that
$`L=M=N` and hence $`z=w` by torsionfreeness.
:::

```tex "QHat.lowestTerms" (slot := proof)
\begin{proof}
    Existence: by the previous lemma, an arbitrary element can be written as $z/N$; let $D$
    be the greatest common divisor of $N$ and $z_N$ (lifted to a natural). If $D=1$
    then the fraction is by definition in lowest terms. However if $1<D\mid N$ then $z_D$
    is the reduction of $z_N$ and is hence 0. By lemma~\ref{ZHat.multiples} we deduce that $z=Dy$
    is a multiple of~$D$, and hence $z/N=\frac{1}{N}\otimes_tDy=\frac{1}{E}\otimes y$, where
    $E=N/D$. Now if a natural divided both $y_E$ and $E$ then this natural would divide both $z_N/D$
    and $N/D$, contradicting the fact that $D$ is the greatest common divisor.

    Uniqueness: if $z/N=w/M$, we deduce $1\otimes_t Mz=1\otimes_t Nw$,
    and by injectivity of $\Zhat\to\Qhat$ we deduce that $Mz=Nw=y$.
    In particular, if $L$ is the lowest common multiple of $M$ and $N$ then $y_L$ is a multiple of both $M$ and $N$ and is
    hence zero, so $y=Lx$ is a multiple of~$L$ by~\ref{ZHat.multiples}, and we deduce
    from torsionfreeness that $z=(L/M)x$ and $w=(L/N)x$. If some prime divided $L/M$
    then it would have to divide~$N$ which means that $z$ is not in lowest terms;
    similarly if some prime divided $L/N$ then $w/M$ would not be in lowest terms.
    We deduce that $L=M=N$ and hence $z=w$ by torsionfreeness.
\end{proof}
```

If $`A` and $`B` are additive abelian groups then $`A\otimes B` is also an
additive abelian group. However if $`A` and $`B` are commutative rings, then
$`A\otimes B` also inherits the structure of a commutative ring, with
$`0=0\otimes_t 0` and $`1=1\otimes_t 1`. Pure tensors multiply in the obvious
way: the product of $`a_1\otimes_t b_1` and $`a_2\otimes_t b_2` is
$`a_1a_2\otimes_t b_1b_2`. There are ring homomorphisms $`A\to A\otimes B` and
$`B\to A\otimes B` sending $`a` to $`a\otimes_t 1` and $`b` to
$`1\otimes_t b`. In general such maps are not injective, but in the case of
$`\Qhat=\Q\otimes\Zhat` both maps from $`\Q` and $`\Zhat` are inclusions.

```tex
If $A$ and $B$ are additive abelian groups then $A\otimes B$ is also an additive abelian group.
However if $A$ and $B$ are commutative rings, then $A\otimes B$ also inherits the structure
of a commutative ring, with $0=0\otimes_t 0$ and $1=1\otimes_t 1$. Pure tensors multiply in the
obvious way: the product of $a_1\otimes_t b_1$ and $a_2\otimes_t b_2$ is $a_1a_2\otimes_t b_1b_2.$
There are ring homomorphisms $A\to A\otimes B$ and $B\to A\otimes B$ sending $a$ to $a\otimes_t 1$
and $b$ to $1\otimes_t b$. In general such maps are not injective, but in the case of
$\Qhat=\Q\otimes\Zhat$ both maps from $\Q$ and $\Zhat$ are inclusions.
```

:::lemma_ "QHat.injective_rat" (parent := "automorphic_example_program") (lean := "QHat.injective_rat")
{uses "QHat"}[]
{uses "ZHat.commRing"}[]
The ring homomorphism $`\Q\to\Qhat` sending $`q` to $`q\otimes_t 1` is
injective.
:::

```tex "QHat.injective_rat" (slot := statement)
\begin{lemma}
    \label{QHat.injective_rat}
    \lean{QHat.injective_rat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The ring homomorphism $\Q\to\Qhat$ sending $q$ to $q\otimes_t 1$
    is injective.
\end{lemma}
```

:::proof "QHat.injective_rat"
We have seen that the map from $`\Z` to $`\Zhat` is injective. Now $`\Q` is a
flat $`\Z`-module, because it's torsion-free, so tensoring up we deduce that
the map from $`\Q=\Q\otimes\Z` to $`\Qhat=\Q\otimes\Zhat` is also injective.
There is no doubt a more elementary proof of this fact.
:::

```tex "QHat.injective_rat" (slot := proof)
\begin{proof} \leanok
    We have seen that the map from $\Z$ to $\Zhat$ is
    injective. Now $\Q$ is a flat $\Z$-module, because it's
    torsion-free, so tensoring up we deduce that the map
    from $\Q=\Q\otimes\Z$ to $\Qhat=\Q\otimes\Zhat$ is also injective.
    There is no doubt a more elementary proof of this fact.
\end{proof}
```

:::lemma_ "QHat.injective_zHat" (parent := "automorphic_example_program") (lean := "QHat.injective_zHat")
{uses "QHat"}[]
{uses "ZHat.torsionfree"}[]
The ring homomorphism $`\Zhat\to\Qhat` sending $`z` to $`1\otimes_t z` is
injective.
:::

```tex "QHat.injective_zHat" (slot := statement)
\begin{lemma}
    \label{QHat.injective_zHat}
    \lean{QHat.injective_zHat}
    \uses{QHat, ZHat.torsionfree}
    \leanok
    The ring homomorphism $\Zhat\to\Qhat$ sending
    $z$ to $1\otimes_t z$ is injective.
\end{lemma}
```

:::proof "QHat.injective_zHat"
The map from $`\Z` to $`\Q` is injective, and we have seen that $`\Zhat` is a
torsion-free and thus flat $`\Z`-module, so the map from $`\Zhat` to
$`\Qhat` is also injective.
:::

```tex "QHat.injective_zHat" (slot := proof)
\begin{proof} \leanok
    The map from $\Z$ to $\Q$ is injective, and we have seen
    that $\Zhat$ is a torsion-free and thus flat $\Z$-module,
    so the map from $\Zhat$ to $\Qhat$ is also injective.
\end{proof}
```

# Additive structure of Qhat.

Here we forget the ring structure on everything, and analyse $`\Qhat` as an
additive abelian group, and in particular how the subgroups $`\Z`, $`\Q` and
$`\Zhat` sit within it.

```tex
Here we forget the ring structure on everything, and analyse $\Qhat$ as an additive
abelian group, and in particular how the subgroups $\Z$, $\Q$ and $\Zhat$ sit within it.
```

The two results we prove in this section are that $`\Q\cap\Zhat=\Z` and that
$`\Q+\Zhat=\Qhat`. Using lattice-theoretic notation we could write these
results as $`\Q\sqcap\Zhat=\Z` and $`\Q\sqcup\Zhat=\Qhat`.

```tex
The two results we prove in this section are that $\Q\cap\Zhat=\Z$ and
that $\Q+\Zhat=\Qhat$. Using lattice-theoretic notation we could write
these results as $\Q\sqcap\Zhat=\Z$ and $\Q\sqcup\Zhat=\Qhat$.
```

:::lemma_ "QHat.rat_meet_zHat" (parent := "automorphic_example_program") (lean := "QHat.rat_meet_zHat")
{uses "QHat"}[]
{uses "ZHat.commRing"}[]
The intersection of $`\Q` and $`\Zhat` in $`\Qhat` is $`\Z`.
:::

```tex "QHat.rat_meet_zHat" (slot := statement)
\begin{lemma}
    \label{QHat.rat_meet_zHat}
    \lean{QHat.rat_meet_zHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The intersection of $\Q$ and $\Zhat$ in $\Qhat$ is $\Z$.
\end{lemma}
```

:::proof "QHat.rat_meet_zHat"
{uses "QHat.lowestTerms"}[]
Clearly $`\Z\subseteq\Q\cap\Zhat`. Now suppose that $`x\in\Q\cap\Zhat`.
Because $`x` is rational we can write it as $`\frac{A}{B}\otimes_t1` for some
fraction $`A/B` in lowest terms, and hence $`x=A/B` where now we regard
$`A\in\Zhat` and note that $`A/B` is still in lowest terms. However
$`x\in\Zhat` implies that $`x=x/1` is in lowest terms, so we deduce that
$`B=1` and thus $`x=A\in\Z`.
:::

```tex "QHat.rat_meet_zHat" (slot := proof)
\begin{proof}
    \uses{QHat.lowestTerms}
    \leanok
    Clearly $\Z\subseteq\Q\cap\Zhat$. Now suppose that $x\in\Q\cap\Zhat$.
    Because $x$ is rational we can write it as $\frac{A}{B}\otimes_t1$ for some
    fraction $A/B$ in lowest terms, and hence $x=A/B$ where now we regard $A\in\Zhat$
    and note that $A/B$ is still in lowest terms. However $x\in\Zhat$ implies that
    $x=x/1$ is in lowest terms, so we deduce that $B=1$ and thus $x=A\in\Z$.
\end{proof}
```

:::lemma_ "QHat.rat_join_zHat" (parent := "automorphic_example_program") (lean := "QHat.rat_join_zHat")
{uses "QHat"}[]
{uses "ZHat.commRing"}[]
The sum of $`\Q` and $`\Zhat` in $`\Qhat` is $`\Qhat`. More precisely, every
element of $`\Qhat` can be written as $`q+z` with $`q\in\Q` and $`z\in\Zhat`,
or more precisely as $`q\otimes_t 1+1\otimes_t z`.
:::

```tex "QHat.rat_join_zHat" (slot := statement)
\begin{lemma}
    \label{QHat.rat_join_zHat}
    \lean{QHat.rat_join_zHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The sum of $\Q$ and $\Zhat$ in $\Qhat$ is $\Qhat$.
    More precisely, every element of $\Qhat$ can be written as $q+z$ with $q\in\Q$ and $z\in\Zhat$,
    or more precisely as $q\otimes_t 1+1\otimes_t z$.
\end{lemma}
```

:::proof "QHat.rat_join_zHat"
{uses "QHat.canonicalForm"}[]
Write $`x\in\Qhat` as $`x=z/N` in lowest terms. Lift $`z_N` to an integer
$`t` and observe that $`(z-t)_N=0`, hence $`z-t=Ny` for some $`y\in\Zhat`. Now
$`x=t/N+y\in\Q+\Zhat`.
:::

```tex "QHat.rat_join_zHat" (slot := proof)
\begin{proof}
    \uses{QHat.canonicalForm}
    \leanok
    Write $x\in\Qhat$ as $x=z/N$ in lowest terms. Lift $z_N$ to an integer $t$ and observe
    that $(z-t)_N=0$, hence $z-t=Ny$ for some $y\in\Zhat$. Now $x=t/N+y\in\Q+\Zhat$.
\end{proof}
```

# Multiplicative structure of the units of Qhat.

We now forget the additive structure on the commutative ring $`\Qhat` and
consider the multiplicative structure of its group of units $`\Qhat^\times`
(which I couldn't get into the section title). We have the obvious subgroups
$`\Q^\times`, $`\Z^\times` and $`\Zhat^\times`.

```tex
We now forget the additive structure on the commutative ring $\Qhat$ and consider
the multiplicative structure of its group of units $\Qhat^\times$ (which I couldn't
get into the section title). We have the obvious
subgroups $\Q^\times$, $\Z^\times$ and $\Zhat^\times$.
```

:::lemma_ "Qhat.unitsrat_meet_unitszHat" (parent := "automorphic_example_program") (lean := "QHat.unitsrat_meet_unitszHat")
{uses "QHat"}[]
{uses "ZHat.commRing"}[]
The intersection of $`\Q^\times` and $`\Zhat^\times` in $`\Qhat^\times` is
$`\Z^\times`.
:::

```tex "Qhat.unitsrat_meet_unitszHat" (slot := statement)
\begin{lemma}
    \label{Qhat.unitsrat_meet_unitszHat}
    \lean{QHat.unitsrat_meet_unitszHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The intersection of $\Q^\times$ and $\Zhat^\times$ in $\Qhat^\times$ is $\Z^\times$.
\end{lemma}
```

:::proof "Qhat.unitsrat_meet_unitszHat"
{uses "QHat.lowestTerms"}[]
{uses "QHat.rat_meet_zHat"}[]
Clearly the intersection is contained within $`\Q\cap\Zhat=\Z`. If $`n\in\Z`
is in $`\Zhat^\times` then $`n\not=0` and its inverse $`1/n=\pm1/|n|` is in
lowest terms but also in $`\Zhat`, and hence $`|n|=1` by uniqueness of lowest
term representation.
:::

```tex "Qhat.unitsrat_meet_unitszHat" (slot := proof)
\begin{proof}
    \uses{QHat.lowestTerms,QHat.rat_meet_zHat}
    \leanok
    Clearly the intersection is contained within $\Q\cap\Zhat=\Z$. If $n\in\Z$ is in $\Zhat^\times$
    then $n\not=0$ and its inverse $1/n=\pm1/|n|$ is in lowest terms but also in $\Zhat$,
    and hence $|n|=1$ by uniqueness of lowest term representation.
\end{proof}
```

Note that by the previous lemma, this representation will be unique up to sign.

```tex
Note that by the previous lemma, this representation will be unique up to sign.
```

:::lemma_ "QHat.unitsrat_join_unitszHat" (parent := "automorphic_example_program") (lean := "QHat.unitsrat_join_unitszHat")
{uses "QHat"}[]
{uses "ZHat.commRing"}[]
The product of $`\Q^\times` and $`\Zhat^\times` in $`\Qhat^\times` is all of
$`\Qhat^\times`. More precisely, every element of $`\Qhat^\times` can be
written as $`qz` with $`q\in\Q^\times` and $`z\in\Zhat^\times`.
:::

```tex "QHat.unitsrat_join_unitszHat" (slot := statement)
\begin{lemma}
    \label{QHat.unitsrat_join_unitszHat}
    \lean{QHat.unitsrat_join_unitszHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The product of $\Q^\times$ and $\Zhat^\times$ in $\Qhat^\times$ is all of $\Qhat^\times$.
    More precisely, every element of $\Qhat^\times$ can be written as $qz$ with $q\in\Q^\times$
    and $z\in\Zhat^\times$.
\end{lemma}
```

:::proof "QHat.unitsrat_join_unitszHat"
{uses "ZHat.multiples"}[]
{uses "QHat.canonicalForm"}[]
We already know that a general element of $`\Qhat^\times` can be written as
$`x/N` with $`N` positive, so this reduces us to proving that a general element
$`x\in\Zhat` which is invertible in $`\Qhat^\times` can be written as
$`qz` with $`q\in\Q^\times` and $`z\in\Zhat^\times`.

We know $`1/x` can be written in lowest terms as $`y/M`, and multiplying up we
deduce that $`xy=M`, and hence $`x` divides a positive integer. If
$`i:\Z\to\Zhat` denotes the inclusion, then we've just seen that the preimage of
the principal ideal $`(x)`, namely, $`J:=i^{-1}(x\Zhat)` is nonzero, as it
contains $`M`. Let $`g\in J` be the smallest positive integer; it's
well-known that $`J=(g)`.

I claim that it suffices to show that $`x\Zhat=g\Zhat`. Because knowing
$`g=yx` and $`x=gz` for some $`y,z\in\Zhat` tells us that
$`g(1-yz)=0`, and we know that multiplication by $`g` is injective, hence
$`yz=1`, so $`z` is a unit and we have written $`x=gz` with
$`g\in\Q^\times` and $`z\in\Zhat^\times`.

It remains to prove the claim. By definition $`g\in J\subseteq x\Zhat` so this
is one inclusion. For the other, it suffices to prove that $`x_g=0`. However if
$`0<x_g<g` lifts $`x_g` to the naturals then I claim that $`x_g\in J`, for
$`x_g-x` is a multiple of $`g` and hence of $`x`, and this contradicts
minimality of $`g`.
:::

```tex "QHat.unitsrat_join_unitszHat" (slot := proof)
\begin{proof}
    \uses{ZHat.multiples,ZHat.eq_zero_of_mul_eq_zero,QHat.canonicalForm}
    \leanok
  We already know that a general element of $\Qhat^\times$ can be written as $x/N$ with $N$
  positive, so this reduces us to proving that a general element $x\in\Zhat$ which is invertible
  in $\Qhat^\times$ can be written as $qz$ with $q\in\Q^\times$ and $z\in\Zhat^\times$.

  We know $1/x$ can be written in lowest terms as $y/M$, and multiplying up we deduce
  that $xy=M$, and hence $x$ divides a positive integer. If $i:\Z\to\Zhat$ denotes the inclusion, then we've just seen that the preimage of
  the principal ideal $(x)$, namely, $J:=i^{-1}(x\Zhat)$ is nonzero, as it
  contains $M$. Let $g\in J$ be the smallest positive integer; it's
  well-known that $J=(g)$.

  I claim that it suffices to show that $x\Zhat=g\Zhat$. Because knowing
  $g=yx$ and $x=gz$ for some $y,z\in\Zhat` tells us that
  $g(1-yz)=0$, and we know that multiplication by $g$ is injective, hence
  $yz=1$, so $z$ is a unit and we have written $x=gz$ with
  $g\in\Q^\times$ and $z\in\Zhat^\times$.

  It remains to prove the claim. By definition $g\in J\subseteq x\Zhat$ so this
  is one inclusion. For the other, it suffices to prove that $x_g=0$. However if
  $0<x_g<g$ lifts $x_g$ to the naturals then I claim that $x_g\in J$, for
  $x_g-x$ is a multiple of $g$ and hence of $x$, and this contradicts
  minimality of $g$.
\end{proof}
```

# The Hurwitz quaternions

```tex
\section{The Hurwitz quaternions}
```

:::definition "Hurwitz" (parent := "automorphic_example_program") (lean := "Hurwitz")
The Hurwitz quaternions are the set
$`\calO := \Z\oplus\Z \omega\oplus\Z i\oplus\Z i\omega` (as an abstract
abelian group or as a subgroup of the usual quaternions). Here
$`\omega=\frac{-1+(i+j+k)}{2}` and note that $`(i+j+k)^2=-3`. We have
$`\overline{\omega}=\omega^2=-(\omega+1)`. A general quaternion $`a+bi+cj+dk`
is a Hurwitz quaternion if either $`a,b,c,d\in\Z` or
$`a,b,c,d\in\Z+\frac{1}{2}`.
:::

```tex "Hurwitz" (slot := statement)
\begin{definition}
    \label{Hurwitz}
    \lean{Hurwitz}
    \leanok
        The Hurwitz quaternions are the set $\calO := \Z\oplus\Z \omega\oplus\Z i\oplus
    \Z i\omega$ (as an abstract abelian group or as a subgroup of the usual quaternions).
    Here $\omega=\frac{-1+(i+j+k)}{2}$ and note that $(i+j+k)^2=-3$.
    We have $\overline{\omega}=\omega^2=-(\omega+1)$. A general quaternion
    $a+bi+cj+dk$ is a Hurwitz quaternion if either $a,b,c,d\in\Z$
    or $a,b,c,d\in\Z+\frac{1}{2}$.
\end{definition}
```

```tex
\begin{lemma}
    \label{Hurwitz.ring}
    \lean{Hurwitz.ring}
    \uses{Hurwitz}
    \leanok
    The Hurwitz quaternions form a ring.
\end{lemma}
\begin{proof}
    \leanok
    Follow your nose.
\end{proof}


This ring is isomorphic to $\Z^4$ as an additive group, and
$\calO\otimes_{\Z}\R=\R\oplus \R i\oplus \R j\oplus\R \omega$
is the usual Hamilton quaternions.

\begin{definition}
    \label{Hurwitz.starRing}
    \lean{Hurwitz.starRing}
    \uses{Hurwitz.ring}
    \leanok
    There's a conjugation map (which we'll call "star") from the Hurwitz quaternions to themselves, sending
    integers to themselves and purely imaginary elements like $2\omega+1$ to minus themselves.
    It satisfies $(x^*)^*=x$, $(xy)^*=y^*x^*$ and $(x+y)^*=x^*+y^*$. In particular, the Hurwitz
    quaternions are a "star ring" in the sense of mathlib.
\end{definition}

\begin{definition}
    \label{Hurwitz.norm}
    \lean{Hurwitz.norm}
    \uses{Hurwitz}
    \leanok
    The Hurwitz quaternions come equipped with an integer-valued norm, which is
    $a^2+b^2+c^2+d^2$ on $a+bi+cj+dk$ but needs to be modified a bit to deal with $\omega$.
\end{definition}

\begin{lemma}
    \label{Hurwitz.norm_eq_mul_conj}
    \lean{Hurwitz.norm_eq_mul_conj}
    \leanok
    We have $N(x)=x\overline{x}$.
\end{lemma}
\begin{proof}
    \uses{Hurwitz.norm, Hurwitz.starRing}
    \leanok
    Easy calculation.
\end{proof}

\begin{lemma}
    \label{Hurwitz.norm_zero}
    \lean{Hurwitz.norm_zero}
    \uses{Hurwitz.norm}
    \leanok
    The norm of $0$ is $0$.
\end{lemma}
\begin{proof}
    \leanok
    A calculation.
\end{proof}

\begin{lemma}
    \label{Hurwitz.norm_one}
    \lean{Hurwitz.norm_one}
    \uses{Hurwitz.norm}
    \leanok
    The norm of $1$ is $1$.
\end{lemma}
\begin{proof}
    \leanok
    A calculation.
\end{proof}

\begin{lemma}
    \label{Hurwitz.norm_mul}
    \lean{Hurwitz.norm_mul}
    \uses{Hurwitz.norm}
    \leanok
    The norm of a product is the product of the norms.
\end{lemma}
\begin{proof}
    \leanok
    A calculation.
\end{proof}

\begin{lemma}
    \label{Hurwitz.norm_nonneg}
    \lean{Hurwitz.norm_nonneg}
    \uses{Hurwitz.norm}
    \leanok
    The norm of an element is nonnegative.
\end{lemma}
\begin{proof} \leanok
    It's a sum of rational squares.
\end{proof}

\begin{lemma}
    \label{Hurwitz.norm_eq_zero}
    \lean{Hurwitz.norm_eq_zero}
    \uses{Hurwitz.norm}
    \leanok
    The norm of an element is zero if and only if the element is zero.
\end{lemma}
\begin{proof}
    \leanok
    It's a sum of rational squares.
\end{proof}

\begin{lemma}
    \label{Hurwitz.exists_near}
    \lean{Hurwitz.exists_near}
    \uses{Hurwitz.norm}
    \leanok
    Given a ``usual'' quaternion $a=x+yi+zj+wk$ with $x,y,z,w\in\R$,
    there exists a Hurwitz quaternion $q$ such that $N(a-q)<1$.
\end{lemma}
\begin{proof}
    \leanok
  If $[r]$ denotes the nearest integer to the real number $r$, then $|r-[r]|\leq \frac{1}{2}$.
  Hence if $q=[x]+[y]i+[z]j+[w]k$ then $N(a-q)=|x-[x]|^2+\cdots
  \leq \frac{1}{4}+\frac{1}{4}+\frac{1}{4}+\frac{1}{4}\leq 1$, with strict inequality unless
  $|x-[x]|=|y-[y]|=|z-[z]|=|w-[w]|=\frac{1}{2}$, in which case $a\in\mathcal{O}$ because $a-\omega$
  has integer coordinates.
\end{proof}

\begin{lemma}
    \label{Hurwitz.quot_rem}
    \lean{Hurwitz.quot_rem}
    \uses{Hurwitz.norm, Hurwitz.exists_near}
    \leanok
    Given two Hurwitz quaternions $a$ and $b$ with $b$ nonzero, there exists
    $q$ and $r$ such that $a=qb+r$ and $N(r)<N(b)$.
\end{lemma}
\begin{proof}
    \leanok
  Let $q$ be the Hurwitz quaternion obtained by applying Lemma~\ref{Hurwitz.exists_near}
  to $a/b := ab^{-1}$; then $N(a/b-q)<1$ and now everything follows after multiplying up.
\end{proof}

\begin{corollary}
    \label{Hurwitz.left_ideal_princ}
    \lean{Hurwitz.left_ideal_princ}
    \uses{Hurwitz.norm}
    \leanok
    All left ideals of $\calO$ are principal.
\end{corollary}
\begin{proof}
    \uses{Hurwitz.quot_rem}
    \leanok
    If the ideal is 0, use 0. Otherwise, choose a nonzero element of smallest norm.
\end{proof}

\begin{remark}
    All right ideals are principal too, because there's
    another version of Euclid saying $a=bq+r$.
\end{remark}
```

:::lemma_ "Hurwitz.ring" (parent := "automorphic_example_program") (lean := "Hurwitz.ring")
{uses "Hurwitz"}[]
The Hurwitz quaternions form a ring.
:::

```tex "Hurwitz.ring" (slot := statement)
\begin{lemma}
    \label{Hurwitz.ring}
    \lean{Hurwitz.ring}
    \uses{Hurwitz}
    \leanok
    The Hurwitz quaternions form a ring.
\end{lemma}
```

:::proof "Hurwitz.ring"
Follow your nose.
:::

```tex "Hurwitz.ring" (slot := proof)
\begin{proof}
    \leanok
    Follow your nose.
\end{proof}
```

This ring is isomorphic to $`\Z^4` as an additive group, and
$`\calO\otimes_{\Z}\R=\R\oplus \R i\oplus \R j\oplus\R \omega`
is the usual Hamilton quaternions.

```tex
This ring is isomorphic to $\Z^4$ as an additive group, and
$\calO\otimes_{\Z}\R=\R\oplus \R i\oplus \R j\oplus\R \omega$
is the usual Hamilton quaternions.
```

:::definition "Hurwitz.starRing" (parent := "automorphic_example_program") (lean := "Hurwitz.starRing")
{uses "Hurwitz.ring"}[]
There's a conjugation map (which we'll call "star") from the Hurwitz
quaternions to themselves, sending integers to themselves and purely imaginary
elements like $`2\omega+1` to minus themselves. It satisfies $`(x^*)^*=x`,
$`(xy)^*=y^*x^*` and $`(x+y)^*=x^*+y^*`. In particular, the Hurwitz quaternions
are a "star ring" in the sense of mathlib.
:::

```tex "Hurwitz.starRing" (slot := statement)
\begin{definition}
    \label{Hurwitz.starRing}
    \lean{Hurwitz.starRing}
    \uses{Hurwitz.ring}
    \leanok
    There's a conjugation map (which we'll call "star") from the Hurwitz quaternions to themselves, sending
    integers to themselves and purely imaginary elements like $2\omega+1$ to minus themselves.
    It satisfies $(x^*)^*=x$, $(xy)^*=y^*x^*$ and $(x+y)^*=x^*+y^*$. In particular, the Hurwitz
    quaternions are a "star ring" in the sense of mathlib.
\end{definition}
```

:::definition "Hurwitz.norm" (parent := "automorphic_example_program") (lean := "Hurwitz.norm")
{uses "Hurwitz"}[]
The Hurwitz quaternions come equipped with an integer-valued norm, which is
$`a^2+b^2+c^2+d^2` on $`a+bi+cj+dk` but needs to be modified a bit to deal with
$`\omega`.
:::

```tex "Hurwitz.norm" (slot := statement)
\begin{definition}
    \label{Hurwitz.norm}
    \lean{Hurwitz.norm}
    \uses{Hurwitz}
    \leanok
    The Hurwitz quaternions come equipped with an integer-valued norm, which is
    $a^2+b^2+c^2+d^2$ on $a+bi+cj+dk$ but needs to be modified a bit to deal with $\omega$.
\end{definition}
```

:::lemma_ "Hurwitz.norm_eq_mul_conj" (parent := "automorphic_example_program") (lean := "Hurwitz.norm_eq_mul_conj")
We have $`N(x)=x\overline{x}`.
:::

```tex "Hurwitz.norm_eq_mul_conj" (slot := statement)
\begin{lemma}
    \label{Hurwitz.norm_eq_mul_conj}
    \lean{Hurwitz.norm_eq_mul_conj}
    \leanok
    We have $N(x)=x\overline{x}$.
\end{lemma}
```

:::proof "Hurwitz.norm_eq_mul_conj"
{uses "Hurwitz.norm"}[]
{uses "Hurwitz.starRing"}[]
Easy calculation.
:::

```tex "Hurwitz.norm_eq_mul_conj" (slot := proof)
\begin{proof}
    \uses{Hurwitz.norm, Hurwitz.starRing}
    \leanok
    Easy calculation.
\end{proof}
```

:::lemma_ "Hurwitz.norm_zero" (parent := "automorphic_example_program") (lean := "Hurwitz.norm_zero")
{uses "Hurwitz.norm"}[]
The norm of $`0` is $`0`.
:::

```tex "Hurwitz.norm_zero" (slot := statement)
\begin{lemma}
    \label{Hurwitz.norm_zero}
    \lean{Hurwitz.norm_zero}
    \uses{Hurwitz.norm}
    \leanok
    The norm of $0$ is $0$.
\end{lemma}
```

:::proof "Hurwitz.norm_zero"
A calculation.
:::

```tex "Hurwitz.norm_zero" (slot := proof)
\begin{proof}
    \leanok
    A calculation.
\end{proof}
```

:::lemma_ "Hurwitz.norm_one" (parent := "automorphic_example_program") (lean := "Hurwitz.norm_one")
{uses "Hurwitz.norm"}[]
The norm of $`1` is $`1`.
:::

```tex "Hurwitz.norm_one" (slot := statement)
\begin{lemma}
    \label{Hurwitz.norm_one}
    \lean{Hurwitz.norm_one}
    \uses{Hurwitz.norm}
    \leanok
    The norm of $1$ is $1$.
\end{lemma}
```

:::proof "Hurwitz.norm_one"
A calculation.
:::

```tex "Hurwitz.norm_one" (slot := proof)
\begin{proof}
    \leanok
    A calculation.
\end{proof}
```

:::lemma_ "Hurwitz.norm_mul" (parent := "automorphic_example_program") (lean := "Hurwitz.norm_mul")
{uses "Hurwitz.norm"}[]
The norm of a product is the product of the norms.
:::

```tex "Hurwitz.norm_mul" (slot := statement)
\begin{lemma}
    \label{Hurwitz.norm_mul}
    \lean{Hurwitz.norm_mul}
    \uses{Hurwitz.norm}
    \leanok
    The norm of a product is the product of the norms.
\end{lemma}
```

:::proof "Hurwitz.norm_mul"
A calculation.
:::

```tex "Hurwitz.norm_mul" (slot := proof)
\begin{proof}
    \leanok
    A calculation.
\end{proof}
```

:::lemma_ "Hurwitz.norm_nonneg" (parent := "automorphic_example_program") (lean := "Hurwitz.norm_nonneg")
{uses "Hurwitz.norm"}[]
The norm of an element is nonnegative.
:::

```tex "Hurwitz.norm_nonneg" (slot := statement)
\begin{lemma}
    \label{Hurwitz.norm_nonneg}
    \lean{Hurwitz.norm_nonneg}
    \uses{Hurwitz.norm}
    \leanok
    The norm of an element is nonnegative.
\end{lemma}
```

:::proof "Hurwitz.norm_nonneg"
It's a sum of rational squares.
:::

```tex "Hurwitz.norm_nonneg" (slot := proof)
\begin{proof} \leanok
    It's a sum of rational squares.
\end{proof}
```

:::lemma_ "Hurwitz.norm_eq_zero" (parent := "automorphic_example_program") (lean := "Hurwitz.norm_eq_zero")
{uses "Hurwitz.norm"}[]
The norm of an element is zero if and only if the element is zero.
:::

```tex "Hurwitz.norm_eq_zero" (slot := statement)
\begin{lemma}
    \label{Hurwitz.norm_eq_zero}
    \lean{Hurwitz.norm_eq_zero}
    \uses{Hurwitz.norm}
    \leanok
    The norm of an element is zero if and only if the element is zero.
\end{lemma}
```

:::proof "Hurwitz.norm_eq_zero"
It's a sum of rational squares.
:::

```tex "Hurwitz.norm_eq_zero" (slot := proof)
\begin{proof}
    \leanok
    It's a sum of rational squares.
\end{proof}
```

:::lemma_ "Hurwitz.exists_near" (parent := "automorphic_example_program") (lean := "Hurwitz.exists_near")
{uses "Hurwitz.norm"}[]
Given a "usual" quaternion $`a=x+yi+zj+wk` with $`x,y,z,w\in\R`, there exists a
Hurwitz quaternion $`q` such that $`N(a-q)<1`.
:::

```tex "Hurwitz.exists_near" (slot := statement)
\begin{lemma}
    \label{Hurwitz.exists_near}
    \lean{Hurwitz.exists_near}
    \uses{Hurwitz.norm}
    \leanok
    Given a ``usual'' quaternion $a=x+yi+zj+wk$ with $x,y,z,w\in\R$,
    there exists a Hurwitz quaternion $q$ such that $N(a-q)<1$.
\end{lemma}
```

:::proof "Hurwitz.exists_near"
If $`[r]` denotes the nearest integer to the real number $`r`, then
$`|r-[r]|\leq \frac{1}{2}`. Hence if
$`q=[x]+[y]i+[z]j+[w]k` then $`N(a-q)=|x-[x]|^2+\cdots
\leq \frac{1}{4}+\frac{1}{4}+\frac{1}{4}+\frac{1}{4}\leq 1`, with strict
inequality unless
$`|x-[x]|=|y-[y]|=|z-[z]|=|w-[w]|=\frac{1}{2}`, in which case
$`a\in\mathcal{O}` because $`a-\omega` has integer coordinates.
:::

```tex "Hurwitz.exists_near" (slot := proof)
\begin{proof}
    \leanok
  If $[r]$ denotes the nearest integer to the real number $r$, then $|r-[r]|\leq \frac{1}{2}$.
  Hence if $q=[x]+[y]i+[z]j+[w]k$ then $N(a-q)=|x-[x]|^2+\cdots
  \leq \frac{1}{4}+\frac{1}{4}+\frac{1}{4}+\frac{1}{4}\leq 1$, with strict inequality unless
  $|x-[x]|=|y-[y]|=|z-[z]|=|w-[w]|=\frac{1}{2}$, in which case $a\in\mathcal{O}$ because $a-\omega$
  has integer coordinates.
\end{proof}
```

:::lemma_ "Hurwitz.quot_rem" (parent := "automorphic_example_program") (lean := "Hurwitz.quot_rem")
{uses "Hurwitz.norm"}[]
{uses "Hurwitz.exists_near"}[]
Given two Hurwitz quaternions $`a` and $`b` with $`b` nonzero, there exists
$`q` and $`r` such that $`a=qb+r` and $`N(r)<N(b)`.
:::

```tex "Hurwitz.quot_rem" (slot := statement)
\begin{lemma}
    \label{Hurwitz.quot_rem}
    \lean{Hurwitz.quot_rem}
    \uses{Hurwitz.norm, Hurwitz.exists_near}
    \leanok
    Given two Hurwitz quaternions $a$ and $b$ with $b$ nonzero, there exists
    $q$ and $r$ such that $a=qb+r$ and $N(r)<N(b)$.
\end{lemma}
```

:::proof "Hurwitz.quot_rem"
Let $`q` be the Hurwitz quaternion obtained by applying
lemma `Hurwitz.exists_near` to $`a/b := ab^{-1}`; then $`N(a/b-q)<1` and
now everything follows after multiplying up.
:::

```tex "Hurwitz.quot_rem" (slot := proof)
\begin{proof}
    \leanok
  Let $q$ be the Hurwitz quaternion obtained by applying Lemma~\ref{Hurwitz.exists_near}
  to $a/b := ab^{-1}$; then $N(a/b-q)<1$ and now everything follows after multiplying up.
\end{proof}
```

:::corollary "Hurwitz.left_ideal_princ" (parent := "automorphic_example_program") (lean := "Hurwitz.left_ideal_princ")
{uses "Hurwitz.norm"}[]
All left ideals of $`\calO` are principal.
:::

```tex "Hurwitz.left_ideal_princ" (slot := statement)
\begin{corollary}
    \label{Hurwitz.left_ideal_princ}
    \lean{Hurwitz.left_ideal_princ}
    \uses{Hurwitz.norm}
    \leanok
    All left ideals of $\calO$ are principal.
\end{corollary}
```

:::proof "Hurwitz.left_ideal_princ"
{uses "Hurwitz.quot_rem"}[]
If the ideal is `0`, use `0`. Otherwise, choose a nonzero element of smallest
norm.
:::

```tex "Hurwitz.left_ideal_princ" (slot := proof)
\begin{proof}
    \uses{Hurwitz.quot_rem}
    \leanok
    If the ideal is 0, use 0. Otherwise, choose a nonzero element of smallest norm.
\end{proof}
```

All right ideals are principal too, because there's
another version of Euclid saying $`a=bq+r`.

```tex
\begin{remark}
    All right ideals are principal too, because there's
    another version of Euclid saying $a=bq+r$.
\end{remark}
```

```tex
We define $\calOhat$ to be $\calO\otimes\Zhat$, so it's elements $a+bi+cj+d\omega$
with $a,b,c,d\in\Zhat$. The basic thing we need is this:

\begin{theorem}
    \label{Hurwitz.surjective_pnat_quotient}
    \uses{Hurwitz}
    If $N$ is a positive natural then the obvious map $\calO\to\calOhat/N\calOhat$ is surjective.
\end{theorem}
\begin{proof}
    This is just four copies of the surjection $\Z\to\Zhat/N\Zhat$.
    Note that this latter map is surjective because $\Z\to\Z/N\Z$ is surjective,
    hence given $z\in\Zhat$ you can subtract an integer $w$ such
    that $(z-w)_N=0$, so $z-w$ is a multiple of~$N$.
\end{proof}

We define $D:=\Q\otimes\calO=\Q\oplus\Q i\oplus\Q j\oplus\Q\omega=\Q\oplus\Q i\oplus\Q j\oplus\Q k$.
Finally, we define $\widehat{D}:=D\otimes\Zhat$. Just as with $\Qhat$ we have

\begin{lemma}
    \label{HurwitzRatHat.canonicalForm}
    \lean{HurwitzRatHat.canonicalForm}
    \uses{QHat, ZHat, Hurwitz}
    \leanok
    Every element of $\widehat{D}$ can be written as $z/N$ with $z\in\calOhat$ and $N\in\N^+$.
\end{lemma}
\begin{proof}
    Same as the proof for $\Qhat$.
\end{proof}

It is not hard to check that $\widehat{D}$ contains $\widehat{\calO}$
and $D$ as subrings, and that as additive abelian groups we have
$\widehat{\calO}\cap D=\calO$ and $\widehat{\calO}+D=\widehat{D}$.
This is because $\calO$ is just four copies of $\Z$ and we've proved
the analogous result for $\Z$.

However the multiplicative structure is more interesting, especially
as $D$ is not commutative. For a general quaternion algebra it is \emph{not}
true that $(\widehat{D})^\times=D^\times(\widehat{\calO})^\times$, because
there are "class group obstructions". The double coset space is some
kind of non-commutative analogue of a class group. However for our
particular choice of $D$ and $\calO$ the result is true.

\begin{theorem}
    \label{HurwitzRatHat.completed_units}
    \lean{HurwitzRatHat.completed_units}
    \uses{HurwitzRatHat.canonicalForm}
    \leanok
    The group of units of $\widehat{D}$ is $D^\times\calOhat^\times$.
\end{theorem}
\begin{proof}
    \uses{Hurwitz.left_ideal_princ}
    \leanok
    The proof uses a quaternionic version of the lowest-terms argument and the
    Euclidean property of the Hurwitz order.
\end{proof}
```

# Profinite completion of the Hurwitz quaternions

```tex
\section{Profinite completion of the Hurwitz quaternions}
```

We define $`\calOhat` to be $`\calO\otimes\Zhat`, so it's elements
$`a+bi+cj+d\omega` with $`a,b,c,d\in\Zhat`. The basic thing we need is this:

```tex
We define $\calOhat$ to be $\calO\otimes\Zhat$, so it's elements $a+bi+cj+d\omega$
with $a,b,c,d\in\Zhat$. The basic thing we need is this:
```

:::theorem "Hurwitz.surjective_pnat_quotient" (parent := "automorphic_example_program")
{uses "Hurwitz"}[]
If $`N` is a positive natural then the obvious map
$`\calO\to\calOhat/N\calOhat` is surjective.
:::

```tex "Hurwitz.surjective_pnat_quotient" (slot := statement)
\begin{theorem}
    \label{Hurwitz.surjective_pnat_quotient}
    \uses{Hurwitz}
    If $N$ is a positive natural then the obvious map $\calO\to\calOhat/N\calOhat$ is surjective.
\end{theorem}
```

:::proof "Hurwitz.surjective_pnat_quotient"
This is just four copies of the surjection $`\Z\to\Zhat/N\Zhat`. Note that this
latter map is surjective because $`\Z\to\Z/N\Z` is surjective, hence given
$`z\in\Zhat` you can subtract an integer $`w` such that $`(z-w)_N=0`, so
$`z-w` is a multiple of $`N`.
:::

```tex "Hurwitz.surjective_pnat_quotient" (slot := proof)
\begin{proof}
    This is just four copies of the surjection $\Z\to\Zhat/N\Zhat$.
    Note that this latter map is surjective because $\Z\to\Z/N\Z$ is surjective,
    hence given $z\in\Zhat$ you can subtract an integer $w$ such
    that $(z-w)_N=0$, so $z-w$ is a multiple of~$N$.
\end{proof}
```

We define $`D:=\Q\otimes\calO=\Q\oplus\Q i\oplus\Q j\oplus\Q\omega=\Q\oplus\Q i\oplus\Q j\oplus\Q k`.
Finally, we define $`\widehat{D}:=D\otimes\Zhat`. Just as with $`\Qhat` we
have

```tex
We define $D:=\Q\otimes\calO=\Q\oplus\Q i\oplus\Q j\oplus\Q\omega=\Q\oplus\Q i\oplus\Q j\oplus\Q k$.
Finally, we define $\widehat{D}:=D\otimes\Zhat$. Just as with $\Qhat$ we have
```

:::lemma_ "HurwitzRatHat.canonicalForm" (parent := "automorphic_example_program") (lean := "HurwitzRatHat.canonicalForm")
{uses "QHat"}[]
{uses "ZHat"}[]
{uses "Hurwitz"}[]
Every element of $`\widehat{D}` can be written as $`z/N` with
$`z\in\calOhat` and $`N\in\N^+`.
:::

```tex "HurwitzRatHat.canonicalForm" (slot := statement)
\begin{lemma}
    \label{HurwitzRatHat.canonicalForm}
    \lean{HurwitzRatHat.canonicalForm}
    \uses{QHat, ZHat, Hurwitz}
    \leanok
    Every element of $\widehat{D}$ can be written as $z/N$ with $z\in\calOhat$ and $N\in\N^+$.
\end{lemma}
```

:::proof "HurwitzRatHat.canonicalForm"
Same as the proof for $`\Qhat`.
:::

```tex "HurwitzRatHat.canonicalForm" (slot := proof)
\begin{proof}
    Same as the proof for $\Qhat$.
\end{proof}
```

It is not hard to check that $`\widehat{D}` contains $`\widehat{\calO}`
and $`D` as subrings, and that as additive abelian groups we have
$`\widehat{\calO}\cap D=\calO` and $`\widehat{\calO}+D=\widehat{D}`.
This is because $`\calO` is just four copies of $`\Z` and we've proved
the analogous result for $`\Z`.

```tex
It is not hard to check that $\widehat{D}$ contains $\widehat{\calO}$
and $D$ as subrings, and that as additive abelian groups we have
$\widehat{\calO}\cap D=\calO$ and $\widehat{\calO}+D=\widehat{D}$.
This is because $\calO$ is just four copies of $\Z$ and we've proved
the analogous result for $\Z$.
```

However the multiplicative structure is more interesting, especially
as $`D` is not commutative. For a general quaternion algebra it is not
true that $`(\widehat{D})^\times=D^\times(\widehat{\calO})^\times`, because
there are "class group obstructions". The double coset space is some
kind of non-commutative analogue of a class group. However for our
particular choice of $`D` and $`\calO` the result is true.

```tex
However the multiplicative structure is more interesting, especially
as $D$ is not commutative. For a general quaternion algebra it is \emph{not}
true that $(\widehat{D})^\times=D^\times(\widehat{\calO})^\times$, because
there are "class group obstructions". The double coset space is some
kind of non-commutative analogue of a class group. However for our
particular choice of $D$ and $\calO$ the result is true.
```

:::theorem "HurwitzRatHat.completed_units" (parent := "automorphic_example_program") (lean := "HurwitzRatHat.completed_units")
{uses "HurwitzRatHat.canonicalForm"}[]
The group of units of $`\widehat{D}` is $`D^\times\calOhat^\times`. More
precisely, every element of $`\widehat{D}^\times` can be written as a product
$`\delta u` with $`\delta\in D^\times` and $`u\in\calOhat^\times`.
:::

```tex "HurwitzRatHat.completed_units" (slot := statement)
\begin{theorem}
    \label{HurwitzRatHat.completed_units}
    \lean{HurwitzRatHat.completed_units}
    \uses{HurwitzRatHat.canonicalForm}
    \leanok
    The group of units of $\widehat{D}$ is $D^\times\calOhat^\times$.
    More precisely, every element of $\widehat{D}^\times$ can be written as a product $\delta u$
    with $\delta\in D^\times$ and $u\in\calOhat^\times$.
\end{theorem}
```

:::proof "HurwitzRatHat.completed_units"
Given an element $`x` of $`\widehat{D}^\times`, we can use
lemma `HurwitzRatHat.canonicalForm` to write it as $`z/N` with $`N` a
positive integer and $`z\in\widehat{\calO}`. Note that $`N` is central and in
$`D^\times`. Similarly, we can write $`x^{-1}` as $`y/M` with $`M` a positive
integer and $`y\in\widehat{\calO}`. Then
$`1=xx^{-1}=zy/NM` and so $`zy=NM=MN`, and $`1=x^{-1}x=yz/MN` so $`yz=MN` too.
In particular $`y` both left and right divides a positive integer.

Now consider the left ideal $`\widehat{\calO}y` generated by $`y`. We've just
seen that this ideal has nontrivial intersection with $`\calO`, because it
contains $`MN>0`. Hence its intersection with $`\calO` is a nonzero left ideal
of $`\calO`, which is hence principal by
corollary `Hurwitz.left_ideal_princ`. Write it as $`\calO\alpha` with
$`0\not=\alpha\in\calO`.

It suffices to show that $`\calOhat\alpha=\calOhat y`. For this would imply
that $`u\alpha=y` and $`vy=\alpha` for some $`u,v\in\calOhat`, and thus
$`(vu-1)\alpha=0` and $`(uv-1)y=0`, and both $`\alpha` and $`y` are left
divisors of positive integers (the norm of $`\alpha`, and $`MN`
respectively), so now using the fact that $`\calOhat` is $`\Z`-torsion-free
(is the tensor product of torsion-free abelian groups torsion-free? That would
be a cheap way of doing it. Otherwise use $`\calO=\Z^4`) we deduce that
$`u` and $`v` are units, and thus
$`x^{-1}=\frac{1}{M}u\alpha` so $`x=(M\alpha^{-1})v\in D^\times\calOhat^\times`.

What remains is this. We have $`y\in\calOhat` which left and right divides some
positive integer. We've defined $`0\not=\alpha\in\calO` such that
$`\calO\alpha` is the pullback of the abelian group $`\calOhat y` along the map
$`\calO\to\calOhat`. We need to show that when we push this ideal $`\calO\alpha`
forwards to $`\calOhat` we get $`\calOhat y` again. The fact that
$`\calOhat\alpha\subseteq\calOhat y` is easy, because $`\alpha\in\calOhat y` by
definition. So it remains to show that $`y\in\calOhat\alpha`.

Let's define $`T` to be a positive integer which is both a left and right
multiple of both $`y` and $`\alpha` (for example
$`T=MN\alpha\overline{\alpha}` will do). Now note that we have an isomorphism
$`\calO/T\calO=\calOhat/T\calOhat`, so we can choose some $`\beta\in\calO` such
that $`\beta-y\in T\calOhat` is a multiple of $`T`. Next note that
$`\beta\in y+\calOhat T\subset \calOhat y` is in
$`\calOhat y\cap\calO=\calO\alpha`, meaning $`\beta=\gamma\alpha` for some
$`\gamma\in\calO`. Hence $`y\in\beta+\calOhat T\subseteq\calOhat\alpha`.
:::

```tex "HurwitzRatHat.completed_units" (slot := proof)
\begin{proof}
    Given an element $x$ of $\widehat{D}^\times$, we can use lemma~\ref{HurwitzRatHat.canonicalForm}
    to write it as $z/N$ with $N$ a positive integer
    and $z\in\widehat{\calO}$. Note that $N$ is central and in $D^\times$. Similarly, we can
    write $x^{-1}$ as $y/M$ with $M$ a positive integer and $y\in\widehat{\calO}$. Then
    $1=xx^{-1}=zy/NM$ and so $zy=NM=MN$, and $1=x^{-1}x=yz/MN$ so $yz=MN$ too. In particular $y$
    both left and right divides a positive integer.

    Now consider the left ideal $\widehat{\calO}y$ generated by $y$. We've just seen that
    this ideal has nontrivial intersection with $\calO$, because it contains $MN>0$. Hence
    its intersection with $\calO$ is a nonzero left ideal of $\calO$, which is
    hence principal by corollary~\ref{Hurwitz.left_ideal_princ}. Write it as $\calO\alpha$
    with $0\not=\alpha\in\calO$.

    It suffices to show that $\calOhat\alpha=\calOhat y$. For this would imply that
    $u\alpha=y$ and $vy=\alpha$ for some $u,v\in\calOhat$ and thus $(vu-1)\alpha=0$
    and $(uv-1)y=0$, and both $\alpha$ and $y$ are left divisors of positive integers
    (the norm of $\alpha$, and $MN$ respectively), so now using the fact that $\calOhat$
    is $\Z$-torsion-free (is the tensor product of torsion-free abelian groups torsion-free? That
    would be a cheap way of doing it. Otherwise use $\calO=\Z^4$) we deduce that $u$ and $v$
    are units, and thus $x^{-1}=\frac{1}{M}u\alpha$ so $x=(M\alpha^{-1})v\in D^\times\calOhat^\times$.

    What remains is this. We have $y\in\calOhat$ which left and right divides some positive integer.
    We've defined $0\not=\alpha\in\calO$ such that $\calO\alpha$ is the pullback of the
    abelian group $\calOhat y$ along the map $\calO\to\calOhat$. We need to show that when we push
    this ideal $\calO\alpha$ forwards to $\calOhat$ we get $\calOhat y$ again. The fact that
    $\calOhat\alpha\subseteq\calOhat y$ is easy, because $\alpha\in\calOhat y$ by definition.
    So it remains to show that $y\in\calOhat\alpha$.

    Let's define $T$ to be a positive integer which is both a left and right multiple of
    both $y$ and $\alpha$ (for example $T=MN\alpha\overline{\alpha}$ will do). Now note that we
    have an isomorphism $\calO/T\calO=\calOhat/T\calOhat$, so we can choose
    some $\beta\in\calO$ such that $\beta-y\in T\calOhat$ is a multiple of $T$. Next note that
    $\beta\in y+\calOhat T\subset \calOhat y$ is in $\calOhat y\cap\calO=\calO\alpha$, meaning
    $\beta=\gamma\alpha$ for some $\gamma\in\calO$.
    Hence $y\in\beta+\calOhat T\subseteq\calOhat\alpha$.
\end{proof}
```
