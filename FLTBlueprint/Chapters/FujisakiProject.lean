import Verso
import VersoManual
import VersoBlueprint
import FLT.DivisionAlgebra.Finiteness
import FLTBlueprint.Citations

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Fujisaki's Lemma" =>

:::group "fujisaki_project"
Fujisaki's lemma packages the adelic compactness statement that underlies the
finiteness of many spaces of quaternionic automorphic forms.
:::

```tex
\section{The goal}

There is an idelic compactness statement which encapsulates both finiteness of the class
group of a number field and Dirichlet's units theorem about the rank of the unit group.
```

In fact there is even a noncommutative version of this statement. In John
Voight's book {Informal.citep voightBook}[] this is Main Theorem `27.6.14(a)`
and Voight calls it Fujisaki's lemma. I know nothing of the history but I'm
happy to adopt this name. In the quaternion algebra miniproject we will use
this compactness result to prove finite-dimensionality of a space of
quaternionic modular forms.

```tex
In fact there is even a noncommutative version of this statement. In John Voight's
book~\cite{voightbook} this is Main Theorem 27.6.14(a) and Voight calls it Fujisaki’s lemma.
I know nothing of the history but I'm happy to adopt this name. In the quaternion algebra
miniproject we will use this compactness result to prove finite-dimensionality of a
space of quaternionic modular forms.
```

The compact quotient theorem for a division algebra is meant to be the
noncommutative analogue of the classical compactness of
$`K \backslash \mathbf{A}_K`.

```tex
The compact quotient theorem for a division algebra is meant to be the
noncommutative analogue of the classical compactness of
$`K \backslash \mathbf{A}_K`.
```

The TeX chapter uses this analogy repeatedly. The quotient
$`K \backslash \mathbf{A}_K` is the model case: a global field
embedded discretely in its adeles with compact quotient. Fujisaki's lemma asks
for the same style of compactness after replacing the commutative additive group
by the norm-one units in an adelic division algebra.

```tex
The TeX chapter uses this analogy repeatedly. The quotient
$`K \backslash \mathbf{A}_K` is the model case: a global field
embedded discretely in its adeles with compact quotient. Fujisaki's lemma asks
for the same style of compactness after replacing the commutative additive group
by the norm-one units in an adelic division algebra.
```

# Initial definitions

Let `K` be a field. A central simple `K`-algebra is a `K`-algebra `B` not
necessarily commutative with centre `K` such that `B` has exactly two two-sided
ideals, namely `{0}` and `B`. We will be concerned only with central simple
`K`-algebras which are finite-dimensional as `K`-vector spaces, and when `K` is
clear we will just refer to them as central simple algebras. We remark that a
`4`-dimensional central simple algebra is called a quaternion algebra; we will
have more to say about these later on.

```tex
Let $K$ be a field. A \emph{central simple $K$-algebra} is a $K$-algebra~$B$ (not necessarily
commutative) with centre $K$ such that $B$ has exactly two two-sided ideals, namely ${0}$ and $B$
(or $\bot$ and $\top$, as Lean would call them). We will be concerned
only with central simple $K$-algebras which are finite-dimensional as $K$-vector spaces, and
when $K$ is clear we will just refer to them as central simple algebras. We remark that a
4-dimensional central simple algebra is called a \emph{quaternion algebra}; we will have
more to say about these later on.
```

Matrix algebras `M_n(K)` are examples of finite-dimensional central simple
`K`-algebras. If `K = ℂ` or more generally if `K` is algebraically closed, then
matrix algebras are the only finite-dimensional examples up to isomorphism.

```tex
Matrix algebras $M_n(K)$ are examples of finite-dimensional central simple $K$-algebras.
If $K=\bbC$ (or more generally if $K$ is algebraically closed)
then matrix algebras are the only finite-dimensional examples
up to isomorphism.
```

There are other examples over the reals: for example Hamilton's quaternions
`ℍ := ℝ ⊕ ℝ i ⊕ ℝ j ⊕ ℝ k` with the usual rules `i^2 = j^2 = k^2 = -1`,
`ij = -ji = k` and so on are an example of a central simple `ℝ`-algebra, and
matrix algebras over `ℍ` are other central simple `ℝ`-algebras. For a general
field `K` one can make an analogue of Hamilton's quaternions
`K ⊕ Ki ⊕ Kj ⊕ Kk` with the same multiplication rules to describe the
multiplication, and if the characteristic of `K` is not `2` then this is a
quaternion algebra which may or may not be isomorphic to `M_2(K)`.

```tex
There are other examples over the reals: for example Hamilton's quaternions
$\bbH:=\R\oplus\R i\oplus\R j\oplus\R k$ with the usual rules $i^2=j^2=k^2=-1$,
$ij=-ji=k$ etc, are an example of a central simple $\R$-algebra (and a quaternion algebra), and
matrix algebras over $\bbH$ are other central simple $\R$-algebras.
For a general field $K$
one can make an analogue of Hamilton's quaternions $K\oplus Ki\oplus Kj\oplus Kk$ with the
same multiplication rules ($i^2=-1$ and so on) to describe the multiplication, and if the characteristic
of~$K$ isn't 2
then this is a quaternion algebra (which may or may not be isomorphic to $M_2(K)$ in this
generality).
```

