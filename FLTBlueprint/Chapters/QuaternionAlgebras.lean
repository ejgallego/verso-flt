import Verso
import VersoManual
import VersoBlueprint
import FLT.AutomorphicForm.QuaternionAlgebra.Defs
import FLT.AutomorphicForm.QuaternionAlgebra.FiniteDimensional

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Quaternion algebras" =>

:::group "quaternion_algebra_project"
Miniproject: Quaternion algebras.
:::

# The goal

At the time of writing, `mathlib` still does not have a proof that the space of
classical modular forms of a fixed weight, level and character is
finite-dimensional. The main result in this miniproject is to prove that
certain spaces of quaternionic modular forms are finite-dimensional. We need
finiteness results like this in order to control the Hecke algebras which act
on these spaces; these Hecke algebras are the `T`s which are isomorphic to the
`R`s in the `R = T` theorem which is the big first target for the FLT project.

```tex "quat_goal_intro"
At the time of writing, {\tt mathlib} still does not have a proof that the space
of classical modular forms of a fixed weight, level and character is finite-dimensional.
The main result in this miniproject is to prove that certain spaces of quaternionic modular forms
are finite-dimensional. We need finiteness results
like this in order to control the Hecke algebras which act on these spaces; these Hecke
algebras are the ``$T$''s which are isomorphic to the ``$R$''s in the $R=T$ theorem which
is the big first target for the FLT project.
```

# Initial definitions

Our first goal in this miniproject is the definition of these spaces of
quaternionic modular forms. We start with some preliminary work towards this.

```tex "quat_initial_goal"
Our first goal in this miniproject is the definition of these spaces of quaternionic modular forms.
We start with some preliminary work towards this.
```

Let $`K` be a field. Recall that a quaternion algebra over $`K` is a central
simple $`K`-algebra of $`K`-dimension `4`.

```tex "quat_initial_field"
Let $K$ be a field. Recall that a quaternion algebra
over $K$ is a central simple $K$-algebra of $K$-dimension~4.
```

A fundamental fact about central simple algebras is that if $`D/K` is a central
simple $`K`-algebra and $`L/K` is an extension of fields, then $`D \otimes_K L`
is a central simple $`L`-algebra. In particular, if $`D` is a quaternion
algebra over $`K` then $`D \otimes_K L` is a quaternion algebra over $`L`.
Some Imperial undergraduate students have established this fact in ongoing
project work.

```tex "quat_initial_csa"
A fundamental fact about central simple algebras is that if $D/K$
is a central simple $K$-algebra and $L/K$ is an extension of fields, then $D\otimes_KL$
is a central simple $L$-algebra. In particular if $D$ is a quaternion algebra over $K$
then $D\otimes_KL$ is a quaternion algebra over $L$. Some Imperial undergraduate students have established
this fact in ongoing project work.
```

A *totally real field* is a number field $`F` such that the image of every
ring homomorphism $`F \to \bbC` is a subset of $`\R`. We fix once and for all a
totally real field $`F` and a quaternion algebra $`D` over $`F`. We furthermore
assume that $`D` is *totally definite*, that is, that for all field
embeddings $`\tau : F \to \R` we have $`D \otimes_{F,\tau} \R \cong \bbH`.
Because $`F` has at least one real place, the totally definite hypothesis is
enough to show that $`D` is not a matrix algebra and thus must be a division
algebra. Thus Fujisaki's theorem from the Fujisaki miniproject applies, and we
know that
$`D^\times\backslash (D\otimes_F\A_F)^{(1)}` is compact.

```tex "quat_initial_totally_real"
A \emph{totally real field} is a number field~$F$ such that the image of every ring
homomorphism $F\to\bbC$ is a subset of $\R$. We fix once and for all a totally real field~$F$ and a
quaternion algebra $D$ over $F$. We furthermore assume that $D$ is \emph{totally definite}, that is,
that for all field embeddings $\tau:F\to\R$ we have $D\otimes_{F,\tau}\R\cong\bbH$. Because $F$
has at least one real place, the totally definite hypothesis is enough to show that $D$
is not a matrix algebra and thus must be a division algebra. Thus Fujisaki's theorem (theorem~\ref{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
from the Fujisaki miniproject) applies, and we know that $D^\times\backslash (D\otimes_F\A_F)^{(1)}$
is compact.
```

