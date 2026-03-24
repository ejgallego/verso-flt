import Verso
import VersoManual
import VersoBlueprint
import FLT.AutomorphicForm.QuaternionAlgebra.HeckeOperators.Abstract

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Hecke Operators" =>

:::group "hecke_operator_project"
This miniproject packages the abstract double-coset formalism and then applies
it to spaces of automorphic forms.
:::

The TeX blueprint is explicit that this project has two layers. The abstract
theory is pure algebra and already fully formalized. The concrete theory,
however, still needs more local and adelic API before all proofs become
sorry-free.

# Status

:::definition "hecke_operator_project_status" (parent := "hecke_operator_project")
This remains an active miniproject. The abstract Hecke formalism is already in
good shape, while the concrete adelic theory still depends on restricted-product
and local matrix-group infrastructure.
:::

The TeX chapter is slightly sharper about the current state: the abstract theory
is described as completely formalized, while the concrete theory is said to
have no sorried definitions but still some sorried proofs. So the point of the
chapter is not to invent the formalism, but to finish the local and adelic API
needed to make the concrete operators sorry-free.

# Goal

The purpose of the chapter is to obtain sorry-free Hecke operators on spaces of
automorphic forms. These operators generate the Hecke algebras that supply the
`T` side of the modularity lifting theorems, and so they sit directly on the
critical path toward `R = T`.

The TeX source is explicit that the project splits into two parts. The abstract
theory is pure algebra and comparatively short. The concrete theory is where
the real infrastructure burden sits, because the adelic groups of interest are
restricted products and the local compact-open subgroups are matrix groups over
local rings.

# Abstract theory

The setup in the TeX chapter is deliberately minimal:

- a commutative coefficient ring `R`
- an `R`-module `A`
- a group `G` acting `R`-linearly on `A`
- subgroups `U` and `V` of `G`
- an element `g : G`

The key finiteness hypothesis is that the double coset `UgV` is a finite union
of single left cosets `g_iV`. Under that hypothesis one gets an operator from
the `V`-fixed points to the `U`-fixed points.

:::definition "abstract_hecke_operator" (parent := "hecke_operator_project")
  (lean := "AbstractHeckeOperator.HeckeOperator")
Given a group action on an $`R`$-module and a finite decomposition of a double
coset, one defines the Hecke operator by summing translates over the chosen
single-coset representatives. This is the abstract engine behind the concrete
operator story in {uses "concrete_hecke_action"}[].
:::

:::theorem "abstract_hecke_operator_well_defined" (parent := "hecke_operator_project")
The operator is independent of the chosen representatives, lands in the desired
invariant submodule, and is $`R`$-linear.
This is the formal heart of the abstract theory section of the old chapter.
It is the theorem-level packaging of {uses "abstract_hecke_operator"}[].
:::

:::proof "abstract_hecke_operator_well_defined"
The TeX proof is the expected one. Replacing a representative `g_i` with
`g_i v` for `v ∈ V` does not change `g_i • a` because `a` is `V`-invariant. The
image lands in `A^U` because left multiplication by an element of `U` permutes
the relevant cosets. Finally, linearity is inherited from the linearity of the
group action.
:::

:::theorem "finite_double_coset_criterion" (parent := "hecke_operator_project")
In a topological group, compactness and openness hypotheses imply the required
double-coset finiteness automatically, and this is the bridge from the abstract
Hecke formalism to spaces such as {uses "weight_two_quaternionic_forms_of_level"}[].
The corresponding Lean theorem exists in the concrete Hecke file, but that path
still sits behind the quaternionic rc6 compatibility work.
:::

:::proof "finite_double_coset_criterion"
The TeX proof is the standard compactness argument: a double coset `UgV` is a
compact subset when `U` and `V` are compact, and a decomposition into left
`V`-cosets is an open cover when `V` is open. Compactness then forces only
finitely many cosets.
:::

:::theorem "abstract_hecke_operators_commute" (parent := "hecke_operator_project")
  (lean := "AbstractHeckeOperator.comm")