Some central simple algebras $`B` are division algebras, meaning that they are
division rings, or equivalently that every nonzero $`b\in B` has a two-sided
inverse. For example Hamilton's quaternions are a division algebra over
$`\R`, because
$`(x+yi+zj+tk)(x-yi-zj-tk)=x^2+y^2+z^2+t^2`, so the inverse of a nonzero
$`x+yi+zj+tk` is
$`(x-yi-zj-tk)/(x^2+y^2+z^2+t^2)`.

```tex
Some central simple algebras~$B$ are \emph{division algebras}, meaning that they are division
rings, or equivalently that every nonzero $b\in B$ has a two-sided inverse. For example
Hamilton's quaternions are a division algebra over $\R$,
because $(x+yi+zj+tk)(x-yi-zj-tk)=x^2+y^2+z^2+t^2$, so the inverse
of a nonzero $x+yi+zj+tk$ is $(x-yi-zj-tk)/(x^2+y^2+z^2+t^2)$.
```

However $`2\times 2` matrices over a field $`K`, whilst being a central
simple algebra over $`K`, are never a division algebra, because a nonzero
matrix with determinant zero such as
$`\begin{pmatrix}1&0\\0&0\end{pmatrix}` has no inverse.

```tex
However $2\times 2$ matrices over a field~$K$, whilst being a central simple algebra
over~$K$, are never a division algebra
(even if $K=\bbC$) because a nonzero matrix with determinant zero such as
$\begin{pmatrix}1&0\\0&0\end{pmatrix}$ has no inverse.
```

```tex
\section{Initial definitions}

Let $K$ be a field. A \emph{central simple $K$-algebra} is a $K$-algebra~$B$ (not necessarily
commutative) with centre $K$ such that $B$ has exactly two two-sided ideals, namely ${0}$ and $B$
(or $\bot$ and $\top$, as Lean would call them). We will be concerned
only with central simple $K$-algebras which are finite-dimensional as $K$-vector spaces, and
when $K$ is clear we will just refer to them as central simple algebras. We remark that a
4-dimensional central simple algebra is called a \emph{quaternion algebra}; we will have
more to say about these later on.

Matrix algebras $M_n(K)$ are examples of finite-dimensional central simple $K$-algebras.
If $K=\bbC$ (or more generally if $K$ is algebraically closed)
then matrix algebras are the only finite-dimensional examples
up to isomorphism. There are other examples over the reals: for example Hamilton's quaternions
$\bbH:=\R\oplus\R i\oplus\R j\oplus\R k$ with the usual rules $i^2=j^2=k^2=-1$,
$ij=-ji=k$ etc, are an example of a central simple $\R$-algebra (and a quaternion algebra), and
matrix algebras over $\bbH$ are other central simple $\R$-algebras.
For a general field $K$
one can make an analogue of Hamilton's quaternions $K\oplus Ki\oplus Kj\oplus Kk$ with the
same multiplication rules ($i^2=-1$ and so on) to describe the multiplication, and if the characteristic
of~$K$ isn't 2
then this is a quaternion algebra (which may or may not be isomorphic to $M_2(K)$ in this
generality).
```

# Enter the adeles

:::definition "adelic_division_algebra_setup" (parent := "fujisaki_project")
Let $`K` be a number field and let $`D/K` be a finite-dimensional central
simple $`K`-algebra (later on $`D` will be a division algebra, hence the
name, but we do not need this yet). Then $`D_{\A}:=D\otimes_K\A_K` is an
$`\A_K`-algebra which is free of finite rank, and if we give $`D_{\A}` the
$`\A_K`-module topology then it is a topological ring. Furthermore
$`D_{\A}` is free of finite rank over the locally compact topological ring
$`\A_K` and is thus also locally compact. So by the theory of Haar characters
there is a canonical character
$`\delta_{D_{\A}}:D_{\A}^\times\to\R_{>0}` measuring how left multiplication
by an element of $`D_{\A}^\times` changes the additive Haar measure on
$`D_{\A}`. Let $`D_{\A}^{(1)}` denote the kernel of $`\delta_{D_{\A}}`, and
give it the subspace topology coming from $`D_{\A}^\times`.
:::

