import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude
import FLTBlueprint.Citations

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "An overview of the proof" =>

So far we have seen that, modulo Mazur's theorem (and various other things
which will still take some work to formalise but which are much easier),
Fermat's Last Theorem can be reduced to the statement that there is no prime
$`\ell \geq 5` and hardly-ramified irreducible `2`-dimensional Galois
representation $`\rho : \GQ \to \GL_2(\Z/\ell\Z)`.

```tex
So far we have seen that, modulo Mazur's theorem (and various other things which will still take some work to formalise but which are much easier), Fermat's Last Theorem can be reduced
to the statement that there is no prime $\ell\geq 5$ and hardly-ramified
irreducible 2-dimensional Galois representation $\rho:\GQ\to\GL_2(\Z/\ell\Z)$.
```

In this chapter we give an overview of our strategy for proving this, and
collect various results which we will need along the way. Note that we no
longer need to assume that $`\rho` comes from the $`\ell`-torsion in an
elliptic curve.

```tex
In this chapter we give an overview of our strategy for proving this, and collect
various results which we will need along the way. Note that we no longer need to assume that $\rho$ comes from the $\ell$-torsion in an elliptic curve.
```

# Potential modularity.

We will only speak about modularity for `2`-dimensional representations of the
absolute Galois group of a totally real field $`F` of even degree over $`\Q`.
What we will mean by "modular" is "associated to an automorphic representation
of the units of the totally definite quaternion algebra over $`F` ramified at
no finite places and at all infinite places". Such a quaternion algebra only
exists if $`F` has even degree, hence the restriction in our definition of
modularity. We can furthermore even demand that the infinity type of the form
is trivial (the analogue in this setting of classical weight `2` forms), as
these are the only forms we shall need for FLT.

```tex
We will only speak about modularity for 2-dimensional representations of the
absolute Galois group of a totally real field $F$ \emph{of even degree over} $\Q$.
What we will mean by ``modular'' is ``associated to an automorphic representation of the
units of the totally definite quaternion algebra over $F$ ramified at no finite places
and at all infinite places''. Such a quaternion algebra only exists if $F$ has even degree,
hence the restriction in our definition of modularity.
We can furthermore even demand that the infinity type of the form is trivial (the analogue
in this setting of classical weight 2 forms), as these are the only forms we shall need for FLT.
```

Assume we have a hardly-ramified representation $`\rho` as above. Let $`K` be
the number field corresponding to the kernel of $`\rho`. Our first claim is
that there is some totally real field $`F` of even degree, Galois over $`\Q`,
unramified at $`\ell`, and disjoint from $`K`, such that $`\rho|G_F` is
modular. The proof of this is very long, and uses a host of machinery. For
example:

```tex
Assume we have a hardly-ramified representation~$\rho$ as above. Let $K$
be the number field corresponding to the kernel of~$\rho$. Our first claim
is that there is some totally real field $F$ of even degree, Galois over $\Q$,
unramified at $\ell$, and disjoint from $K$, such that $\rho|G_F$ is modular.
The proof of this is very long, and uses a host of machinery. For example:
```

- Moret--Bailly's result {Informal.citep moretBailly1990}[] on points on curves
  with prescribed local behaviour;
- several nontrivial results in global class field theory;
- the Jacquet--Langlands correspondence;
- The assertion that irreducible `2`-dimensional mod `p` representations
  induced from a character are modular (this follows from converse theorems);
- A modularity lifting theorem.

```tex
\begin{itemize}
    \item Moret--Bailly's result~\cite{moret-bailly} on points on curves with prescribed
    local behaviour;
    \item several nontrivial results in global class field theory;
    \item the Jacquet--Langlands correspondence;
    \item The assertion that irreducible 2-dimensional mod $p$ representations induced from a character are modular (this follows from converse theorems);
    \item A modularity lifting theorem.
\end{itemize}
```

Almost everything here dates back to the `1980`s or before. The exception is
the modularity lifting theorem, which we now state explicitly.

```tex
Almost everything here dates back to the 1980s or before.
The exception is the modularity lifting theorem, which we now state explicitly.
```

# A modularity lifting theorem

Suppose $`\ell \geq 5` is a prime, that $`F` is a totally real field of even
degree in which $`\ell` is unramified, and that $`S` is a finite set of finite
places of $`F` not dividing $`\ell`. Write $`G_F` for the absolute Galois group
of $`F`.

```tex
Suppose $\ell\geq5$ is a prime, that $F$ is a totally real field of even degree in which $\ell$
is unramified, and that~$S$ is a finite set of finite places of~$F$ not dividing~$\ell$. Write
$G_F$ for the absolute Galois group of~$F$.
```

If $`v \in S` then let $`F_v` denote the completion of $`F` at $`v`, fix an
inclusion $`\overline{F} \to \overline{F_v}`, let $`\calO_v` denote the
integers of $`F_v` and $`k(v)` the residue field. Let $`I_v \subset G_F` denote
the inertia subgroup at $`v`. Local class field theory (or a more elementary
approach) gives a map $`I_v \to \calO_{F_v}^\times` and hence a map
$`I_v \to k(v)^\times`. Let $`J_v` denote the kernel of this map.