Under the expected commutation hypothesis on representatives, the abstract
Hecke operators commute.
This is the abstract commutativity criterion later used in
{uses "hecke_operators_different_places_commute"}[].
:::

:::proof "abstract_hecke_operators_commute"
The TeX chapter simply expands both compositions into double sums and then
swaps the order of multiplication using the commutation relation on the chosen
representatives.
:::

# Concrete theory

:::definition "restricted_product_api_pressure" (parent := "hecke_operator_project")
To instantiate the abstract theory adelically, the blueprint needs a robust API
for restricted products, compact open subgroups, and matrix groups over local
rings. This is the point of contact with {uses "adele_base_change"}[] and
{uses "adele_local_compactness"}[].
:::

The TeX chapter explains why the concrete theory is not just a routine
instantiation. In the adelic setting, the ambient groups are restricted
products, and even statements that sound tautological, such as
`GL_2(A_F)` being a restricted product of `GL_2(F_v)`, need careful
topological justification.

The TeX source then proceeds in a very specific order: products, units, local
matrix theory, adelic groups, automorphic forms, and only then the concrete
Hecke operators. The Verso chapter follows that same order here.

:::definition "restricted_product_definition" (parent := "hecke_operator_project")
The restricted product is the subset of the full product consisting of tuples
that lie in designated good subspaces for all but finitely many indices.
:::

:::proof "restricted_product_definition"
The chapter emphasizes that while group/ring/module structure is inherited
componentwise, the topology is not the subspace topology from the full product.
Instead, it is defined so that finite products of bad factors and good factors
away from a finite set assemble continuously.

The TeX chapter also stresses a subtle point that matters later: the natural map
from the restricted product into the full product is continuous, but is not in
general a topological embedding.
:::

:::theorem "restricted_product_product_homeomorphism" (parent := "hecke_operator_project")
Restricted products with respect to open subspaces commute with finite products.
:::

:::proof "restricted_product_product_homeomorphism"
The TeX chapter proves this first for binary products and then for finite
products by induction. The openness hypothesis is emphasized because the
restricted-product topology behaves much better under products in that case.

The TeX notes even remark that this may fail without the openness hypothesis,
because filtered colimits and binary products do not commute well in general in
the category of topological spaces.
:::

:::theorem "restricted_product_matrix_homeomorphism" (parent := "hecke_operator_project")
Matrices over a restricted product identify homeomorphically with the
restricted product of the corresponding matrix spaces.
This is the matrix-valued companion to
{uses "restricted_product_product_homeomorphism"}[].
:::

:::proof "restricted_product_matrix_homeomorphism"
This is the immediate matrix-valued corollary of the finite-product theorem,
since an `n × n` matrix space is just a finite product of copies of the
coefficient space.
:::

:::theorem "units_of_open_submonoid_open" (parent := "hecke_operator_project")
If `U` is an open submonoid of a topological monoid `M`, then `Uˣ` is naturally
an open subgroup of `Mˣ`.
:::

:::proof "units_of_open_submonoid_open"
The proof in the TeX chapter embeds `Mˣ` in `M × M` by `g ↦ (g, g⁻¹)`. Under
that embedding, `Uˣ` is exactly the intersection of `Mˣ` with the open set
`U × U`.
:::

:::theorem "units_of_compact_submonoid_compact" (parent := "hecke_operator_project")
If `U` is a compact submonoid of a Hausdorff topological monoid `M`, then `Uˣ`
is a compact subgroup of `Mˣ`.
:::

:::proof "units_of_compact_submonoid_compact"
The same embedding argument works again. Hausdorffness makes `Mˣ` closed in
`M × M`, so intersecting it with the compact subset `U × U` gives a compact
space of units.

The TeX chapter explicitly asks whether Hausdorffness is really necessary here.
The current proof uses it exactly at the point where `{1}` has to be a closed
subset of the ambient monoid.
:::