The high-falutin' explanation of what is about to happen is that the units
$`D^\times` of $`D` can be regarded as a connected reductive algebraic group
over $`F`, and we are going to define certain spaces of automorphic forms for
this algebraic group. For a general connected reductive algebraic group, part
of the definition of an automorphic form is that it is satisfies some
differential equations (for example modular forms are automorphic forms for the
algebraic group `GL_2` over `Q`, and the definition of a modular form involves
holomorphic functions, which are solutions to the Cauchy-Riemann equations).
However under the assumption that $`F` is totally real and $`D/F` is totally
definite, the "associated symmetric space is a 0-dimensional manifold",
meaning in practice that the part of the definition of an automorphic form
involving differential equations is vacuously satisfied in this setting.

```tex "quat_initial_high_falutin"
The high-falutin' explanation of what is about to happen is that the units $D^\times$ of $D$
can be regarded as a connected reductive algebraic group over $F$, and we are going to define certain spaces
of automorphic forms for this algebraic group. For a general connected reductive algebraic group,
part of the definition of an automorphic form is that it is satisfies some differential
equations (for example modular forms are automorphic forms for the algebraic group $\GL_2$ over
$\Q$, and the definition of a modular form involves holomorphic functions, which are solutions to
the Cauchy--Riemann equations). However under the assumption that $F$ is totally real and $D/F$ is
totally definite, the ``associated symmetric space is a 0-dimensional manifold'', meaning in practice that
the part of the definition of an automorphic form involving differential equations is vacuously satisfied in this setting.
```

As a consequence, the definitions we are about to give have a far more
algebraic flavour. Crucially, the fact that we do not need to talk about
differential equations at all means that one does not need to assume that our
automorphic forms are `ℂ`-valued; our definition makes sense for forms valued
in an arbitrary additive commutative group. In particular, it is possible to
talk about mod `p^n` and `p`-adic automorphic forms in this setting without
doing any complicated algebraic geometry.

```tex "quat_initial_consequence"
As a consequence, the definitions we're about to give have a far more algebraic flavour. Crucially, in stark
contrast to the general theory, the fact that we do not need to talk about differential equations at all means that one does
not need to assume that our automorphic forms are $\bbC$-valued; our definition makes sense for forms valued in an arbitrary additive commutative group.
In particular, it is possible to talk about mod $p^n$ and $p$-adic automorphic forms in this setting without doing any complicated algebraic geometry.
```

# Brief introduction to automorphic forms in this setting

Having made assumptions on $`D` which make the theory of automorphic forms over
$`D^\times` far less technical, we will now make it a little more technical by
using the modern adelic approach to the theory. Note that many results about
the adeles of a number field are proved in the adele miniproject. Our
automorphic forms will be certain functions on the units of the ring
$`D_{\A^\infty} := D \otimes_F \A_F^\infty \cong D \otimes_{\Q} \A_{\Q}^\infty`.

```tex "quat_brief_intro_1"
Having made assumptions on $D$ which make the theory of automorphic forms over
$D^\times$ far less technical, we will now make it a little more technical by
using the modern adelic approach to the theory. Note that many results about
the adeles of a number field are proved in the adele miniproject. Our
automorphic forms will be certain functions on the units of the ring
$D_{\A^\infty}:=D\otimes_F\A_F^\infty\cong D\otimes_{\Q}\A_{\Q}^\infty$.
```

To prove Fermat's Last Theorem it suffices to work in weight `2` and trivial
character, and for simplicity we shall, at least for now, bake these
assumptions into our definitions, even though they would be easy to remove. We
remark again that there is no analogue of the holomorphicity condition that one
sees in the classical theory, because the symmetric space is a finite set of
points rather than the upper half plane. Also there is no analogue of the
cuspidality condition because there are no cusps in this setting. Other than
the number field $`F` and the quaternion algebra $`D`, the other variable we
will see in our situation will be the level of the forms. The main result in
this miniproject will be that the space of weight `2` automorphic forms of
level $`U` is finite-dimensional.

