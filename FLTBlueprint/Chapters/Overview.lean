import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.Citations

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "An Overview Of The Proof" =>

:::group "overview_strategy"
This chapter gives a sketch overview of the strategy for ruling out hardly
ramified irreducible two-dimensional Galois representations and hence finishing
the FLT argument after the first reductions.
:::

So far we have seen that, modulo Mazur's theorem and various other things which
will still take some work to formalize but which are much easier, Fermat's Last
Theorem can be reduced to the statement that there is no prime $`\ell \geq 5`
and hardly-ramified irreducible `2`-dimensional Galois representation
$`\rho : \GQ \to \GL_2(\Z/\ell\Z)`.

In this chapter we give an overview of our strategy for proving this, and
collect various results which we will need along the way. Note that we no
longer need to assume that $`\rho` comes from the $`\ell`-torsion in an
elliptic curve.

```tex "overview_intro"
\chapter{An overview of the proof}\label{ch_overview}

So far we have seen that, modulo Mazur's theorem (and various other things which will still take some work to formalise but which are much easier), Fermat's Last Theorem can be reduced
to the statement that there is no prime $\ell\geq 5$ and hardly-ramified
irreducible 2-dimensional Galois representation $\rho:\GQ\to\GL_2(\Z/\ell\Z)$.

In this chapter we give an overview of our strategy for proving this, and collect
various results which we will need along the way. Note that we no longer need to assume that $\rho$ comes from the $\ell$-torsion in an elliptic curve.
```

# Potential Modularity

We will only speak about modularity for `2`-dimensional representations of the
absolute Galois group of a totally real field $`F` of even degree over $`\Q`.
What we will mean by modular is associated to an automorphic representation of
the units of the totally definite quaternion algebra over $`F` ramified at no
finite places and at all infinite places. Such a quaternion algebra only exists
if $`F` has even degree, hence the restriction in our definition of modularity.
We can furthermore even demand that the infinity type of the form is trivial,
the analogue in this setting of classical weight `2` forms, as these are the
only forms we shall need for FLT.

:::theorem "potential_modularity_step" (parent := "overview_strategy")
Assume we have a hardly-ramified representation $`\rho` as above. Let $`K` be
the number field corresponding to the kernel of $`\rho`. Then there is some
totally real field $`F` of even degree, Galois over $`\Q`, unramified at
$`\ell`, and disjoint from $`K`, such that $`\rho|G_F` is modular.
:::

:::proof "potential_modularity_step"
The proof of this is very long, and uses a host of machinery. For example:

- Moret--Bailly's result on points on curves with prescribed local behaviour,
  recorded in {uses "moret_bailly_placeholder"}[] and cited in
  {Informal.citep moretBailly1990}[].
- several nontrivial results in global class field theory, recorded in
  {uses "global_class_field_theory_placeholder"}[].
- the Jacquet--Langlands correspondence.
- the assertion that irreducible `2`-dimensional mod `p` representations
  induced from a character are modular.
- a modularity lifting theorem, namely {uses "modularity_lifting_theorem"}[].

Almost everything here dates back to the `1980`s or before. The exception is
the modularity lifting theorem, which we now state explicitly.

```tex "potential_modularity"
\section{Potential modularity.}

We will only speak about modularity for 2-dimensional representations of the
absolute Galois group of a totally real field $F$ \emph{of even degree over} $\Q$.
What we will mean by ``modular'' is ``associated to an automorphic representation of the
units of the totally definite quaternion algebra over $F$ ramified at no finite places
and at all infinite places''. Such a quaternion algebra only exists if $F$ has even degree,
hence the restriction in our definition of modularity.
We can furthermore even demand that the infinity type of the form is trivial (the analogue
in this setting of classical weight 2 forms), as these are the only forms we shall need for FLT.

Assume we have a hardly-ramified representation~$\rho$ as above. Let $K$
be the number field corresponding to the kernel of~$\rho$. Our first claim
is that there is some totally real field $F$ of even degree, Galois over $\Q$,
unramified at $\ell$, and disjoint from $K$, such that $\rho|G_F$ is modular.
The proof of this is very long, and uses a host of machinery. For example:
\begin{itemize}
    \item Moret--Bailly's result~\cite{moret-bailly} on points on curves with prescribed
    local behaviour;
    \item several nontrivial results in global class field theory;
    \item the Jacquet--Langlands correspondence;
    \item The assertion that irreducible 2-dimensional mod $p$ representations induced from a character are modular (this follows from converse theorems);
    \item A modularity lifting theorem.
\end{itemize}

Almost everything here dates back to the 1980s or before.
The exception is the modularity lifting theorem, which we now state explicitly.
```
:::

