import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Adeles" =>

:::group "adele_project"
The adele miniproject develops the finite adeles, infinite adeles, and full
adeles of a number field together with the local compactness and base-change
results needed later in the project.
:::

The old TeX chapter is very explicit that this is both a mathematical and a
library-design project. Some pieces already live in mathlib, some have been
proved in external repos, and some still need to be formalized in a way that
fits the existing restricted-product API cleanly.

# Status

:::definition "adele_project_status" (parent := "adele_project")
This is still an active miniproject. The TeX chapter treats the existence of the
adele ring as largely settled, while local compactness, base change, and the
discrete cocompact embedding remain the real mathematical targets.
:::

The TeX chapter is unusually explicit about project status:

- defining the adeles of a number field as a `K`-algebra is treated as done, and the corresponding construction is already in mathlib
- local compactness was formalized first in Salvatore Mercuri's external adele-ring development, but still needed clean integration with mathlib's restricted-product API
- base change and the discrete cocompact embedding were not yet formalized and were presented as the main remaining mathematical targets
- a further meta-goal is to upstream as much of the finished infrastructure to mathlib as possible

The chapter is also explicit that finite adeles and full adeles sit at slightly
different levels of generality. The finite adele construction works naturally
for Dedekind domains, while the full adele ring uses archimedean places and so
is genuinely number-field-specific.

# Goals

:::definition "adele_ring_goals" (parent := "adele_project")
The TeX blueprint lists four main targets: define the adeles, prove local
compactness, prove base change along finite field extensions, and prove that
the number field sits discretely with compact quotient.
:::

:::definition "adele_mathlib_goal" (parent := "adele_project")
The TeX chapter also lists a fifth meta-goal: get the finished adele
infrastructure into mathlib once the core statements are formalized cleanly.
:::

The chapter also stresses a useful distinction. Finite adeles are algebraic
objects and can be defined for general Dedekind domains. Full adeles are more
arithmetic: they add the archimedean factor and use special properties of number
fields.

The TeX chapter begins the miniproject by spelling out “cheap” definitions
before switching back to the literature and mathlib definitions. That contrast
is important because it explains both what one morally wants the adeles to be
and why the harness still follows the restricted-product implementation.

:::definition "finite_adeles_for_dedekind_domains" (parent := "adele_project")
The finite-adele construction extends beyond number fields to general Dedekind
domains by taking the restricted product of local fraction fields with respect
to their local integer rings.
:::

:::proof "finite_adeles_for_dedekind_domains"
The TeX chapter stresses this point because it affects API design. Many of the
local and finite-adelic constructions should be developed at Dedekind-domain
generality, even though the final FLT application only needs number fields.

That is why the current chapter oscillates between number-field language and the
more general “Dedekind domain with field of fractions” setup.
:::

:::definition "cheap_finite_adele_definition" (parent := "adele_project")
A cheap definition of the finite adeles of a number field `K` is
$`K \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}`$, equipped with the
`$\widehat{\mathbf{Z}}`-module topology.
:::

:::definition "cheap_infinite_adele_definition" (parent := "adele_project")
A cheap definition of the infinite adeles is `K ⊗_ℚ ℝ`, equipped with its
finite-dimensional real vector-space topology.
:::

:::definition "cheap_full_adele_definition" (parent := "adele_project")
The cheap full adele ring is the product of the finite and infinite adeles,
with the product topology.
:::

:::definition "restricted_product_adele_definition" (parent := "adele_project")
The literature and mathlib instead define finite adeles as the restricted
product of the local completions `K_v` with respect to their compact open
integer subrings.
:::

:::proof "restricted_product_adele_definition"
This is the definition the chapter chooses to follow, precisely because it is
already the mathlib-facing one and generalizes well to the Dedekind-domain API.

The TeX chapter also stresses that mathlib's full adele ring is the product of
the finite adeles with the archimedean completions, so one should think of the
cheap tensor-product definitions and the restricted-product definitions as
different presentations of the same intended object rather than as competing
mathematics.
:::