```tex
Let $K$ be a number field and let $D/K$ be a finite-dimensional central simple $K$-algebra
(later on $D$ will be a division algebra (hence the name) but we do not need this yet).
Then $D_{\A}:=D\otimes_K\A_K$ is an $\A_K$-algebra which
is free of finite rank, and if we give $D_{\A}$ the $\A_K$-module topology then it is
a topological ring (by results in mathlib). Furthermore $D_{\A}$ is free of finite
rank over the locally compact topological ring $\A_K$ and is thus also
locally compact. So by the theory of Haar characters (see Chapter~\ref{Haar_char_project})
there is a canonical character $\delta_{D_{\A}}:D_{\A}^\times\to\R_{>0}$ measuring
how left multiplication by an element of $D_{\A}^\times$ changes the additive Haar
measure on $D_{\A}$. Let $D_{\A}^{(1)}$ denote the kernel of $\delta_{D_{\A}}$,
and give it the subspace topology coming from $D_{\A}^\times$.
```

One can furthermore check that if $`R` is a finite $`K`-algebra then the
$`\A_K`-module topologies and $`\A_{\Q}`-module topologies on $`R_{\A}`
coincide. Indeed, the topology on $`\A_K` is the $`\A_{\Q}`-module topology,
as $`\A_K=\A_{\Q}\otimes_{\Q}K` as topological $`\A_{\Q}`-algebras, where the
right hand side has the $`\A_{\Q}`-module topology by definition.

```tex
One can furthermore check that if $R$ is a finite $K$-algebra then the $\A_K$-module topologies and $\A_{\Q}$-module
topologies on $R_{\A}$ coincide. Indeed, the topology on $\A_K$
is the $\A_{\Q}$-module topology, as
$\A_K=\A_{\Q}\otimes_{\Q}K$ as topological $\A_{\Q}$-algebras, where the right hand side
has the $\A_{\Q}$-module topology by definition.
```

```tex
\section{Enter the adeles}

The adeles of a number field are discussed in far more detail
in the adele miniproject \ref{Adele_miniproject}. We just recall here that if $K$ is a number field
then there are two huge commutative topological $K$-algebras called the \emph{finite adeles}
$\A_K^\infty$ and the \emph{adeles} $\A_K$ of $K$, and that they're both locally compact
as topological spaces. We also know from theorem~\ref{NumberField.AdeleRing.baseChangeEquiv}
that $\A_K\cong K\otimes_{\Q}\A_{\Q}K$ (both topologically and algebraically), meaning
that if $R$ is a $K$-algebra then $R_{\A} := R\otimes_K\A_K$ is naturally isomorphic
to $R\otimes_{\Q}\A_{\Q}$. One can
furthermore check that if $R$ is a finite $K$-algebra then the $\A_K$-module topologies and $\A_{\Q}$-module
topologies on $R_{\A}$ coincide. Indeed, the topology on $\A_K$
is the $\A_{\Q}$-module topology, as
$\A_K=\A_{\Q}\otimes_{\Q}K$ as topological $\A_{\Q}$-algebras, where the right hand side
has the $\A_{\Q}$-module topology by definition.
```

# The proof

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE")
There's a compact subset $`E` of $`D_A` with the property that for all
$`x\in D_A^{(1)}`, the obvious map $`xE\to D\backslash D_A` is not injective.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \leanok
  There's a compact subset $E$ of $D_{\A}$
  with the property that for all $x\in D_{\A}^{(1)}$,
  the obvious map $xE\to D\backslash D_{\A}$ is not injective.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE"
{uses "NumberField.AdeleRing.discrete"}[]
{uses "Rat.AdeleRing.cocompact"}[]
We know that if we pick a $`\Q`-basis for $`D` of size $`d` then this
identifies $`D` with $`\Q^d`, $`D_{\A}` with $`\A_{\Q}^d`, and
$`D\backslash D_{\A}` with $`(\Q\backslash\A_{\Q})^d`. Now $`\Q` is
discrete in $`\A_{\Q}` by theorem `NumberField.AdeleRing.discrete`, and the
quotient $`\Q\backslash \A_{\Q}` is compact by theorem
`Rat.AdeleRing.cocompact`. Hence $`D` is discrete in $`D_{\A}` and the
quotient $`D\backslash D_{\A}` is compact.