```tex "quat_brief_intro_2"
To prove Fermat's Last Theorem it suffices to work in weight 2 and trivial character, and for simplicity we shall (at least for now)
bake these assumptions into our definitions, even though they would be easy to remove (at the expense of having
to write ``of weight 2 and trivial character'' throughout the proof). We remark again that
there is no analogue of the holomorphicity condition that one sees in the classical theory,
because the symmetric space is a finite set of points rather than the upper half plane. Also
there is no analogue of the cuspidality condition because there are no cusps in this setting.
Other than the number field $F$ and the quaternion algebra $D$, the other variable we will see in our situation
will be the \emph{level} of the forms. The main result in this miniproject will be that the space of weight 2 automorphic forms of level $U$
is finite-dimensional.
```

# Definition of spaces of automorphic forms

Let us now give some precise definitions. Recall that by $`\A_F^\infty` we mean
the finite adeles of the totally real number field $`F`.

```tex "quat_defs_1"
Let us now give some precise definitions. Recall that by $\A_F^\infty$ we mean
the finite adeles of the totally real number field $F$.
```

A level is a compact open subgroup $`U` of $`(D \otimes_F \A_F^\infty)^\times`.
These are plentiful. The ring $`D_f := D \otimes_F \A_F^\infty` is a
topological ring, and hence the units $`D_f^\times` of this ring are a
topological group. This group is locally profinite, and hence has many compact
open subgroups; we will see explicit examples later on.

```tex "quat_defs_2"
A \emph{level} is a compact open subgroup~$U$ of $(D\otimes_F\A_F^\infty)^\times$. These are
plentiful. The ring $D_f:=D\otimes_F\A_F^\infty$ is a topological ring,
and hence the units $D_f^\times$ of this ring
are a topological group. This group is locally profinite, and hence has many compact open subgroups;
we will see explicit examples later on.
```

We regard $`\A_F^\infty` as a subring of
$`D_{\A^\infty} := D \otimes_F \A_F^\infty`, which is possible because $`F` is
a subring of $`D`. More precisely, we embed $`\A_F^\infty` into
$`D \otimes_F \A_F^\infty` via the map sending $`g` to $`1 \otimes g`.
Because $`F` is in the centre of $`D`, we have that $`\A_F^\infty` is in the
centre of $`D_{\A^\infty}`. As a consequence we can identify
$`(\A_F^\infty)^\times` as a subgroup of $`(D \otimes_F \A_F^\infty)^\times`.
We may also regard $`D` as a subring of $`D \otimes_F \A_F^\infty` via the map
$`d \mapsto d \otimes 1`, and hence we can think of $`D^\times` as a subgroup
of $`(D \otimes_F \A_F^\infty)^\times`.

```tex "quat_defs_3"
We regard $\A_F^\infty$ as a subring of
$D_{\A^\infty}:=D\otimes_F\A_F^\infty$, which is possible because $F$ is a
subring of $D$. More precisely, we embed $\A_F^\infty$ into
$D\otimes_F\A_F^\infty$ via the map sending $g$ to $1\otimes g$. Because $F$ is
in the centre of $D$, we have that $\A_F^\infty$ is in the centre of
$D_{\A^\infty}$. As a consequence we can identify $(\A_F^\infty)^\times$ as a
subgroup of $(D\otimes_F\A_F^\infty)^\times$. We may also regard $D$ as a
subring of $D\otimes_F\A_F^\infty$ via the map $d\mapsto d\otimes 1$, and hence
we can think of $D^\times$ as a subgroup of $(D\otimes_F\A_F^\infty)^\times$.
```

Let $`R` be an additive commutative group. Later on $`R` will be a commutative
ring but we will not need this for the definition.

```tex "quat_defs_4"
Let $R$ be an additive commutative group. Later on $R$ will be a commutative
ring but we will not need this for the definition.
```

Let us now give some precise definitions. Recall that by $`\A_F^\infty`$ we mean
the finite adeles of the totally real number field $`F`$.

```tex "weight_two_quaternionic_forms/1"
Let us now give some precise definitions. Recall that by $\A_F^\infty$ we mean
the finite adeles of the totally real number field $F$.
```

