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

The TeX source itself begins with the note `This is not imported right now.` The
current Verso chapter should be read in exactly that spirit: it is a frontier
marker, not a substantially developed chapter.

# Overview Of The Chapter

In this section we discuss the problem of attempting to state the motivic global
Langlands conjectures for connected reductive groups over number fields. More
precisely, the goal is to formally state the Buzzard--Gee version of the
conjecture, which applies to algebraic automorphic representations. The main
difficulties here are in writing down precisely what is meant by phrases such as
`automorphic representation`, `connected reductive group`,
`local-global compatibility`, `de Rham Galois representation`, and so on; these
words hide a large amount of technical material.

The TeX chapter is extremely short, and that brevity is informative. It means
the real blocker here is not writing polished prose but getting the surrounding
language precise enough that even the first serious definitions can be stated
honestly in Lean.

# Statement Of The Conjecture

Let $`R` be a commutative base ring; it will often be a field but we shall
develop the theory in more generality when there is no extra effort needed to
do.

:::definition "affine_group_scheme_over_affine_base" (parent := "global_langlands_program")
An affine group scheme over $`R` is a group object in the category of affine
schemes over $`R`.
:::

The TeX draft immediately follows this with a nested note about Hopf algebras
and then stops, with `Connected and reductive` still marked as TODO. So the
current Verso port deliberately preserves that incompleteness rather than
inventing a more finished interface than the source actually contains.

:::definition "Hopf_algebra" (parent := "global_langlands_program")
TODO: Connected and reductive.
:::
