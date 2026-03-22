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