# A Modularity Lifting Theorem

Suppose $`\ell \geq 5` is a prime, that $`F` is a totally real field of even
degree in which $`\ell` is unramified, and that $`S` is a finite set of finite
places of $`F` not dividing $`\ell`. Write $`G_F` for the absolute Galois group
of $`F`.

If $`v \in S` then let $`F_v` denote the completion of $`F` at $`v`, fix an
inclusion $`\overline{F} \to \overline{F_v}`, let $`\calO_v` denote the
integers of $`F_v`, and $`k(v)` the residue field. Let $`I_v \subset G_F`
denote the inertia subgroup at $`v`. Local class field theory gives a map
$`I_v \to \calO_{F_v}^\times` and hence a map $`I_v \to k(v)^\times`. Let
$`J_v` denote the kernel of this map.

:::definition "s_good_lift_condition" (parent := "overview_strategy")
Let $`R` be a complete local Noetherian $`\Z_\ell`-algebra with finite residue
field of characteristic $`\ell`. We will be interested in representations
$`\rho : G_F \to \GL_2(R)` with the following four properties:

- $`\det(\rho)` is the cyclotomic character.
- $`\rho` is unramified outside $`S \cup \{\ell\}`.
- If $`v \in S` then $`\rho(g)` has trace equal to `2` for all $`g \in J_v`.
- If $`v \mid \ell` is a place of $`F` then $`\rho` is flat at $`v`.

In the last bullet point, flat means projective limit of representations
arising from finite flat group schemes. Let us use the temporary notation
`S`-good to denote representations with these four properties.
:::

:::theorem "s_good_deformation_problem" (parent := "overview_strategy")
Say $`k` is a finite extension of $`\Z/\ell\Z` and
$`\rhobar : G_F \to \GL_2(k)` is continuous, absolutely irreducible when
restricted to $`F(\zeta_\ell)`, and `S`-good. Then one can check that the
functor representing `S`-good lifts of $`\rhobar` is representable.
It uses {uses "s_good_lift_condition"}[].
:::

:::proof "s_good_deformation_problem"
This is the deformation-theoretic setup behind
{uses "modularity_lifting_theorem"}[]. The surrounding local input is the
cohomological package summarized in {uses "local_galois_cohomology_package"}[].
:::

:::theorem "modularity_lifting_theorem" (parent := "overview_strategy")
If $`\rhobar` is modular of level $`\Gamma_1(S)` and
$`\rho : G_F \to \GL_2(\calO)` is an `S`-good lift of $`\rhobar` to $`\calO`,
the integers of a finite extension of $`\Q_\ell`, then $`\rho` is also modular
of level $`\Gamma_1(S)`.
It uses {uses "s_good_deformation_problem"}[],
{uses "local_galois_cohomology_package"}[],
{uses "skinner_wiles_cft_trick_placeholder"}[], and
{uses "moret_bailly_placeholder"}[].
:::

:::proof "modularity_lifting_theorem"
Right now we are very far from even stating this theorem in Lean.

One near-reference is Theorem `3.3` of {Informal.citep taylorMeroCont}[], which
assumes that $`\ell` is totally split in $`F` rather than just unramified.
Another near-reference is Theorem `5.2` of {Informal.citep tobyModularity}[],
which assumes the slightly stronger hypothesis that the image of $`\rho`
contains $`\SL_2(\Z/p\Z)`.

The proof is a two-stage procedure and has a nontrivial analytic input. First
one uses the Skinner--Wiles trick, recorded abstractly in
{uses "skinner_wiles_cft_trick_placeholder"}[], to reduce to the minimal case,
and this needs cyclic base change for `GL(2)` and also a characterization of
the image of the base change construction. Because of our definition of
modular, this seems to need Jacquet--Langlands as well. In the minimal case,
the argument is the usual Taylor--Wiles trick, using refinements due to Kisin
and others.
:::

