import FLTBlueprint.Citations
import FLT.GlobalLanglandsConjectures.GLnDefs
import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Automorphic forms and the Langlands Conjectures" =>

:::group "gln_langlands_program"
This chapter came from discussions between Patrick, Mario and myself, all
currently visiting the Hausdorff Research Institute for Mathematics in Bonn.
The ultimate goal is to formally state some version of the global Langlands
reciprocity conjectures for `GL_n` over `Q`.
:::

```tex
\chapter{Automorphic forms and the Langlands Conjectures}

This chapter came from discussions between Patrick, Mario and myself, all currently
visiting the Hausdorff Research Institute for
Mathematics in Bonn. The ultimate goal is to formally state some version of the global Langlands
reciprocity conjectures for $\GL_n$ over $\Q$.
```

# Definition of an automorphic form for GLn over Q

The global Langlands reciprocity conjectures relate automorphic forms to Galois
representations. The statements for a general connected reductive group involve
the construction of the Langlands dual group, and we do not have quite enough
Lie algebra theory to push this definition through in general. However if we
restrict the special case of the group $`\GL_n/\Q`, the dual group is just
$`\GL_n(\bbC)` and several other technical obstructions are also removed. In
this section we will explain the definition of an automorphic form for the
group $`\GL_n/\Q`, following the exposition by Borel and Jacquet in Corvallis
{Informal.citep corvallisAutomorphicForms}[].

```tex
The global Langlands reciprocity conjectures relate automorphic forms to Galois representations.
The statements for a general connected reductive group involve the construction of the Langlands
dual group, and we do not have quite enough Lie algebra theory to push this definition through
in general. However if we restrict the special case of the group $\GL_n/\Q$, the dual group
is just $\GL_n(\bbC)$ and several other technical obstructions are also removed. In this
section we will explain the definition of an automorphic form for the group $\GL_n/\Q$, following
the exposition by Borel and Jacquet in Corvallis.
```

# The Finite Adeles Of The Rationals

Mathlib already has the definition of the finite adeles $`\A_{\Q}^f` of the
rationals as a commutative $`\Q`-algebra, and the proof that it's a
topological ring.

```tex
Mathlib already has the definition of the finite adeles $\A_{\Q}^f$ of the rationals as a
commutative $\Q$-algebra, and the proof that it's a topological ring.
```

# The Group GLn Of The Adeles

The adeles $`\A_{\Q}` of $`\Q` are the product $`\A_{\Q}^f \times \R`, with the
product topology. They are a topological ring. Hence
$`\GL_n(\A_{\Q}) = \GL_n(\A_{\Q}^f) \times \GL_n(\R)` is a topological group,
where we are being a bit liberal with our use of the equality symbol.

```tex
The adeles $\A_{\Q}$ of $\Q$ are the product $\A_{\Q}^f\times\R$, with the product topology.
They are a topological ring. Hence $\GL_n(\A_{\Q})=\GL_n(\A_{\Q}^f)\times\GL_n(\R)$ is a
topological group, where we are being a bit liberal with our use of the equality symbol.
```

# Smooth Functions

:::definition "smooth_gln_function" (parent := "gln_langlands_program")
A function $`f : \GL_n(\A_{\Q}^f) \times \GL_n(\R) \to \bbC` is smooth if it has
the following three properties:

1. $`f` is continuous.
2. For all $`x \in \GL_n(\A_{\Q}^f)`, the function $`y \mapsto f(x,y)` is smooth.
3. For all $`y \in \GL_n(\R)`, the function $`x \mapsto f(x,y)` is locally constant.
:::

```tex
\section{Smooth functions}

\begin{definition}
  \label{AutomorphicForm.GLn.IsSmooth}
  A function $f:\GL_n(\A_{\Q}^f)\times\GL_n(\R)\to\bbC$ is \emph{smooth}
  if it has the following three properties.

  \begin{enumerate}
    \item $f$ is continuous.
    \item For all $x\in\GL_n(\A_{\Q}^f)$, the function $y\mapsto f(x,y)$ is smooth.
    \item For all $y\in\GL_n(\R)$, the function $x\mapsto f(x,y)$ is locally constant.
  \end{enumerate}
\end{definition}
```