# Local compactness

:::theorem "adele_local_compactness" (parent := "adele_project")
The adeles of a number field should form a locally compact topological ring.
This local compactness is one of the inputs needed by {uses "compact_quotient_for_division_algebra"}[].
:::

:::theorem "local_integer_ring_compact_open" (parent := "adele_project")
For a nonarchimedean completion of a number field, the local integer ring
should be a compact open subgroup.
:::

:::proof "adele_local_compactness"
The finite adele part is a restricted product over compact open integer
subgroups, and the infinite part is finite-dimensional real linear algebra.
This is exactly why {uses "local_integer_ring_compact_open"}[] is the key local
input in the TeX chapter.

The chapter is explicit that this is now meant to be proved using the
restricted-product topology rather than the older ad hoc topology from the
first external adele formalization. That is why the local compactness theorem
for restricted products in mathlib is the real harness-facing endpoint here.
:::

The TeX miniproject also records the project status here: Salvatore Mercuri had
already formalized local compactness in an external adele-ring repo, and the
question for the blueprint was how to refactor that proof so it fits mathlib's
restricted-product API cleanly. It also notes the specific local input one
needs: for number fields, unlike a general Dedekind domain, the local integer
rings are compact because the residue fields are finite.

# Base change

:::theorem "adele_base_change" (parent := "adele_project")
For a finite extension $`L/K`$, the adele ring of $`L`$ should identify with
$`L \otimes_K \mathbf{A}_K`$ as both an algebra and a topological space.
This is one of the basic background results for {uses "adelic_division_algebra_setup"}[] and {uses "haar_character_goal"}[].
:::

The TeX chapter is also careful about the logical shape of this statement:
`A_L = L ⊗_K A_K` is really a construction plus an isomorphism theorem, not just
a bare equality.

It also immediately splits the problem into finite and infinite parts, because
the adele ring itself is the product of the finite adeles and the infinite
adeles. So the real work is to prove the two corresponding base-change
statements separately and then reassemble them.

## Base Change For Nonarchimedean Completions

As pointed out earlier in the TeX chapter, the finite-adelic theory works
perfectly well for Dedekind domains, so the nonarchimedean discussion is first
carried out in that generality. One fixes a Dedekind domain `A` with field of
fractions `K`, then a finite separable extension `L/K` with integral closure
`B`, and works place by place.

The TeX chapter also pauses to note a mathlib convention: fields are regarded
as Dedekind domains, so their height-one spectrum is empty. The author remarks
that this is slightly awkward geometrically, but it is the literature-facing
convention that the current API follows.

:::definition "finite_adele_base_change_map" (parent := "adele_project")
Before proving finite-adele base change, one first defines the natural map
$`\mathbf{A}_{A,K}^\infty \to \mathbf{A}_{B,L}^\infty` induced by the local maps
on completions.
:::

:::definition "local_completion_map" (parent := "adele_project")
Given a finite extension `L/K` and places `w | v`, there is a natural map from
the completion `K_v` to the completion `L_w`.
:::

The TeX chapter obtains this by completing the inclusion `K → L` with respect
to the `v`-adic and `w`-adic topologies, so the first real input is the
relation between the two valuations.

:::theorem "local_valuation_compatibility" (parent := "adele_project")
The `v`-adic and `w`-adic valuations are related by the ramification index:
`e · w(i(k)) = v(k)` in additive-valuation normalization.
:::

:::proof "local_valuation_compatibility"
This valuation identity is what makes the local completion map uniformly
continuous, and therefore what allows the local part of base change to be
defined at all.
:::

:::theorem "local_module_topology_for_completion" (parent := "adele_project")
After base change to a local completion, the topology on `L_w` should agree with
the `K_v`-module topology.
This is the topological sharpening of {uses "local_completion_map"}[] and
{uses "local_valuation_compatibility"}[].
:::