```tex "modularity_lifting"
\section{A modularity lifting theorem}

Suppose $\ell\geq5$ is a prime, that $F$ is a totally real field of even degree in which $\ell$
is unramified, and that~$S$ is a finite set of finite places of~$F$ not dividing~$\ell$. Write
$G_F$ for the absolute Galois group of~$F$.

If $v\in S$ then let $F_v$ denote the completion of~$F$ at~$v$, fix an inclusion $\overline{F}\to\overline{F_v}$,
let $\calO_v$ denote the integers of $F_v$ and $k(v)$ the residue field. Let $I_v\subset G_F$ denote the inertia
subgroup at~$v$. Local class field theory (or a more elementary approach) gives a map $I_v\to\calO_{F_v}^\times$
and hence a map $I_v\to k(v)^\times$. Let $J_v$ denote the kernel of this map.

Let $R$ be a complete local Noetherian $\Z_\ell$-algebra with finite residue field of characteristic $\ell$.
We will be interested in representations $\rho:G_F\to\GL_2(R)$ with the following four properties.
\begin{itemize}
    \item $\det(\rho)$ is the cyclotomic character;
    \item $\rho$ is unramified outside $S\cup\{\ell\}$;
    \item If $v\in S$ then $\rho(g)$ has trace equal to~2 for all $g\in J_v$;
    \item If $v\mid\ell$ is a place of $F$ then $\rho$ is flat at~$v$.
\end{itemize}

In the last bullet point, ``flat'' means ``projective limit of representations arising from
finite flat group schemes''. Let us use the lousy temporary notation ``$S$-good'' to denote
representations with these four properties.

Say $k$ is a finite extension of $\Z/\ell\Z$ and $\rhobar:G_F\to\GL_2(k)$ is continuous,
absolutely irreducible when restricted to $F(\zeta_\ell)$, and $S$-good. One can check
that the functor representing $S$-good lifts of $\rhobar$ is representable.
```

:::theorem "potential_modularity_auxiliary_curve" (parent := "overview_strategy")
Given this modularity lifting theorem, the strategy to show potential
modularity of $`\rho` is to use Moret--Bailly to find an appropriate totally
real field $`F`, an auxiliary prime $`p`, and an auxiliary elliptic curve over
$`F` whose mod $`\ell` Galois representation is $`\rho` and whose mod `p`
Galois representation is induced from a character.
It uses {uses "moret_bailly_placeholder"}[] and {uses "modularity_lifting_theorem"}[].
:::

:::proof "potential_modularity_auxiliary_curve"
By converse theorems, the mod `p` Galois representation is associated to an
automorphic representation of $`\GL_2/F` and hence by Jacquet--Langlands it is
modular. We then use {uses "modularity_lifting_theorem"}[] to deduce the
modularity of the curve over $`F` and hence the modularity of the $`\ell`-torsion.
:::

# Compatible Families And Reduction At 3

:::theorem "compatible_family_step" (parent := "overview_strategy") (lean := "GaloisRepFamily.isCompatible")
We now use Khare--Wintenberger to lift $`\rho` to a potentially modular
$`\ell`-adic Galois representation of conductor `2`, and put it into an
$`\ell`-adic family using Brauer's theorem trick in BLGGT.
:::

:::proof "compatible_family_step"
This is the compatible-family step later echoed by
{uses "hardly_ramified_compatible_family"}[]. The TeX notes point in
particular to {Informal.citep khareWintenbergerII}[] and
{Informal.citep blggtPotentialAutomorphy}[].
:::

:::theorem "reduction_at_three_step" (parent := "overview_strategy") (lean := "FreyCurve.torsion_not_isIrreducible")
Finally we look at the `3`-adic specialization of this family. Reducing mod `3`
we get a representation which is flat at `3` and tame at `2`, so it must be
reducible. One can then deduce that the `3`-adic representation must be
reducible, which contradicts the irreducibility of $`\rho`.
:::

:::proof "reduction_at_three_step"
The reason for reducibility is that an irreducible representation would cut out
a number field whose discriminant violates the Odlyzko bounds. This is the
Fontaine/Odlyzko step later tracked abstractly through
{uses "odlyzko_root_discriminant_bound"}[].

We apologize for the sketchiness of what is here. At the time of writing it is
so far from what we are even able to state in Lean that there seems to be
little point right now in fleshing out the argument further. As this document
grows, we will add a far more detailed discussion of what is going on here.
Note in particular that stating {uses "modularity_lifting_theorem"}[] in Lean
is the first target.
:::
