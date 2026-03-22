import FLTBlueprint.Chapters.HistoricalInputs
import FLTBlueprint.Chapters.MiniProjects
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Introduction" =>

:::group "flt_main_story"
The top-level route from the classical statement of Fermat's Last Theorem to
the formal reduction currently implemented in Lean.
:::

Fermat's Last Theorem says that if $`a,b,c,n`$ are positive integers with
$`n \ge 3`$, then $`a^n + b^n \ne c^n`$. In that sense it is a statement about
an infinite family of Diophantine equations. The FLT project treats the
formalization task as teaching this proof to Lean, starting from the mathematics
already available in core Lean and mathlib rather than rebuilding all of basic
number theory from scratch.

The old TeX blueprint emphasized that this is like explaining the proof to a
very demanding audience member: Lean insists on complete detail, and in 2025-era
formalization practice it only fills in the steps that are mathematically
utterly obvious. The resulting cost in human time is one of the central facts
about the project.

:::definition "formalization_starting_point" (parent := "flt_main_story")
The project starts from core Lean and mathlib rather than rebuilding basic
arithmetic, algebra, and geometry from first principles inside the FLT repo.
:::

:::proof "formalization_starting_point"
The TeX introduction makes this pedagogical analogy explicit: formalizing FLT is
not like formalizing Peano arithmetic from scratch, but like teaching a
graduate-level course on Fermat's Last Theorem to a computer that already knows
large parts of an undergraduate degree and some relevant graduate topics.

That is why the blueprint can begin directly with elliptic curves, Galois
representations, and modularity rather than first rebuilding the integers,
polynomials, completions, or basic field theory.
:::

:::author "kevin_buzzard" (name := "Kevin Buzzard")
:::

:::author "flt_contributors" (name := "FLT contributors")
:::

:::theorem "flt_classical_statement" (parent := "flt_main_story") (owner := "flt_contributors")
Fermat's Last Theorem states that there are no non-trivial positive integer
solutions to $`x^n + y^n = z^n`$ for $`n >= 3`$.
The public-facing theorem exported by the project is still tracked separately;
the first Verso port keeps the informal statement here without forcing the
blueprint build through the monolithic root import.
:::

:::proof "flt_classical_statement"
The project exports the classical positive-integer formulation directly, so the
rendered blueprint can point at the same theorem that downstream users see.
:::

:::theorem "flt_modern_reduction" (parent := "flt_main_story") (owner := "kevin_buzzard")
The current formal route proves Fermat's Last Theorem by showing that a
counterexample would yield a Frey package, then deriving incompatible
properties of the associated Galois representation.
The contradiction is assembled from {uses "mazur_frey_irreducible"}[] and
{uses "wiles_frey_not_irreducible"}[].
:::

:::proof "flt_modern_reduction"
This is the project-level endpoint for the reduction chain. The detailed steps
are tracked in the following chapters, starting with
{uses "counterexample_yields_frey_package"}[] and ending with
{uses "no_frey_package"}[].
:::

:::theorem "phase_one_goal" (parent := "flt_main_story")
The current project phase aims for a Lean proof that Fermat's Last Theorem
follows from mathematics already known by the end of 1989.
This is the phase boundary recorded more systematically in
{uses "known_in_1980s_phase_boundary"}[].
:::

:::proof "phase_one_goal"
The introduction in the TeX blueprint is very clear about the intended staging.
The first milestone is not a proof free of assumptions, but a proof whose
remaining assumptions all belong to the pre-1990 literature.

That is why the current blueprint keeps a dedicated chapter of explicit
historical inputs and assumptions, beginning with
{uses "formalized_assumptions_scope"}[].
:::

:::definition "verso_port_scope" (parent := "flt_main_story")
This Verso port replaces the old `leanblueprint` build with the reference
`verso-blueprint` structure. The initial migration keeps the central reduction
nodes, the currently axiomatized historical inputs, and a map of the
mini-project chapters that still need fuller informal migration.
:::

:::definition "nonlinear_blueprint_structure" (parent := "flt_main_story")
The blueprint is intentionally nonlinear: one main route follows the reduction
chapters, while a parallel collection of bottom-up workstreams supplies the API
and background mathematics those chapters eventually need.
The project map for those workstreams is recorded in
{uses "legacy_blueprint_map"}[].
:::

:::proof "nonlinear_blueprint_structure"
The TeX introduction explicitly warned readers not to expect a single linear
chapter order. The intended reading route begins with the core contradiction
chain in {uses "counterexample_yields_frey_package"}[],
{uses "hardly_ramified_reducible"}[], and {uses "no_frey_package"}[], but many
other chapters are written as local projects with their own concrete goals.

That split survives in the Verso port: the proof spine lives in the reduction,
hardly ramified, and overview chapters, while the project-map chapter records
the auxiliary workstreams that build the surrounding infrastructure.
:::

:::definition "miniproject_workstyle" (parent := "flt_main_story")
Many chapters are miniprojects: bottom-up projects with sharply defined local
goals, often at early graduate level, and often motivated by the possibility of
upstreaming reusable mathematics to mathlib.
:::

:::proof "miniproject_workstyle"
This language comes directly from the old introduction. The point of a
miniproject is not just to accumulate background material, but to isolate a
concrete theorem or API boundary that can be attacked independently of the full
global FLT proof.

The Frobenius workstream is the model success story, summarized by
{uses "miniproject_success_story"}[], and the broader collection of current
workstreams is organized in {uses "legacy_blueprint_map"}[].
:::

# Which proof is being formalised?

The route followed by the project is not a direct transcription of the original
Wiles and Taylor--Wiles papers. Instead, the plan is the modern strategy
designed by Richard Taylor in discussion with Kevin Buzzard: a 21st century
version of the proof, incorporating later refinements due to
Diamond--Fujiwara, Khare--Wintenberger, Kisin, Skinner--Wiles, Taylor, and
others.

In the current first phase of the FLT project, many deep results that were
already known by the end of 1989 are allowed as assumptions. The intended
endpoint of that phase is a Lean proof that Fermat's Last Theorem follows from
mathematics that humanity already knew in the 1980s.

# The structure of this blueprint

The original TeX document described itself as a nonlinear blueprint: a family
of semi-independent chapters with explicit local goals rather than a single
linear narrative. That same philosophy is kept here. The first reductions are
tracked in the reduction chapter, while the later strategy is sketched in the
overview chapter through the modularity lifting theorem and the reduction at 3
step.

Much of the remaining work is organized as miniprojects. Those chapters are not
mere appendices: they are where the project develops the background API around
adeles, Haar characters, quaternion algebras, Hecke operators, and Frobenius
elements that the global proof strategy eventually depends on. The rendered
project map for those workstreams now lives in the dedicated legacy-map
chapter.

# Remarks

The TeX introduction was candid that many chapters were still rough sketches or
collections of ideas. The Verso port is following the same staged approach. Some
chapters are already close to their intended long-term role, while others are
present mainly to preserve the project map and its dependency structure until
their informal mathematics is ported more fully.