Current state of this definition: I've half-formalised it; I don't know how to
say the the function is smooth on the infinite part, because I have never used
the manifold library before and I have no idea what my model with corners is
supposed to be.

```tex
Current state of this definition: I've half-formalised it; I don't know how to
say the the function is smooth on the infinite part, because I have never used
the manifold library before and I have no idea what my model with corners is
supposed to be.
```

# Slowly-Increasing Functions

Automorphic representations satisfy a growth condition which we may as well
factor out into a separate definition.

```tex
Automorphic representations satisfy a growth condition which we may as well
factor out into a separate definition.
```

We define the following temporary ``size'' function $`s : \GL_n(\R) \to \R``
by $`s(M) = \operatorname{trace}(MM^T + M^{-1}M^{-T})`, where $`M^{-T}`
denotes inverse-transpose. Note that $`s(M)` is always positive, and is large
if $`M` has a very large or very small, in absolute value, eigenvalue.

```tex
Automorphic representations satisfy a growth condition which we may as well
factor out into a separate definition.

We define the following temporary size function $s : \GL_n(\R) \to \R$ by
$s(M) = \operatorname{trace}(MM^T + M^{-1}M^{-T})$, where $M^{-T}$ denotes
inverse-transpose. Note that $s(M)$ is always positive, and is large if $M$
has a very large or very small, in absolute value, eigenvalue.
```

:::definition "AutomorphicForm.GLn.IsSlowlyIncreasing" (parent := "gln_langlands_program") (lean := "AutomorphicForm.GLn.IsSlowlyIncreasing")
We say that a function $`f : \GL_n(\R) \to \bbC` is slowly-increasing if there
is some real constant $`C` and positive integer $`n` such that
$`|f(M)| \leq C s(M)^n` for all $`M \in \GL_n(\R)`.
:::

```tex "AutomorphicForm.GLn.IsSlowlyIncreasing" (slot := statement)
\begin{definition}
  \label{AutomorphicForm.GLn.IsSlowlyIncreasing}
  \lean{AutomorphicForm.GLn.IsSlowlyIncreasing}
  \leanok
  We say that a function $f:\GL_n(\R)\to\bbC$ is \emph{slowly-increasing}
  if there's some real constant $C$ and positive integer $n$ such that $|f(M)|\leq Cs(M)^n$
  for all $M\in\GL_n(\R)$.
\end{definition}
```

Note: the book says $`n` is positive, but $`\{M|s(M)\leq 1\}` is compact so I
don't think it makes any difference.

```tex
Note: the book says $n$ is positive, but $\{M|s(M)\leq 1\}$ is compact so I
don't think it makes any difference.
```

# Weights At Infinity

:::definition "AutomorphicForm.GLn.Weight" (parent := "gln_langlands_program") (lean := "AutomorphicForm.GLn.Weight")
The weight of an automorphic form for $`\GL_n/\Q` can be thought of as a
finite-dimensional continuous complex representation $`\rho` of a maximal
compact subgroup of $`\GL_n(\R)`, and it's convenient to choose one (they're
all conjugate) so we choose $`O_n(\R)`.
:::

```tex
\section{Weights at infinity}

\begin{definition}
  \label{AutomorphicForm.GLn.Weight}
  \lean{AutomorphicForm.GLn.Weight}

The \emph{weight} of an automorphic form for $\GL_n/\Q$ can be thought of as a finite-dimensional
continuous complex representation $\rho$ of a maximal compact subgroup of $\GL_n(\R)$,
and it's convenient to choose one (they're all conjugate) so we choose $O_n(\R)$.
\end{definition}
```

The Lean definition is incomplete right now -- I don't demand irreducibility
(I wasn't sure whether I was doing this the right way; if I used category
theory then I might have struggled to say that the representation was
continuous).

```tex
The Lean definition is incomplete right now -- I don't demand irreducibility
(I wasn't sure whether I was doing this the right way; if I used category
theory then I might have struggled to say that the representation was
continuous).
```

# The Action Of The Universal Enveloping Algebra

:::definition "instLieAlgebraAction" (parent := "gln_langlands_program")
There is a natural action of the real Lie algebra of $`\GL_n(\R)` on the
complex vector space of smooth complex-valued functions on $`\GL_n(\R)`.
:::

```tex
\section{The action of the universal enveloping algebra.}

