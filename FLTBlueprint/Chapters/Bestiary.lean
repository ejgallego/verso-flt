import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Appendix: A Collection Of Results Needed In The Proof" =>

:::group "bestiary_appendix"
The old TeX appendix is a holding area for major background results that were
known before 1990 and will eventually migrate into more focused chapters.
:::

# Class field theory

:::definition "local_weil_group_placeholder" (parent := "bestiary_appendix")
The appendix records the local Weil group and local class field theory among
the core background items still waiting for polished Lean-facing statements.
:::

:::theorem "local_galois_cohomology_package" (parent := "bestiary_appendix")
The local cohomology package includes finiteness, cohomological dimension two,
top-degree identifications, Poincare duality, and Euler-Poincare formulas.
:::

# Algebraic groups and automorphic forms

:::definition "connected_reductive_group_placeholder" (parent := "bestiary_appendix")
The appendix also tracks the background definitions of connected reductive
groups, Lie-group structures on real and complex points, and automorphic-form
notions in generality well beyond the immediate FLT needs.
:::

:::proof "connected_reductive_group_placeholder"
The point of the appendix is triage rather than completion: it marks the
high-level objects that the project will eventually need to state precisely.
:::
