import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Automorphic Forms And The Langlands Conjectures" =>

:::group "gln_langlands_program"
This chapter ports the TeX discussion of automorphic forms on
GLn over Q and the shape of the global Langlands reciprocity
conjectures in that setting.
:::

# Definition for GLn over Q

:::definition "automorphic_form_for_gln" (parent := "gln_langlands_program")
The old chapter specializes the general theory to GLn over Q,
where the dual group is again GLn(C) and many technical
obstructions disappear.
:::

:::definition "smooth_gln_function" (parent := "gln_langlands_program")
Smoothness is split into three conditions: continuity, smoothness in the real
direction, and local constancy on the finite adelic direction.
:::

:::definition "slowly_increasing_gln_function" (parent := "gln_langlands_program")
The growth condition is factored into a separate notion of slowly-increasing
function on GLn(R).
:::

:::definition "weight_at_infinity_gln" (parent := "gln_langlands_program")
The weight at infinity is modeled by a finite-dimensional continuous
representation of a maximal compact subgroup such as On(R).
:::

:::definition "centre_action_gln" (parent := "gln_langlands_program")
The center of the universal enveloping algebra acts by differential operators,
encoding the infinite-level conditions in the automorphic-form definition.
:::

:::definition "full_automorphic_form_definition_gln" (parent := "gln_langlands_program")
Combining periodicity, finite level, weight, infinitesimal character, and
growth yields the intended definition of an automorphic form for
GLn(AQ).
:::

:::theorem "hecke_operator_action_gln" (parent := "gln_langlands_program")
The finite adelic group acts on these spaces, giving the usual Hecke operators
after passing to fixed compact open level.
:::
