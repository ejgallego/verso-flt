import Verso
import VersoManual
import VersoBlueprint
import FLT.HaarMeasure.HaarChar.AdeleRing

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Haar Characters" =>

:::group "haar_character_project"
This miniproject develops the API around how additive Haar measure changes under
linear automorphisms, especially on locally compact topological rings.
:::

The old TeX chapter frames this as infrastructure rather than a single isolated
theorem. The point is to build a reusable measure-theoretic package that can be
applied uniformly to local fields, finite products, restricted products, and
adelic algebras.

```tex "haar_character_project/lt_intro"
The old TeX chapter frames this as infrastructure rather than a single isolated theorem.
```

# Goal

:::definition "haar_character_goal" (parent := "haar_character_project")
The main application is adelic: if `B` is a finite-dimensional algebra over a
number field `K`, then `B^\times` lies in the kernel of the Haar character of
`B \otimes_K \A_K`.
:::

```tex "haar_character_project/goal"
\section{The goal}

The goal of this miniproject is to develop the theory (i.e., the basic API) of Haar characters.
``Haar character'' is a name I've made up to describe a certain character of the units of a locally
compact topological ring.

KMB would like to heartily thank S\'ebastien Gou\"ezel for the help he gave during the preparation
of this material.
```

`Haar character` is a name I've made up to describe a certain character of
the units of a locally compact topological ring. The main result we need here is
that if `B` is a finite-dimensional algebra over a number field `K`, then
`B^\times` is in the kernel of the Haar character of `B \otimes_K \A_K`, where
`\A_K` is the ring of adeles of `K`. Most if not all of this should probably be
in mathlib.

```tex "haar_character_project/lt_goal_terminology"
``Haar character'' is a name I've made up to describe a certain character of the units of a locally compact topological ring.
```

KMB would like to heartily thank S\'ebastien Gou\"ezel for the help he gave
during the preparation of this material.

```tex "haar_character_project/lt_goal_provenance"
KMB would like to heartily thank S\'ebastien Gou\"ezel for the help he gave during the preparation of this material.
```

The chapter thanks Sebastien Gou\"ezel for the help he gave during the
preparation of this material.

```tex "haar_character_project/lt_goal_context"
The goal of this miniproject is to develop the theory (i.e., the basic API) of Haar characters.
```

# Initial definitions

:::definition "additive_haar_character" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar")
For a locally compact additive abelian group `A`, a regular Haar measure `μ`,
and an additive homeomorphism `φ : A ≃ₜ+ A`, the Haar character `d_A(φ)` is
the unique positive real such that `μ(X) = d_A(φ) (φ_* μ)(X)` for every Borel
set `X`.
:::

```tex "haar_character_project/additive_haar_character"
\section{Initial definitions}

\subsection{Scaling Haar measure on a group}

Let $A$ be a locally compact topological additive abelian group. There's then a regular additive
Haar measure $\mu$ on $A$, unique up to a positive scalar factor. If $\phi:(A,+)\cong(A,+)$ is a
homeomorphism and an additive automorphism of $A$, then we can push forward $\mu$
along $\phi$ to get a second measure $\phi_*\mu$ on $A$.
```

More concretely, if `μ` is a regular Haar measure on an additive locally compact
group `A` and `φ : A ≃ₜ+ A` is an additive homeomorphism, then the pushforward
`φ_* μ` is again a Haar measure. So it differs from `μ` by a unique positive
scalar, and the Haar-character construction is just the systematic way of
recording that scalar.

```tex "haar_character_project/lt_pushforward_haar_measure"
Now $\phi_*\mu$ is a translation-invariant and regular measure,
and hence also a Haar measure on $A.$ It must thus differ from
$\mu$ by a positive scalar factor, which we call $d_A(\phi)$.
```

There is a choice of normalization here between `d_A(\phi)` and
`d_A(\phi)^{-1}`, so let us be more precise.

```tex "haar_character_project/lt_normalization"
There is a choice of normalization here between $d_A(\phi)$ and $d_A(\phi)^{-1}$, so let us be more precise.
```

Strictly speaking our definition of `d_A(\phi)` depends on the choice of
regular Haar measure `\mu`.

```tex "haar_character_project/lt_mathlib_haar_measure"
Strictly speaking our definition of $d_A(\phi)$ depends on the choice of regular Haar measure $\mu$.
```

```tex "haar_character_project/lt_additive_definition"
If $A$ is a locally compact topological additive abelian group, if $\mu$ is a regular Haar measure on $A$, and if $\phi:A\to A$ is an additive homeomorphism, then we let $d_A(\phi)$ denote the unique positive real number such that $\mu(X)=d_A(\phi)(\phi_*\mu)(X)$ for any Borel set~$X$.
```

:::theorem "haar_character_independent_of_measure" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_eq")
This scaling factor is independent of the chosen regular Haar measure.
This is the first lemma attached to {uses "additive_haar_character"}[].
:::

```tex "haar_character_project/lt_independent_of_measure"
$d_A(\phi)$ is independent of choice of regular Haar measure.
```

:::proof "haar_character_independent_of_measure"
If `μ'` is a second choice then `μ' = λ μ` for some positive real `λ`, and the
`λ`s on each side of `μ'(X) = d_A(\phi)(\phi_* μ')(X)` cancel.
:::

```tex "haar_character_project/independent_of_measure"
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_eq}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \discussion{508}
  \leanok
  $d_A(\phi)$ is independent of choice of regular Haar measure.
\end{lemma}
\begin{proof}
  \leanok
  If $\mu'$ is a second choice then $\mu'=\lambda\mu$ for some
  positive real $\lambda$, and the $\lambda$s on each side of
  $\mu'(X)=d_A(\phi)(\phi_*\mu')(X)$ cancel.
\end{proof}
```

:::theorem "haar_character_pushforward_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_smul_map")
For any regular Haar measure `μ`, one has
$`d_A(\phi) (\phi_* \mu) = \mu`.
This is the direct restatement of {uses "haar_character_independent_of_measure"}[].
:::

```tex "haar_character_project/lt_pushforward_formula"
If $\mu$ is any regular Haar measure on $A$ then $d_A(\phi)(\phi_*\mu) = \mu.$
```

:::proof "haar_character_pushforward_formula"
This is a restatement of the previous result.
:::

```tex "haar_character_project/pushforward_formula"
\begin{lemma}
  \lean{MeasureTheory.addEquivAddHaarChar_smul_map}
  \label{MeasureTheory.addEquivAddHaarChar_smul_map}
  \uses{MeasureTheory.addEquivAddHaarChar_eq}
  \leanok
  If $\mu$ is any regular Haar measure on $A$ then
  $d_A(\phi)(\phi_*\mu) = \mu.$
\end{lemma}
\begin{proof}
  \leanok
  This is a restatement of the previous result.
\end{proof}
```

:::theorem "haar_character_pullback_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_smul_eq_comap")
Pulling Haar measure back along an additive homeomorphism scales the measure by
the same Haar-character factor.
This is the pullback companion to {uses "haar_character_pushforward_formula"}[].
:::

```tex "haar_character_project/lt_pullback_formula"
If $\mu$ is any regular Haar measure on $A$ then $d_A(\phi)\mu = \phi^*\mu.$
```

:::proof "haar_character_pullback_formula"
This follows from the pushforward formula applied to the regular Haar measure
`\phi^* \mu` and the fact that `\phi_*\phi^*\mu = \mu`.
:::