\begin{definition}
  \label{instLieAlgebraAction}
There is a natural action of the real Lie algebra of $\GL_n(\R)$ on the complex vector space of
smooth complex-valued functions on $\GL_n(\R)$.
\end{definition}
```

```tex
\begin{definition}
  \label{instComplexLieAlgebraAction}
  \uses{instLieAlgebraAction}

  This extends to is a natural complex Lie algebra action of the complexification of
  the real Lie algebra, on the smooth complex functions on $\GL_n(\R)$.

\end{definition}
```

:::definition "instComplexLieAlgebraAction" (parent := "gln_langlands_program")
This extends to a natural complex Lie algebra action of the complexification of
the real Lie algebra on the smooth complex-valued functions on $`\GL_n(\R)`.
This depends on {uses "instLieAlgebraAction"}[].
:::

```tex "instComplexLieAlgebraAction" (slot := statement)
\begin{definition}
  \label{instComplexLieAlgebraAction}
  \uses{instLieAlgebraAction}

  This extends to is a natural complex Lie algebra action of the complexification of
  the real Lie algebra, on the smooth complex functions on $\GL_n(\R)$.

\end{definition}
```

:::definition "instUniversalEnvelopingAlgebraAction" (parent := "gln_langlands_program")
By functoriality, we get an action of the universal enveloping algebra of this
complexified Lie algebra on the smooth complex-valued functions. This depends on
{uses "instComplexLieAlgebraAction"}[].
:::

```tex "instUniversalEnvelopingAlgebraAction" (slot := statement)
\begin{definition}
  \label{instUniversalEnvelopingAlgebraAction}
  \uses{instComplexLieAlgebraAction}
By functoriality, we get an action of the universal enveloping algebra of this
complexified Lie algebra on the smooth complex functions.

\end{definition}
```

:::definition "instCentreAction" (parent := "gln_langlands_program")
Thus the centre $`Z_n` of this universal enveloping algebra also acts on the
smooth complex-valued functions. This depends on
{uses "instUniversalEnvelopingAlgebraAction"}[].
:::

```tex "instCentreAction" (slot := statement)
\begin{definition}
\label{instCentreAction}
\uses{instUniversalEnvelopingAlgebraAction}
Thus the \emph{centre} $\Z_n$ of this universal enveloping algebra also acts on the smooth
complex functions.

\end{definition}
```

The centre we just defined is a commutative ring which contains a copy of
$`\bbC`. Note that Harish-Chandra, or possibly this was known earlier, showed
that it is a polynomial ring in $`n` variables over the complexes. We shall not
need this.

```tex
\begin{remark} The centre we just defined is a commutative ring which contains a copy of $\bbC$.
  Note that Harish-Chandra, or possibly this was known earlier, showed that it is a polynomial
  ring in $n$ variables over the complexes. We shall not need this.
\end{remark}
```

# Automorphic Forms

From here on there is no more Lean right now, only LaTeX.

```tex
\section{Automorphic forms}