Fix a Haar measure $`\mu` on $`D_{\A}` and push it forward to
$`D\backslash D_{\A}`; by compactness this quotient has finite and positive
measure, say $`m\in\R_{>0}`. Choose any compact $`E\subseteq D_{\A}` with
measure $`>m` (for example, choose a $`\Z`-lattice $`L\cong\Z^d` in
$`D\cong\Q^d`, define $`E_f:=\prod_p L_p\in D\otimes_{\Q}\A_{\Q}^\infty`, and
define $`E_{\infty}\subseteq D\otimes_{\Q}\R\cong\R^n` to be a huge closed
ball, large enough to ensure the measure of $`E:=E_f\times E_{\infty}` is
bigger than $`m`). Then $`\mu(xE)=\mu(E)>m` so the map can't be injective.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE" (slot := proof)
\begin{proof}
  \leanok
  We know that if we pick a $\Q$-basis for $D$
  of size $d$ then this identifies $D$ with $\Q^d$,
  $D_{\A}$ with $\A_{\Q}^d$, and $D\backslash D_{\A}$ with
  $(\Q\backslash\A_{\Q})^d$. Now $\Q$ is discrete in $\A_{\Q}$
  by theorem~\ref{NumberField.AdeleRing.discrete}, and the quotient
  $\Q\backslash \A_{\Q}$ is compact by theorem~\ref{Rat.AdeleRing.cocompact}.
  Hence $D$ is discrete in $D_{\A}$
  and the quotient $D\backslash D_{\A}$ is compact.

    Fix a Haar measure $\mu$ on $D_{\A}$ and push it forward
    to $D\backslash D_{\A}$; by compactness this quotient has finite
    and positive measure, say $m\in\R_{>0}$.
    Choose any compact $E\subseteq D_{\A}$ with measure $> m$
    (for example, choose a $\Z$-lattice $L\cong\Z^d$ in $D\cong\Q^d$,
    define $E_f:=\prod_p L_p\in D\otimes_{\Q}\A_{\Q}^\infty$,
    and define $E_{\infty}\subseteq D\otimes_{\Q}\R\cong\R^n$ to be a huge closed
    ball, large enough to ensure the measure of $E:=E_f\times E_{\infty}$ is bigger than $m$).
    Then $\mu(xE)=\mu(E)>m$ so the map can't be injective.
\end{proof}
```

:::definition "NumberField.AdeleRing.DivisionAlgebra.Aux.E" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.E")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE"}[]
We let `E` denote any compact set satisfying the hypothesis of the previous lemma.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.E" (slot := statement)
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \leanok
  We let $E$ denote any compact set satisfying the hypothesis of the previous lemma.
\end{definition}
```

:::definition "NumberField.AdeleRing.DivisionAlgebra.Aux.X" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.X")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.E"}[]
Define $`X:=E-E:=\{e-f:e,f\in E\}\subseteq D_{\A}`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X" (slot := statement)
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  \leanok
Define $X:=E-E:=\{e-f:e,f\in E\}\subseteq D_{\A}$.
\end{definition}
```

:::definition "NumberField.AdeleRing.DivisionAlgebra.Aux.Y" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.Y")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X"}[]
Define $`Y:=X.X:=\{xy:x,y\in X\}\subseteq D_{\A}`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.Y" (slot := statement)
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
Define $Y:=X.X:=\{xy:x,y\in X\}\subseteq D_{\A}$.
\end{definition}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X"}[]
$`X` is a compact subset of $`D_{\A}`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
  $X$ is a compact subset of $D_{\A}$.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact"
It's the continuous image of the compact set $`E\times E`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact" (slot := proof)
\begin{proof}
  \leanok
  It's the continuous image of the compact set~$E\times E$.
\end{proof}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.Y"}[]
$`Y` is a compact subset of $`D_{\A}`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \leanok
  $Y$ is a compact subset of $D_{\A}$.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact"
It's the continuous image of the compact set $`X\times X`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact" (slot := proof)
\begin{proof}
  \leanok
  It's the continuous image of the compact set~$X\times X$.
\end{proof}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X"}[]
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.E"}[]
If $`\beta\in D_{\A}^{(1)}` then $`\beta X\cap D^\times\not=\emptyset`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X, NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  % TODO I used E in the statement of the lemma here
  \leanok
  If $\beta\in D_{\A}^{(1)}$ then
$\beta X\cap D^\times\not=\emptyset$.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel"
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE"}[]
Indeed by the previous lemma, the
map $`\beta E\to D\backslash D_{\A}` is not injective, so there are distinct
$`\beta e_1,\beta e_2\in \beta E` with $`e_i\in E` and
$`\beta e_1-\beta e_2=b\in D`. Now $`b\not=0` and $`D` is a division
algebra, so $`b\in D^\times`. And $`e_1-e_2\in X` so
$`b=\beta(e_1-e_2)\in \beta X`, so we are done.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel" (slot := proof)
\begin{proof}
  \leanok
Indeed by lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE},
the map $\beta E\to D\backslash D_{\A}$
isn't injective, so there are distinct
$\beta e_1,\beta e_2\in \beta E$ with $e_i\in E$ and
$\beta e_1-\beta e_2=b\in D$.
Now $b\not=0$ and $D$ is a division algebra, so $b\in D^\times$.
And $e_1-e_2\in X$ so $b=\beta(e_1-e_2)\in \beta X$, so we're done.
\end{proof}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X"}[]
Similarly, if $`\beta\in D_{\A}^{(1)}` then
$`X\beta^{-1}\cap D^\times\not=\emptyset`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
  Similarly, if $\beta\in D_{\A}^{(1)}$ then
  $X\beta^{-1}\cap D^\times\not=\emptyset$.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'"
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.E"}[]
{uses "NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul"}[]
Indeed, $`\beta^{-1}\in D_{\A}^{(1)}`, and so left multiplication by
$`\beta^{-1}` does not change Haar measure on $`D_{\A}`, so neither does
right multiplication (by theorem
`NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul`).
So the same argument works: $`E\beta^{-1}\to D\backslash D_{\A}` is not
injective so choose $`e_1\beta^{-1}\not=e_2\beta^{-1}` with difference
$`b\in D` and then $`(e_1-e_2)\beta^{-1}\in D-\{0\}=D^\times`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'" (slot := proof)
\begin{proof}
  \leanok
  % TODO does this make the lines dottted? I used E in the proof here
  % TODO does \uses a theorem from another project mess up the colouring?
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.E, NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}
  Indeed, $\beta^{-1}\in D_{\A}^{(1)}$, and so left multiplication by $\beta^{-1}$
  doesn't change Haar measure on $D_{\A}$, so neither does right multiplication
  (by theorem~\ref{NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}).
  So the same argument works: $E\beta^{-1}\to D\backslash D_{\A}$ is not
  injective so choose $e_1\beta^{-1}\not=e_2\beta^{-1}$ with difference $b\in D$
  and then $(e_1-e_2)\beta^{-1}\in D-{0}=D^\times$.
\end{proof}
```

