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

The TeX chapter treats this as a noncommutative analogue of very classical
compactness results in algebraic number theory: class-group finiteness and
Dirichlet's theorem on units.

It also treats this as a genuinely adelic theorem rather than a purely
algebraic one. The input is a division algebra `D/K`, but the compactness lives
on a quotient of the norm-one part of the adelic unit group `D_A^×`.

# Goal

:::theorem "fujisaki_lemma_goal" (parent := "fujisaki_project")
For a finite-dimensional central simple algebra over a number field, the
quotient of the norm-one adelic units by the global units should be compact.
This is the compactness statement later used in {uses "finite_dimensional_quaternionic_forms"}[].
:::

:::proof "fujisaki_lemma_goal"
The old blueprint highlights this as the noncommutative compactness statement
that simultaneously generalizes class-group finiteness and Dirichlet's unit
theorem; it explicitly follows Voight's presentation {Informal.citep voightBook}[]
and the commutative prototype {uses "commutative_prototype_for_fujisaki"}[].
:::

```tex "fujisaki_goal_raw"
\section{The goal}

There is an idelic compactness statement which encapsulates both finiteness of the class
group of a number field and Dirichlet's units theorem about the rank of the unit group.
In fact there is even a noncommutative version of this statement. In John Voight's
book~\cite{voightbook} this is Main Theorem 27.6.14(a) and Voight calls it Fujisaki’s lemma.
I know nothing of the history but I'm happy to adopt this name. In the quaternion algebra
miniproject we will use this compactness result to prove finite-dimensionality of a
space of quaternionic modular forms.
```

:::theorem "commutative_prototype_for_fujisaki" (parent := "fujisaki_project")
The compact quotient theorem for a division algebra is meant to be the
noncommutative analogue of the classical compactness of
$`K \backslash \mathbf{A}_K`.
:::

:::proof "commutative_prototype_for_fujisaki"
The TeX chapter uses this analogy repeatedly. The quotient
{uses "adele_discrete_cocompact_embedding"}[] is the model case: a global field
embedded discretely in its adeles with compact quotient. Fujisaki's lemma asks
for the same style of compactness after replacing the commutative additive group
by the norm-one units in an adelic division algebra.
:::

# Initial definitions

The TeX chapter begins by reviewing the algebraic input. A central simple
algebra over a field has center exactly the base field and no nontrivial
two-sided ideals. Quaternion algebras are the four-dimensional examples, and
division algebras are the cases in which every nonzero element is invertible.

It then stresses that matrix algebras are the basic examples, that central
simple algebras behave well under base change, and that over algebraically
closed fields matrix algebras are essentially the only finite-dimensional
examples. The point is not just classification: it is to prepare the reader for
why the adelic algebra attached to a division algebra still has enough linear
structure for a compactness argument.

The TeX chapter is concrete here. It mentions Hamilton's quaternions over `ℝ`
as the motivating division-algebra example, contrasts them with matrix algebras
that are central simple but never division rings, and notes that quaternion
algebras over a general field play the same formal role later in the project.

:::definition "division_algebra_hypothesis_for_fujisaki" (parent := "fujisaki_project")
The final compactness theorem is stated for division algebras, not just arbitrary
central simple algebras, because nonzero elements then form a genuine group and
the difference set arguments in the proof land inside `D^×`.
:::

:::proof "division_algebra_hypothesis_for_fujisaki"
This distinction matters in the proof. Several steps start by producing a
nonzero element of `D` from adelic intersections and then immediately
reinterpret it as a unit. That shortcut is available only because the theorem is
specialized to division algebras.
:::

```tex "fujisaki_initial_definitions_raw"
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
The argument studies the adelic algebra $`D \otimes_K \mathbf{A}_K`$ together
with the Haar-character kernel inside its unit group, using {uses "adele_base_change"}[] and the API goal recorded in {uses "haar_character_goal"}[].
:::

The TeX chapter explains why the Haar-character package is exactly the right
input here. Once `D_A := D ⊗_K A_K` is viewed as a finite `A_K`-algebra with the
module topology, it becomes a locally compact topological ring, and the kernel
of its Haar character gives the norm-one part of the adelic unit group.

At that point the project’s compactness statement is a genuine quotient-space
claim about `Dˣ \ D_A^{(1)}`. The chapter is careful to note that this is a
subspace of the full unit group, equipped with the quotient topology coming from
the Haar-character kernel.

:::theorem "adelic_module_topologies_coincide" (parent := "fujisaki_project")
If a finite-dimensional `K`-algebra is tensored with the adeles, the resulting
`A_K`-module topology agrees with the `A_{\mathbf{Q}}`-module topology coming
from scalar restriction.
:::

:::proof "adelic_module_topologies_coincide"
The TeX chapter pauses to note this because `D_A` is often viewed both as
`D \otimes_K A_K` and as a finite module over `A_{\mathbf{Q}}` via a choice of
`K/\mathbf{Q}`-structure. The point is that no ambiguity of topology is being
introduced when switching between those viewpoints.
:::

```tex "fujisaki_enter_adeles_raw"
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