A level is a compact open subgroup $`U`$ of $`(D\otimes_F\A_F^\infty)^\times`$.
These are plentiful. The ring $`D_f:=D\otimes_F\A_F^\infty`$ is a topological
ring, and hence the units $`D_f^\times`$ of this ring are a topological group.
This group is locally profinite, and hence has many compact open subgroups; we
will see explicit examples later on.

```tex "weight_two_quaternionic_forms/2"
A level is a compact open subgroup~$U$ of $(D\otimes_F\A_F^\infty)^\times$.
These are plentiful. The ring $D_f:=D\otimes_F\A_F^\infty$ is a topological
ring, and hence the units $D_f^\times$ of this ring are a topological group.
This group is locally profinite, and hence has many compact open subgroups; we
will see explicit examples later on.
```

We regard $`\A_F^\infty`$ as a subring of
$`D_{\A^\infty}:=D\otimes_F\A_F^\infty`$, which is possible because $`F`$ is a
subring of $`D`$. More precisely, we embed $`\A_F^\infty`$ into
$`D\otimes_F\A_F^\infty`$ via the map sending $`g`$ to $`1\otimes g`$. Because $`F`$ is
in the centre of $`D`$, we have that $`\A_F^\infty`$ is in the centre of
$`D_{\A^\infty}`$. As a consequence we can identify $`(\A_F^\infty)^\times`$ as a
subgroup of $`(D\otimes_F\A_F^\infty)^\times`$. We may also regard $`D`$ as a
subring of $`D\otimes_F\A_F^\infty`$ via the map $`d\mapsto d\otimes 1`$, and hence
we can think of $`D^\times`$ as a subgroup of $`(D\otimes_F\A_F^\infty)^\times`.

```tex "weight_two_quaternionic_forms/3"
We regard $\A_F^\infty$ as a subring of
$D_{\A^\infty}:=D\otimes_F\A_F^\infty$, which is possible because $F$ is a
subring of $D$. More precisely, we embed $\A_F^\infty$ into
$D\otimes_F\A_F^\infty$ via the map sending $g$ to $1\otimes g$. Because $F$ is
in the centre of $D$, we have that $\A_F^\infty$ is in the centre of
$D_{\A^\infty}$. As a consequence we can identify $(\A_F^\infty)^\times$ as a
subgroup of $(D\otimes_F\A_F^\infty)^\times$. We may also regard $D$ as a
subring of $D\otimes_F\A_F^\infty$ via the map $d\mapsto d\otimes 1$, and hence
we can think of $D^\times$ as a subgroup of $(D\otimes_F\A_F^\infty)^\times$.
```

Let $`R`$ be an additive commutative group. Later on $`R`$ will be a commutative
ring but we will not need this for the definition.

```tex "weight_two_quaternionic_forms/4"
Let $R$ be an additive commutative group. Later on $R$ will be a commutative
ring but we will not need this for the definition.
```

:::definition "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm" (parent := "quaternion_algebra_project")
The space of $`R`$-valued *automorphic forms* for $`D^\times`$ is the set of
functions $`f:D_{\A^\infty}^\times\to R`$ satisfying the following axioms:

- $`f(dg)=f(g)`$ for all $`d\in D^\times`$ and $`g\in D_{\A^\infty}^\times`$.
- $`f(gz)=f(g)`$ for all $`g\in D_{\A^\infty}^\times`$.
- There exists a compact open subgroup $`U\subseteq (D_{\A^f}^\times)`$
  such that $`f(gu)=f(g)`$ for all $`g\in D_{\A^\infty}^\times`$ and $`u\in U`$.
:::

```tex "weight_two_quaternionic_forms/definition"
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}
  \leanok
  The space of $R$-valued *automorphic forms* for $D^\times$ is the set of
  functions $f:D_{\A^\infty}^\times\to R$ satisfying the following axioms:
  \begin{itemize}
    \item $f(dg)=f(g)$ for all $d\in D^\times$ and $g\in D_{\A^\infty}^\times$.
    \item $f(gz)=f(g)$ for all $g\in D_{\A^\infty}^\times$.
    \item There exists a compact open subgroup $U\subseteq (D_{\A^f}^\times)$
      such that $f(gu)=f(g)$ for all $g\in D_{\A^\infty}^\times$ and $u\in U$.
  \end{itemize}
\end{definition}
```

