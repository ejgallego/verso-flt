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

This is not imported right now.

# Overview Of The Chapter

In this section we discuss the problem of attempting to state the motivic global
Langlands conjectures for connected reductive groups over number fields. More
precisely, the goal is to formally state the Buzzard--Gee version of the
conjecture, which applies to algebraic automorphic representations. The main
difficulties here are in writing down precisely what is meant by phrases such as
`automorphic representation`, `connected reductive group`,
`local-global compatibility`, `de Rham Galois representation`, and so on; these
words hide a large amount of technical material.

```tex "global_langlands_overview"
\chapter{The Global Langlands conjectures}

\section{Overview of the chapter}

In this section we discuss the problem of attempting to state the motivic global
Langlands conjectures for connected reductive groups over number fields. More
precisely, the goal is to formally state the Buzzard--Gee version of the
conjecture, which applies to algebraic automorphic representations. The main
difficulties here are in writing down precisely what is meant by phrases such as
``automorphic representation'', ``connected reductive group'',
``local-global compatibility'', ``de Rham Galois representation'', and so on;
these words hide a large amount of technical material.
```

# Statement Of The Conjecture

Let $`R` be a commutative base ring; it will often be a field but we shall
develop the theory in more generality when there is no extra effort needed to do.

```tex "global_langlands_statement"
\section{Statement of the conjecture}

Let $R$ be a commutative base ring; it will often be a field but we shall develop
the theory in more generality when there is no extra effort needed to do.
```

:::definition "affine_group_scheme_over_affine_base" (parent := "global_langlands_program")
An affine group scheme over $`R` is a group object in the category of affine
schemes over $`R`.
:::

Equivalently, if $`G = \operatorname{Spec} A` is affine over $`R`, then the
group structure on $`G` is encoded by a commutative Hopf `R`-algebra structure
on `A`: a coproduct $`\Delta : A \to A \otimes_R A`, a counit
$`\varepsilon : A \to R`, and an antipode $`S : A \to A`, satisfying the usual
coassociativity, counit, and antipode identities.

```tex "affine_group_scheme_over_affine_base"
\begin{definition}\label{affine_group_scheme_over_affine_base}\lean{???}

  An \emph{affine group scheme over $R$} is a group object in the category of affine schemes over $R$.
```

:::definition "Hopf_algebra" (parent := "global_langlands_program")
A Hopf `R`-algebra is a commutative `R`-algebra `A` equipped with a coproduct
$`\Delta : A \to A \otimes_R A`, a counit $`\varepsilon : A \to R`, and an
antipode $`S : A \to A`, subject to the usual coassociativity, counit, and
antipode axioms. In the affine case, such a Hopf algebra is the coordinate ring
of an affine group scheme.
:::

In the global Langlands setting one usually restricts to connected reductive
groups over a number field: smooth affine group schemes whose geometric fibers
are connected reductive algebraic groups.

```tex "Hopf_algebra"
\begin{definition}\label{Hopf_algebra}\lean{TODO}% we have Hopf algebras in mathlib

  %%%%%%%%%%%%%%%%%%%

  TODO: Connected and reductive
```
