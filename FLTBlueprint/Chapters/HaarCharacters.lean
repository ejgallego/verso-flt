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

# Goal

:::definition "haar_character_goal" (parent := "haar_character_project")
The main application is adelic: for a finite-dimensional algebra over a number
field, the adelic units should lie in the kernel of the associated Haar
character.
:::

```tex "haar_character_project/goal"
\section{The goal}

The goal of this miniproject is to develop the theory (i.e., the basic API) of Haar characters.
``Haar character'' is a name I've made up to describe a certain character of the units of a locally
compact topological ring.

KMB would like to heartily thank S\'ebastien Gou\"ezel for the help he gave during the preparation
of this material.
```

The TeX chapter is explicit that “Haar character” is project terminology rather
than standard textbook terminology. The point is to package the multiplicative
behavior of additive Haar measure on a locally compact ring in a way that is
easy to reuse later for adelic algebras.

It also records the project's historical provenance: this material was refined
with substantial outside input during blueprint development, precisely because
the eventual application to adeles and division algebras needs a dependable
measure-theoretic API rather than ad hoc local computations.

The TeX chapter even pauses to thank Sebastien Gouezel explicitly for help in
preparing this material, which is a good indication of how much of the work
here is about getting the measure-theoretic interface exactly right.

# Initial definitions

:::definition "additive_haar_character" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar")
For a locally compact additive group and an additive automorphism, the Haar
character measures the positive scalar by which Haar measure is rescaled.
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

The TeX chapter is careful about normalization here: one could equally well
record the inverse scale factor. The project fixes the convention that
`μ(X) = d_A(φ) (φ_* μ)(X)`, so multiplication by `2` on `ℝ` has Haar character
`2` rather than `1/2`.

It also notes that mathlib packages a preferred Haar measure, while the actual
mathematics is independent of that choice. In the Lean code, the multiplicative
version is primary and the additive statements are obtained by `to_additive`.

:::theorem "haar_character_independent_of_measure" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_eq")
This scaling factor is independent of the chosen regular Haar measure.
This is the first lemma attached to {uses "additive_haar_character"}[].
:::

:::proof "haar_character_independent_of_measure"
The proof is the usual uniqueness-of-Haar-measure argument: changing the Haar
measure by a positive scalar cancels on both sides of the defining relation.
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

:::proof "haar_character_pushforward_formula"
The TeX chapter presents this as the direct reformulation of the definition once
independence of Haar measure has been established.
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

:::proof "haar_character_pullback_formula"
The TeX chapter treats this as the immediate companion to the pushforward
formula: once one knows what happens to `φ_* μ`, the pullback `φ^* μ` follows by
applying the same statement to the inverse map.
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

:::proof "haar_character_identity"
The TeX chapter records this as an immediate formal consequence before proving
multiplicativity under composition.
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
For a Borel set `X`, the Haar-character factor can be read off from the ratio
between the measures of `X` and `φ⁻¹(X)`.
This is the set-theoretic specialization of
{uses "haar_character_pushforward_formula"}[].
:::

:::theorem "haar_character_integral_formula" (parent := "haar_character_project")
For a measurable real-valued function, the Haar-character factor also controls
how integrals transform under pushforward and pullback.
This is the integral version of {uses "haar_character_pushforward_formula"}[].
:::

:::proof "haar_character_integral_formula"
The TeX chapter emphasizes that these integral identities are simply the
measure-scaling identities rewritten through the definition of integration.

It also remarks that if one has a measurable function with positive finite
integral, then the Haar character can be read off from the ratio of the two
integrals before and after pushforward. This viewpoint is exactly what later
drives the continuity proof on unit groups.
:::

:::theorem "haar_character_is_multiplicative" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_trans")
The additive Haar-character construction is multiplicative under composition of
homeomorphisms and equals `1` on the identity map.
This combines {uses "haar_character_identity"}[] with the composition law from
the additive Haar-character setup {uses "additive_haar_character"}[].
:::

:::proof "haar_character_is_multiplicative"
This is the point where the TeX chapter notes that the construction is really a
group homomorphism into the positive reals.
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
For the additive group of `ℝ`, the Haar character is the usual absolute value.
:::