:::theorem "large_compact_set_mod_d_exists" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.existsE")
There is a compact subset `E ⊆ D_A` such that for every
$`\beta \in D_A^{(1)}`, the translated set `βE` cannot inject into the quotient
$`D \backslash D_A`.
:::

:::proof "large_compact_set_mod_d_exists"
The TeX proof begins with the commutative comparison from
{uses "commutative_prototype_for_fujisaki"}[]. After choosing a `\mathbf{Q}`-basis
of `D`, one identifies `D_A` with a finite power of `\mathbf{A}_{\mathbf{Q}}`,
so the quotient `D \backslash D_A` inherits compactness from
`ℚ \backslash \mathbf{A}_{\mathbf{Q}}`.

One then chooses a compact set whose Haar measure is larger than the measure of
the quotient. Any translate of that set must then intersect two points mapping
to the same quotient class.
:::

```tex "fujisaki_first_proof_raw"
\section{The proof}

We prove the theorem via a series of lemmas.

\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \leanok
  There's a compact subset $E$ of $D_{\A}$
  with the property that for all $x\in D_{\A}^{(1)}$,
  the obvious map $xE\to D\backslash D_{\A}$ is not injective.
\end{lemma}

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
\end{proof}
```

:::definition "difference_set_x_for_fujisaki" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.X")
{uses "large_compact_set_mod_d_exists"}[]
From the compact set `E`, define the difference set `X = E - E`.
:::

:::definition "product_set_y_for_fujisaki" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.Y")
{uses "difference_set_x_for_fujisaki"}[]
Define `Y = X · X`, the product of the difference set with itself.
:::

:::proof "product_set_y_for_fujisaki"
The TeX proof immediately takes these closures under subtraction and
multiplication because later steps need one set capturing additive
collisions and another capturing multiplicative combinations of those
collisions.
:::

:::theorem "difference_and_product_sets_compact" (parent := "fujisaki_project")
Both `X` and `Y` are compact subsets of the adelic algebra.
:::

:::proof "difference_and_product_sets_compact"
{uses "difference_set_x_for_fujisaki"}[]
{uses "product_set_y_for_fujisaki"}[]

Each set is the continuous image of a compact product: `X` comes from `E × E`
under subtraction, and `Y` comes from `X × X` under multiplication.
:::

:::theorem "difference_set_meets_d_units" (parent := "fujisaki_project")
For every $`\beta \in D_A^{(1)}`, the translate `βX` meets `D^×`, and likewise
`Xβ⁻¹` meets `D^×`.
:::

:::proof "difference_set_meets_d_units"
{uses "difference_set_x_for_fujisaki"}[]
This is the first real use of {uses "large_compact_set_mod_d_exists"}[]. If
`βE` fails to inject into the quotient, then two distinct points of `βE`
differ by an element of `D`. Because `D` is a division algebra, that nonzero
difference lies in `D^×`. Since the original points differed by an element of
`X`, the translated set `βX` meets `D^×`.

The TeX chapter repeats the same argument on the right using the compatibility
of left and right Haar characters, which is why the Haar-character chapter had
to prove {uses "central_simple_algebra_left_right_same_haar"}[] first.
:::

:::definition "finite_intersection_set_t" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.T")
{uses "product_set_y_for_fujisaki"}[]
Let `T = Y ∩ D^×`.
:::

:::theorem "finite_intersection_set_t_finite" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite")
The set `T` is finite.
:::

:::proof "finite_intersection_set_t_finite"
{uses "finite_intersection_set_t"}[]
{uses "difference_and_product_sets_compact"}[]

The TeX proof uses only general topology. `Y` is compact, `D` is a discrete
additive subgroup of `D_A`, hence closed, so `Y ∩ D` is compact and discrete and
therefore finite. Since `T ⊆ Y ∩ D`, the set `T` is finite as well.
:::

