import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.Citations

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "An Overview Of The Proof" =>

:::group "overview_strategy"
This chapter mirrors the old overview chapter: once the Frey-curve torsion
representation is isolated, the remaining strategy is to prove that no hardly
ramified irreducible representation of that shape can exist.
:::

# Potential modularity

:::theorem "potential_modularity_step" (parent := "overview_strategy")
Starting from a hardly ramified mod $`\ell`$ representation, the strategy is to
find a totally real field of even degree over $`\mathbf{Q}`$ over which the
representation becomes modular in the quaternionic sense, relying on {uses "modularity_lifting_theorem"}[] and the automorphic infrastructure developed in {uses "quaternionic_modular_form_example"}[] and {uses "weight_two_quaternionic_forms"}[].
:::

:::proof "potential_modularity_step"
The legacy blueprint explains this as the part of the argument that mixes
Moret--Bailly, class field theory, Jacquet--Langlands, converse theorems, and a
modularity lifting theorem. For the first ingredient, see
{Informal.citep moretBailly1990}[].
:::

# A modularity lifting theorem

:::definition "s_good_lift_condition" (parent := "overview_strategy")
The modularity-lifting input is phrased in terms of a finite set of local
conditions: cyclotomic determinant, controlled ramification away from
$`S \cup \{\ell\}`$, trace restrictions at places in $`S`$, and flatness at the
places above $`\ell`$.
The local cohomological background for these conditions is part of {uses "local_galois_cohomology_package"}[].
:::

:::theorem "modularity_lifting_theorem" (parent := "overview_strategy")
If a residual representation is modular and a lift satisfies the relevant
local conditions, then the lift is modular as well.
This is the first major theorem the old blueprint identifies as a priority to
state cleanly in Lean.
:::

:::proof "modularity_lifting_theorem"
The TeX blueprint presents this theorem as the key genuinely post-1980s input in
the overview, with the proof split into a minimal case and a reduction to that
case via Skinner--Wiles style arguments. The chapter {uses "minimal_modularity_lifting_statement"}[] is devoted to making this interface precise, and the old TeX discussion points in particular to {Informal.citep taylorMeroCont}[] and {Informal.citep tobyModularity}[] as near references.
:::

# Compatible families and reduction at 3

:::theorem "compatible_family_step" (parent := "overview_strategy")
After potential modularity, the argument passes to a compatible
family and studies the specialization at $`3`$.
:::

:::proof "compatible_family_step"
This is the place where the legacy blueprint invokes Khare--Wintenberger,
Brauer's theorem tricks, and the move to a 3-adic specialization, matching the
program sketched in {uses "hardly_ramified_compatible_family"}[].
:::

:::theorem "reduction_at_three_step" (parent := "overview_strategy")
The specialization at $`3`$ should force reducibility by a discriminant-bound
argument of Fontaine/Odlyzko type, contradicting the original irreducibility.
:::

:::proof "reduction_at_three_step"
The contradiction uses {uses "odlyzko_root_discriminant_bound"}[] together with the deformation-theoretic bridge recorded earlier in {uses "hardly_ramified_compatible_family"}[].
:::