:::definition "NumberField.AdeleRing.DivisionAlgebra.Aux.T" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.T")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.Y"}[]
Let `T = Y ∩ D^×`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.T" (slot := statement)
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.T}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.T}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \leanok
  Let $T:=Y\cap D^\times$.
\end{definition}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.T"}[]
The set `T` is finite.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.T}
  \leanok
  $T$ is finite.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite"
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact"}[]
It suffices to prove that $`Y\cap D` is finite. But
$`D\subseteq D_{\A}` is a discrete additive subgroup, and hence closed. And
$`Y\subseteq D_{\A}` is compact. So $`D\cap Y` is compact and discrete, so
finite.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite" (slot := proof)
\begin{proof}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}
  \leanok
  % TODO I used T in both the theorem and proof this time!
  It suffices to prove that $Y\cap D$ is finite.
    But $D\subseteq D_{\A}$ is a discrete additive subgroup, and hence closed.
    And $Y\subseteq D_{\A}$ is compact.
    So $D\cap Y$ is compact and discrete, so finite.
\end{proof}
```

:::definition "NumberField.AdeleRing.DivisionAlgebra.Aux.C" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.C")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.T"}[]
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X"}[]
Define the compact constraint set
$`C = (T^{-1} X) \times X \subseteq D_A \times D_A`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.C" (slot := statement)
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.T,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
  Define $C:= (T^{-1}.X) \times X\subset D_{\A}\times D_{\A}$.
\end{definition}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.C"}[]
The set `C` is compact.
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite"}[]
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact"}[]
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C,
    NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \leanok
  $C$ is compact.
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact"
`X` is compact and `T` is finite.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact" (slot := proof)
\begin{proof}
  \leanok
  $X$ is compact and $T$ is finite.
\end{proof}
```

:::lemma_ "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C")
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.C"}[]
For every $`\beta \in D_A^{(1)}`, there exist `b ∈ D^×` and `ν ∈ D_A^{(1)}`
such that `β = bν` and `(ν, ν⁻¹) ∈ C`.
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C" (slot := statement)
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \leanok
  For every $\beta\in D_{\A}^{(1)}$, there exists $b\in D^\times$
  and $\nu\in D_{\A}^{(1)}$ such that $\beta=b\nu$ and $(\nu,\nu^{-1})\in C.$
\end{lemma}
```

:::proof "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C"
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.C"}[]
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.E"}[]
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel"}[]
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'"}[]
{uses "NumberField.AdeleRing.units_mem_ringHaarCharacter_ker"}[]

By lemma `NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel`,
$`\beta X\cap D^\times\not=\emptyset`, and lemma
`NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'`,
$`X\beta^{-1}\cap D^\times\not=\emptyset`, so we can write
$`\beta x_1=b_1` and $`x_2\beta^{-1}=b_2` with $`b_i\in D^\times` and
$`x_i\in X`. Note that $`\beta\in D_{\A}^{(1)}` and
$`b_i\in D^{\times}\subseteq D_{\A}^{(1)}` by corollary
`NumberField.AdeleRing.units_mem_ringHaarCharacter_ker`, so $`x_i\in D_{\A}^{(1)}`
as well. In particular $`x_i\in D_{\A}^\times` so $`x_1^{-1}` makes sense.

Multiplying the equations defining the $`x_i` and $`b_i` we deduce that
$`x_2x_1=b_2b_1\in Y\cap D^\times=T` (recall that $`Y=X.X` and
$`T=Y\cap D^\times` is finite); call this element $`t`. Then
$`x_1^{-1}=t^{-1}x_2\in T^{-1}.X`, and $`x_1\in X`, so if we set
$`\nu=x_1^{-1}\in D_{\A}^{(1)}` and $`b=b_1\in D^\times` then we have
$`\beta=b\nu` and $`(\nu,\nu^{-1})\in C := (T^{-1}.X)\times X`. We are done!
:::