Let $`S^D(R)` denote the set of automorphic forms for $`D^\times`. The space
$`S^D(R)` is sometimes referred to as a space of "quaternionic modular forms"
over $`R`. Three basic observations about $`S^D(R)` are as follows.

```tex "quat_automorphic_forms_intro"
Let $S^D(R)$ denote the set of automorphic forms for $D^\times$. The space $S^D(R)$ is sometimes referred to as a space of
quaternionic modular forms over $R$. Three basic observations about $S^D(R)$ are as follows.
```

:::definition "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup" (parent := "quaternion_algebra_project")
Pointwise addition $`(f_1 + f_2)(g) := f_1(g) + f_2(g)` makes $`S^D(R)` into an
additive abelian group. This depends on
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm"}[].
:::

```tex "automorphic_forms_additive_group"
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}
  \leanok
  Pointwise addition $(f_1 + f_2)(g) := f_1(g) + f_2(g)$ makes $S^D(R)$ into an
  additive abelian group.
\end{definition}
```

:::definition "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module" (parent := "quaternion_algebra_project")
If $`R` is a commutative ring then pointwise scalar multiplication
$`(r \cdot f)(g) := r \cdot f(g)` makes $`S^D(R)` into an $`R`-module. This
depends on {uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm"}[]
and {uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup"}[].
:::

```tex "automorphic_forms_module"
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}
  \leanok
  If $R$ is a commutative ring then pointwise scalar multiplication $(r\cdot f)(g):= r\cdot(f(g))$ makes
  $S^D(R)$ into an $R$-module.
\end{definition}
```

:::definition "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction" (parent := "quaternion_algebra_project")
The group $`D_{\A^\infty}^\times` acts on the additive abelian group $`S^D(R)`
by $`(g \cdot f)(x) = f(xg)`. This depends on
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm"}[],
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup"}[], and
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module"}[].
:::

```tex "adelic_right_action_on_quaternionic_forms"
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \leanok
  The group $D_{\A^f}^\times$ acts on the additive abelian group $S^D(R)$ by $(g \cdot f)(x) = f(xg)$.
\end{definition}
```

If $`R` is a commutative ring then the action of $`D_{\A^\infty}^\times`
commutes with the $`R`-action.

```tex "quat_action_commutes"
If $R$ is a commutative ring then the action of $D_{\A^\infty}^\times$ commutes with the $R$-action.
```

Now let $`U` be a level, that is, a compact open subgroup of
$`D_{\A^\infty}^\times`.

```tex "quat_level_intro"
Now let $U$ be a level, that is, a compact open subgroup of $D_{\A^\infty}^\times$.
```

:::definition "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel" (parent := "quaternion_algebra_project")
The quaternionic modular forms of level $`U`, with notation $`S^D(U;R)`, are
the $`U`-invariants for the $`D_{\A^\infty}^\times`-action on $`S^D(R)`. This
depends on {uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm"}[],
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup"}[],
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction"}[], and
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module"}[].
:::

```tex "weight_two_quaternionic_forms_of_level"
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \leanok
  The quaternionic modular forms of level $U$, with notation $S^D(U;R)$, are the $U$-invariants for the $D_{\A^\infty}^\times$-action on $S^D(R)$.
\end{definition}
```

The Hecke algebras involved in the main modularity lifting theorems needed in
the FLT project will be endomorphisms of these spaces $`S^D(U;R)`.

```tex "quat_hecke_algebras"
The Hecke algebras involved in the main modularity lifting theorems needed in
the FLT project will be endomorphisms of these spaces $S^D(U;R)$.
```

# The main result

The point of this miniproject is the finite-dimensionality result below. This
is an analogue of the result that classical modular forms of a fixed level,
weight and character are finite-dimensional. In fact, by delicate results of
Jacquet and Langlands this result, in the case $`k = \bbC`, implies many cases
of that classical claim, although of course the Jacquet--Langlands theorem is
much harder to prove than the classical proof of finite-dimensionality.

```tex "quat_main_result_intro"
The point of this miniproject is the finite-dimensionality result below. This
is an analogue of the result that classical modular forms of a fixed
level, weight and character are finite-dimensional. In fact, by delicate results
of Jacquet and Langlands this result (in the case $k=\bbC$) implies many cases
of that classical claim, although of course the Jacquet--Langlands theorem is
much much harder to prove than the classical proof of finite-dimensionality.
```

:::theorem "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional" (parent := "quaternion_algebra_project") (lean := "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional")
Let $`k` be a field. Then the space $`S^D(U;k)` is a finite-dimensional
$`k`-vector space. This depends on
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module"}[].
:::

```tex "quat_main_result_theorem"
\begin{theorem}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  Let $k$ be a field. Then the space $S^D(U;k)$ is a finite-dimensional $k$-vector space.
\end{theorem}
```

:::proof "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional"
The finite-dimensionality theorem is in fact an easy consequence of Fujisaki's lemma,
proved in the Fujisaki miniproject.
{uses "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact"}[], and
{uses "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset"}[].
Write $`(D \otimes_F \A_F^\infty)^\times`
as a disjoint union of double cosets $`\coprod_i D^\times g_i U`. This open
cover descends to a disjoint open cover of
$`D^\times \backslash (D \otimes_F \A_F^\infty)^\times`, and this latter space
is compact by {uses "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact"}[]. Hence the cover
is finite; write the double coset representatives as $`g_1, g_2, \ldots, g_n`.

We claim that the function $`S^D(U;k) \to k^n` sending $`f` to
$`(f(g_1), f(g_2), \ldots, f(g_n))` is injective and $`k`-linear, which
suffices by finite-dimensionality of $`k^n`. $`k`-linearity is easy, so let us
talk about injectivity.

Say $`f_1` and $`f_2` are two elements of $`S^D(U;k)` which agree on each
$`g_i`. It suffices to prove that $`f_1(g) = f_2(g)` for all
$`g \in (D \otimes_F \A_F^\infty)^\times`. So say
$`g \in (D \otimes_F \A_F^\infty)^\times`, and write $`g = \delta g_i u` for
$`\delta \in D^\times` and $`u \in U`. Then
$`f_1(g) = f_1(\delta g_i u) = f_1(g_i)` by the definition of $`S^D(U;k)`, and similarly
$`f_2(g) = f_2(g_i)`. Because $`f_1(g_i) = f_2(g_i)` by assumption, we deduce
that $`f_1(g) = f_2(g)` as required.
:::

```tex "quat_main_result_proof"
\begin{proof}
  \proves{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}
  \uses{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact,
  NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  The finite-dimensionality theorem is in fact an easy consequence of Fujisaki's lemma,
  proved in the Fukisaki miniproject, chapter~\ref{Fujisaki_project}.
  Write $(D\otimes_F\A_F^\infty)^\times$ as a disjoint union of double cosets
  $\coprod_i D^\times g_i U$. This open cover descends to a disjoint open
  cover of $D^\times\backslash (D\otimes_F\A_F^\infty)^\times$,
  and this latter space is compact by theorem~\ref{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}.
  Hence the cover is finite; write the double coset representatives
  as $g_1,g_2,\ldots,g_n$. We claim that
  the function $S^D(U;k)\to W^n$ sending $f$ to $(f(g_1),f(g_2),\ldots,f(g_n))$
  is injective and $k$-linear, which suffices by finite-dimensionality of $W$.
  $k$-linearity is easy, so let's talk about injectivity.

  Say $f_1$ and $f_2$ are two elements of $S^D(U;k)$ which agree on
  each $g_i$. It suffices to prove that $f_1(g)=f_2(g)$ for all
  $g\in(D\otimes_F\A_F^\infty)^\times$. So say $g\in(D\otimes_F\A_F^\infty)^\times$,
  and write $g=\delta g_i u$ for $\delta \in D^\times$ and $u\in U$.
  Then $f_1(g)=f_1(\delta g_iu)=f_1(g_i)$ (by the definition of $S^D(U;k)$), and similarly $f_2(g)=f_2(g_i)$
  and because $f_1(g_i)=f_2(g_i)$ by assumption, we deduce $f_1(g)=f_2(g)$ as required.
\end{proof}
```