```tex "haar_character_project/pullback_formula"
\begin{corollary}
  \lean{MeasureTheory.addEquivAddHaarChar_smul_eq_comap}
  \label{MeasureTheory.addEquivAddHaarChar_comap}
  \uses{MeasureTheory.addEquivAddHaarChar_smul_map}
  \leanok
  If $\mu$ is any regular Haar measure on $A$ then
  $d_A(\phi)\mu = \phi^*\mu.$
\end{corollary}
\begin{proof}
  \leanok
  This follows from lemma~\ref{MeasureTheory.addEquivAddHaarChar_smul_map}
  applied to the regular Haar measure $\phi^*\mu$ and the fact that $\phi_*\phi^*\mu=\mu$.
\end{proof}
```

:::theorem "haar_character_identity" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_refl")
The Haar character of the identity automorphism is `1`.
:::

```tex "haar_character_project/lt_identity_formula"
$d_A(id)=1.$
```

:::proof "haar_character_identity"
`d_A(id)=1`.
:::

```tex "haar_character_project/identity"
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_refl}
  \lean{MeasureTheory.addEquivAddHaarChar_refl}
  \uses{MeasureTheory.addEquivAddHaarChar_eq}
  \leanok
  $d_A(id)=1.$
\end{lemma}
\begin{proof}
  \uses{MeasureTheory.addEquivAddHaarChar_eq}
  \leanok
  Clear.
\end{proof}
```

:::theorem "haar_character_preimage_formula" (parent := "haar_character_project")
If `X` is a Borel set, then `μ(X) = d_A(φ) μ(φ⁻¹(X))`.
This is the set-theoretic specialization of
{uses "haar_character_pushforward_formula"}[].
:::

```tex "haar_character_project/lt_preimage_formula"
If $X$ is a Borel set then $\mu(X)=d_A(\phi)\mu(\phi^{-1}X)$.
```

:::theorem "haar_character_integral_formula" (parent := "haar_character_project")
If `f : A → ℝ` is Borel measurable, then
`d_A(φ) ∫ f(x) d(φ_* μ)(x) = ∫ f(x) dμ(x)`.
Equivalently, `d_A(φ) ∫ f(x) dμ(x) = ∫ f(x) d(φ^* μ)(x)`.
This is the integral version of {uses "haar_character_pushforward_formula"}[].
:::

```tex "haar_character_project/lt_integral_formula"
If $f:A\to\R$ is a Borel measurable function then $d_A(\phi)\int f(x)d\phi_*\mu(x)=\int f(x)d\mu(x)$.
```

:::proof "haar_character_integral_formula"
This is a restatement of the previous result.
:::

```tex "haar_character_project/lt_integral_proof"
This is a restatement of the previous result.
```

:::theorem "haar_character_is_multiplicative" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_trans")
For additive homeomorphisms `φ` and `ψ`, one has
`d_A(φ ∘ ψ) = d_A(φ) d_A(ψ)`, and the identity map has Haar character `1`.
This combines {uses "haar_character_identity"}[] with the composition law from
the additive Haar-character setup {uses "additive_haar_character"}[].
:::

```tex "haar_character_project/lt_multiplicative_formula"
$d_A(\phi\circ\psi)=d_A(\phi)d_A(\psi).$
```

:::proof "haar_character_is_multiplicative"
Here's one way: it suffices to prove that
`d_A(\phi\circ\psi)(\phi\circ\psi)_*\mu = d_A(\phi)d_A(\psi)(\phi\circ\psi)_*\mu`
(because there exists a compact set with positive finite measure) and using
the pushforward formula and the fact that `(\phi\circ\psi)_*\mu = \phi_*(\psi_*\mu)`
one can simplify both sides to `\mu`.
:::

```tex "haar_character_project/multiplicative"
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_trans}
  \lean{MeasureTheory.addEquivAddHaarChar_trans}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \leanok
  \discussion{511}
  $d_A(\phi\circ\psi)=d_A(\phi)d_A(\psi).$
\end{lemma}
\begin{proof}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_smul_preimage}
  Here's one way: it suffices to prove that
  $d_A(\phi\circ\psi)(\phi\circ\psi)_*\mu=d_A(\phi)d_A(\psi)(\phi\circ\psi)_*\mu$
  (because there exists a compact set with positive finite measure)
  and using lemma~\ref{MeasureTheory.addEquivAddHaarChar_smul_map}
  and the fact that $(\phi\circ\psi)_*\mu=\phi_*(\psi_*\mu)$
  one can simplify both sides to $\mu$.
\end{proof}
```

# Examples

:::theorem "real_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_real")
If $`R=\R`$ then $`\delta_R(u)=|u|`$.
:::

```tex "haar_character_project/lt_real_formula"
If $R=\R$ then $\delta_R(u)=|u|$.
```

:::proof "real_haar_character_formula"
Take `\mu` to be Lebesgue measure and `X = [0,1]`. We have
`δ(u) = \mu(uX)`. If `u > 0` then `u[0,1] = [0,u]`, which has measure
`u = |u|`, and if `u < 0` then `u[0,1] = [u,0]`, which has measure `-u = |u|`.
:::

```tex "haar_character_project/lt_real_proof"
Take $\mu$ to be Lebesgue measure and $X=[0,1]$.
```

:::theorem "complex_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_complex")
If $`R=\bbC`$ then $`\delta_R(u)=|u|^2`$.
:::

```tex "haar_character_project/lt_complex_formula"
If $R=\bbC$ then $\delta_R(u)=|u|^2$.
```

:::proof "complex_haar_character_formula"
Multiplication by a positive real `r` sends a unit square to a square of area
`r^2 = |r|^2`. Multiplication by `e^{i\theta}` is a rotation and thus does not
change area. The general case follows.
:::

```tex "haar_character_project/lt_complex_proof"
Multiplication by a positive real $r$ sends a unit square to a square of area $r^2=|r|^2$.
```

# Ring-level Haar characters

:::definition "ring_level_haar_character" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar")
For a locally compact topological ring `R` and `u ∈ R^\times`, define
`δ_R(u) = d_R(ℓ_u)`, where `ℓ_u(r) = ur`.
This packages the additive setup for ring-level use via
{uses "additive_haar_character"}[].
:::

```tex "haar_character_project/ring_level"
Now let $R$ be a locally compact topological ring. The \emph{Haar character} of $R$,
or more precisely the \emph{left Haar character} of $R$, is a group homomorphism
$R^\times\to\R^\times$ defined in the following way.
```

:::theorem "ring_haar_character_integral_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_mul_integral")
If `f : R → ℝ` is Borel measurable and `u ∈ R^\times`, then
`δ_R(u) ∫ f(ux) dμ(x) = ∫ f(x) dμ(x)`.
This is the ring-theoretic specialization of
{uses "haar_character_integral_formula"}[] and depends on
{uses "ring_level_haar_character"}[].
:::

```tex "haar_character_project/ring_integral"
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_mul_integral}
  \lean{MeasureTheory.ringHaarChar_mul_integral}
  \uses{MeasureTheory.ringHaarChar}
  \leanok
  \discussion{514}
  If $f:R\to\R$ is a Borel measurable function and $u\in R^\times$ then
  $\delta_R(u)\int f(ux)d\mu(x)=\int f(x)d\mu(x)$.
\end{lemma}
\begin{proof}
  \uses{MeasureTheory.addEquivAddHaarChar_smul_integral_map}
  \leanok
  A short calculation using lemma~\ref{MeasureTheory.addEquivAddHaarChar_smul_integral_map}.
\end{proof}
```

:::theorem "ring_haar_character_volume_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_mul_volume")
If `X` is a Borel subset of `R` and `r ∈ R^\times`, then
`μ(rX) = δ_R(r) μ(X)`.
This is the ring-theoretic specialization of
{uses "haar_character_preimage_formula"}[] and depends on
{uses "ring_level_haar_character"}[].
:::

