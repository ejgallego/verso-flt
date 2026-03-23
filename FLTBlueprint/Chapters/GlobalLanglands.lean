import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "The Global Langlands Conjectures" =>

:::group "global_langlands_program"
This chapter discusses the problem of attempting to state the motivic global
Langlands conjectures for connected reductive groups over number fields.
:::

# Overview Of The Chapter

In this section we discuss the problem of attempting to state the motivic global
Langlands conjectures for connected reductive groups over number fields. More
precisely, the goal is to formally state the Buzzard--Gee version of the
conjecture, which applies to algebraic automorphic representations. The main
difficulties here are in writing down precisely what is meant by phrases such as
`automorphic representation`, `connected reductive group`,
`local-global compatibility`, `de Rham Galois representation`, and so on; these
words hide a large amount of technical material.

# Statement Of The Conjecture

Let $`R` be a commutative base ring; it will often be a field but we shall
develop the theory in more generality when there is no extra effort needed to
do.

:::definition "affine_group_scheme_over_affine_base" (parent := "global_langlands_program")
An affine group scheme over $`R` is a group object in the category of affine
schemes over $`R`.
:::

:::definition "Hopf_algebra" (parent := "global_langlands_program")
TODO: Connected and reductive.
:::