From here on there is no more Lean right now, only LaTeX.
```

:::definition "AutomorphicForm.GLn.AutomorphicFormForGLnOverQ" (parent := "gln_langlands_program") (lean := "AutomorphicForm.GLn.AutomorphicFormForGLnOverQ")
A smooth function $`f : \GL_n(\A_{\Q}^f) \times \GL_n(\R) \to \bbC` is an
$`O_n(\R)`-automorphic form on $`\GL_n(\A_{\Q})` if it satisfies the following
five conditions. This depends on {uses "smooth_gln_function"}[],
{uses "AutomorphicForm.GLn.IsSlowlyIncreasing"}[],
{uses "AutomorphicForm.GLn.Weight"}[], and {uses "instCentreAction"}[].

1. Periodicity: for all $`g \in \GL_n(\Q)`, we have $`f(gx,gy) = f(x,y)`.
2. It has a finite level: there exists a compact open subgroup
   $`U \subseteq \GL_n(\A_{\Q}^f)` such that $`f(xu,y) = f(x,y)` for all
   $`u \in U`, $`x \in \GL_n(\A_{\Q}^f)`, and $`y \in \GL_n(\R)`.
3. It has weight $`\rho`: there exists a continuous finite-dimensional
   irreducible complex representation $`\rho` of $`O_n(\R)` such that for every
   $`(x,y) \in \GL_n(\A_{\Q})`, the complex vector space spanned by the
   functions $`k \mapsto f(x,yk)` is finite-dimensional and isomorphic, as an
   $`O_n(\R)`-representation, to a direct sum $`\rho^{\oplus m}` of copies of
   $`\rho` for some $`m`.
4. It has an infinite level: there is an ideal $`I \subseteq Z_n` of the
   centre $`Z_n` described in the previous section, with finite complex
   codimension $`\dim_\C(Z_n/I) < \infty`, and $`I` annihilates the function
   $`y \mapsto f(x,y)` for all $`x \in \GL_n(\A_{\Q}^f)`. This is a very fancy
   way of saying that the function satisfies some natural differential
   equations. In the case of modular forms, these are the Cauchy-Riemann
   equations, which is why modular forms are holomorphic.
5. It satisfies the growth condition: for every $`x \in \GL_n(\A_{\Q}^f)`, the
   function $`y \mapsto f(x,y)` on $`\GL_n(\R)` is slowly-increasing.
:::

```tex
\begin{definition}
  \label{AutomorphicForm.GLn.AutomorphicFormForGLnOverQ}
  \lean{AutomorphicForm.GLn.AutomorphicFormForGLnOverQ}
  \uses{AutomorphicForm.GLn.IsSmooth, AutomorphicForm.GLn.IsSlowlyIncreasing,
    AutomorphicForm.GLn.Weight, instCentreAction}
  A smooth function $f:\GL_n(\A_{\Q}^f)\times\GL_n(\R)\to\bbC$ is
  an $O_n(\R)$-\emph{automorphic form} on $\GL_n(\A_{\Q})$ if it satisfies the following
  five conditions.
  \begin{enumerate}
    \item (periodicity) For all $g\in\GL_n(\Q)$, we have $f(gx,gy)=f(x,y)$.
    \item (has a finite level) There exists a compact open subgroup $U\subseteq\GL_n(\A_{\Q}^f)$
      such that $f(xu,y)=f(x,y)$ for all $u\in U$, $x\in \GL_n(\A_{\Q}^f)$ and $y\in\GL_n(\R)$.
    \item (weight $\rho$) There exists a continuous finite-dimensional irreducible complex
    representation $\rho$ of $O_n(\R)$ such that for every $(x,y)\in\GL_n(\A_{\Q})$, the
    set of functions $k\mapsto f(x,yk)$ span a finite-dimensional complex vector space isomorphic
    as $O_n(\R)$-representation to a direct sum of copies of $\rho$.
    \item (has an infinite level) There is an ideal $I$ of the centre $Z_n$ described in the
    previous section, which has finite complex codimension, and which annihiliates the
    function $y \mapsto f(x,y)$ for all $x\in \GL_n(\A_{\Q}^f)$. Note that this is a very fancy
    way of saying ``the function satisfies some natural differential equations''. In the
    case of modular forms, the differential equations are the Cauchy-Riemann equations, which
    is why modular forms are holomorphic.
    \item (growth condition) For every $x\in\GL_n(\A_{\Q}^f)$, the function $y\mapsto f(x,y)$
  on $\GL_n(\R)$ is slowly-increasing.
  \end{enumerate}