```tex "haar_character_project/ring_volume"
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_mul_volume}
  \lean{MeasureTheory.ringHaarChar_mul_volume}
  \uses{MeasureTheory.ringHaarChar,MeasureTheory.addEquivAddHaarChar_smul_preimage}
  \leanok
  \discussion{515}
  If $X$ is a Borel subset of $R$ and $r\in R^\times$ then $\mu(rX)=\delta_R(r)\mu(X)$.
\end{lemma}
\begin{proof}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_smul_preimage}
   Immediate from lemma~\ref{MeasureTheory.addEquivAddHaarChar_smul_preimage}.
\end{proof}
```

:::theorem "ring_haar_character_continuous" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_continuous")
The function `δ_R : R^\times → ℝ_{>0}` is continuous.
The TeX proof builds this directly from
{uses "ring_haar_character_integral_formula"}[].
:::

```tex "haar_character_project/lt_ring_continuous"
The function $\delta_R:R^\times\to\R_{>0}$ is continuous.
```

:::proof "ring_haar_character_continuous"
Fix a Haar measure `\mu` on `R` and a continuous real-valued function `f` on
`R` with compact support and such that `\int f(x) d\mu(x) \neq 0`. Then
`r \mapsto \int f(rx) d\mu(x)` is continuous, and so is
`u \mapsto (\int f(ux) d\mu(x))/(\int f(x) d\mu(x))`. Hence `δ_R^{-1}` is
continuous, and thus `δ_R` is too.
:::

```tex "haar_character_project/ring_continuous"
\begin{corollary}
  \label{MeasureTheory.ringHaarChar_continuous}
  \lean{MeasureTheory.ringHaarChar_continuous}
  \uses{MeasureTheory.ringHaarChar}
  \leanok
  \discussion{516}
  The function $\delta_R:R^\times\to\R_{>0}$ is continuous.
\end{corollary}
\begin{proof}
  \leanok
  \uses{MeasureTheory.ringHaarChar_mul_integral}
  Fix a Haar measure $\mu$ on $R$ and a continuous real-valued function
  $f$ on $R$ with compact support and such that $\int f(x) d\mu(x)\not=0$.
  Then $r \mapsto \int f(rx) d\mu(x)$ is a continuous function
  from $R\to\R$ (because a continuous function with compact support is uniformly
   continuous) and thus gives a continuous function $R^\times\to\R$.
   Thus the function $u\mapsto (\int f(ux) d\mu(x))/(\int f(x)d\mu(x))$ is
   a continuous function from $R^\times$ to $\R$ taking values in $\R_{>0}$.
   Hence $\delta_R^{-1}$ is continuous,
   from lemma~\ref{MeasureTheory.ringHaarChar_mul_integral},
   and thus $\delta_R$ is too.
\end{proof}
```

:::theorem "padic_haar_character_formula" (parent := "haar_character_project")
For $`\mathbf{Q}_p`$, the Haar character agrees with the usual p-adic norm.
:::

```tex "haar_character_project/lt_padic_formula"
If $R=\Q_p$ then $\delta_R(u)=|u|_p$, the usual $p$-adic norm.
```

:::proof "padic_haar_character_formula"
Normalise Haar measure so that `μ(\Z_p)=1`.
:::

```tex "haar_character_project/lt_padic_proof"
Normalise Haar measure so that $\mu(\Z_p)=1$.
```

:::theorem "padic_integer_haar_character_formula" (parent := "haar_character_project")
For $`\mathbf{Z}_p`$, the Haar character is constantly $`1`$ on the unit group.
:::

```tex "haar_character_project/lt_padic_integer_formula"
If $R=\Z_p$ then the Haar character is constantly $1$ on the unit group.
```

:::proof "padic_integer_haar_character_formula"
This is the integral counterpart to the p-adic formula.
:::

```tex "haar_character_project/lt_padic_integer_proof"
This is the integral counterpart to the p-adic formula.
```

The TeX chapter also remarks here that for a finite extension of `ℚ_p`, the
same computation gives the normalized nonarchimedean norm.

```tex "haar_character_project/lt_padic_remark"
If $R$ is a finite extension of $\Q_p$ then $\delta_R(u)$ is the norm on $R$ normalised in the following way: $\delta_R(\varpi)=q^{-1}$, where $\varpi$ is a uniformiser and $q$ is the size of the (finite) residue field.
```

At the level of the TeX proof, the `\mathbf{Q}_p` calculation is completely
concrete: normalize Haar measure by `μ(\mathbf{Z}_p) = 1`, check that units
preserve `\mathbf{Z}_p`, and compute the effect of multiplication by `p` using
the index of `p\mathbf{Z}_p` inside `\mathbf{Z}_p`.

```tex "haar_character_project/lt_padic_calculation"
Normalise Haar measure so that $\mu(\Z_p)=1$.
```

# Algebras

:::theorem "haar_character_linear_map_determinant_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det")
Let `F` be a locally compact field and `V` a finite free `F`-module. Assume that
there is an `F`-basis of `V` with respect to which `φ` is a product of
elementary and diagonal matrices. Then
`d_V(φ) = δ_F(det(φ))`, where `det(φ)` is the determinant of `φ` as an
`F`-linear map.
This is the linear-algebra counterpart to {uses "ring_level_haar_character"}[].
:::

```tex "haar_character_project/lt_linear_map_determinant_formula"
Assume that there's an $F$-basis for $V$ such that $\phi$ is a product of elementary and diagonal matrices.
```

:::proof "haar_character_linear_map_determinant_formula"
The proof is a generalization of `Real.map_matrix_volume_pi_eq_smul_volume_pi`.
:::

```tex "haar_character_project/lt_linear_map_determinant_proof"
The proof is a generalization of \href{https://leanprover-community.github.io/mathlib4\_docs/Mathlib/MeasureTheory/Measure/Lebesgue/Basic.html\#Real.map\_matrix\_volume\_pi\_eq\_smul\_volume\_pi}{\tt Real.map\_matrix\_volume\_pi\_eq\_smul\_volume\_pi}.
```

:::theorem "algebra_haar_character_determinant_formula" (parent := "haar_character_project") (lean := "MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det")
If `F` is a locally compact field, `R` is a finite-dimensional `F`-algebra,
and `u ∈ R^\times`, then
`δ_R(u) = δ_F(det(ℓ_u))`.
This is the algebraic corollary of
{uses "haar_character_linear_map_determinant_formula"}[].
:::

```tex "haar_character_project/lt_algebra_determinant_formula"
If $u\in R^\times$ then $\delta_R(u)=\delta_F(\det(\ell_u))$.
```

:::proof "algebra_haar_character_determinant_formula"
Follows immediately from the preceding lemma.
:::

```tex "haar_character_project/lt_algebra_determinant_proof"
Follows immediately from the preceding lemma.
```