:::proof "real_haar_character_formula"
Take Lebesgue measure and evaluate on the interval `[0,1]`. Multiplication by a
positive scalar stretches the interval by that factor, while multiplication by a
negative scalar only adds an orientation reversal, so the scale factor is
always the absolute value.
:::

:::theorem "complex_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_complex")
For the additive group of `ℂ`, the Haar character is $`|z|^2`.
:::

:::proof "complex_haar_character_formula"
The TeX proof decomposes multiplication into a positive real dilation and a
rotation. Rotations preserve area, while scaling by `r > 0` multiplies area by
`r²`, so the resulting Haar character is the square of the complex norm.
:::

# Ring-level Haar characters

:::definition "ring_level_haar_character" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar")
For a locally compact topological ring, the left Haar character is obtained by
applying the additive theory to left multiplication by a unit.
This packages the additive setup for ring-level use via
{uses "additive_haar_character"}[].
:::

```tex "haar_character_project/ring_level"
Now let $R$ be a locally compact topological ring. The \emph{Haar character} of $R$,
or more precisely the \emph{left Haar character} of $R$, is a group homomorphism
$R^\times\to\R^\times$ defined in the following way.
```

:::theorem "ring_haar_character_integral_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_mul_integral")
At the ring level, the Haar character controls how integrals change under left
multiplication by units.
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
Likewise, the Haar character controls how the measure of a Borel set changes
under multiplication by a unit.
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
The Haar character on the unit group of a locally compact topological ring is a
continuous group homomorphism.
The TeX proof builds this directly from
{uses "ring_haar_character_integral_formula"}[].
:::

:::proof "ring_haar_character_continuous"
The TeX chapter derives continuity from the integral formula. One fixes a
compactly supported continuous function with nonzero integral and then rewrites
the Haar character as a ratio of two continuous integrals depending on the unit.

So continuity is not an extra miracle; it is built into the same measure-scaling
formalism used everywhere else in the chapter.
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

:::proof "padic_haar_character_formula"
The dedicated p-adic chapter in the FLT fork computes the Haar character
explicitly and then deduces the standard volume-scaling formulas.
The corresponding Lean declarations exist, but importing that rc6 path still
needs FLT-fork compatibility work before we can attach them here.
:::

:::theorem "padic_integer_haar_character_formula" (parent := "haar_character_project")
For $`\mathbf{Z}_p`$, the Haar character is constantly $`1`$ on the unit group.
:::

:::proof "padic_integer_haar_character_formula"
This is the integral counterpart to {uses "padic_haar_character_formula"}[].
:::

The TeX chapter also remarks here that for a finite extension of `ℚ_p`, the
same computation gives the normalized nonarchimedean norm. It leaves that
statement informal because the right local-field interface was not yet settled.

At the level of the TeX proof, the `\mathbf{Q}_p` calculation is completely
concrete: normalize Haar measure by `μ(\mathbf{Z}_p) = 1`, check that units
preserve `\mathbf{Z}_p`, and compute the effect of multiplication by `p` using
the index of `p\mathbf{Z}_p` inside `\mathbf{Z}_p`.

# Algebras

:::theorem "haar_character_linear_map_determinant_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det")
For a finite free module over a locally compact field, the Haar character of an
invertible linear map is the field-level Haar character applied to its
determinant.
This is the linear-algebra counterpart to {uses "ring_level_haar_character"}[].
:::

:::proof "haar_character_linear_map_determinant_formula"
The TeX chapter reduces this to explicit matrix calculations, using that an
invertible matrix can be decomposed into diagonal and transvection pieces. One
checks the formula directly on those generators and then multiplies the answers.

This is the bridge from additive Haar theory on groups to ring-theoretic Haar
characters on finite-dimensional algebras.
:::

:::theorem "algebra_haar_character_determinant_formula" (parent := "haar_character_project") (lean := "MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det")
If `R` is a finite-dimensional algebra over a locally compact field `F`, then
the ring-level Haar character of a unit `u` is obtained from the determinant of
left multiplication by `u`.
This is the algebraic corollary of
{uses "haar_character_linear_map_determinant_formula"}[].
:::

