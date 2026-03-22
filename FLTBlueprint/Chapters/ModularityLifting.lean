import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Stating The Modularity Lifting Theorems" =>

:::group "modularity_lifting_program"
This chapter corresponds to the TeX work-in-progress chapter devoted to stating
the minimal and non-minimal modularity lifting theorems precisely. Its role in
the blueprint is deliberately narrow but important: turn the vague phrase
“there is an `R = T` theorem here” into a clean interface of local conditions,
automorphic input, and reduction steps.
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

:::theorem "quaternionic_automorphic_forms_are_algebraic" (parent := "modularity_lifting_program")
For the totally definite quaternionic groups relevant to FLT, automorphic forms
behave like algebraic level structures rather than holomorphic functions on a
positive-dimensional symmetric space.
This is why the modularity-lifting chapter can point naturally toward
{uses "weight_two_quaternionic_forms"}[] instead of classical modular forms.
:::

:::proof "quaternionic_automorphic_forms_are_algebraic"
The TeX chapter makes this contrast with classical modular forms explicit.
For `GL₂/ℚ`, quotienting `GL₂(ℝ)` by its center and maximal compact subgroup
produces the upper half-plane, so differential operators and holomorphicity are
built into the theory. For the quaternionic groups used in the FLT strategy,
the analogous real quotient is zero-dimensional. So the automorphic theory is
still deep, but its definitions are far more algebraic and much closer to the
finite-level structures built later in {uses "quaternionic_modular_form_example"}[].
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

:::proof "minimal_modularity_lifting_statement"
The old TeX chapter is explicit that “stating the theorem” is already a serious
goal. The minimal theorem is not a one-line modularity slogan: it depends on a
precise automorphic notion, a definite quaternionic setting, and a deformation
problem with controlled local conditions like the `S`-good package recorded in
{uses "s_good_lift_condition"}[] and {uses "s_good_deformation_problem"}[].

The strategy chapter already explains why this theorem matters. Potential
modularity uses an auxiliary modular object to land inside the hypotheses of a
lifting theorem, and the minimal case is the place where the Taylor--Wiles
patching argument is expected to live.
:::

:::theorem "reduction_to_minimal_case" (parent := "modularity_lifting_program")
The non-minimal modularity-lifting theorem should be reduced to the minimal
case by Skinner--Wiles-style arguments together with cyclic base change and
control of the local level structure.
:::

:::proof "reduction_to_minimal_case"
The TeX proof sketch says exactly this. One first peels away the excess local
level until the deformation problem is minimal, and only then runs the
Taylor--Wiles/Kisin machine. In the quaternionic setting, that reduction phase
is not purely local: it also needs global input such as cyclic base change and
the characterization of which automorphic representations arise by base change.

So this node records a real logical interface, not just a storytelling choice:
the non-minimal theorem is expected to factor through the minimal one rather
than being proved independently from scratch.
:::

:::theorem "nonminimal_modularity_lifting_statement" (parent := "modularity_lifting_program")
The non-minimal theorem is expected to be derived from the minimal case by the
additional modern arguments highlighted in the old blueprint.
The overview chapter points back to this node through {uses "modularity_lifting_theorem"}[].
:::

:::proof "nonminimal_modularity_lifting_statement"
The TeX chapter identifies the literature only approximately, but it does point
to near-references for the kind of theorem the project wants:
{Informal.citep taylorMeroCont}[] and {Informal.citep tobyModularity}[].
The exact FLT statement is not copied verbatim from either source; rather, it
is the theorem that should emerge after combining the minimal statement with the
reduction mechanism recorded in {uses "reduction_to_minimal_case"}[].

That is why this chapter stays focused on interfaces. The proof architecture is
already visible, even before every surrounding automorphic and local-theory
definition has been pushed all the way down into Lean.
:::