```tex "haar_character_project/algebras"
  Say $F$ is a locally compact topological ring (for example $\R$ or $\bbC$ or $\Q_p$,
  or the adeles of a number field), $V$
  is a finite free $F$-module, and $\phi:V\to V$ is an invertible $F$-linear map.
  Then $V$ with its module topology (which is the product topology if one picks a basis)
  is a locally compact topological abelian group, and $\phi$ is additive.
  One can check that linearity implies continuity (this is
  {\tt IsModuleTopology.continuous\_of\_linearMap} in mathlib),
  so in fact $\phi$ is a homeomorphism
  and our theory applies. The following lemma gives a formula for the scale factor $d_V(\phi)$.

\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}
  \lean{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}
  \uses{MeasureTheory.ringHaarChar}
  \leanok
  \discussion{517}
  Assume that there's an $F$-basis for $V$ such that $\phi$ is a product of elementary
  and diagonal matrices (note that this is automatic if $F$ is a field and mathlib
  has this). Then
  $d_V(\phi)=\delta_F(\det(\phi))$, where $\det(\phi)\in F$ is the determinant of
  $\phi$ as an $F$-linear map.
\end{lemma}
\begin{proof}
\uses{MeasureTheory.addEquivAddHaarChar}
\leanok
The proof is a generalization of
\href{https://leanprover-community.github.io/mathlib4\_docs/Mathlib/MeasureTheory/Measure/Lebesgue/Basic.html\#Real.map\_matrix\_volume\_pi\_eq\_smul\_volume\_pi}
{\tt Real.map\_matrix\_volume\_pi\_eq\_smul\_volume\_pi},
which crucially uses the induction principle
\href{https://leanprover-community.github.io/mathlib4\_docs/Mathlib/LinearAlgebra/Matrix/Transvection.html\#Matrix.diagonal\_transvection\_induction\_of\_det\_ne\_zero}
{\tt Matrix.diagonal\_transvection\_induction\_of\_det\_ne\_zero}.
One checks it explicitly for diagonal matrices and for matrices which are the identity
except that one off-diagonal entry is non-zero.

Note: we assume that $F$ is second countable
(but it shouldn't be necessary).
\end{proof}

Now say $F$ is a locally compact topological field, and that $R$ is a (possibly
non-commutative) $F$-algebra. Recall that this means that ($R=0$ or) $F$ lies in the centre of $R$.
Assume that $R$ is finite-dimensional as an $F$-vector space. Then if we give $R$ the
$F$-module topology (which is just the product topology if we pick a basis) then it is known
that $R$ becomes a topological ring. Now say $u\in R^\times$, and
recall $\ell_u:R\to R$ is left multiplication by $u$. Then $\ell_u$ is easily checked to be
an $F$-linear homeomorphism.

  \begin{corollary}
  \label{MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det}
  \lean{MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det}
  \leanok
  If $u\in R^\times$ then $\delta_R(u)=\delta_F(\det(\ell_u))$.
\end{corollary}
\begin{proof}
  \uses{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det}
  \leanok
  Follows immediately from the preceding lemma.
\end{proof}
```

# Left and right multiplication

:::theorem "central_simple_algebra_left_right_same_haar" (parent := "haar_character_project") (lean := "IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight")
For a central simple algebra `B` over a locally compact field `F` and
`u ∈ B^\times`, one has `d_B(r_u) = δ_B(u)`.
This combines the determinant comparison {uses "IsSimpleRing.mulLeft_det_eq_mulRight_det"}[] with
{uses "algebra_haar_character_determinant_formula"}[].
:::

```tex "haar_character_project/lt_left_right_same_haar"
If $B$ is a central simple algebra over a locally compact field $F$, and if $u\in B^\times$, then $d_B(r_u)=\delta_B(u)$.
```

:::proof "central_simple_algebra_left_right_same_haar"
The TeX chapter proves that left and right multiplication have the same
determinant in a central simple algebra by base-changing to an algebraic closure
and identifying the algebra with a matrix algebra. Once the determinants agree,
the Haar-character factors agree as well.

This symmetry is exactly what is needed later when quotient arguments in
division algebras mix left and right multiplication.
:::

```tex "haar_character_project/left_right_multiplication"
If $R$ is a locally compact topological ring, and if multiplication on $R$ is not commutative,
then left and right multiplication by an element of~$R$ can scale Haar measure in different ways.
For example if $R$ is the upper-triangular $2\times 2$ matrices with real
entries, then left multiplication by $\begin{pmatrix}a&0\\0&1\end{pmatrix}$
sends $\begin{pmatrix}x&y\\0&z\end{pmatrix}$ to $\begin{pmatrix}ax&ay\\0&z\end{pmatrix}$
and thus scales $R$'s additive
Haar measure by $|a|^2$, but right multiplication by $\begin{pmatrix}a&0\\0&1\end{pmatrix}$
sends $\begin{pmatrix}x&y\\0&z\end{pmatrix}$ to $\begin{pmatrix}ax&y\\0&z\end{pmatrix}$
and thus scales $R$'s additive Haar measure by a factor of $|a|$.

What's going on here is that if we regard left and right multiplication as $\R$-linear
maps from $R$ to $R$, then their associated matrices with respect to the obvious basis
are $diag(a,a,1)$ and $diag(a,1,1)$, which have different determinants.

However, if $k$ is now any field and if $B$ is a finite-dimensional central
simple algebra over $k$ (for example a quaternion algebra, the case we'll care about later),
and if $u\in B^\times$ then $x\mapsto ux$ and $x\mapsto xu$
are both $k$-linear endomorphisms of $B$, and I claim that they have
the same determinant.

\begin{lemma}
  \label{IsSimpleRing.mulLeft_det_eq_mulRight_det}
  \lean{IsSimpleRing.mulLeft_det_eq_mulRight_det}
  \leanok
  \discussion{518}
  Say $B$ is a finite-dimensional central simple algebra over a field~$k$,
  and $u\in B^\times$. Let $\ell_u:B\to B$ be the $k$-linear mapping $x$ to $ux$ and
  let $r_u:B\to B$ be the $k$-linear map sending $x$ to $xu$. Then
  $\det(\ell_u)=\det(r_u)$.
\end{lemma}
\begin{proof}
  \leanok
  Determinants are unchanged by base extension, so WLOG $k$ is algebraically closed.
  Then it's known that $B$ must be a matrix algebra, say $M_n(k)$. Now $u$ can be thought
  of as a matrix which has its own intrinsic determinant $d$, and $B$ as a left $B$-module
  becomes a direct sum of $n$ copies of $V$, the standard $n$-dimensional representation of $B$.
  Thus $\det(\ell_u)=d^n$. Similarly $\det(r_u)=d^n$ and in particular they are equal.
\end{proof}

\begin{corollary}
  \label{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}
  \lean{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}
  \leanok
  If $B$ is a central simple algebra over a locally compact field $F$, and if $u\in B^\times$,
  then $d_B(r_u)=\delta_B(u)$ (recall that the latter is defined to mean $d_B(\ell_u)$).
\end{corollary}
\begin{proof}
  \leanok
  \uses{IsSimpleRing.mulLeft_det_eq_mulRight_det, MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det}
  If $\ell_u$ and $r_u$ denote left and right multiplication by $u$ on $B$, then we have
  seen in lemma~\ref{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det} that $d_B(r_u)=\delta_F(\det(r_u))$.
  Lemma~\ref{IsSimpleRing.mulLeft_det_eq_mulRight_det} tells
  us that this is $\delta_F(\det(\ell_u))$ and this is $\delta_B(u)$ again by
  corollary~\ref{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det}.
\end{proof}
```

# Finite products

:::theorem "product_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_prodCongr")
If `A` and `B` are locally compact additive groups and `φ : A ≃ₜ+ A` and
`ψ : B ≃ₜ+ B` are additive homeomorphisms, then
`d_{A × B}(φ × ψ) = d_A(φ) d_B(ψ)`.
Iterating gives the corresponding finite-product formula. This is the
finite-product analogue of {uses "haar_character_is_multiplicative"}[].
:::

```tex "haar_character_project/lt_product_formula"
If $(A,+)$ and $(B,+)$ are locally compact topological abelian groups, and if $\phi:A\to A$ and $\psi:B\to B$ are additive homeomorphisms, then $\phi\times\psi:A\times B\to A\times B$ is an additive homeomorphism.
```

:::proof "product_haar_character_formula"
First prove this for two factors, then iterate.
:::

```tex "haar_character_project/lt_product_formula_proof"
d_{A\times B}(\phi\times\psi)=d_A(\phi)d_B(\psi).
```

:::theorem "product_ring_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_prod")
If `R` and `S` are locally compact topological rings, then
$`\delta_{R\times S}(r,s)=\delta_R(r)\delta_S(s)`$.
:::

```tex "haar_character_project/lt_product_ring_formula"
If $R$ and $S$ are locally compact topological rings, then $\delta_{R\times S}(r,s)=\delta_R(r)\times\delta_S(s)$.
```