:::proof "local_module_topology_for_completion"
The TeX proof uses that `L_w` is finite-dimensional over `K_v`, so the module
topology is the same as a product topology after choosing a basis. The
`w`-adic topology also comes from a `K_v`-norm, and the standard theorem that
all norms on a finite-dimensional vector space over a complete field are
equivalent identifies the two topologies.
:::

Because the local map `K_v → L_w` lies over `K → L`, the TeX chapter then views
`L_w` as an `L ⊗_K K_v`-algebra before packaging all places `w | v` together.

:::theorem "finite_primes_above_v_are_finite" (parent := "adele_project")
For a fixed finite place `v` of `K`, there are only finitely many places `w` of
`L` lying above it.
:::

:::proof "finite_primes_above_v_are_finite"
This is a standard Dedekind-domain fact, but the TeX chapter singles it out
because the restricted-product reindexing later depends on finite fibres over
the map `w ↦ v`.
:::

The TeX chapter writes `w | v` for this finite set of places above `v`, and
then takes the product of the local completion maps over all such `w`.

:::theorem "nonarchimedean_base_change_local_decomposition" (parent := "adele_project")
For a fixed finite place `v` of `K`, the algebra
$`L \otimes_K K_v` decomposes as the finite product of the completions
$`\prod_{w \mid v} L_w`.
:::

:::proof "nonarchimedean_base_change_local_decomposition"
This is one of the key structural theorems in the TeX chapter. The local
completion map {uses "local_completion_map"}[] is assembled over all `w | v`,
and one proves that the resulting map is an algebraic isomorphism. At this
stage the theorem is algebraic first, topological second.

The TeX file is explicit that this is probably the hardest proof in the section
to formalize. The proposed strategy there is dimension-theoretic: prove the map
is surjective because its image is dense and closed, then compare the
`K_v`-dimensions of the source and target. The source has dimension `[L : K]`,
and the target has dimension `\sum_{w \mid v} e_w f_w`; one then reduces to the
local field fact that an extension of complete discretely valued fields has
degree `ef`.

The later finite-adele base-change theorem is basically this statement applied
simultaneously at every nonarchimedean place.
:::

:::theorem "product_local_completion_module_topology" (parent := "adele_project")
For fixed `v`, the product topology on $`\prod_{w \mid v} L_w` is the
`K_v`-module topology.
This packages the finite-product topological step immediately after the local
algebraic decomposition.
:::

:::proof "product_local_completion_module_topology"
This is a finite product of `K_v`-modules, each of which has the `K_v`-module
topology by {uses "local_module_topology_for_completion"}[]. The TeX chapter
then appeals to the standard fact that finite products of modules with module
topologies again carry the product/module topology.
:::

:::theorem "nonarchimedean_base_change_local_homeomorphism" (parent := "adele_project")
If `L \otimes_K K_v` is given the `K_v`-module topology, then the local
algebraic isomorphism
$`L \otimes_K K_v \cong \prod_{w \mid v} L_w`
is also a homeomorphism.
This is the topological sharpening of
{uses "nonarchimedean_base_change_local_decomposition"}[].
:::

:::proof "nonarchimedean_base_change_local_homeomorphism"
The TeX proof is short once the right topology has been identified on both
sides: it is a `K_v`-linear algebra isomorphism between modules that both carry
their `K_v`-module topology, and linear maps are automatically continuous for
those topologies.
:::

:::theorem "nonarchimedean_integral_decomposition" (parent := "adele_project")
The same local decomposition identifies the integral subring
$`B \otimes_A A_v` with the product of the local integer rings
$`\prod_{w \mid v} B_w`.
This is the integral refinement of
{uses "nonarchimedean_base_change_local_decomposition"}[].
:::

:::proof "nonarchimedean_integral_decomposition"
The TeX chapter treats this as the crucial integral refinement of the previous
theorem. Without it, one only knows the decomposition of the ambient local
fields; with it, one can match the open compact subrings that define the
restricted-product topology.

The proof sketch in the TeX chapter now points to Matthew Jasper's argument:
identify the closure of `A` in one completion and then in a finite product of
completions, use Chinese remainder input to get the corresponding statement for
`B`, and finally show that this closure is exactly the image of
`B \otimes_A A_v`.
:::

