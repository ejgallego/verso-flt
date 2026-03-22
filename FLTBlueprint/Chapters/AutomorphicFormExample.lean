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
The motivating point is pedagogical rather than logical necessity: compute one
example explicitly so that the general theory of quaternionic modular forms is
not introduced in a vacuum.
:::

# Profinite completions

:::definition "profinite_completion_zhat" (parent := "automorphic_example_program")
The profinite completion $`\widehat{\mathbf{Z}}`$ is introduced as compatible
residue classes modulo all positive integers.
The chapter uses it as a low-level entry point to the adelic viewpoint.
:::

:::definition "example_element_of_zhat" (parent := "automorphic_example_program")
The TeX blueprint highlights the formal infinite sum
$`0! + 1! + 2! + \cdots`$ as a concrete element of $`\widehat{\mathbf{Z}}`$
that is not visibly an integer.
:::

# Quaternionic algebra

:::definition "hurwitz_quaternion_order" (parent := "automorphic_example_program")
The example is built from Hamilton's quaternions over $`\mathbf{Q}`$ together
with the Hurwitz order, which plays the role of an integral structure analogous
to $`\mathrm{GL}_2(\mathbf{Z})`.
:::

:::theorem "one_dimensional_example_space" (parent := "automorphic_example_program")
The target conclusion is that the chosen concrete space of quaternionic modular
forms is one-dimensional.
:::

:::proof "one_dimensional_example_space"
The old blueprint treats this chapter as both a worked example and a source of
API pressure for the later quaternion-algebra and Hecke-operator chapters.
:::