```tex
If $v\in S$ then let $F_v$ denote the completion of~$F$ at~$v$, fix an inclusion $\overline{F}\to\overline{F_v}$,
let $\calO_v$ denote the integers of $F_v$ and $k(v)$ the residue field. Let $I_v\subset G_F$ denote the inertia
subgroup at~$v$. Local class field theory (or a more elementary approach) gives a map $I_v\to\calO_{F_v}^\times$
and hence a map $I_v\to k(v)^\times$. Let $J_v$ denote the kernel of this map.
```

Let $`R` be a complete local Noetherian $`\Z_\ell`-algebra with finite residue
field of characteristic $`\ell`. We will be interested in representations
$`\rho : G_F \to \GL_2(R)` with the following four properties.

```tex
Let $R$ be a complete local Noetherian $\Z_\ell$-algebra with finite residue field of characteristic $\ell$.
We will be interested in representations $\rho:G_F\to\GL_2(R)$ with the following four properties.
```

- $`\det(\rho)` is the cyclotomic character;
- $`\rho` is unramified outside $`S \cup \{\ell\}`;
- If $`v \in S` then $`\rho(g)` has trace equal to `2` for all $`g \in J_v`;
- If $`v \mid \ell` is a place of $`F` then $`\rho` is flat at $`v`.

```tex
\begin{itemize}
    \item $\det(\rho)$ is the cyclotomic character;
    \item $\rho$ is unramified outside $S\cup\{\ell\}$;
    \item If $v\in S$ then $\rho(g)$ has trace equal to~2 for all $g\in J_v$;
    \item If $v\mid\ell$ is a place of $F$ then $\rho$ is flat at~$v$.
\end{itemize}
```

In the last bullet point, "flat" means "projective limit of representations
arising from finite flat group schemes". Let us use the lousy temporary
notation "S-good" to denote representations with these four properties.

```tex
In the last bullet point, ``flat'' means ``projective limit of representations arising from
finite flat group schemes''. Let us use the lousy temporary notation ``$S$-good'' to denote
representations with these four properties.
```

Say $`k` is a finite extension of $`\Z/\ell\Z` and
$`\rhobar : G_F \to \GL_2(k)` is continuous, absolutely irreducible when
restricted to $`F(\zeta_\ell)`, and S-good. One can check that the functor
representing S-good lifts of $`\rhobar` is representable.

```tex
Say $k$ is a finite extension of $\Z/\ell\Z$ and $\rhobar:G_F\to\GL_2(k)$ is continuous,
absolutely irreducible when restricted to $F(\zeta_\ell)$, and $S$-good. One can check
that the functor representing $S$-good lifts of $\rhobar$ is representable.
```

:::theorem "modularity_lifting_theorem" (parent := "overview_strategy")
{uses "Skinner_Wiles_CFT_trick"}[]
{uses "local_galois_coh_dim_two"}[]
{uses "local_galois_coh_top_degree"}[]
{uses "local_galois_coh_poincare"}[]
{uses "local_galois_coh_euler_poincare"}[]
{uses "IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv"}[]
{uses "automorphic_representation_local_decomposition"}[]
{uses "cuspidal_automorphic_representation"}[]
{uses "Galois_representation_from_automorphic_representation_on_GL_2_form"}[]
{uses "local_galois_coh_finite"}[]
If $`\rhobar` is modular of level $`\Gamma_1(S)` and
$`\rho : G_F \to \GL_2(\calO)` is an S-good lift of $`\rhobar` to $`\calO`, the
integers of a finite extension of $`\Q_\ell`, then $`\rho` is also modular of
level $`\Gamma_1(S)`.
:::

```tex
\begin{theorem}
    \label{modularity_lifting_theorem}
    \uses{Skinner_Wiles_CFT_trick,local_galois_coh_dim_two,local_galois_coh_top_degree,
      local_galois_coh_poincare,local_galois_coh_euler_poincare,IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv,
      automorphic_representation_local_decomposition,cuspidal_automorphic_representation,
      Galois_representation_from_automorphic_representation_on_GL_2_form, moret-bailly,
      local_galois_coh_finite}
      \notready
        If $\rhobar$ is modular of level $\Gamma_1(S)$ and $\rho:G_F\to\GL_2(\calO)$ is
        an $S$-good lift of $\rhobar$ to $\calO$, the integers of a finite extension of $\Q_\ell$,
        then $\rho$ is also modular of level $\Gamma_1(S)$.
\end{theorem}
```

Right now we are very far from even stating this theorem in Lean.

```tex
Right now we are very far from even stating this theorem in Lean.
```

I am not entirely sure where to find a proof of this in the literature,
although it has certainly been known to the experts for some time. Theorem `3.3`
of {Informal.citep taylorMeroCont}[] comes close, although it assumes that
$`\ell` is totally split in $`F` rather than just unramified. Another
near-reference is Theorem `5.2` of {Informal.citep tobyModularity}[], although
this assumes the slightly stronger assumption that the image of $`\rho`
contains $`\SL_2(\Z/p\Z)` (however it is well-known to the experts that this
can be weakened to give the result we need). One reference for the proof is
Richard Taylor's `2018` Stanford course.

