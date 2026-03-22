import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "An Example Of An Automorphic Form" =>

:::group "automorphic_example_program"
The old chapter develops one explicit quaternionic automorphic example to guide
the general definitions used later in the modularity-lifting story.
:::

# Introduction

:::definition "quaternionic_modular_form_example" (parent := "automorphic_example_program")
The chapter studies a concrete space of quaternionic modular forms, with the
eventual claim that a specific weight-2 level-2 example is one-dimensional.
:::

:::proof "quaternionic_modular_form_example"
The TeX chapter motivates this example through the role of `R = T`
theorems in the proof of Fermat's Last Theorem. For Wiles, the `R` came from
elliptic curves and the `T` came from classical modular forms. In the FLT
project’s preferred route, the relevant `T` comes instead from quaternionic
automorphic forms.

That shift is one reason the example matters. The chapter is not logically
essential to the proof, but it is meant to prevent the general quaternionic
theory from appearing out of nowhere. The explicit example serves as a test case
for what infrastructure the later chapters should actually build.
:::

# A quaternion algebra

:::definition "hamilton_quaternion_algebra_over_q" (parent := "automorphic_example_program")
The example starts with Hamilton's quaternion algebra
$`\mathbf{Q} \oplus \mathbf{Q} i \oplus \mathbf{Q} j \oplus \mathbf{Q} k`$,
viewed as a noncommutative analogue of `2 × 2` matrices over `ℚ`.
:::

:::definition "hurwitz_quaternion_order" (parent := "automorphic_example_program")
The example is built from Hamilton's quaternions over $`\mathbf{Q}`$ together
with the Hurwitz order, which plays the role of an integral structure analogous
to `GL₂(ℤ)`.
:::

:::proof "hurwitz_quaternion_order"
The old TeX chapter explains that the Hurwitz order is preferred over the more
naive lattice `ℤ ⊕ ℤ i ⊕ ℤ j ⊕ ℤ k` because it is a maximal order and a
Euclidean domain. That makes it the natural arithmetic input for a concrete
automorphic-form computation.
:::

# Zhat

:::definition "profinite_completion_zhat" (parent := "automorphic_example_program")
The profinite completion $`\widehat{\mathbf{Z}}`$ is introduced as compatible
residue classes modulo all positive integers.
The chapter uses it as a low-level entry point to the adelic viewpoint.
:::

The TeX chapter motivates this detour historically. Classical automorphic forms
are functions on symmetric spaces such as the upper half-plane, but when one
works over number fields with nontrivial class group the classical approach
becomes awkward: Hecke operators want prime ideals, not just principal positive
integers. The adelic viewpoint fixes this, and `\widehat{Z}` is introduced as a
low-level toy model for the finite adelic direction.

:::theorem "zhat_is_a_ring" (parent := "automorphic_example_program")
The set of compatible residue-class collections forms a ring, naturally sitting
inside the product of all `ℤ / Nℤ`.
:::

:::proof "zhat_is_a_ring"
The point here is not depth but orientation: all ring operations are inherited
componentwise, and compatibility with reduction maps is preserved by those same
operations.
:::

:::theorem "zhat_is_not_the_integers" (parent := "automorphic_example_program")
The profinite completion contains the image of the integers, but it is much
larger than `ℤ`.
:::

:::definition "example_element_of_zhat" (parent := "automorphic_example_program")
The TeX blueprint highlights the formal infinite sum
$`0! + 1! + 2! + \cdots`$ as a concrete element of $`\widehat{\mathbf{Z}}`$
that is not visibly an integer.
:::

:::proof "example_element_of_zhat"
Modulo any positive integer `N`, the factorial series stabilizes after
`(N-1)!`, because every subsequent term is divisible by `N`. So the sequence of
partial factorial sums defines a compatible adelic-style object even though the
naive infinite sum diverges in the ordinary real sense.
:::

# Target calculation

:::theorem "one_dimensional_example_space" (parent := "automorphic_example_program")
The target conclusion is that the chosen concrete space of quaternionic modular
forms is one-dimensional.
:::

:::proof "one_dimensional_example_space"
The old blueprint treats this chapter as both a worked example and a source of
API pressure for the later quaternion-algebra and Hecke-operator chapters.
It also makes a methodological point: if this example were completed before
mathlib proves the finite-dimensionality of classical modular-form spaces, then
the first modular-form finite-dimensionality theorem in Lean would be
quaternionic rather than classical.
:::