:::theorem "product_units_homeomorphism" (parent := "hecke_operator_project")
For a finite product of topological monoids, the units of the product are
homeomorphic to the product of the unit groups.
:::

:::proof "product_units_homeomorphism"
The TeX chapter proves continuity in both directions directly from the induced
topology on units and the universal property of products.
:::

:::theorem "restricted_product_units_homeomorphism" (parent := "hecke_operator_project")
If `M_i` are topological monoids with open good submonoids `U_i`, then the
units of the restricted product are naturally the restricted product of the
unit groups.
This combines {uses "product_units_homeomorphism"}[] with
{uses "units_of_open_submonoid_open"}[].
:::

:::proof "restricted_product_units_homeomorphism"
The TeX chapter singles this out because it is exactly the statement one needs
to pass from restricted products of local rings to restricted products of local
matrix groups and their units. The openness of the `U_i` is what makes the
restricted-product topology and the topology on units interact cleanly.

The TeX proof there is deliberately indirect: it proves the map is a
homeomorphism near the identity, using the open neighborhoods coming from the
good submonoids, and then upgrades that local statement to a global
homeomorphism of topological groups.
:::

# Local matrix theory

The local section of the TeX chapter specializes to completions `K_v` of number
fields at finite places. The point is to manufacture the compact open
subgroups and explicit double-coset decompositions that later define the local
Hecke operators.

The TeX chapter is candid that these local lemmas were not yet formalized in
the right generality. It sticks to completions of number fields at finite
places, even though the natural long-term statements should be about general
nonarchimedean local fields.

:::theorem "local_integer_ring_open" (parent := "hecke_operator_project")
The local integer ring `\mathcal{O}_v` is an open subring of `K_v`.
:::

:::theorem "local_integer_ring_compact" (parent := "hecke_operator_project")
The local integer ring `\mathcal{O}_v` is a compact subring of `K_v`.
:::

:::theorem "matrix_full_level_open" (parent := "hecke_operator_project")
The matrix ring `M₂(\mathcal{O}_v)` is an open subring of `M₂(K_v)`.
:::

:::theorem "matrix_full_level_compact" (parent := "hecke_operator_project")
The matrix ring `M₂(\mathcal{O}_v)` is a compact subring of `M₂(K_v)`.
:::

:::theorem "local_gl2_full_level_compact_open" (parent := "hecke_operator_project")
For a nonarchimedean local field `K_v`, the subgroup `GL₂(\mathcal{O}_v)` is a
compact open subgroup of `GL₂(K_v)`.
This is obtained from {uses "matrix_full_level_open"}[],
{uses "matrix_full_level_compact"}[],
{uses "units_of_open_submonoid_open"}[], and
{uses "units_of_compact_submonoid_compact"}[].
:::

:::proof "local_gl2_full_level_compact_open"
The TeX chapter derives this from the corresponding statement for the matrix
ring `M₂(\mathcal{O}_v)`: once the full matrix ring is known to be a compact
open subring of `M₂(K_v)`, the compact-open statement for units follows from the
general topology of units in compact/open submonoids.
:::

:::definition "local_level_from_residue_subgroup" (parent := "hecke_operator_project")
If `Γ_v` is a subgroup of `GL₂(k_v)`, its preimage in `GL₂(\mathcal{O}_v)` gives
the local compact open subgroup used to define the corresponding local level.
:::

:::theorem "local_congruence_level_compact_open" (parent := "hecke_operator_project")
If `Γ_v` is a subgroup of `GL₂(k_v)` for the finite residue field `k_v`, then
its preimage in `GL₂(\mathcal{O}_v)` is again a compact open subgroup.
This upgrades {uses "local_level_from_residue_subgroup"}[] to a topological
subgroup statement using {uses "units_of_open_submonoid_open"}[] and
{uses "units_of_compact_submonoid_compact"}[].
:::

:::proof "local_congruence_level_compact_open"
The TeX chapter constructs these subgroups by reduction modulo the maximal ideal.
Because the residue field is finite, the preimage is a finite union of cosets of
the compact open ideal `M₂(\varpi \mathcal{O}_v)`, and hence is itself compact
and open.
:::