A summary of the local picture at this stage, exactly as in the TeX chapter:
for each finite place `v`, the map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`
is both an algebraic and a topological isomorphism, and it matches the natural
integral subrings `B \otimes_A A_v` and `\prod_{w \mid v} B_w`.

The finite adele ring is then the restricted product of the `K_v` with respect
to the `A_v`, with a topology in which `\prod_v A_v` is open rather than merely
closed in the full product. This is exactly why the next step is not just to
tensor everything naively, but to show carefully that restricted products
commute with the local finite-product decompositions.

The TeX chapter now introduces an auxiliary restricted product `R`, namely the
restricted product of the `B \otimes_A K_v` with respect to the
`B \otimes_A A_v`. The strategy is:

- first compare `B \otimes_A \mathbf{A}_K^\infty` with this auxiliary ring `R`
- then identify `R` with `\mathbf{A}_L^\infty` by relabelling places
- finally pass from the integral tensor product to the field-level tensor
  product `L \otimes_K \mathbf{A}_K^\infty`

:::theorem "finite_adele_base_change_algebraic" (parent := "adele_project")
The finite adele ring of `L` is algebraically isomorphic to
$`L \otimes_K \mathbf{A}_K^\infty`.
This is the finite-part algebraic precursor to {uses "adele_base_change"}[].
The proof runs through {uses "finite_adele_base_change_integral"}[] and
{uses "tensor_product_module_base_change"}[].
:::

:::proof "finite_adele_base_change_algebraic"
The TeX argument is a “put the local pieces together” theorem. One combines
{uses "nonarchimedean_base_change_local_decomposition"}[],
{uses "nonarchimedean_integral_decomposition"}[], and a relabelling of
restricted products along the finite-fibre map on places. The result is an
algebraic identification of the finite adeles after base change.
:::

:::theorem "tensor_product_module_base_change" (parent := "adele_project")
If `M` is a `K`-module, then the canonical map
$`B \otimes_A M \to L \otimes_K M` is an isomorphism.
:::

:::proof "tensor_product_module_base_change"
The TeX chapter inserts this algebraic lemma into the nonarchimedean base-change
subsection because the later restricted-product arguments repeatedly move
between `A`-module and `K`-module tensor products. So this is one of the hidden
algebraic engines underneath the finite-adele base-change theorem.

Its proof in the TeX chapter factors the map through the basic algebraic
identification `B \otimes_A K \cong L`, and then tensors that identification
with the module `M`.
:::

The TeX chapter also inserts a finite-presentation detour at this point. The
reason is that one wants tensor products to commute with products in exactly the
range needed to compare the integral tensor product with the auxiliary
restricted product `R`, and finite presentation is the hypothesis that makes
that statement work cleanly.

:::theorem "tensor_product_commutes_with_products_for_finite_presentation" (parent := "adele_project")
If `M` is a finitely presented module over a commutative ring `R`, then
tensoring with `M` commutes with arbitrary products.
This is one of the algebraic inputs behind the auxiliary restricted-product
comparison in the TeX proof of finite-adele base change.
:::

:::proof "tensor_product_commutes_with_products_for_finite_presentation"
The TeX chapter first records that the integral closure `B` is finitely
presented over `A`. It then appeals to the standard theorem that finitely
presented modules commute with products under tensor product. In the finite free
case this is straightforward; the general case is obtained by presenting `M`
as a cokernel of a map between finite free modules.
:::

:::definition "restricted_product_relabel_isomorphism" (parent := "adele_project")
If an index map has finite fibres and each factor over the target is identified
with the product of the corresponding fibres over the source, then the two
restricted products are naturally in bijection.
:::

:::proof "restricted_product_relabel_isomorphism"
The TeX chapter introduces this abstract relabelling construction because the
finite-adele base-change proof needs to reorganize a restricted product indexed
by places of `K` into one indexed by places of `L`.
:::

:::theorem "restricted_product_relabel_homeomorphism" (parent := "adele_project")
If the fibres are finite and the local identifications are homeomorphisms
matching the chosen open subspaces, then the relabelling bijection of
restricted products is also a homeomorphism.
This is the topological refinement of
{uses "restricted_product_relabel_isomorphism"}[].
:::

:::proof "restricted_product_relabel_homeomorphism"
The TeX chapter treats this as the natural topological companion to the
relabelling bijection. The point is that once the open compact pieces and the
local finite products match homeomorphically, the restricted-product topology is
transported correctly across the change of index set.
:::

:::theorem "finite_adele_base_change_integral" (parent := "adele_project")
At the integral level, one gets a `B`-algebra isomorphism
$`B \otimes_A \mathbf{A}_K^\infty \cong \mathbf{A}_L^\infty`.
:::

:::proof "finite_adele_base_change_integral"
In the TeX chapter this is the immediate predecessor of
{uses "finite_adele_base_change_algebraic"}[]. One first matches the integral
restricted products place by place and only then passes to the field-level
statement.

This is also the point where the TeX file says “it is just a case of putting
everything together” informally, while warning that formally there is quite a
lot of bookkeeping hidden inside that phrase. More concretely, the proof factors
through the auxiliary ring `R`: one first compares
`B \otimes_A \mathbf{A}_K^\infty` with `R` using the finite-presentation tensor
product input, and then identifies `R` with `\mathbf{A}_L^\infty` using the
restricted-product relabelling argument and the local integral decomposition
{uses "nonarchimedean_integral_decomposition"}[].
:::

:::theorem "finite_adele_base_change_topological" (parent := "adele_project")
The same finite-adele base-change map is also a homeomorphism when the source is
given the module topology and the target the restricted-product topology.
This is the topological companion to
{uses "finite_adele_base_change_algebraic"}[].
:::

:::proof "finite_adele_base_change_topological"
The TeX chapter insists that this is a separate theorem, not a formality. The
key issue is that the restricted-product topology is not the naive subspace
topology from the full product, so one must check carefully that the local
homeomorphisms from
{uses "nonarchimedean_base_change_local_homeomorphism"}[] respect the chosen
open compact subrings and that restricted products commute with finite products
in the required way.

The TeX proof then adds one more module-topology observation: after identifying
each `B \otimes_A A_v` with a finite power of `A_v`, the restricted product of
those finite powers has the expected module topology because restricted products
commute with finite products. This is the last step that turns the algebraic
finite-adele base-change isomorphism into a homeomorphism.
:::

:::theorem "infinite_place_weak_approximation" (parent := "adele_project")
For any finite set of infinite places, the diagonal embedding of a number field
into the corresponding product of completions is dense.
:::

:::proof "infinite_place_weak_approximation"
The TeX chapter uses this as the analytic input for infinite-adele base change.
The proof is a version of weak approximation: construct elements that converge
to `1` in one archimedean place and to `0` in the others, then linearly combine
them to approximate any chosen tuple.
:::

:::theorem "infinite_place_dimension_count" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the `K_v`-dimension of
$`\prod_{w \mid v} L_w` matches the `K_v`-dimension of $`L \otimes_K K_v`.
:::

:::proof "infinite_place_dimension_count"
The TeX chapter separates this dimension count from the actual map construction,
because surjectivity of the infinite-place base-change map is ultimately proved
by combining weak approximation with finite-dimensional linear algebra.
:::

:::definition "infinite_place_local_base_change_map" (parent := "adele_project")
At a fixed infinite place `v` of `K`, there is a natural map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`.
:::

