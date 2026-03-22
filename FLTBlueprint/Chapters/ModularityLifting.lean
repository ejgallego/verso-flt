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

The old TeX chapter opens with a practical claim: a very worthwhile medium-term
goal for the FLT project is simply to state the modularity lifting theorems
cleanly. There are really two theorems in play. One is a minimal statement
proved by a Taylor--Wiles style argument. The other is obtained from it using
later refinements and reduction steps.

# Automorphic forms and analysis

:::definition "automorphic_form_general_notion" (parent := "modularity_lifting_program")
Automorphic forms are introduced here in the general connected reductive setting
over a global field, with the quaternionic and $`\mathrm{GL}_n`$ cases treated
as specializations. The appendix placeholder for this background is {uses "connected_reductive_group_placeholder"}[].
:::

:::proof "automorphic_form_general_notion"
The TeX chapter spends time explaining why automorphic forms sometimes look very
analytic and sometimes look almost purely combinatorial. Classical modular forms
for `GL₂/ℚ` involve holomorphic functions because the associated symmetric space
is the upper half-plane. By contrast, Dirichlet characters for `GL₁/ℚ` are just
finite-level algebraic data because the symmetric space is zero-dimensional.

The quaternionic setting relevant for FLT behaves like the second kind of
example. For totally definite quaternion algebras over totally real fields, the
associated symmetric space is again zero-dimensional, so the definition of an
automorphic form can be phrased without the usual analytic baggage. That is why
the later quaternionic chapters have such an algebraic flavor.
:::

# Central simple algebras

:::definition "central_simple_algebra_background" (parent := "modularity_lifting_program")
Central simple algebras supply the algebraic background for the quaternionic
groups used in the modularity lifting theorem, and feed directly into {uses "totally_definite_quaternion_algebra_setup"}[].
:::

In the old TeX exposition, this section is meant as a warm-up before talking
about quaternion algebras. Fields are always commutative here, but algebras over
them are not assumed commutative.

:::definition "central_simple_algebra_definition" (parent := "modularity_lifting_program")
A central simple algebra over a field `K` is a nonzero `K`-algebra whose center
is exactly `K` and which has no nontrivial two-sided ideals.
:::

:::theorem "matrix_algebra_is_central_simple" (parent := "modularity_lifting_program")
Matrix algebras are the basic examples of central simple algebras, and their
base change behavior is the prototype for the quaternionic constructions used
later.
:::

:::proof "matrix_algebra_is_central_simple"
The TeX chapter sketches the usual argument: scalar matrices show that `K` is in
the center, commutation with matrix units forces every central element to be
scalar, and any nonzero two-sided ideal contains a matrix unit and therefore the
identity. So the whole matrix algebra is central simple.
:::

:::theorem "central_simple_algebra_base_change" (parent := "modularity_lifting_program")
If `D` is central simple over `K` and `L/K` is a field extension, then
`L ⊗_K D` is central simple over `L`.
:::

:::proof "central_simple_algebra_base_change"
The TeX chapter cites standard algebra references for this fact and then uses
it to motivate why quaternion algebras remain quaternion algebras after
extension of scalars.
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