:::proof "algebra_haar_character_determinant_formula"
This is the immediate algebraic application of
{uses "haar_character_linear_map_determinant_formula"}[]: left multiplication
by a unit is an invertible `F`-linear map on the underlying finite-dimensional
`F`-vector space, so the determinant formula applies.
:::

# Left and right multiplication

:::theorem "central_simple_algebra_left_right_same_haar" (parent := "haar_character_project") (lean := "IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight")
For a finite-dimensional central simple algebra, left and right multiplication
by a unit have the same Haar-character factor.
This combines the determinant comparison {uses "IsSimpleRing.mulLeft_det_eq_mulRight_det"}[] with
{uses "algebra_haar_character_determinant_formula"}[].
:::

:::proof "central_simple_algebra_left_right_same_haar"
The TeX chapter proves that left and right multiplication have the same
determinant in a central simple algebra by base-changing to an algebraic closure
and identifying the algebra with a matrix algebra. Once the determinants agree,
the Haar-character factors agree as well.

This symmetry is exactly what is needed later when quotient arguments in
division algebras mix left and right multiplication.
:::

# Finite products

:::theorem "product_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_prodCongr")
For a finite product of locally compact additive groups, the Haar character of a
product automorphism is the product of the individual Haar characters.
This is the finite-product analogue of {uses "haar_character_is_multiplicative"}[].
:::

:::proof "product_haar_character_formula"
The TeX chapter first handles binary products and then iterates. At the level of
measures this is exactly what one expects: product Haar measure scales by the
product of the coordinatewise scaling factors.
:::

:::theorem "product_ring_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.ringHaarChar_prod")
For a finite product of locally compact topological rings, the ring-level Haar
character is the product of the local ring-level Haar characters.
This is the ring-theoretic specialization of {uses "product_haar_character_formula"}[].
:::

:::proof "product_ring_haar_character_formula"
The TeX chapter states this first for additive groups, then for rings as the
immediate specialization to multiplication-by-units.
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

:::proof "open_embedding_pullback_is_haar_measure"
The TeX proof is elementary: translation invariance is immediate, compact sets
stay finite because continuous images of compact sets are compact, and open sets
stay bounded because open embeddings send open sets to open sets.
:::

:::theorem "open_embedding_pullback_regular_measure" (parent := "haar_character_project") (lean := "Topology.IsOpenEmbedding.regular_comap")
Pulling a regular Borel measure back along an open embedding again gives a
regular Borel measure.
:::

:::proof "open_embedding_pullback_regular_measure"
Again this is exactly the TeX argument: the image of a compact set is compact
and the image of an open set is open, so the usual regularity axioms are
preserved by pullback.
:::

:::theorem "compact_group_haar_character_trivial" (parent := "haar_character_project") (lean := "MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace")
If an additive automorphism acts on a compact additive group, then its Haar
character is `1`.
:::

:::proof "compact_group_haar_character_trivial"
The TeX proof is the short measure argument: the whole compact group has finite,
positive Haar measure, and that total measure is unchanged by the automorphism.
:::

:::theorem "open_embedding_preserves_haar_character" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding")
If an additive automorphism on a locally compact group is intertwined with one
on a larger group through an open embedding, then the two Haar characters
agree.
This is the open-embedding transfer principle for
{uses "additive_haar_character"}[].
:::

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

:::proof "restricted_product_maps_continuous"
The TeX chapter reduces continuity to the universal property of the
restricted-product topology. One checks continuity on sufficiently large finite
stages, where the map becomes an ordinary finite product of continuous maps.
:::

:::theorem "restricted_product_haar_character_formula" (parent := "haar_character_project") (lean := "MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight")
For a restricted product of locally compact groups with compact open reference
subgroups, the Haar character of a restricted-product automorphism is the
finite product of the local Haar characters.
This uses the compact-triviality input from
{uses "compact_group_haar_character_trivial"}[] and the finite-product formula
{uses "product_haar_character_formula"}[].
:::

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
The key intended application is that adelic unit groups coming from
finite-dimensional algebras over a number field land in the kernel of the Haar
character.
This combines {uses "restricted_product_haar_character_formula"}[] and
{uses "algebra_haar_character_determinant_formula"}[].
:::

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
