import Verso
import VersoManual
import VersoBlueprint

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

:::definition "additive_haar_character" (parent := "haar_character_project")
For a locally compact additive group and an additive automorphism, the Haar
character measures the positive scalar by which Haar measure is rescaled.
:::

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

:::theorem "haar_character_independent_of_measure" (parent := "haar_character_project")
This scaling factor is independent of the chosen regular Haar measure.
This is the first lemma attached to {uses "additive_haar_character"}[].
:::

:::proof "haar_character_independent_of_measure"
The proof is the usual uniqueness-of-Haar-measure argument: changing the Haar
measure by a positive scalar cancels on both sides of the defining relation.
:::

:::theorem "haar_character_pushforward_formula" (parent := "haar_character_project")
For any regular Haar measure `μ`, one has
$`d_A(\phi) (\phi_* \mu) = \mu`.
This is the direct restatement of {uses "haar_character_independent_of_measure"}[].
:::

:::proof "haar_character_pushforward_formula"
The TeX chapter presents this as the direct reformulation of the definition once
independence of Haar measure has been established.
:::

:::theorem "haar_character_pullback_formula" (parent := "haar_character_project")
Pulling Haar measure back along an additive homeomorphism scales the measure by
the same Haar-character factor.
This is the pullback companion to {uses "haar_character_pushforward_formula"}[].
:::

:::proof "haar_character_pullback_formula"
The TeX chapter treats this as the immediate companion to the pushforward
formula: once one knows what happens to `φ_* μ`, the pullback `φ^* μ` follows by
applying the same statement to the inverse map.
:::

:::theorem "haar_character_identity" (parent := "haar_character_project")
The Haar character of the identity automorphism is `1`.
:::

:::proof "haar_character_identity"
The TeX chapter records this as an immediate formal consequence before proving
multiplicativity under composition.
:::

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

:::theorem "haar_character_is_multiplicative" (parent := "haar_character_project")
The additive Haar-character construction is multiplicative under composition of
homeomorphisms and equals `1` on the identity map.
This combines {uses "haar_character_identity"}[] with the composition law from
the additive Haar-character setup {uses "additive_haar_character"}[].
:::

:::proof "haar_character_is_multiplicative"
This is the point where the TeX chapter notes that the construction is really a
group homomorphism into the positive reals.
:::

# Examples

:::theorem "real_haar_character_formula" (parent := "haar_character_project")
For the additive group of `ℝ`, the Haar character is the usual absolute value.
:::

:::proof "real_haar_character_formula"
Take Lebesgue measure and evaluate on the interval `[0,1]`. Multiplication by a
positive scalar stretches the interval by that factor, while multiplication by a
negative scalar only adds an orientation reversal, so the scale factor is
always the absolute value.
:::

:::theorem "complex_haar_character_formula" (parent := "haar_character_project")
For the additive group of `ℂ`, the Haar character is $`|z|^2`.
:::

:::proof "complex_haar_character_formula"
The TeX proof decomposes multiplication into a positive real dilation and a
rotation. Rotations preserve area, while scaling by `r > 0` multiplies area by
`r²`, so the resulting Haar character is the square of the complex norm.
:::

# Ring-level Haar characters

:::definition "ring_level_haar_character" (parent := "haar_character_project")
For a locally compact topological ring, the left Haar character is obtained by
applying the additive theory to left multiplication by a unit.
:::

:::theorem "ring_haar_character_integral_formula" (parent := "haar_character_project")
At the ring level, the Haar character controls how integrals change under left
multiplication by units.
This is the ring-theoretic specialization of
{uses "haar_character_integral_formula"}[].
:::

:::theorem "ring_haar_character_volume_formula" (parent := "haar_character_project")
Likewise, the Haar character controls how the measure of a Borel set changes
under multiplication by a unit.
This is the ring-theoretic specialization of
{uses "haar_character_preimage_formula"}[].
:::

:::theorem "ring_haar_character_continuous" (parent := "haar_character_project")
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

:::theorem "haar_character_linear_map_determinant_formula" (parent := "haar_character_project")
For a finite free module over a locally compact field, the Haar character of an
invertible linear map is the field-level Haar character applied to its
determinant.
:::

:::proof "haar_character_linear_map_determinant_formula"
The TeX chapter reduces this to explicit matrix calculations, using that an
invertible matrix can be decomposed into diagonal and transvection pieces. One
checks the formula directly on those generators and then multiplies the answers.

This is the bridge from additive Haar theory on groups to ring-theoretic Haar
characters on finite-dimensional algebras.
:::

:::theorem "algebra_haar_character_determinant_formula" (parent := "haar_character_project")
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

:::theorem "central_simple_algebra_left_right_same_haar" (parent := "haar_character_project")
For a finite-dimensional central simple algebra, left and right multiplication
by a unit have the same Haar-character factor.
This combines the determinant comparison with
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

:::theorem "product_haar_character_formula" (parent := "haar_character_project")
For a finite product of locally compact additive groups, the Haar character of a
product automorphism is the product of the individual Haar characters.
This is the finite-product analogue of {uses "haar_character_is_multiplicative"}[].
:::

:::proof "product_haar_character_formula"
The TeX chapter first handles binary products and then iterates. At the level of
measures this is exactly what one expects: product Haar measure scales by the
product of the coordinatewise scaling factors.
:::

:::theorem "product_ring_haar_character_formula" (parent := "haar_character_project")
For a finite product of locally compact topological rings, the ring-level Haar
character is the product of the local ring-level Haar characters.
:::

:::proof "product_ring_haar_character_formula"
The TeX chapter states this first for additive groups, then for rings as the
immediate specialization to multiplication-by-units.
:::

# Some measure-theoretic preliminaries

:::theorem "open_embedding_pullback_is_haar_measure" (parent := "haar_character_project")
If a locally compact topological group embeds openly into another, then pulling
back a Haar measure along that open embedding again gives a Haar measure.
:::

:::proof "open_embedding_pullback_is_haar_measure"
The TeX proof is elementary: translation invariance is immediate, compact sets
stay finite because continuous images of compact sets are compact, and open sets
stay bounded because open embeddings send open sets to open sets.
:::

:::theorem "open_embedding_pullback_regular_measure" (parent := "haar_character_project")
Pulling a regular Borel measure back along an open embedding again gives a
regular Borel measure.
:::

:::proof "open_embedding_pullback_regular_measure"
Again this is exactly the TeX argument: the image of a compact set is compact
and the image of an open set is open, so the usual regularity axioms are
preserved by pullback.
:::

:::theorem "compact_group_haar_character_trivial" (parent := "haar_character_project")
If an additive automorphism acts on a compact additive group, then its Haar
character is `1`.
:::

:::proof "compact_group_haar_character_trivial"
The TeX proof is the short measure argument: the whole compact group has finite,
positive Haar measure, and that total measure is unchanged by the automorphism.
:::

:::theorem "open_embedding_preserves_haar_character" (parent := "haar_character_project")
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

# Restricted products

:::theorem "restricted_product_maps_continuous" (parent := "haar_character_project")
If one has compatible continuous maps on the factors of a restricted product,
then the induced map on the restricted product is continuous.
:::

:::proof "restricted_product_maps_continuous"
The TeX chapter reduces continuity to the universal property of the
restricted-product topology. One checks continuity on sufficiently large finite
stages, where the map becomes an ordinary finite product of continuous maps.
:::

:::theorem "restricted_product_haar_character_formula" (parent := "haar_character_project")
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

# Adeles

:::theorem "adelic_units_in_kernel_of_haar_character" (parent := "haar_character_project")
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
