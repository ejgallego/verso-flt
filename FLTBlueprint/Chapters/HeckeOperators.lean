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

# Abstract theory

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

# Concrete theory

:::definition "restricted_product_api_pressure" (parent := "hecke_operator_project")
To instantiate the abstract theory adelically, the blueprint needs a robust API
for restricted products, compact open subgroups, and matrix groups over local
rings. This is the point of contact with {uses "adele_base_change"}[] and
{uses "adele_local_compactness"}[].
:::

:::theorem "concrete_hecke_action" (parent := "hecke_operator_project")
Applying the abstract theory to quaternionic automorphic forms produces the
concrete Hecke operators that generate the Hecke algebras used in modularity
lifting. The intended target space is {uses "weight_two_quaternionic_forms_of_level"}[],
and the resulting Hecke algebra feeds the `T` side of {uses "minimal_modularity_lifting_statement"}[].
:::
