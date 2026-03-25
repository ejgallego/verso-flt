import FLTBlueprint.Citations
import FLT.GlobalLanglandsConjectures.GLnDefs
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Automorphic Forms And The Langlands Conjectures" =>

:::group "gln_langlands_program"
This chapter explains the definition of an automorphic form for `GL_n/ℚ` and
tracks the chapter goal of formally stating a version of the global Langlands
reciprocity conjectures in that special case.
:::

This chapter came from discussions between Patrick, Mario and Kevin, all
currently visiting the Hausdorff Research Institute for Mathematics in Bonn.

:::definition "global_langlands_reciprocity_target_gln" (parent := "gln_langlands_program")
The ultimate goal is to formally state some version of the global Langlands
reciprocity conjectures for $`\GL_n` over $`\Q`.
:::

```tex "ch07exampleGLn/introduction"
\chapter{Automorphic forms and the Langlands Conjectures}

This chapter came from discussions between Patrick, Mario and myself, all currently
visiting the Hausdorff Research Institute for
Mathematics in Bonn. The ultimate goal is to formally state some version of the global Langlands
reciprocity conjectures for $\GL_n$ over $\Q$.

\section[Definition of an automorphic form]{Definition of an automorphic form for $\GL_n$ over $\Q$.}

The global Langlands reciprocity conjectures relate automorphic forms to Galois representations.
The statements for a general connected reductive group involve the construction of the Langlands
dual group, and we do not have quite enough Lie algebra theory to push this definition through
in general. However if we restrict the special case of the group $\GL_n/\Q$, the dual group
is just $\GL_n(\bbC)$ and several other technical obstructions are also removed. In this
section we will explain the definition of an automorphic form for the group $\GL_n/\Q$, following
the exposition by Borel and Jacquet in Corvallis.
```

# Definition Of An Automorphic Form For GLn Over Q

The global Langlands reciprocity conjectures relate automorphic forms to Galois
representations. The statements for a general connected reductive group involve
the construction of the Langlands dual group, and we do not have quite enough
Lie algebra theory to push this definition through in general. However, if we
restrict to the special case of the group $`\GL_n/\Q`, the dual group is just
$`\GL_n(\bbC)` and several other technical obstructions are also removed. In
this section we explain the definition of an automorphic form for the group
$`\GL_n/\Q`, following the exposition by Borel and Jacquet in Corvallis
{Informal.citep corvallisAutomorphicForms}[].

# The Finite Adeles Of The Rationals

Mathlib already has the definition of the finite adeles $`\A_{\Q}^f` of the
rationals as a commutative $`\Q`-algebra, and the proof that they form a
topological ring.

# The Group GLn Of The Adeles

The adeles $`\A_{\Q}` of $`\Q` are the product $`\A_{\Q}^f \times \R`, with the
product topology. They are a topological ring. Hence
$`\GL_n(\A_{\Q}) = \GL_n(\A_{\Q}^f) \times \GL_n(\R)` is a topological group,
where we are being a bit liberal with our use of the equality symbol.

# Smooth Functions

:::definition "smooth_gln_function" (parent := "gln_langlands_program")
A function $`f : \GL_n(\A_{\Q}^f) \times \GL_n(\R) \to \bbC` is smooth if it has
the following three properties:

1. $`f` is continuous.
2. For all $`x \in \GL_n(\A_{\Q}^f)`, the function $`y \mapsto f(x,y)` is smooth.
3. For all $`y \in \GL_n(\R)`, the function $`x \mapsto f(x,y)` is locally constant.
:::