:::proof "product_ring_haar_character_formula"
Follows immediately from {uses "product_haar_character_formula"}[].
:::

```tex "haar_character_project/finite_products"
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_prodCongr}
  \lean{MeasureTheory.addEquivAddHaarChar_prodCongr}
  \leanok
  \discussion{520}
  If $(A,+)$ and $(B,+)$ are locally compact topological abelian groups,
  and if $\phi:A\to A$ and $\psi:B\to B$ are additive homeomorphisms,
  then $\phi\times\psi:A\times B\to A\times B$ is an additive homeomorphism (this is
  obvious), and
  $d_{A\times B}(\phi\times\psi)=d_A(\phi)d_B(\psi)$.
\end{lemma}
\begin{proof}
  \leanok
  We only need this result in the case where both $A$ and $B$ are second-countable, in which case
  {\tt Prod.borelSpace} can be used to show that Haar measure on $A\times B$ is the product of
  Haar measures on $A$ and $B$, and in this case the result follows easily. Without this assumption,
  the product of these measures may not even be a Borel measure and one has to be more careful.
  The proof in this case is explained by Gou\"{e}zel
  \href{https://leanprover.zulipchat.com/#narrow/channel/116395-maths/topic/Product.20of.20Borel.20spaces/near/487257981}{here}.
  Here is the idea. Let $\rho$ be a Haar measure on $A\times B$. Fix sets $X\subseteq A$ and
  $Y\subseteq B$ which are compact with nonempty interior. We can now pull back $\rho$
  to a measure $\nu$ on the Borel sigma-algebra of $A$ defined as $\nu(s)=\rho(s\times Y)$
  and this is easily checked to be a Haar measure on $A$. Then
  $\delta_{A\times B}(a,0)\nu(X)=
  \delta_{A\times B}(a,0)\rho(X\times Y)=\rho((a,0)(X\times Y))=
  \rho(aX\times Y)=\nu(aX)=\delta_A(a)\nu(X)$
  , so $\delta_{A\times B}(a,0)=\delta_A(a)$.
  Similarly $\delta_{A\times B}(0,b)=\delta_B(b)$ and because $\delta_{A\times B}$ is a group
  homomorphism we're home.
\end{proof}

\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_piCongrRight}
  \lean{MeasureTheory.addEquivAddHaarChar_piCongrRight}
  \leanok
  \discussion{521}
  \uses{MeasureTheory.addEquivAddHaarChar_prodCongr}
  If $A_i$ are a finite collection of locally compact topological abelian groups,
  with $\phi_i:A_i\to A_i$ additive homeomorphisms, then $d_{\prod_i A_i}(\prod_i\phi_i)=\prod_i d_{A_i}(\phi_i)$.
\end{lemma}
\begin{proof}
  \leanok
  Induction on the size of the finite set, using the previous lemma.
\end{proof}

\begin{lemma}
  \label{MeasureTheory.ringHaarChar_prod}
  \lean{MeasureTheory.ringHaarChar_prod}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_prodCongr}
  If $R$ and $S$ are locally compact topological rings, then $\delta_{R\times S}(r,s)=\delta_R(r)\times\delta_S(s)$.
\end{lemma}
\begin{proof}
  \leanok
  Follows immediately from lemma~\ref{MeasureTheory.addEquivAddHaarChar_prodCongr}.
\end{proof}

\begin{lemma}
  \label{MeasureTheory.ringHaarChar_pi}
  \lean{MeasureTheory.ringHaarChar_pi}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_piCongrRight}
  If $R_i$ are a finite collection of locally compact topological rings,
  and $u_i\in R_i^\times$ then $\delta_{\prod_i R_i}((u_i)_i)=\prod_i\delta_{R_i}(u_i)$.
\end{lemma}
\begin{proof}
  \leanok
  Follows immediately from lemma~\ref{MeasureTheory.addEquivAddHaarChar_piCongrRight}.
\end{proof}
```

# Some measure-theoretic preliminaries

:::theorem "open_embedding_pullback_is_haar_measure" (parent := "haar_character_project") (lean := "Topology.IsOpenEmbedding.isHaarMeasure_comap")
If a locally compact topological group embeds openly into another, then pulling
back a Haar measure along that open embedding again gives a Haar measure.
:::

```tex "haar_character_project/lt_open_embedding_haar_measure"
The pullback along $f$ of a Haar measure on $B$ is a Haar measure on $A$.
```

:::proof "open_embedding_pullback_is_haar_measure"
The TeX proof is elementary: translation invariance is immediate, compact sets
stay finite because continuous images of compact sets are compact, and open sets
stay bounded because open embeddings send open sets to open sets.
:::

```tex "haar_character_project/lt_open_embedding_haar_measure_proof"
Translation-invariance is easy, compact sets are finite because continuous image of compact is compact, open sets are bounded because image of open is open.
```

:::theorem "open_embedding_pullback_regular_measure" (parent := "haar_character_project") (lean := "Topology.IsOpenEmbedding.regular_comap")
Pulling a regular Borel measure back along an open embedding again gives a
regular Borel measure.
:::

```tex "haar_character_project/lt_open_embedding_regular"
The pullback of a regular Borel measure along an open embedding is a regular Borel measure.
```

:::proof "open_embedding_pullback_regular_measure"
Again this is exactly the TeX argument: the image of a compact set is compact
and the image of an open set is open, so the usual regularity axioms are
preserved by pullback.
:::

```tex "haar_character_project/lt_open_embedding_regular_proof"
Again this is because the image of compact is compact and the image of open is open.
```

:::theorem "compact_group_haar_character_trivial" (parent := "haar_character_project") (lean := "MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace")
If an additive automorphism acts on a compact additive group, then its Haar
character is `1`.
:::

```tex "haar_character_project/lt_compact_group_trivial"
Say $A$ is a compact topological additive group and $\phi:A\to A$ is an additive isomorphism.
```

:::proof "compact_group_haar_character_trivial"
{uses "haar_character_pullback_formula"}[]
We have $`d_A(\phi)\mu(A)=\mu(A)`$.
:::

```tex "haar_character_project/lt_compact_group_trivial_proof"
We have $d_A(\phi)\mu(A)=\mu(A)$.
```

:::theorem "open_embedding_preserves_haar_character" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding")
If an additive automorphism on a locally compact group is intertwined with one
on a larger group through an open embedding, then the two Haar characters
agree.
This is the open-embedding transfer principle for
{uses "additive_haar_character"}[].
:::

```tex "haar_character_project/lt_open_embedding_preserves_haar_character"
If $f:A\to B$ is a group homomorphism and open embedding between locally compact topological additive groups and if $\alpha:A\to A$ and $\beta:B\to B$ are additive homeomorphisms such that the square commutes then $d_A(\alpha)=d_B(\beta)$.
```

:::proof "open_embedding_preserves_haar_character"
The TeX proof pulls back Haar measure along the open embedding and compares the
resulting integral identities on the smaller and larger groups. The pullback is
a regular Haar measure by
{uses "open_embedding_pullback_is_haar_measure"}[] and
{uses "open_embedding_pullback_regular_measure"}[].

This is a transfer principle: once one knows the Haar character in an ambient
group, one can sometimes read off the character on an open embedded subgroup for
free.
:::