```tex "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C" (slot := proof)
\begin{proof}
  \leanok
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.E,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel',
    NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  By lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel},
  $\beta X\cap D^\times\not=\emptyset$,
  and lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'},
  $X\beta^{-1}\cap D^\times\not=\emptyset$,
  so we can write $\beta x_1=b_1$ and $x_2\beta^{-1}=b_2$ with $b_i\in D^\times$ and $x_i\in X$.
  Note that $\beta\in D_{\A}^{(1)}$ and $b_i\in D^{\times}\subseteq D_{\A}^{(1)}$ by
  corollary~\ref{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}, so $x_i\in D_{\A}^{(1)}$
  as well. In particular $x_i\in D_{\A}^\times$ so $x_1^{-1}$ makes sense.

  Multiplying the equations defining the $x_i$ and $b_i$ we deduce that
  $x_2x_1=b_2b_1\in Y\cap D^\times=T$ (recall that $Y=X.X$ and $T=Y\cap D^\times$
  is finite); call this element $t$. Then $x_1^{-1}=t^{-1}x_2\in T^{-1}.X$,
  and $x_1\in X$, so if we set $\nu=x_1^{-1}\in D_{\A}^{(1)}$
  and $b=b_1\in D^\times$ then we have $\beta=b\nu$ and $(\nu,\nu^{-1})\in C := (T^{-1}.X)\times X$.
  We are done!
\end{proof}
```

:::theorem "compact_quotient_for_division_algebra" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.compact_quotient")
If $`D` is a division algebra then the quotient
$`D^\times\backslash D_{\A}^{(1)}` with its quotient topology coming from
$`D_{\A}^{(1)}` is compact.
:::

```tex "compact_quotient_for_division_algebra" (slot := statement)
\begin{theorem}
  \label{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \lean{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \leanok
  If $D$ is a division algebra then
  the quotient $D^\times\backslash D_{\A}^{(1)}$
  with its quotient topology coming from $D_{\A}^{(1)}$, is compact.
\end{theorem}
```

:::proof "compact_quotient_for_division_algebra"
{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact"}[]
Indeed, if `M` is the preimage of `C` under the inclusion
`D_A^{(1)} \to D_A \times D_A` sending `ν` to `(ν, ν⁻¹)`, then `M` is a
closed subspace of a compact space so it's compact (note that `δ_{D_A}` is
continuous, by {uses "MeasureTheory.ringHaarChar_continuous"}[], so
`D_A^{(1)}` is a closed subset of `D_A^\times` which is itself a closed subset
of `D_A \times D_A`).

{uses "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C"}[] shows that `M` surjects onto
`D^\times \backslash D_A^{(1)}` which is thus also compact.
:::

```tex "compact_quotient_for_division_algebra" (slot := proof)
\begin{proof}
  \proves{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \leanok
  \uses{MeasureTheory.ringHaarChar_continuous,
    NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C,
    NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  Indeed, if $M$ is the preimage of $C$ under the inclusion $D_{\A}^{(1)} \to D_{\A}\times D_{\A}$
  sending $\nu$ to $(\nu,\nu^{-1})$, then $M$ is a closed subspace
    of a compact
  space so it's compact (note that $\delta_{D_{\A}}$ is continuous,
  by theorem~\ref{MeasureTheory.ringHaarChar_continuous}, so $D_{\A}^{(1)}$ is a closed subset of
  $D_{\A}^\times$ which is itself a closed subset of $D_{\A}\times D_{\A}$).
  Lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C} shows that $M$ surjects onto
  $D^\times\backslash D_{\A}^{(1)}$ which is thus also compact.
\end{proof}
```