:::proof "infinite_place_local_base_change_map"
The TeX chapter builds this in two stages: first a map `K_v → ∏_{w|v} L_w`,
then the induced `L`-linear map on the tensor product. This mirrors the
nonarchimedean completion story as closely as possible.
:::

:::theorem "infinite_place_local_base_change_surjective" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the local infinite-place base-change map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`
is surjective.
:::

:::proof "infinite_place_local_base_change_surjective"
The TeX proof chooses a `K_v`-basis of `\prod_{w \mid v} L_w` and then uses
{uses "infinite_place_weak_approximation"}[] to approximate those basis vectors
by elements of `L`. Choosing the approximations carefully makes the resulting
matrix invertible, so the images of those elements span the target.
:::

:::theorem "infinite_place_local_base_change_injective" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the local infinite-place base-change map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`
is injective.
:::

:::proof "infinite_place_local_base_change_injective"
The TeX chapter observes that the map is `K_v`-linear. Once surjectivity is
known from {uses "infinite_place_local_base_change_surjective"}[] and the
dimensions agree by {uses "infinite_place_dimension_count"}[], injectivity
follows immediately.
:::

:::theorem "infinite_place_local_module_topology" (parent := "adele_project")
If `w \mid v` is an infinite place of `L` lying above an infinite place `v` of
`K`, then `L_w` has the `K_v`-module topology.
:::