```tex "haar_character_project/measure_theoretic_preliminaries"
\begin{lemma}
  \label{Topology.IsOpenEmbedding.isHaarMeasure_comap}
  \lean{Topology.IsOpenEmbedding.isHaarMeasure_comap}
  \leanok
  \discussion{507}
  Let $A$ and $B$ be locally compact topological groups
  and let $f:A\to B$ be both a group homomorphism and open embedding.
  The pullback along $f$ of a Haar measure on $B$ is a Haar measure on $A$.
\end{lemma}
\begin{proof}
  \leanok
  Translation-invariance is easy, compact sets are finite because continuous
  image of compact is compact, open sets are bounded because image of open is open.
\end{proof}

\begin{lemma}
  \label{Topology.IsOpenEmbedding.regular_comap}
  \lean{Topology.IsOpenEmbedding.regular_comap}
  \leanok
  \discussion{513}
  The pullback of a regular Borel measure along an open
  embedding is a regular Borel measure.
\end{lemma}
\begin{proof}
  \leanok
  Again this is because the image of compact is compact and the
  image of open is open, so all the properties of being a regular measure
  are easily checked.
\end{proof}

\begin{lemma}
  \label{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}
  \lean{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}
  \leanok
  \discussion{532}
  Say $A$ is a compact topological additive group and $\phi:A\to A$ is an additive isomorphism.
Then $d_A(\phi)=1.$
\end{lemma}
\begin{proof}
\uses{MeasureTheory.addEquivAddHaarChar_smul_preimage}
  \leanok
  We have $d_A(\phi)\mu(A)=\mu(A)$
  from lemma~\ref{MeasureTheory.addEquivAddHaarChar_smul_preimage}
  and $\mu(A)$ is positive and finite because $A$ is open and compact.
\end{proof}

\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding}
  \lean{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding}
  \leanok
  \discussion{551}
  If $f:A\to B$ is a group homomorphism and open embedding between locally compact
  topological additive groups and if $\alpha:A\to A$ and $\beta:B\to B$ are additive
  homeomorphisms such that the square commutes (i.e., $f\circ\alpha=\beta\circ f$)
  then $d_A(\alpha)=d_B(\beta)$.
\end{lemma}
\begin{proof}
  \uses{Topology.IsOpenEmbedding.isHaarMeasure_comap,
    Topology.IsOpenEmbedding.regular_comap,
    MeasureTheory.addEquivAddHaarChar_smul_integral_comap}
  \leanok
  Choose a regular Haar measure $\mu_B$ on $B$. We just saw
  in lemmas~\ref{Topology.IsOpenEmbedding.isHaarMeasure_comap}
  and~\ref{Topology.IsOpenEmbedding.regular_comap} that its pullback
  $\mu_A:=f^*\mu_B$ to $A$ is also a regular Haar
  measure. Now fix a continuous compactly-supported function $g$ on $A$ with
  $0<\int g(a)d\mu(a)<\infty$. Then $d_A(\alpha)\int g(a)d\mu_A(a)=\int g(a)d(\alpha^*\mu_A)(a)$
  by lemma~\ref{MeasureTheory.addEquivAddHaarChar_smul_integral_comap}.
  This equals $\int g(a)d(\alpha^* f^*\mu_B)(a)$ by definition,
  which is $\int g(a)d(f^*\beta^*\mu_B)(a)$ because pullback of pullback is pullback.
  This equals $d_B(\beta)\int g(a) d(f^*\mu_B)(a)$ by
  corollary~\ref{MeasureTheory.addEquivAddHaarChar_comap}
  which is $d_B(\beta)\int g(a)d\mu_A(a)$ by definition,
  and so $d_A(\alpha)=d_B(\beta)$ as required.
\end{proof}
```

# Restricted products

:::theorem "restricted_product_maps_continuous" (parent := "haar_character_project") (lean := "Continuous.restrictedProduct_congrRight")
If one has compatible continuous maps on the factors of a restricted product,
then the induced map on the restricted product is continuous.
:::

```tex "haar_character_project/lt_restricted_product_continuous"
If the $A_i$ and $B_i$ are topological spaces and the $\phi_i$ are continuous functions, then the restricted product $\phi = \prod'_i\phi_i$ is a continuous function.
```

:::proof "restricted_product_maps_continuous"
The TeX chapter reduces continuity to the universal property of the
restricted-product topology. One checks continuity on sufficiently large finite
stages, where the map becomes an ordinary finite product of continuous maps.
:::

```tex "haar_character_project/lt_restricted_product_continuous_proof"
We use the universal property {\tt RestrictedProduct.continuous\_dom} of the topology in mathlib.
```

:::theorem "restricted_product_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight")
With `A`, `A_i`, `C_i`, `φ_i`, and `φ` defined as above, one has
`δ_A(φ) = ∏_i δ_{A_i}(φ_i)`.
This uses the compact-triviality input from
{uses "compact_group_haar_character_trivial"}[] and the finite-product formula
{uses "product_haar_character_formula"}[].
:::

```tex "haar_character_project/lt_restricted_product_formula"
With $A$, $A_i$, $C_i$, $\phi_i$, $\phi$ defined as above, we have $\delta_A(\phi)=\prod_i\delta_{A_i}(\phi_i)$.
```

:::proof "restricted_product_haar_character_formula"
This is one of the chapter's key technical payoffs. Because the reference
subgroups are compact and open, any automorphism that preserves them has local
Haar character `1` there. So only finitely many places contribute, and the
global Haar character becomes a finite product of local terms.

The TeX chapter also records the technical caveat that one wants a countable
index set and second-countable factors so that the product sigma algebra agrees
with the Borel sigma algebra on the restricted product. That is the level of
generality needed for the adelic applications.

That is precisely the mechanism that later makes adelic Haar-character
computations tractable.
:::

```tex "haar_character_project/lt_restricted_product_formula_proof"
Assume $\phi_i(C_i)=C_i$ for all $i\not\in S$, a finite set, and work in the open subgroup $U:=\prod_{i\in S}A_i\times\prod_{i\notin S}C_i$.
```