The TeX chapter then specializes to upper-triangular congruence-type local
subgroups in preparation for the explicit `U_{v,\alpha}` double-coset
calculation.

:::theorem "local_u_operator_double_coset_decomposition" (parent := "hecke_operator_project")
For upper-triangular congruence-type local levels, the double coset of
`diag(\alpha,1)` admits an explicit finite decomposition indexed by
`\mathcal{O}_v / \alpha \mathcal{O}_v`.
:::

:::proof "local_u_operator_double_coset_decomposition"
This is the concrete local combinatorics behind the `U_{v,\alpha}` operators in
the TeX chapter. After conjugating by `diag(\alpha,1)`, the double-coset
problem reduces to a finite quotient of the upper-right entry modulo `\alpha`.
The resulting representatives are unipotent translates of the diagonal matrix.

The TeX proof is explicit that the real work is first to reduce the statement
to a finite-group calculation inside the chosen congruence subgroup, and then to
read off the quotient parameter from the upper-right entry modulo `\alpha`.
:::

# Adelic groups

The group of actual interest is the adelic unit group
`(D \otimes_K \mathbf{A}_K^\infty)^×`, which is identified via a chosen
rigidification with `GL₂(\mathbf{A}_K^\infty)`.

:::theorem "adelic_gl2_is_restricted_product" (parent := "hecke_operator_project")
After choosing the standard local full levels, `GL₂(\mathbf{A}_F^\infty)` is a
restricted product of the local groups `GL₂(F_v)`.
This is the adelic consequence of
{uses "restricted_product_matrix_homeomorphism"}[] and
{uses "restricted_product_units_homeomorphism"}[].
:::

:::proof "adelic_gl2_is_restricted_product"
The TeX chapter treats this as one of those “obvious” adelic facts that still
needs careful topological proof. One first identifies matrices over restricted
products with restricted products of matrices, then applies
{uses "restricted_product_units_homeomorphism"}[] to pass to units.
:::

:::theorem "adelic_levels_from_local_data" (parent := "hecke_operator_project")
Choosing compact open subgroups at finitely many places and the full level
elsewhere produces a compact open adelic level subgroup.
:::

:::proof "adelic_levels_from_local_data"
This is the basic global construction used throughout the concrete theory. The
TeX chapter emphasizes that levels of interest are almost always built in this
way from finitely many exceptional local conditions.

More concretely, one chooses for each bad place `v` a subgroup `Γ_v` of
`GL₂(k_v)` of the upper-triangular type used in the local double-coset
calculation, lets `U_{Δ_v}` be its preimage in `GL₂(\mathcal{O}_v)`, and takes
full level `GL₂(\mathcal{O}_v)` away from the finite bad set `S`. The TeX
chapter then checks compactness and openness factorwise and finally uses the
open embedding of the product of full local levels into the adelic restricted
product.
:::

# Automorphic forms

:::definition "automorphic_forms_for_hecke_setup" (parent := "hecke_operator_project")
For the concrete Hecke theory, one fixes a totally real field `F`, a totally
definite quaternion algebra `D/F`, and a coefficient group `R`, and lets `A`
denote the space of weight-2 quaternionic automorphic forms.
:::

:::proof "automorphic_forms_for_hecke_setup"
The TeX chapter recalls the quaternionic automorphic-form axioms at this point:
left `D^×`-invariance, triviality under the finite ideles in the center, and
right invariance under some compact open subgroup. For a fixed level `U`, the
forms of level `U` are exactly the fixed vectors `A^U`.

It also spells out the left action of `G` on this ambient space `A` by the rule
`(g • f)(x) := f(xg)`. This is the action to which the abstract Hecke-operator
formalism is applied.
:::

# Concrete Hecke operators