:::proof "infinite_place_local_module_topology"
The TeX proof is finite-dimensional linear algebra: `L_w` is a finite-dimensional
normed `K_v`-vector space, so after choosing a basis it is linearly
homeomorphic to a finite power of `K_v`.
:::

:::theorem "infinite_place_local_base_change_homeomorphism" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the local base-change map gives a
homeomorphism
$`L \otimes_K K_v \cong \prod_{w \mid v} L_w`.
:::

:::proof "infinite_place_local_base_change_homeomorphism"
The TeX chapter first obtains the algebraic isomorphism from
{uses "infinite_place_local_base_change_surjective"}[] and
{uses "infinite_place_local_base_change_injective"}[]. It then uses
{uses "infinite_place_local_module_topology"}[] to see that both sides carry the
`K_v`-module topology, so the `K_v`-linear isomorphism is automatically a
homeomorphism.
:::

:::theorem "infinite_adele_base_change" (parent := "adele_project")
The infinite adele ring of `L` is isomorphic, both algebraically and
topologically, to $`L \otimes_K K_\infty`.
This is assembled from {uses "infinite_place_weak_approximation"}[],
{uses "infinite_place_dimension_count"}[], and
{uses "infinite_place_local_base_change_homeomorphism"}[].
:::

:::proof "infinite_adele_base_change"
The TeX chapter mirrors the nonarchimedean story but with archimedean
completions. One first builds local maps at each infinite place, then proves
surjectivity and injectivity using weak approximation and dimension counting,
and finally upgrades the local algebra isomorphisms to homeomorphisms.

At the global level, the TeX chapter then packages these local results into a
`K_\infty`-linear homeomorphism
$`K_\infty^{[L:K]} \cong L_\infty`
and uses it to identify the topology on `L_\infty` with the
`K_\infty`-module topology. Once both sides of
$`L \otimes_K K_\infty \cong L_\infty`
carry their `K_\infty`-module topology, the final algebra isomorphism is
automatically a homeomorphism.
:::

:::proof "adele_base_change"
The old blueprint splits this into finite and infinite pieces and develops the
local completion maps place by place before assembling the global theorem.

So {uses "adele_base_change"}[] is really the sum of
{uses "finite_adele_base_change_algebraic"}[],
{uses "finite_adele_base_change_topological"}[], and
{uses "infinite_adele_base_change"}[].
:::

:::theorem "adele_base_change_module_topology" (parent := "adele_project")
If `K -> L` is a finite extension of number fields, then the topology on
`\mathbf{A}_L` is the `\mathbf{A}_K`-module topology coming from the natural
map `\mathbf{A}_K -> \mathbf{A}_L`.
:::

:::proof "adele_base_change_module_topology"
This is the short theorem the TeX chapter inserts just before the final
discreteness and compactness section. Once {uses "adele_base_change"}[] is
known, the claim is immediate: `\mathbf{A}_L` is homeomorphic to
`L \otimes_K \mathbf{A}_K`, and the tensor-product side carries the
`\mathbf{A}_K`-module topology by construction.
:::

# Discreteness and compactness