```tex "haar_character_project/restricted_products"
\begin{lemma}
  \lean{Continuous.restrictedProduct_congrRight}
  \label{Continuous.restrictedProduct_congrRight}
  \leanok
  \discussion{531}
  If the $A_i$ and $B_i$ are topological spaces and the $\phi_i$ are continuous functions,
  then the restricted product $\phi = \prod'_i\phi_i$ is a continuous function.
\end{lemma}
\begin{proof}
  \leanok
  We use the universal property {\tt RestrictedProduct.continuous\_dom} of the
  topology in mathlib to reduce to the claim that for all finite $S$,
  the induced map $A_S:=\prod_{i\in S}A_i\times\prod_{i\notin S}C_i\to B$ is continuous.
  Because the inclusion $A_S\to A_T$ is continuous for $S\subseteq T$ we are reduced
  to checking this claim for $S$ sufficiently large that it contains all of the $i$
  for which $\phi(C_i)\not=D_i$. For such $S$, this map $A_S\to B$ factors as $A_S\to B_S\to B$
  and $B_S\to B$ is continuous, so it suffices to prove that $A_S\to B_S$ is continuous, but
  this is just a product of continuous maps.
\end{proof}

We now focus on the case that $B_i=A_i$ are locally compact groups, $D_i=C_i$ are compact
open subgroups, and $\phi_i:A_i\to A_i$ are group isomorphisms and homeomorphisms sending
$C_i$ onto $C_i$ for all but finitely many $i$. Then the restricted product $A:=\prod'A_i$
of the $A_i$ with respect to the $C_i$ is also a locally compact topological group, and the
restricted product $\phi=\prod'\phi_i$ of the $\phi_i$ is a group isomorphism and homeomorphism,
so we can ask how $d_A(\phi)$ compares to the $d_{A_i}(\phi_i)$.

First note that $d_{A_i}(\phi_i)=1$ for all the $i$ such that $\phi_i(C_i)=C_i$, as
$d_{A_i}(\phi_i)$ can be computed as $\mu(\phi_i(C_i))/\mu(C_i)$ and $\mu(C_i)$ is
guaranteed to have positive finite measure as it is open and compact. Hence the product
$\prod_id_{A_i}\phi_i$ is a finite product, in the sense that all but finitely many terms are 1.
The following theorem shows that the value of this product is $d(\phi)$.

\begin{theorem}
  \label{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}
  \lean{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}
  \leanok
  \discussion{552}
  With $A$, $A_i$, $C_i$, $\phi_i$, $\phi$ defined as above, we have
  $\delta_A(\phi)=\prod_i\delta_{A_i}(\phi_i)$.
\end{theorem}
\begin{remark} In the Lean file we make the additional assumption that the index set over
  which we're taking the product, is countable, and that the $A_i$ are second countable.
  This is because in this proof we make use
  of an infinite product $\prod_{i\notin S}C_i$ of topological spaces equipped with Haar measure,
  so each topological space gets equipped with the Borel sigma algebra.
  Mathlib then gives the product a canonical product sigma algebra which, in the case where the
  index set is uncountable, may not be the Borel sigma algebra. However we also want to use Haar
  measure on the product so we need the ``canonical'' sigma algebra on this product to be the Borel
  sigma algebra. Rather than taking the trouble
  to locally turn off this product sigma algebra construction in FLT, we simply restrict to a
  countable index set and add second countability assumptions, because then the product is a
  Borel sigma algebra and this is all we need in our applications to adeles.
\end{remark}
\begin{proof}
  \leanok
  \uses{
  MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding,
  MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace,
  MeasureTheory.addEquivAddHaarChar_piCongrRight,Continuous.restrictedProduct_congrRight,
  MeasureTheory.addEquivAddHaarChar_prodCongr}
  Assume $\phi_i(C_i)=C_i$ for all $i\not\in S$, a finite set, and work in the
  open subgroup $U:=\prod_{i\in S}A_i\times\prod_{i\notin S}C_i$. Then $\phi$ induces
  an automorphism $\phi_S$ of this open subgroup $U$ of $A$, and in particular
  lemma~\ref{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding} tells us
  that $\delta(\phi)=\delta_U(\phi_S)$.
  Next note that $\phi_S:U\to U$ can be written as a product of the automorphisms
  $\prod_{i\notin S}\phi_i|_{C_i}$ of $\prod_{i\notin S}C_i$ and
  $\prod_{i\in S}\phi_i$ of $\prod_{i\in S}A_i$, so by lemma~\ref{MeasureTheory.addEquivAddHaarChar_prodCongr}
  we have $\delta(\phi)=\delta(\prod_{i\notin S}\phi_i|_{C_i})\times\delta(\prod_{i\in S}\phi_i).$
  Because $\prod_{i\notin S}C_i$ is a compact
  group we must have $\delta(\phi_{i\notin S}\phi_i|_{C_i})=1$
  by lemma~\ref{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}. Finally
  $\delta(\prod_{i\in S}\phi_i)=\prod_{i\in S}\delta(\phi_i)$ by
  lemma~\ref{MeasureTheory.addEquivAddHaarChar_piCongrRight} and we are home.
\end{proof}

As a special case, if $R$ is the restricted product of a collection of topological rings $R_i$
  (not necessarily commutative) each equipped with a compact open subring $C_i$, then
  we have

\begin{corollary}
  \label{MeasureTheory.ringHaarChar_restrictedProduct}
  \lean{MeasureTheory.ringHaarChar_restrictedProduct}
  \leanok
  \discussion{554}
  If $u=(u_i)_i\in R^\times$ then $\delta_R(u)=\prod_i\delta_{R_i}(u_i)$.
\end{corollary}
\begin{proof}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}
  By definition of restricted product we have $u_i\in C_i$ for all but finitely many $i$.
  Note also that $u$ has an inverse $v=(v_i)_i$ with $v_i\in C_i$ for all but finitely many $i$.
  The fact that $u_iv_i=v_iu_i=1$ means that $u_i,v_i\in C_i^\times$ for all but finitely many $i$.
  Thus the previous theorem~\ref{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight} applies.
\end{proof}
```

# Adeles

:::theorem "adelic_units_in_kernel_of_haar_character" (parent := "haar_character_project") (lean := "NumberField.AdeleRing.units_mem_ringHaarCharacter_ker")
The key intended application is that if `B` is a finite-dimensional `K`-algebra,
then `B^\times` lies in the kernel of the Haar character of
`B \otimes_K \A_K`.
This combines {uses "restricted_product_haar_character_formula"}[] and
{uses "algebra_haar_character_determinant_formula"}[].
:::

```tex "haar_character_project/lt_adelic_units_kernel"
If $B$ is a finite-dimensional $K$-algebra, then $B^\times$ lies in the kernel of the Haar character of $B\otimes_K\A_K$.
```

:::proof "adelic_units_in_kernel_of_haar_character"
This is the culmination of the TeX chapter. For an algebra `B_A = B ⊗_K A_K`,
the adelic ring decomposes into local factors. At the finite places, the global
Haar character is the restricted-product product of the local ones by
{uses "restricted_product_haar_character_formula"}[]. At the infinite places,
the character is controlled by determinants via
{uses "algebra_haar_character_determinant_formula"}[].

The TeX chapter proves a series of intermediate product-formula statements over
`\mathbf{Q}` and over finite-dimensional `\mathbf{Q}`-vector spaces, then uses a
module-topology lemma for adele extensions to pass cleanly between
`B \otimes_K \mathbf{A}_K` and `B \otimes_{\mathbf{Q}} \mathbf{A}_{\mathbf{Q}}`.
The local determinant computations then cancel globally, forcing the units of
the original algebra to land in the kernel. That is exactly the API input used
by {uses "adelic_division_algebra_setup"}[] in the Fujisaki chapter.
:::