:::definition "compact_constraint_set_c" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.C")
{uses "finite_intersection_set_t"}[]
{uses "difference_set_x_for_fujisaki"}[]
Define the compact constraint set
$`C = (T^{-1} X) \times X \subseteq D_A \times D_A`.
:::

:::proof "compact_constraint_set_c"
{uses "finite_intersection_set_t_finite"}[]
{uses "difference_set_x_for_fujisaki"}[]

The TeX proof introduces `C` only after all previous compact and finiteness
lemmas are in place. The point is to create one compact set that simultaneously
controls an adelic element and its inverse.
:::

:::theorem "antidiagonal_hits_compact_constraint_set" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C")
{uses "difference_set_meets_d_units"}[]
{uses "compact_constraint_set_c"}[]
For every $`\beta \in D_A^{(1)}`, there exist `b ∈ D^×` and `ν ∈ D_A^{(1)}`
such that `β = bν` and `(ν, ν⁻¹) ∈ C`.
:::

:::proof "antidiagonal_hits_compact_constraint_set"
{uses "difference_set_meets_d_units"}[]
{uses "compact_constraint_set_c"}[]

This is the heart of the TeX argument. Using
{uses "difference_set_meets_d_units"}[] twice, one writes `βx₁ = b₁` and
`x₂β⁻¹ = b₂` with `x_i ∈ X` and `b_i ∈ D^×`. Multiplying those equations shows
that `x₂x₁` lands in the finite set `T`, so `x₁⁻¹` belongs to `T^{-1}X`. Setting
`ν = x₁⁻¹` produces a factorization `β = bν` with controlled antidiagonal point
`(ν, ν⁻¹)`.
:::

:::theorem "compact_quotient_for_division_algebra" (parent := "fujisaki_project") (lean := "NumberField.AdeleRing.DivisionAlgebra.compact_quotient")
The compactness theorem for the adelic quotient is the final output of the
chapter and the input needed by the quaternion algebra miniproject.
:::

:::proof "compact_quotient_for_division_algebra"
The proof now has a clear internal graph:
{uses "large_compact_set_mod_d_exists"}[],
{uses "difference_set_x_for_fujisaki"}[],
{uses "product_set_y_for_fujisaki"}[],
{uses "difference_and_product_sets_compact"}[],
{uses "difference_set_meets_d_units"}[],
{uses "finite_intersection_set_t_finite"}[],
{uses "compact_constraint_set_c"}[], and
{uses "antidiagonal_hits_compact_constraint_set"}[].

The final step is topological. The compact set `C` controls the antidiagonal
image of a representative `ν` of every class in `D^× \ D_A^{(1)}`. Taking the
preimage of `C` under the map `ν ↦ (ν, ν⁻¹)` gives a compact set surjecting onto
the quotient. Therefore the quotient itself is compact.

This is exactly the compactness input used later in
{uses "finite_dimensional_quaternionic_forms"}[].
:::

```tex "fujisaki_later_proof_and_finite_adele_raw"
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

The TeX chapter closes by recording two useful consequences of Fujisaki's
lemma, both for the finite adelic unit group.

:::theorem "finite_adele_units_cocompact_for_division_algebra" (parent := "fujisaki_project") (lean := "NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact")
The quotient
$`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times`
is compact.
:::

:::proof "finite_adele_units_cocompact_for_division_algebra"
The TeX proof constructs a natural map from the compact quotient
{uses "compact_quotient_for_division_algebra"}[] to the finite-adelic unit
quotient and proves that this map is surjective. The key point is that any
finite-adelic unit can be extended by a suitable archimedean unit to land in
the Haar-character kernel; the archimedean correction is possible because
scalars in `\mathbf{R}^\times` scale Haar measure by an explicit positive power.
:::

:::theorem "finite_double_coset_for_open_subgroup" (parent := "fujisaki_project") (lean := "NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset")
If `U` is an open subgroup of
$`(D \otimes_K \mathbf{A}_K^\infty)^\times`, then the double coset space
$`D^\times \backslash (D \otimes_K \mathbf{A}_K^\infty)^\times / U`
is finite.
:::

:::proof "finite_double_coset_for_open_subgroup"
The TeX chapter observes that the double cosets define a disjoint open cover of
the compact quotient from
{uses "finite_adele_units_cocompact_for_division_algebra"}[]. A compact space
cannot admit an infinite disjoint open cover, so only finitely many double
cosets occur.
:::
