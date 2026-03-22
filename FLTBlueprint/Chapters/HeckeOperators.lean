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

# Goal

The purpose of the chapter is to obtain sorry-free Hecke operators on spaces of
automorphic forms. These operators generate the Hecke algebras that supply the
`T` side of the modularity lifting theorems, and so they sit directly on the
critical path toward `R = T`.

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

:::definition "restricted_product_definition" (parent := "hecke_operator_project")
The restricted product is the subset of the full product consisting of tuples
that lie in designated good subspaces for all but finitely many indices.
:::

:::proof "restricted_product_definition"
The chapter emphasizes that while group/ring/module structure is inherited
componentwise, the topology is not the subspace topology from the full product.
Instead, it is defined so that finite products of bad factors and good factors
away from a finite set assemble continuously.
:::

:::theorem "restricted_product_product_homeomorphism" (parent := "hecke_operator_project")
Restricted products with respect to open subspaces commute with finite products.
:::

:::theorem "units_of_open_submonoid_open" (parent := "hecke_operator_project")
If `U` is an open submonoid of a topological monoid `M`, then `Uˣ` is naturally
an open subgroup of `Mˣ`.
:::

:::theorem "units_of_compact_submonoid_compact" (parent := "hecke_operator_project")
If `U` is a compact submonoid of a Hausdorff topological monoid `M`, then `Uˣ`
is a compact subgroup of `Mˣ`.
:::

:::theorem "restricted_product_units_homeomorphism" (parent := "hecke_operator_project")
If `M_i` are topological monoids with open good submonoids `U_i`, then the
units of the restricted product are naturally the restricted product of the
unit groups.
:::

:::proof "restricted_product_units_homeomorphism"
The TeX chapter singles this out because it is exactly the statement one needs
to pass from restricted products of local rings to restricted products of local
matrix groups and their units. The openness of the `U_i` is what makes the
restricted-product topology and the topology on units interact cleanly.
:::

# Local matrix theory

:::theorem "local_gl2_full_level_compact_open" (parent := "hecke_operator_project")
For a nonarchimedean local field `K_v`, the subgroup `GL₂(\mathcal{O}_v)` is a
compact open subgroup of `GL₂(K_v)`.
:::

:::proof "local_gl2_full_level_compact_open"
The TeX chapter derives this from the corresponding statement for the matrix
ring `M₂(\mathcal{O}_v)`: once the full matrix ring is known to be a compact
open subring of `M₂(K_v)`, the compact-open statement for units follows from the
general topology of units in compact/open submonoids.
:::

:::theorem "local_congruence_level_compact_open" (parent := "hecke_operator_project")
If `Γ_v` is a subgroup of `GL₂(k_v)` for the finite residue field `k_v`, then
its preimage in `GL₂(\mathcal{O}_v)` is again a compact open subgroup.
:::

:::proof "local_congruence_level_compact_open"
The TeX chapter constructs these subgroups by reduction modulo the maximal ideal.
Because the residue field is finite, the preimage is a finite union of cosets of
the compact open ideal `M₂(\varpi \mathcal{O}_v)`, and hence is itself compact
and open.
:::

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
:::

# Adelic groups

:::theorem "adelic_gl2_is_restricted_product" (parent := "hecke_operator_project")
After choosing the standard local full levels, `GL₂(\mathbf{A}_F^\infty)` is a
restricted product of the local groups `GL₂(F_v)`.
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
:::

:::theorem "concrete_hecke_action" (parent := "hecke_operator_project")
Applying the abstract theory to quaternionic automorphic forms produces the
concrete Hecke operators that generate the Hecke algebras used in modularity
lifting. The intended target space is {uses "weight_two_quaternionic_forms_of_level"}[],
and the resulting Hecke algebra feeds the `T` side of {uses "minimal_modularity_lifting_statement"}[].
:::

:::proof "concrete_hecke_action"
The remaining work in the TeX chapter is local-to-global bookkeeping: understand
restricted products, compact open unit groups, and the relevant matrix-group
double cosets well enough that the abstract Hecke machinery can be applied to
the quaternionic automorphic-form spaces.
:::

:::theorem "hecke_operators_different_places_commute" (parent := "hecke_operator_project")
Hecke operators supported at different finite places commute, because the chosen
local representatives commute inside the adelic product.
:::

:::proof "hecke_operators_different_places_commute"
The TeX chapter reduces this to the abstract commutativity criterion
{uses "abstract_hecke_operators_commute"}[]. Once the representatives are
supported at disjoint places, they commute componentwise, so the abstract
criterion applies immediately.
:::

:::theorem "hecke_algebra_noetherian_commutative_placeholder" (parent := "hecke_operator_project")
The intended final output is a commutative Noetherian Hecke algebra generated by
the operators `T_v` away from the bad set and the local `U_{v,\alpha}` operators
at the bad places.
:::

:::proof "hecke_algebra_noetherian_commutative_placeholder"
The TeX chapter only sketches this endpoint, but its logic is clear. The
commutativity comes from the local and abstract commutation arguments, while the
Noetherianity comes from the fact that the Hecke operators act on a
finite-dimensional space of automorphic forms over a Noetherian coefficient
ring.

So this node is where the concrete Hecke theory actually reconnects with the
modularity-lifting story.
:::
