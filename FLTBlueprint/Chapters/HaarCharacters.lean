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

:::theorem "haar_character_independent_of_measure" (parent := "haar_character_project")
This scaling factor is independent of the chosen regular Haar measure.
:::

:::proof "haar_character_independent_of_measure"
The proof is the usual uniqueness-of-Haar-measure argument: changing the Haar
measure by a positive scalar cancels on both sides of the defining relation.
:::

:::theorem "haar_character_pullback_formula" (parent := "haar_character_project")
Pulling Haar measure back along an additive homeomorphism scales the measure by
the same Haar-character factor.
:::

:::proof "haar_character_pullback_formula"
The TeX chapter treats this as the immediate companion to the pushforward
formula: once one knows what happens to `φ_* μ`, the pullback `φ^* μ` follows by
applying the same statement to the inverse map.
:::

:::theorem "haar_character_preimage_formula" (parent := "haar_character_project")
For a Borel set `X`, the Haar-character factor can be read off from the ratio
between the measures of `X` and `φ⁻¹(X)`.
:::

:::theorem "haar_character_integral_formula" (parent := "haar_character_project")
For a measurable real-valued function, the Haar-character factor also controls
how integrals transform under pushforward and pullback.
:::

:::proof "haar_character_integral_formula"
The TeX chapter emphasizes that these integral identities are simply the
measure-scaling identities rewritten through the definition of integration.
:::

:::theorem "haar_character_is_multiplicative" (parent := "haar_character_project")
The additive Haar-character construction is multiplicative under composition of
homeomorphisms and equals `1` on the identity map.
:::

:::proof "haar_character_is_multiplicative"
This is the point where the TeX chapter notes that the construction is really a
group homomorphism into the positive reals.
:::

# Ring-level Haar characters

:::definition "ring_level_haar_character" (parent := "haar_character_project")
For a locally compact topological ring, the left Haar character is obtained by
applying the additive theory to left multiplication by a unit.
:::

:::theorem "ring_haar_character_integral_formula" (parent := "haar_character_project")
At the ring level, the Haar character controls how integrals change under left
multiplication by units.
:::

:::theorem "ring_haar_character_volume_formula" (parent := "haar_character_project")
Likewise, the Haar character controls how the measure of a Borel set changes
under multiplication by a unit.
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

:::theorem "adelic_units_in_kernel_of_haar_character" (parent := "haar_character_project")
The key intended application is that adelic unit groups coming from
finite-dimensional algebras over a number field land in the kernel of the Haar
character.
:::
