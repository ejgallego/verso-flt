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

The opening sentence of the TeX chapter makes the reduction target explicit:
modulo Mazur's theorem and some other still-unformalized 1980s background, FLT
has been reduced to ruling out a hardly ramified irreducible two-dimensional
mod-`ℓ` Galois representation over `ℚ`.

It is also explicit there that we no longer need to assume the representation
comes from the torsion of an elliptic curve. Once the Frey reduction has done
its job, the rest of the strategy is formulated at the level of abstract Galois
representations with the same local properties.

# Potential modularity

:::theorem "potential_modularity_step" (parent := "overview_strategy")
Starting from a hardly ramified mod $`\ell`$ representation, the strategy is to
find a totally real field of even degree over $`\mathbf{Q}`$ over which the
representation becomes modular in the quaternionic sense, relying on
{uses "potential_modularity_auxiliary_curve"}[],
{uses "modularity_lifting_theorem"}[], and the automorphic infrastructure
developed in {uses "quaternionic_modular_form_example"}[] and
{uses "weight_two_quaternionic_forms"}[].
:::

:::proof "potential_modularity_step"
In the old blueprint, “modular” here does not mean classical modular forms on
`GL₂/ℚ`. It means automorphic forms for the units of a totally definite
quaternion algebra over a totally real field of even degree. The parity
condition matters: such a quaternion algebra exists only when the number of real
places is even.

The point of the potential modularity step is that one starts with a
hardly-ramified representation over `ℚ`, passes to the number field cut out by
its kernel, and then searches for a suitable totally real extension `F`
disjoint from that field such that the restricted representation becomes
modular.

The TeX chapter explicitly lists the kinds of ingredients this uses:

- Moret--Bailly's theorem on global points with prescribed local behavior; see
  {Informal.citep moretBailly1990}[].
- global class field theory
- the Jacquet--Langlands correspondence
- converse-theorem input showing certain induced mod `p` representations are
  modular
- a modularity lifting theorem

Almost everything in this list dates back to the 1980s or earlier. The TeX
chapter is explicit that the modularity lifting theorem is the main genuine
post-1980s ingredient in this potential modularity package.
:::

:::theorem "potential_modularity_auxiliary_curve" (parent := "overview_strategy")
Potential modularity is implemented by choosing a totally real field, an
auxiliary prime, and an auxiliary elliptic curve whose mod $`\ell`$
representation realizes the target representation and whose mod `p`
representation is already modular.
:::

:::proof "potential_modularity_auxiliary_curve"
The TeX overview makes this construction explicit. One uses Moret--Bailly to
produce an auxiliary curve over a suitable totally real field `F`, arranged so
that its mod $`\ell`$ representation is the one we care about while its mod `p`
representation is induced from a character. Converse-theorem input then makes
the mod `p` side modular, and {uses "modularity_lifting_theorem"}[] transports
that modularity back to the mod $`\ell` side.

This is the concrete mechanism hidden behind the slogan “potential modularity”.
:::

# A modularity lifting theorem

:::definition "s_good_lift_condition" (parent := "overview_strategy")
The modularity-lifting input is phrased in terms of a finite set of local
conditions: cyclotomic determinant, controlled ramification away from
$`S \cup \{\ell\}`$, trace restrictions at places in $`S`$, and flatness at the
places above $`\ell`$.
The local cohomological background for these conditions is part of {uses "local_galois_cohomology_package"}[].
:::

:::theorem "s_good_deformation_problem" (parent := "overview_strategy")
Once the `S`-good local conditions are fixed, the corresponding deformation
problem for an absolutely irreducible residual representation is expected to be
representable.
This is the deformation-theoretic interface behind
{uses "modularity_lifting_theorem"}[].
:::

:::proof "s_good_deformation_problem"
The old TeX overview says this explicitly before stating the theorem: after
fixing determinant, ramification, trace conditions at the auxiliary groups
`J_v`, and flatness above $`\ell`, one can package the allowed lifts into a
representable functor.

This matters for the blueprint graph because the modularity lifting theorem is
not merely about one distinguished lift. It is about a whole deformation
problem with controlled local behavior, and that representable deformation
problem is the `R` side of the later `R = T` story.
:::

:::theorem "modularity_lifting_theorem" (parent := "overview_strategy")
If a residual representation is modular and a lift satisfies the relevant
local conditions, then the lift is modular as well.
The statement is meant to apply to lifts governed by
{uses "s_good_lift_condition"}[] and {uses "s_good_deformation_problem"}[].
This is the first major theorem the old blueprint identifies as a priority to
state cleanly in Lean.
:::

:::proof "modularity_lifting_theorem"
The TeX chapter spells out the local conditions more concretely. For places
`v ∈ S`, one uses a tame quotient condition encoded through a subgroup `J_v` of
inertia. At places above `\ell`, one imposes flatness, meaning that the
representation should be approximable by finite flat group schemes. That is the
point where the “projective limit of finite flat objects” formulation enters.

The overview is also explicit that this theorem is the main genuinely
post-1980s ingredient in the whole chapter. The proof is presented as a
two-stage argument: first reduce to a minimal case by Skinner--Wiles-style
arguments and cyclic base change, then run a Taylor--Wiles/Kisin patching
argument in the minimal setting.

The chapter {uses "minimal_modularity_lifting_statement"}[] is devoted to
making this interface precise, and the TeX discussion points in particular to
{Informal.citep taylorMeroCont}[] and {Informal.citep tobyModularity}[] as near
references.

The TeX draft also says something worth preserving here: at the time of
writing, it was already viewed as a worthwhile medium-term project milestone
simply to state this theorem properly in Lean, even before proving it.
:::

# Compatible families and reduction at 3

:::theorem "compatible_family_step" (parent := "overview_strategy")
After potential modularity, the argument passes to a compatible
family and studies the specialization at $`3`$, matching the transfer
formalized later in {uses "hardly_ramified_compatible_family"}[].
:::

:::proof "compatible_family_step"
This is the place where the legacy blueprint invokes Khare--Wintenberger,
Brauer's theorem tricks, and the move to a 3-adic specialization, matching the
program sketched in {uses "hardly_ramified_compatible_family"}[]. The TeX notes
specifically point toward the Khare--Wintenberger modularity machinery
{Informal.citep khareWintenbergerII}[] and a Brauer-theoretic compatible-family
construction in BLGGT {Informal.citep blggtPotentialAutomorphy}[].
:::

:::theorem "reduction_at_three_step" (parent := "overview_strategy")
The specialization at $`3`$ should force reducibility by a discriminant-bound
argument of Fontaine/Odlyzko type, contradicting the original irreducibility.
:::

:::proof "reduction_at_three_step"
The TeX blueprint phrases this as a Fontaine-style contradiction. After passing
to the 3-adic specialization of a compatible family, the reduction mod `3`
becomes flat at `3` and tame at `2`. The resulting representation should then be
reducible because an irreducible one would cut out a number field with root
discriminant too small to satisfy the Odlyzko bounds.

So the contradiction uses {uses "odlyzko_root_discriminant_bound"}[] together
with the deformation-theoretic bridge recorded earlier in
{uses "hardly_ramified_compatible_family"}[], and the TeX bibliography traces
the numerical estimate back to the Poitou--Odlyzko discriminant bounds
{Informal.citep poitouOdlyzkoBounds}[].

The TeX chapter ends by apologizing for how sketchy this whole discussion still
is, and that remains the right reading instruction for the current overview: it
is a strategic map, not yet a polished full-dress exposition.
:::