\end{definition}
```

Automorphic forms of a fixed weight $`\rho` form a complex vector space, and if
we also fix the finite level $`U` and the infinite level $`I` then we get a
subspace which is finite-dimensional; this is a theorem of Harish-Chandra.
There is also the concept of a cusp form, meaning an automorphic form for which
furthermore some adelic integrals vanish.

```tex
Automorphic forms of a fixed weight $\rho$ form a complex vector space, and if we also
fix the finite level $U$ and the infinite level $I$ then we get a subspace which is
finite-dimensional; this is a theorem of Harish-Chandra. There is also the concept
of a cusp form, meaning an automorphic form for which furthermore some adelic integrals
vanish.
```

# Hecke Operators

:::lemma_ "hecke_operator_action_gln" (parent := "gln_langlands_program")
The group $`\GL_n(\A_{\Q}^f)` acts on the space of automorphic forms for
$`\GL_n(\A_{\Q})` by the formula $`(g \cdot f)(x,y) = f(xg,y)`.
:::

```tex "hecke_operator_action_gln" (slot := statement)
\begin{lemma} The group $\GL_n(\A_{\Q}^f)$ acts (on the left) on the space of automorphic forms
  for $\GL_n(\A_{\Q})$ by the formula $(g\cdot f)(x,y)=f(xg,y)$.
\end{lemma}
```

:::proof "hecke_operator_action_gln"
This is obvious. Note that the conjugate of a compact open subgroup is still
compact and open.
:::

```tex "hecke_operator_action_gln" (slot := proof)
\begin{proof}
  This is obvious. Note that the conjugate of a compact open subgroup is still
  compact and open.
\end{proof}
```

A formal development of the theory of Hecke operators looks like the following.

```tex
A formal development of the theory of Hecke operators looks like the following.
```

Let $`U` be a fixed compact open subgroup of $`\GL_n(\A_{\Q}^f)`, and let us
also fix a weight $`\rho`. Let $`M_\rho(n)` denote the complex vector space of
automorphic forms for $`\GL_n/\Q` of weight $`\rho`. The level $`U` forms
$`M_\rho(n,U)` are just the $`U`-invariants of this space. If
$`g \in \GL_n(\A_{\Q}^f)`, then the double coset space $`UgU` can be written as
a finite disjoint union of single cosets $`g_iU`: the double coset space is
certainly a disjoint union of left cosets, but the double coset space is
compact and the left cosets are open.

```tex
Let $U$ be a fixed compact open subgroup of $\GL_n(\A_{\Q}^f)$, and let's also fix
a weight $\rho$, and let $M_\rho(n)$ denote the complex vector space of automorphic
forms for $\GL_n/\Q$ of weight $\rho$. The level $U$ forms $M_\rho(n,U)$ are just the $U$-invariants
of this space. If $g\in\GL_n(\A_{\Q}^f)$, then I
claim that the double coset space $UgU$ can be written as a \emph{finite} disjoint union
of single cosets $g_iU$; one way of saying this is that the double coset space is certainly
a disjoint union of left cosets, but the double coset space is compact and the left cosets
are open.
```

Define the Hecke operator $`T_g : M_\rho(n,U) \to M_\rho(n,U)` by
$`T_g(f) = \sum g_i \cdot f`.

```tex
Define the Hecke operator $T_g:M_\rho(n,U)\to M_\rho(n,U)$ by
$T_g(f)=\sum g_i\cdot f$.
```

:::lemma_ "gln_hecke_operator_well_defined" (parent := "gln_langlands_program")
This function is well-defined, in the sense that it sends a $`U`-invariant form
to a $`U`-invariant form and is independent of the choice of the representatives
$`g_i`.
:::

```tex "gln_hecke_operator_well_defined" (slot := statement)
\begin{lemma} This function is well-defined, i.e., it sends a $U$-invariant form to
  a $U$-invariant form which is independent of the choice of $g_i$.
\end{lemma}
```

:::proof "gln_hecke_operator_well_defined"
Easy group theory.
:::

```tex "gln_hecke_operator_well_defined" (slot := proof)
\begin{proof} Easy group theory.
\end{proof}
```
