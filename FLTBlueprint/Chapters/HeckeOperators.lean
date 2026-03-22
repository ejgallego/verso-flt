import Verso
import VersoManual
import VersoBlueprint

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
Given a group action on an $`R`$-module and a finite decomposition of a double
coset, one defines the Hecke operator by summing translates over the chosen
single-coset representatives.
:::

:::theorem "abstract_hecke_operator_well_defined" (parent := "hecke_operator_project")
The operator is independent of the chosen representatives, lands in the desired
invariant submodule, and is $`R`$-linear.
:::

:::theorem "finite_double_coset_criterion" (parent := "hecke_operator_project")
In a topological group, compactness and openness hypotheses imply the required
double-coset finiteness automatically.
:::

# Concrete theory

:::definition "restricted_product_api_pressure" (parent := "hecke_operator_project")
To instantiate the abstract theory adelically, the blueprint needs a robust API
for restricted products, compact open subgroups, and matrix groups over local
rings.
:::

:::theorem "concrete_hecke_action" (parent := "hecke_operator_project")
Applying the abstract theory to quaternionic automorphic forms produces the
concrete Hecke operators that generate the Hecke algebras used in modularity
lifting.
:::