```tex "haar_character_project/adeles"
\begin{corollary}
  \label{NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv}
  \lean{NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv}
  \leanok
  If $K$ is a number field and $V$ is an $K$-module, then
  the natural isomorphism $V\otimes_K\A_K=V\otimes_{\Q}\A_{\Q}$ induced by the natural
  isomorphism $\A_K=K\otimes_K\A_{\Q}$ is a homeomorphism if the left hand side has the $\A_K$-module
  topology and the right hand side has the $\A_{\Q}$-module topology.
\end{corollary}
\begin{proof}
  \leanok
  \uses{IsModuleTopology.continuous_bilinear_of_finite_left}
  Lemma~\ref{IsModuleTopology.continuous_bilinear_of_finite_left} tells us that $V\otimes_K\A_K$
  has the $\A_{\Q}$-module topology, and it is easily checked that the isomorphism is
  $\A_{\Q}$-linear and hence automatically continuous.

  Note that in the Lean we prove this for a general extension $L/K$ rather than $K/\Q$.
\end{proof}

As a consequence, if $B$ is a $K$-algebra then we can think of $B_{\A}$ as either $B\otimes_K\A_K$
with the $\A_K$-module topology or as $B\otimes_{\Q}\A_{\Q}$ with the $\A_{\Q}$-module
topology. Note that this isomorphism commutes with the inclusions from $B$ into these rings.
But Lean is picky about these things so we'll have to be careful.

\begin{theorem}
  \label{NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}
  \leanok
  Let $B$ be a finite-dimensional central simple $K$-algebra.
  Say $u\in B_{\A}^\times$, and define $\ell_u$ and $r_u:B_{\A}\to B_{\A}$ by
  $\ell_u(x)=ux$ and $r_u(x)=xu$. Then $d_{B_{\A}}(\ell_u)=d_{B_{\A}}(r_u)$.
\end{theorem}
\begin{proof}
  \uses{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight,
    IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}
  We think of $B_{\A}$ as $B\otimes_K\A_K$.
  If $u=(u_v)$ as $v$ runs through the places of $K$ then
  $d_{B_{\A}}(\ell_u)=\prod_v d_{B_v}(\ell_{u_v})$ by
  theorem~\ref{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight} (and the product is finite).
  By corollary~\ref{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}
  this equals $\prod_v d_{B_v}(r_{u_v})$, and again by
  theorem~\ref{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight} this is $d_{B_{\A}}(r_u)$.
\end{proof}

The previous theorem only applies to inner forms of matrix algebras, but the below theorem,
a generalization of the adelic product formula, is valid for any finite-dimensional
$K$-algebra. Before we state it let's remind ourselves of the product formula for $\Q$,
and restate it in the language of these Haar characters.

\begin{lemma}
  \label{MeasureTheory.ringHaarChar_adeles_rat}
  \lean{MeasureTheory.ringHaarChar_adeles_rat}
  \leanok
  If $x\in\A_{\Q}^\times$ then $\delta_{\A_{\Q}}(x)=\prod_v|x_v|_v.$
\end{lemma}
\begin{proof}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_prodCongr,MeasureTheory.ringHaarChar_real,
    MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight,MeasureTheory.ringHaarChar_padic}
  By theorem~\ref{MeasureTheory.addEquivAddHaarChar_prodCongr}
  we have $\delta_{\A_{\Q}}(x)=\delta_{\A_{\Q}^\infty}(x^\infty)\times\delta_{\R}(x_\infty)$.
  By lemma~\ref{MeasureTheory.ringHaarChar_real} we have $\delta_{\R}(x_\infty)=|x|_\infty$, and by
  theorem~\ref{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight} we have
  $\delta_{\A_{\Q}^\infty}=\prod_p\delta_{\Q_p}(x_p)$. By lemma~\ref{MeasureTheory.ringHaarChar_padic}
  we have $\delta_{\Q_p}(x_p)=|x_p|_p$ and putting everything together we get the result.
\end{proof}

Now $\A_{\Q}$ is nonzero a $\Q$-algebra and hence we have an inclusion $\Q^\times\to\A_{\Q}^\times$.
Here is our reinterpretation of the product formula.

\begin{lemma}
  \label{MeasureTheory.ringHaarChar_adeles_units_rat_eq_one}
  \lean{MeasureTheory.ringHaarChar_adeles_units_rat_eq_one}
  \leanok
  If $x\in\Q^\times\subseteq\A_{\Q}^\times$ then $\delta_{\A_{\Q}}(x)=1.$
\end{lemma}
\begin{proof}
  \leanok
  \uses{MeasureTheory.ringHaarChar_adeles_rat}
  By lemma~\ref{MeasureTheory.ringHaarChar_adeles_rat} we have $\delta_{\A_{\Q}}(x)=\prod_v|x|_v$.
  But the product formula says that this is 1.
  A quick proof: if $x=\pm\prod_pp^{e_p}$ then $\prod_p|x|_p=\prod_pp^{-e_p}$
  and $|x|_\infty=\prod_pp^{e_p}$ so they cancel.
\end{proof}

  Next we generalize this to finite-dimensional $\Q$-vector spaces.

  So say $V$ is an $N$-dimensional $\Q$-vector space,
  and define $V_{\A}:= V\otimes_{\Q}\A_{\Q}$ with its $\A_{\Q}$-module topology.
  If we choose an isomorphism $V\cong\Q^N$ then $V_{\A}\cong\A_{\Q}^N$
  as an additive topological abelian group. In particular, $V_{\A}$ is locally compact.

  Fix a $\Q$-linear automorphism $\phi:V\to V$. By base extension $\phi$ induces
  an $\A_{\Q}$-linear automorphism $\phi_{\A}$ of $V_{\A}$ which is also a homeomorphism of $V_{\A}$
  if $V_{\A}$ is given the module topology as an $\A_{\Q}$-module. Our goal is

  \begin{theorem}
    \label{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}
    \lean{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}
    \leanok
    In the above situation ($V$ a finite-dimensional $\Q$-vector space, $\phi:V\cong V$ is
    $\Q$-linear, $\phi_{\A}$ the base extension to $V_{\A}:=V\otimes_{\Q}{\A_{\Q}}$, a continuous linear
    endomorphism of $V_{\A}$ with the $\A_{\Q}$-module topology), we have $d_{V_{\A}}(\phi_{\A})=1.$
  \end{theorem}
  \begin{proof}
    \leanok
    \uses{
      MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
      MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight,
      NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv
    }
    The original blueprint proof of this was that $\phi_{\mathbb{A}} : V_{\mathbb{A}}\to V_{\mathbb{A}}$
    could be written as a restricted product of $\phi_v:V\otimes_{\Q}{\Q_v} \to V\otimes_{\Q}\Q_v$
    and hence by theorem~\ref{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}
    we have $d_{V_{\A}}(\phi_{\A})=\prod_p d_{V_p}(\phi_p)\times d_{V_\infty}(\phi_\infty)$,
    and then applying Lemma~\ref{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det} this
    is equal to $\prod_v\delta_{\Q_v}(\det(\phi_v))\prod_v\delta_{\Q_v}(\det(\phi))=1$.

    This turned out to be a nightmare to formalize, because commuting the tensor product
    and the restricted product cannot be done naively, as the tensor product is over $\Q$
    and the submodules in the restricted product defining $\A_{\Q}$ are not $\Q$-modules.
    So one has to choose a $\Z$-lattice in $V$ and
    use the isomorphisms $V\otimes_{\mathbb{Q}}\mathbb{A}=\Lambda\otimes_{\mathbb{Z}}\mathbb{A}=
    \Lambda\otimes_{\mathbb{Z}}\mathbb{Q}_\infty\times\prod'_p[\Lambda\otimes_{\mathbb{Z}}\mathbb{Q}_p;\Lambda\otimes_{\mathbb{Z}}\mathbb{Z}_p]=
    V\otimes_{\mathbb{Q}}\mathbb{Q}_\infty\times\prod'_p[V\otimes_{\mathbb{Q}}\mathbb{Q}_p;im(\Lambda\otimes_{\Z}\mathbb{Z}_p)]$
    and check that all of these canonical maps are continuous (and one of these claims
    boils down to yet another claim of the form "if you do something to the factors and then
    take the restricted product, then this is topologically the same as doing it to the restriced product",
    with the thing being $\Lambda\otimes_{\Z}$ in this case, something which needs
    checking).

    So here is the proof which we actually formalized. Say an automorphism of a finite free
    $R$-module is \emph{nice} if it's a product of transvections and diagonal matrices with unit
    entries. Mathlib has the fact that if $R$ is a field then all automorphisms are nice,
    and the base change of a nice morphism is nice. Hence $\phi_{\mathbb{A}}$ is nice,
    and we can simply prove Lemma~\cite{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det}
    for nice endomorphisms over a commutative ring, which gives the result we want immediately
    by the product formula.
  \end{proof}

  \begin{corollary}
    \label{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}
    \lean{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}
    \leanok
    If $B$ is a finite-dimensional $\Q$-algebra (for example a number field, or a quaternion algebra over a number field),
    if $B_{\A}$ denotes the ring $B\otimes_{\Q}\A_{\Q}$, and if $b\in B^\times$,
    then $\delta_{B_{\A}}(b)=1$.
  \end{corollary}
  \begin{proof}
    \uses{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}
    \leanok
    Follows immediately from the previous theorem.
  \end{proof}

  \begin{corollary}
    \label{NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one}
    \lean{NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one}
    \leanok
    If $B$ is a finite-dimensional $\Q$-algebra and
    if $b\in B^\times$ then right multiplication by $b$
    does not change Haar measure on $B_{\A}$.
  \end{corollary}
  \begin{proof}
    \leanok
    \uses{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}
    Follows immediately from the previous theorem.
  \end{proof}
```