:::definition "t_v_hecke_operator" (parent := "hecke_operator_project")
For a place `v` outside the bad set, the operator `T_v` is defined by the
double coset of the element supported at `v` with local component
`diag(\varpi_v,1)`.
:::

:::definition "u_valpha_hecke_operator" (parent := "hecke_operator_project")
For a bad place `v` and a nonzero `\alpha \in \mathcal{O}_v`, the operator
`U_{v,\alpha}` is defined by the double coset of the element supported at `v`
with local component `diag(\alpha,1)`.
:::

The TeX chapter emphasizes that the Hecke algebra of interest is generated by
the operators `T_v` for `v ∉ S` together with the operators `U_{v,\alpha}` for
`v ∈ S`.

:::theorem "concrete_hecke_action" (parent := "hecke_operator_project")
Applying the abstract theory to quaternionic automorphic forms produces the
concrete Hecke operators that generate the Hecke algebras used in modularity
lifting. The intended target space is {uses "weight_two_quaternionic_forms_of_level"}[],
and the resulting Hecke algebra feeds the `T` side of {uses "minimal_modularity_lifting_statement"}[].
The concrete local operators are {uses "t_v_hecke_operator"}[] and
{uses "u_valpha_hecke_operator"}[].
:::

:::proof "concrete_hecke_action"
The remaining work in the TeX chapter is local-to-global bookkeeping: understand
restricted products, compact open unit groups, and the relevant matrix-group
double cosets well enough that the abstract Hecke machinery can be applied to
the quaternionic automorphic-form spaces.
:::

# Analysis of the Hecke algebra

:::theorem "hecke_operators_different_places_commute" (parent := "hecke_operator_project")
Hecke operators supported at different finite places commute, because the chosen
local representatives commute inside the adelic product.
:::

:::proof "hecke_operators_different_places_commute"
The TeX chapter reduces this to the abstract commutativity criterion
{uses "abstract_hecke_operators_commute"}[]. Once the representatives are
supported at disjoint places, they commute componentwise, so the abstract
criterion applies immediately.

The TeX proof is a little more concrete than that summary: for both the good
operators `T_v` and the bad operators `U_{v,\alpha}`, one first chooses
single-coset representatives supported only at the relevant place. Disjoint
support is then exactly what forces commutativity.
:::

:::theorem "u_operators_same_place_multiply" (parent := "hecke_operator_project")
At a fixed bad place `v`, the operators `U_{v,\alpha}` satisfy
`U_{v,\alpha} U_{v,\beta} = U_{v,\alpha\beta}`.
This is the same-place local relation coming from
{uses "local_u_operator_double_coset_decomposition"}[].
:::

:::proof "u_operators_same_place_multiply"
The TeX chapter derives this from the explicit local double-coset
decomposition. That stronger multiplicative relation is the last local input
needed for commutativity of the whole Hecke algebra.
:::

:::theorem "hecke_algebra_noetherian_commutative_placeholder" (parent := "hecke_operator_project")
The intended final output is a commutative Noetherian Hecke algebra generated by
the operators `T_v` away from the bad set and the local `U_{v,\alpha}` operators
at the bad places.
This combines {uses "hecke_operators_different_places_commute"}[],
{uses "u_operators_same_place_multiply"}[], and
{uses "finite_dimensional_quaternionic_forms"}[].
:::

:::proof "hecke_algebra_noetherian_commutative_placeholder"
The TeX chapter only sketches this endpoint, but its logic is clear. The
commutativity comes from the local and abstract commutation arguments, while the
Noetherianity comes from the fact that the Hecke operators act on a
finite-dimensional space of automorphic forms over a Noetherian coefficient
ring.

So this node is where the concrete Hecke theory actually reconnects with the
modularity-lifting story.

The TeX chapter is explicit that the Noetherianity input comes from the
quaternion algebra miniproject via Fujisaki's lemma: once the relevant space of
automorphic forms is finite-dimensional over a Noetherian ring, its endomorphism
algebra is a Noetherian module, and the Hecke algebra generated inside it is
therefore a Noetherian ring as well.
:::