The TeX chapter now changes viewpoint completely. After the local and global
base-change machinery, the goal is to show that a number field embeds in its
adeles as a discrete subgroup with compact quotient. The chapter presents this
as a proposed proof, first reducing the statements to the rational case and
then handling `\mathbf{A}_{\mathbf{Q}}` explicitly.

:::theorem "rational_adele_zero_neighborhood" (parent := "adele_project")
There is an open subset of the rational adeles whose intersection with `ℚ` is
just `{0}`.
:::

:::proof "rational_adele_zero_neighborhood"
The TeX chapter proves this using the explicit open set
`\prod_p \mathbf{Z}_p \times (-1,1)`. A rational number lying in that set is a
`p`-adic integer at every prime, hence an ordinary integer, and the archimedean
condition then forces it to be `0`.
:::

:::theorem "number_field_adele_zero_neighborhood" (parent := "adele_project")
There is an open subset of the adeles of a number field whose intersection with
the number field is just `{0}`.
:::

:::proof "number_field_adele_zero_neighborhood"
The TeX chapter reduces this to {uses "rational_adele_zero_neighborhood"}[] by
choosing a `\mathbf{Q}`-basis and using the base-change description of the
adeles from {uses "adele_base_change"}[].

More concretely, once one identifies `\mathbf{A}_K` with a finite power of
`\mathbf{A}_{\mathbf{Q}}` through a chosen `\mathbf{Q}`-basis of `K`, the claim
reduces to the corresponding rational statement coordinatewise.
:::

:::theorem "number_field_adele_discrete_embedding" (parent := "adele_project")
The additive subgroup `K` of `\mathbf{A}_K` is discrete.
:::

:::proof "number_field_adele_discrete_embedding"
This is the immediate corollary of
{uses "number_field_adele_zero_neighborhood"}[] in the TeX chapter: translate
the zero-neighborhood by an element of `K`.
:::

:::theorem "rational_adele_quotient_compact" (parent := "adele_project")
The quotient `\mathbf{A}_{\mathbf{Q}} / \mathbf{Q}` is compact.
:::

:::proof "rational_adele_quotient_compact"
The TeX chapter gives an explicit compact fundamental-domain style argument
using `\prod_p \mathbf{Z}_p \times [0,1]`.

The point is that every rational adele can be translated into this compact set
by first clearing the finitely many nonintegral `p`-adic coordinates with a
rational number and then adjusting the archimedean coordinate by an integer.
:::

:::theorem "adele_discrete_cocompact_embedding" (parent := "adele_project")
The embedding of a number field into its adeles should be discrete with compact
quotient, echoing the commutative prototype behind {uses "fujisaki_lemma_goal"}[].
This global statement is assembled from
{uses "number_field_adele_discrete_embedding"}[] and
{uses "rational_adele_quotient_compact"}[].
:::

:::proof "adele_discrete_cocompact_embedding"
In the TeX chapter this statement is positioned as the commutative prototype for
the later division-algebra compactness theorem. The point is not just that `K`
sits inside its adeles, but that the quotient carries genuine compactness
content that later noncommutative arguments should imitate.

The proof follows the same reduction-to-`\mathbf{Q}` pattern as the
discreteness argument: after choosing a `\mathbf{Q}`-basis of `K`, the quotient
`\mathbf{A}_K / K` is identified with a finite power of
`\mathbf{A}_{\mathbf{Q}} / \mathbf{Q}`, so compactness descends from the
rational case.
:::

:::theorem "commutative_compactness_prototype" (parent := "adele_project")
The quotient $`K \backslash \mathbf{A}_K` is the commutative model for the later
quotient compactness theorem in {uses "compact_quotient_for_division_algebra"}[].
:::

:::proof "commutative_compactness_prototype"
The TeX chapter is explicit about this motivational role. Before one studies
division algebras or norm-one adelic unit groups, one should understand the
classical quotient of a number field inside its adeles. Fujisaki's lemma is then
presented as the noncommutative analogue of exactly this compactness statement.
:::
