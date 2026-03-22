import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Stating The Modularity Lifting Theorems" =>

:::group "modularity_lifting_program"
This chapter corresponds to the TeX work-in-progress chapter devoted to stating
the minimal and non-minimal modularity lifting theorems precisely.
:::

# Automorphic forms and analysis

:::definition "automorphic_form_general_notion" (parent := "modularity_lifting_program")
Automorphic forms are introduced here in the general connected reductive setting
over a global field, with the quaternionic and $`\mathrm{GL}_n`$ cases treated
as specializations. The appendix placeholder for this background is {uses "connected_reductive_group_placeholder"}[].
:::

:::proof "automorphic_form_general_notion"
The legacy chapter emphasizes that the amount of analysis depends on the
associated symmetric space: for totally definite quaternion algebras the theory
becomes largely combinatorial.
:::

# Central simple algebras

:::definition "central_simple_algebra_background" (parent := "modularity_lifting_program")
Central simple algebras supply the algebraic background for the quaternionic
groups used in the modularity lifting theorem, and feed directly into {uses "totally_definite_quaternion_algebra_setup"}[].
:::

:::theorem "matrix_algebra_is_central_simple" (parent := "modularity_lifting_program")
Matrix algebras are the basic examples of central simple algebras, and their
base change behavior is the prototype for the quaternionic constructions used
later.
:::

# Main theorem interface

:::theorem "minimal_modularity_lifting_statement" (parent := "modularity_lifting_program")
One target of the full port is a clean Lean statement of the minimal
modularity-lifting theorem, built on {uses "automorphic_form_general_notion"}[]
and {uses "central_simple_algebra_background"}[].
:::

:::theorem "nonminimal_modularity_lifting_statement" (parent := "modularity_lifting_program")
The non-minimal theorem is expected to be derived from the minimal case by the
additional modern arguments highlighted in the old blueprint.
The overview chapter points back to this node through {uses "modularity_lifting_theorem"}[].
:::