```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C,
    NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \leanok
  $C$ is compact.
\end{lemma}
\begin{proof}
  \leanok
   $X$ is compact and $T$ is finite.
\end{proof}

\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \leanok
  For every $\beta\in D_{\A}^{(1)}$, there exists $b\in D^\times$
  and $\nu\in D_{\A}^{(1)}$ such that $\beta=b\nu$ and $(\nu,\nu^{-1})\in C.$
\end{lemma}
\begin{proof}
  \leanok
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.E,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel',
    NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  By lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel},
  $\beta X\cap D^\times\not=\emptyset$,
  and lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'},
  $X\beta^{-1}\cap D^\times\not=\emptyset$,
  so we can write $\beta x_1=b_1$ and $x_2\beta^{-1}=b_2$ with $b_i\in D^\times$ and $x_i\in X$.
  Note that $\beta\in D_{\A}^{(1)}$ and $b_i\in D^{\times}\subseteq D_{\A}^{(1)}$ by
  corollary~\ref{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}, so $x_i\in D_{\A}^{(1)}$
  as well. In particular $x_i\in D_{\A}^\times$ so $x_1^{-1}$ makes sense.

  Multiplying the equations defining the $x_i$ and $b_i$ we deduce that
  $x_2x_1=b_2b_1\in Y\cap D^\times=T$ (recall that $Y=X.X$ and $T=Y\cap D^\times$
  is finite); call this element $t$. Then $x_1^{-1}=t^{-1}x_2\in T^{-1}.X$,
  and $x_1\in X$, so if we set $\nu=x_1^{-1}\in D_{\A}^{(1)}$
  and $b=b_1\in D^\times$ then we have $\beta=b\nu$ and $(\nu,\nu^{-1})\in C := (T^{-1}.X)\times X$.
  We are done!
\end{proof}

We can now prove Fujisaki's theorem~\ref{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}.

\begin{proof}
  \proves{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \leanok
  \uses{MeasureTheory.ringHaarChar_continuous,
    NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C,
    NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  Indeed, if $M$ is the preimage of $C$ under the inclusion $D_{\A}^{(1)} \to D_{\A}\times D_{\A}$
  sending $\nu$ to $(\nu,\nu^{-1})$, then $M$ is a closed subspace
    of a compact
  space so it's compact (note that $\delta_{D_{\A}}$ is continuous,
  by theorem~\ref{MeasureTheory.ringHaarChar_continuous}, so $D_{\A}^{(1)}$ is a closed subset of
  $D_{\A}^\times$ which is itself a closed subset of $D_{\A}\times D_{\A}$).
  Lemma~\ref{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C} shows that $M$ surjects onto
  $D^\times\backslash D_{\A}^{(1)}$ which is thus also compact.
\end{proof}

We note here some useful consequences.

\begin{theorem}
  \label{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \lean{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \leanok
  $D^\times\backslash(D\otimes_K\A_K^\infty)^\times$ is compact.
\end{theorem}
\begin{proof}
  \uses{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \leanok
There's a natural map $\alpha$ from $D^\times\backslash D_{\A}^{(1)}$ to
  $D^\times\backslash (D\otimes_K \A_K^\infty)^\times$. We claim that it's
  surjective. Granted this claim, we are home, because if we put the quotient
  topology on $D^\times\backslash (D\otimes_K \A_K^\infty)^\times$ coming from
  $(D\otimes_K \A_K^\infty)^\times$ then it's readily verified that $\alpha$
  is continuous, and the continuous image of a compact space is compact.

  As for surjectivity: say $x\in (D\otimes_K \A_K^\infty)^\times$. We need to extend
  $x$ to an element $(x,y)\in (D\otimes_K \A_K^\infty)^\times\times(D\otimes_K K_\infty)^\times$
  which is in the kernel of $\delta_{D_{\A}}$. Because $\delta_{D_{\A}}(x,1)$ is some positive
  real number, it will suffice to show that if $r$ is any positive real number then we can
  find $y\in (D\otimes_K \A_K^\infty)^\times=(D\otimes_{\Q}\R)^\times$ with $\delta_{D_{\A}}(1,y)=r$,
  or equivalently (setting $D_{\R}=D\otimes_{\Q}\R$) that $\delta_{D_{\R}}(y)=r$.
  But $D\not=0$ as it is a division algebra,and hence $\Q\subseteq D$, meaning
  $\R\subseteq D_{\R}$, and if
  $x\in\R^\times\subseteq D_{\R}^\times$ then $\delta(x)=|x|^d$ with $d=\dim_{\Q}(D)$,
  as multiplication by $x$ is just scaling by a factor of $x$ on $D_{\R}\cong\R^d$.
  In particular we can set $x=y^{1/d}$.
\end{proof}
\begin{remark} In this generality the quotient might not be Hausdorff.
\end{remark}

\begin{theorem}
  \label{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  \lean{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  \uses{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \leanok
  If $U$ is an open subgroup of $(D\otimes_K \A_K^\infty)^\times$
  then the double coset space $D^\times\backslash(D\otimes_K \A_K^\infty)^\times/U$ is finite.
\end{theorem}
\begin{proof}
  \leanok
  The double cosets give a disjoint open cover of $(D\otimes_K \A_K^\infty)$
  which descends to a disjoint open cover of the quotient space
  $D^\times\backslash(D\otimes_K \A_K^\infty)^\times$. However this space is compact
  by theorem~\ref{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}.
\end{proof}
```

We note here some useful consequences.

```tex
We note here some useful consequences.
```

:::theorem "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact" (parent := "fujisaki_project") (lean := "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact")
The quotient
$`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times`
is compact.
:::

```tex "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact" (slot := statement)
\begin{theorem}
  \label{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \lean{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \leanok
  $D^\times\backslash(D\otimes_K\A_K^\infty)^\times$ is compact.
\end{theorem}
```