```tex "ch07exampleGLn/smooth_functions"
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

Current state of this definition: it is only half-formalized. The issue is how
to say the function is smooth on the infinite part, because the manifold
library interface is not yet settled here.

# Slowly-Increasing Functions

Automorphic representations satisfy a growth condition which we may as well
factor out into a separate definition.

We define the following temporary size function $`s : \GL_n(\R) \to \R` by
$`s(M) = \operatorname{trace}(MM^T + M^{-1}M^{-T})`, where $`M^{-T}` denotes
inverse-transpose. Note that $`s(M)` is always positive, and is large if $`M`
has a very large or very small, in absolute value, eigenvalue.

:::definition "slowly_increasing_gln_function" (parent := "gln_langlands_program")
We say that a function $`f : \GL_n(\R) \to \bbC` is slowly-increasing if there
is some real constant $`C` and positive integer $`n` such that
$`|f(M)| \leq C s(M)^n` for all $`M \in \GL_n(\R)`.
:::

```tex "ch07exampleGLn/slowly_increasing_functions"
\section{Slowly-increasing functions}

Automorphic representations satisfy a growth condition which we may as well
factor out into a separate definition.

We define the following temporary size function $s : \GL_n(\R) \to \R$ by
$s(M) = \operatorname{trace}(MM^T + M^{-1}M^{-T})$, where $M^{-T}$ denotes
inverse-transpose. Note that $s(M)$ is always positive, and is large if $M$
has a very large or very small, in absolute value, eigenvalue.

\begin{definition}
  \label{AutomorphicForm.GLn.IsSlowlyIncreasing}
  \lean{AutomorphicForm.GLn.IsSlowlyIncreasing}
  \leanok
  We say that a function $f:\GL_n(\R)\to\bbC$ is \emph{slowly-increasing}
  if there's some real constant $C$ and positive integer $n$ such that $|f(M)|\leq Cs(M)^n$
  for all $M\in\GL_n(\R)$.
\end{definition}
```

The TeX note remarks that the book says $`n` is positive, but since
$`\{ M \mid s(M) \leq 1 \}` is compact, this may make no difference.

# Weights At Infinity

:::definition "weight_at_infinity_gln" (parent := "gln_langlands_program")
The weight of an automorphic form for $`\GL_n/\Q` can be thought of as a
finite-dimensional continuous complex representation $`\rho` of a maximal
compact subgroup of $`\GL_n(\R)`, and it is convenient to choose one. We choose
$`O_n(\R)`.
:::

```tex "ch07exampleGLn/weights_at_infinity"
\section{Weights at infinity}

\begin{definition}
  \label{AutomorphicForm.GLn.Weight}

