import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "The Global Langlands Conjectures" =>

:::group "global_langlands_program"
This chapter records the long-range conjectural destination that sits beyond the
`GL_n` example chapter: a clean statement of global Langlands reciprocity for
connected reductive groups over number fields.
:::

The corresponding TeX file is still extremely skeletal. That is itself useful
information. It shows that, even once the project can discuss automorphic forms
for `GL_n/ℚ`, the fully general reciprocity conjecture remains blocked not by
one theorem but by a stack of missing definitions.

# Overview Of The Chapter

:::definition "global_langlands_buzzard_gee_target" (parent := "global_langlands_program")
The intended target is some formal statement of the Buzzard--Gee style motivic
global Langlands conjecture for algebraic automorphic representations.
:::

:::proof "global_langlands_buzzard_gee_target"
The TeX notes phrase this as a problem of precise formulation rather than proof.
The real challenge is to say exactly what the conjectural correspondence should
be between automorphic representations and Galois representations, with all the
local and motivic adjectives spelled out.
:::

# Statement Of The Conjecture

The TeX stub immediately specializes the base to a commutative ring `R`, not
because the final statement is meant to stay at that level of generality, but
because even the earliest group-scheme definitions already want a flexible base
ring parameter.

:::definition "affine_group_scheme_placeholder" (parent := "global_langlands_program")
One foundational input is the notion of an affine group scheme over a
commutative base ring, or equivalently its Hopf-algebra presentation.
:::

:::proof "affine_group_scheme_placeholder"
The TeX stub already points in this direction: before one can even say
“connected reductive group over a number field”, one needs a satisfactory Lean
interface for affine group schemes and Hopf algebras.
:::

:::definition "hopf_algebra_placeholder" (parent := "global_langlands_program")
The TeX stub immediately pairs affine group schemes with the corresponding
Hopf-algebra language, signaling that the eventual formalization will need both
viewpoints available.
:::

:::definition "connected_reductive_group_global_langlands" (parent := "global_langlands_program")
The conjectural statement should be formulated for connected reductive groups
over number fields, using the same background interface tracked earlier in
{uses "connected_reductive_group_placeholder"}[].
:::

:::definition "automorphic_representation_global_langlands" (parent := "global_langlands_program")
On the automorphic side, one needs a robust notion of algebraic automorphic
representation, building on the general placeholders recorded in
{uses "automorphic_form_placeholder"}[],
{uses "automorphic_representation_local_decomposition_placeholder"}[], and the
concrete `GL_n` model from {uses "global_langlands_reciprocity_target_gln"}[].
:::

:::definition "galois_side_global_langlands" (parent := "global_langlands_program")
On the Galois side, one needs de Rham and local-global compatibility conditions
for the conjectural representations, together with a precise compatible-family
package.
:::

:::proof "galois_side_global_langlands"
The TeX stub names these obstacles explicitly: local-global compatibility, de
Rham conditions, and the hidden machinery behind phrases like “motivic Galois
representation”. This chapter therefore serves as a marker for what is still
missing rather than a chapter that pretends the conjecture is already fully
stated.
:::

# Why This Chapter Exists

:::theorem "global_langlands_frontier_statement" (parent := "global_langlands_program")
The chapter exists to mark the current frontier: the project can now formulate
serious automorphic objects in special cases such as `GL_n/ℚ`, but the full
global Langlands conjecture still requires a much larger package of background
definitions.
:::

:::proof "global_langlands_frontier_statement"
This chapter is therefore complementary to {uses "gln_langlands_program"}[].
The `GL_n` chapter shows a first serious special case that can already be
described mathematically. This chapter records the next abstraction jump and the
definitions that still block it.
:::