:::proof "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact"
{uses "NumberField.AdeleRing.DivisionAlgebra.compact_quotient"}[]
There's a natural map `α` from
`D^\times \backslash D_A^{(1)}` to
`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times`. We claim that
it's surjective. Granted this claim, we are home, because if we put the
quotient topology on
`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times` coming from
`(D \otimes_K \mathbf{A}_K^\infty)^\times` then it's readily verified that `α`
is continuous, and the continuous image of a compact space is compact.

As for surjectivity: say
`x ∈ (D \otimes_K \mathbf{A}_K^\infty)^\times`. We need to extend `x` to an
element
`(x,y) ∈ (D \otimes_K \mathbf{A}_K^\infty)^\times × (D \otimes_K K_\infty)^\times`
which is in the kernel of `δ_{D_A}`. Because `δ_{D_A}(x,1)` is some positive
real number, it will suffice to show that if `r` is any positive real number
then we can find
`y ∈ (D \otimes_K \mathbf{A}_K^\infty)^\times = (D \otimes_\mathbf{Q} \mathbf{R})^\times`
with `δ_{D_A}(1,y)=r`, or equivalently, setting
`D_\mathbf{R} = D \otimes_\mathbf{Q} \mathbf{R}`, that `δ_{D_\mathbf{R}}(y)=r`.
But `D ≠ 0` as it is a division algebra, and hence
`\mathbf{Q} \subseteq D`, meaning `\mathbf{R} \subseteq D_\mathbf{R}`, and if
`x ∈ \mathbf{R}^\times \subseteq D_\mathbf{R}^\times` then
`δ(x)=|x|^d` with `d = \dim_\mathbf{Q}(D)`, as multiplication by `x` is just
scaling by a factor of `x` on `D_\mathbf{R}\cong\mathbf{R}^d`. In particular
we can set `x=y^{1/d}`.
:::

```tex "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact" (slot := proof)
\begin{proof}
  \uses{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \leanok
There's a natural map $\alpha$ from $D^\times\backslash D_{\A}^{(1)}$ to
  $D^\times\backslash (D\otimes_K \A_K^\infty)^\times$. We claim that it's
  surjective. Granted this claim, we are home, because if we put the quotient
  topology on $D^\times\backslash (D\otimes_K \A_K^\infty)^\times$ coming from
  $(D\otimes_K \A_K^\infty)^\times$ then it's readily verified that $\alpha$
  is continuous, and the continuous image of a compact space is compact.

  As for surjectivity: say $x\in (D\otimes_K \A_K^\infty)^\times$. We need to extend
  $x$ to an element $(x,y)\in (D\otimes_K \A_K^\infty)^\times\times(D\otimes_K K_\infty)^\times$
  which is in the kernel of $\delta_{D_{\A}}$. Because $\delta_{D_{\A}}(x,1)$ is some positive
  real number, it will suffice to show that if $r$ is any positive real number then we can
  find $y\in (D\otimes_K \A_K^\infty)^\times=(D\otimes_{\Q}\R)^\times$ with $\delta_{D_{\A}}(1,y)=r$,
  or equivalently (setting $D_{\R}=D\otimes_{\Q}\R$) that $\delta_{D_{\R}}(y)=r$.
  But $D\not=0$ as it is a division algebra,and hence $\Q\subseteq D$, meaning
  $\R\subseteq D_{\R}$, and if
  $x\in\R^\times\subseteq D_{\R}^\times$ then $\delta(x)=|x|^d$ with $d=\dim_{\Q}(D)$,
  as multiplication by $x$ is just scaling by a factor of $x$ on $D_{\R}\cong\R^d$.
  In particular we can set $x=y^{1/d}$.
\end{proof}
```

:::theorem "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset" (parent := "fujisaki_project") (lean := "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset")
{uses "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact"}[]
If `U` is an open subgroup of
$`(D \otimes_K \mathbf{A}_K^\infty)^\times`, then the double coset space
$`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times / U`
is finite.
:::

```tex "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset" (slot := statement)
\begin{theorem}
  \label{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  \lean{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  \uses{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \leanok
  If $U$ is an open subgroup of $(D\otimes_K \A_K^\infty)^\times$
  then the double coset space $D^\times\backslash(D\otimes_K \A_K^\infty)^\times/U$ is finite.
\end{theorem}
```

:::proof "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset"
{uses "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact"}[]
The double cosets give a disjoint open cover of
$`(D\otimes_K \A_K^\infty)` which descends to a disjoint open cover of the
quotient space $`D^\times\backslash(D\otimes_K \A_K^\infty)^\times`. However
this space is compact by theorem
`NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact`.
:::

```tex "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset" (slot := proof)
\begin{proof}
  \leanok
  The double cosets give a disjoint open cover of $(D\otimes_K \A_K^\infty)$
  which descends to a disjoint open cover of the quotient space
  $D^\times\backslash(D\otimes_K \A_K^\infty)^\times$. However this space is compact
  by theorem~\ref{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}.
\end{proof}
```