The \emph{weight} of an automorphic form for $\GL_n/\Q$ can be thought of as a finite-dimensional
continuous complex representation $\rho$ of a maximal compact subgroup of $\GL_n(\R)$,
and it's convenient to choose one (they're all conjugate) so we choose $O_n(\R)$.
\end{definition}
```

The Lean definition is incomplete right now. It does not yet demand
irreducibility, because it is not clear that the current packaging of
continuous representations is the right one.

# The Action Of The Universal Enveloping Algebra

:::definition "instLieAlgebraAction" (parent := "gln_langlands_program")
There is a natural action of the real Lie algebra of $`\GL_n(\R)` on the
complex vector space of smooth complex-valued functions on $`\GL_n(\R)`.
:::

:::definition "instComplexLieAlgebraAction" (parent := "gln_langlands_program")
This extends to a natural complex Lie algebra action of the complexification of
the real Lie algebra on the smooth complex-valued functions on $`\GL_n(\R)`.
This depends on {uses "instLieAlgebraAction"}[].
:::

:::definition "instUniversalEnvelopingAlgebraAction" (parent := "gln_langlands_program")
By functoriality, we get an action of the universal enveloping algebra of this
complexified Lie algebra on the smooth complex-valued functions. This depends on
{uses "instComplexLieAlgebraAction"}[].
:::

:::definition "instCentreAction" (parent := "gln_langlands_program")
Thus the centre $`Z_n` of this universal enveloping algebra also acts on the
smooth complex-valued functions. This depends on
{uses "instUniversalEnvelopingAlgebraAction"}[].
:::

Remark: the centre just defined is a commutative ring which contains a copy of
$`\bbC`. Harish-Chandra showed that it is a polynomial ring in `n` variables
over the complexes. We shall not need this.

# Automorphic Forms

From here on there is no more Lean right now, only LaTeX.

:::definition "automorphic_form_for_gln" (parent := "gln_langlands_program")
A smooth function $`f : \GL_n(\A_{\Q}^f) \times \GL_n(\R) \to \bbC` is an
$`O_n(\R)`-automorphic form on $`\GL_n(\A_{\Q})` if it satisfies the following
five conditions. This depends on {uses "smooth_gln_function"}[],
{uses "slowly_increasing_gln_function"}[],
{uses "weight_at_infinity_gln"}[], and {uses "instCentreAction"}[].

1. Periodicity: for all $`g \in \GL_n(\Q)`, we have $`f(gx,gy) = f(x,y)`.
2. It has a finite level: there exists a compact open subgroup
   $`U \subseteq \GL_n(\A_{\Q}^f)` such that $`f(xu,y) = f(x,y)` for all
   $`u \in U`, $`x \in \GL_n(\A_{\Q}^f)`, and $`y \in \GL_n(\R)`.
3. It has weight $`\rho`: there exists a continuous finite-dimensional
   irreducible complex representation $`\rho` of $`O_n(\R)` such that for every
   $`(x,y) \in \GL_n(\A_{\Q})`, the set of functions $`k \mapsto f(x,yk)` spans
   a finite-dimensional complex vector space isomorphic, as an
   $`O_n(\R)`-representation, to a direct sum of copies of $`\rho`.
4. It has an infinite level: there is an ideal $`I` of the centre $`Z_n`
   described in the previous section, which has finite complex codimension, and
   which annihilates the function $`y \mapsto f(x,y)` for all
   $`x \in \GL_n(\A_{\Q}^f)`. This is a very fancy way of saying that the
   function satisfies some natural differential equations. In the case of
   modular forms, these are the Cauchy-Riemann equations, which is why modular
   forms are holomorphic.
5. It satisfies the growth condition: for every $`x \in \GL_n(\A_{\Q}^f)`, the
   function $`y \mapsto f(x,y)` on $`\GL_n(\R)` is slowly-increasing.
:::

Automorphic forms of a fixed weight $`\rho` form a complex vector space, and if
we also fix the finite level $`U` and the infinite level $`I` then we get a
subspace which is finite-dimensional; this is a theorem of Harish-Chandra.
There is also the concept of a cusp form, meaning an automorphic form for which
furthermore some adelic integrals vanish.

# Hecke Operators

:::theorem "hecke_operator_action_gln" (parent := "gln_langlands_program")
The group $`\GL_n(\A_{\Q}^f)` acts on the space of automorphic forms for
$`\GL_n(\A_{\Q})` by the formula $`(g \cdot f)(x,y) = f(xg,y)`. This depends on
{uses "automorphic_form_for_gln"}[].
:::

:::proof "hecke_operator_action_gln"
This is obvious. Note that the conjugate of a compact open subgroup is still
compact and open.
:::

A formal development of the theory of Hecke operators looks like the following.

Let $`U` be a fixed compact open subgroup of $`\GL_n(\A_{\Q}^f)`, and let us
also fix a weight $`\rho`. Let $`M_\rho(n)` denote the complex vector space of
automorphic forms for $`\GL_n/\Q` of weight $`\rho`. The level $`U` forms
$`M_\rho(n,U)` are just the $`U`-invariants of this space. If
$`g \in \GL_n(\A_{\Q}^f)`, then the double coset space $`UgU` can be written as
a finite disjoint union of single cosets $`g_iU`: the double coset space is
certainly a disjoint union of left cosets, but the double coset space is
compact and the left cosets are open.

Define the Hecke operator $`T_g : M_\rho(n,U) \to M_\rho(n,U)` by
$`T_g(f) = \sum g_i \cdot f`.

:::theorem "gln_hecke_operator_well_defined" (parent := "gln_langlands_program")
This function is well-defined, in the sense that it sends a $`U`-invariant form
to a $`U`-invariant form and is independent of the choice of the representatives
$`g_i`. This depends on {uses "hecke_operator_action_gln"}[].
:::

:::proof "gln_hecke_operator_well_defined"
Easy group theory.
:::