```tex
I am not entirely sure where to find a proof of this in the literature, although it has
certainly been known to the experts for some time. Theorem `3.3` of {Informal.citep
taylorMeroCont}[] comes close, although it assumes that $`\ell` is totally split in
$`F` rather than just unramified. Another near-reference is Theorem `5.2` of
{Informal.citep tobyModularity}[], although this assumes the slightly stronger assumption
that the image of $`\rho` contains $`\SL_2(\Z/p\Z)` (however it is well-known to the
experts that this can be weakened to give the result we need). One reference for the proof
is Richard Taylor's `2018` Stanford course.
```

:::proof "modularity_lifting_theorem"
Sketch.

The proof is a two-stage procedure and has a nontrivial analytic input. First
one uses the Skinner--Wiles trick to reduce to the "minimal case", and this
needs cyclic base change for $`\GL(2)` and also a characterisation of the image
of the base change construction; this seems to need a multiplicity one result,
which (because of our definition of "modular") will need Jacquet--Langlands as
well.

In the minimal case, the argument is the usual Taylor--Wiles trick, using
refinements due to Kisin and others.
:::

```tex
\begin{proof} (Sketch)

The proof is a two-stage procedure and has a nontrivial analytic input. First one uses
the Skinner--Wiles trick to reduce to the ``minimal case'', and this needs cyclic base
change for $\GL(2)$ and also a characterisation of the image of the base change
construction; this seems to need a multiplicity one result, which (because of our
definition of ``modular'') will need Jacquet--Langlands as well.

In the minimal case, the argument is the usual Taylor--Wiles trick, using refinements due
to Kisin and others.
\end{proof}
```

Given this modularity lifting theorem, the strategy to show potential
modularity of $`\rho` is to use Moret--Bailly to find an appropriate totally
real field $`F`, an auxiliary prime $`p`, and an auxiliary elliptic curve over
$`F` whose mod $`\ell` Galois representation is $`\rho` and whose mod `p`
Galois representation is induced from a character. By converse theorems (for
example) the mod `p` Galois representation is associated to an automorphic
representation of $`\GL_2/F` and hence by Jacquet--Langlands it is modular. Now
we use the modularity lifting theorem to deduce the modularity of the curve
over $`F` and hence the modularity of the $`\ell`-torsion.

```tex
Given this modularity lifting theorem, the strategy to show potential modularity of $\rho$
is to use Moret--Bailly to find an appropriate totally real field $F$, an auxiliary prime
$p$, and an auxiliary elliptic curve over $F$ whose mod $\ell$ Galois representation is $\rho$
and whose mod $p$ Galois representation is induced from a character. By converse theorems
(for example) the mod $p$ Galois representation is associated to an automorphic representation
of $\GL_2/F$ and hence by Jacquet--Langlands it is modular. Now we use the modularity lifting
theorem to deduce the modularity of the curve over $F$ and hence the modularity of the
$\ell$-torsion.
```

# Compatible families, and reduction at 3

We now use Khare--Wintenberger to lift $`\rho` to a potentially modular
$`\ell`-adic Galois representation of conductor `2`, and put it into an
$`\ell`-adic family using the Brauer's theorem trick in
{Informal.citep blggtPotentialAutomorphy}[]. Finally we look at the `3`-adic
specialisation of this family. Reducing mod `3` we get a representation which
is flat at `3` and tame at `2`, so must be reducible because of the techniques
introduced in Fontaine's paper on abelian varieties over $`\Z` (an irreducible
representation would cut out a number field whose discriminant violates the
Odlyzko bounds). One can now go on to deduce that the `3`-adic representation
must be reducible, which contradicts the irreducibility of $`\rho`.

```tex
We now use Khare--Wintenberger to lift $\rho$ to a potentially modular $\ell$-adic
Galois representation of conductor 2, and put it into an $\ell$-adic family using
the Brauer's theorem trick in {Informal.citep blggtPotentialAutomorphy}[]. Finally we
look at the `3`-adic specialisation of this family. Reducing mod `3` we get a representation
which is flat at `3` and tame at `2`, so must be reducible because of the techniques
introduced in Fontaine's paper on abelian varieties over $\Z$ (an irreducible representation
would cut out a number field whose discriminant violates the Odlyzko bounds). One can now
go on to deduce that the `3`-adic representation must be reducible, which contradicts the
irreducibility of $\rho$.
```

We apologise for the sketchiness of what is here, however at the time of
writing it is so far from what we are even able to state in Lean that there
seems to be little point right now in fleshing out the argument further. As
this document grows, we will add a far more detailed discussion of what is
going on here. Note in particular that stating the modularity lifting theorem
in Lean is the first target.

```tex
We apologise for the sketchiness of what is here, however at the time of
writing it is so far from what we are even able to state in Lean that there
seems to be little point right now in fleshing out the argument further. As
this document grows, we will add a far more detailed discussion of what is
going on here. Note in particular that stating the modularity lifting theorem
in Lean is the first target.
```
