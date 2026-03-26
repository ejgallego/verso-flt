import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.Citations
import FLT.Deformations.RepresentationTheory.GaloisRepFamily
import FLT.GlobalLanglandsConjectures.GLnDefs

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Appendix: A Collection Of Results Needed In The Proof" =>

:::group "bestiary_appendix"
The old TeX appendix is a holding area for major background results that were
known before 1990 and will eventually migrate into more focused chapters.
:::

This appendix is intentionally heterogeneous. Some items are straightforward to
state but hard to prove. Others are not even easy to state cleanly in Lean yet
because the necessary surrounding definitions are still missing. The role of the
appendix is to make that frontier explicit.

The TeX chapter is explicit that this appendix is temporary and unorganized. It
is meant as a task map for the community rather than a polished mathematical
text, and it repeatedly warns that several of the listed “definitions” are not
yet formalized well enough even to begin theorem statements seriously.

:::definition "appendix_role_definition" (parent := "bestiary_appendix")
The appendix is project-management infrastructure: it is where the blueprint
records the missing background stack before that material has been migrated into
dedicated chapters or promoted to explicit assumptions.
:::

```tex "bestiary/chapter_opening"
\chapter{Appendix: A collection of results which are needed in the proof.}\label{ch_bestiary}

In this (temporary, unorganised) appendix we list a whole host of definitions and theorems which were known to humanity by the end of the 1980s and which we shall need. These definitions and theorems will find their way into more relevant sections of the blueprint once I have written more details. Note that some of these things are straightforward; others are probably multi-year research projects. The purpose of this chapter right now is simply to give the community (and possibly AIs) some kind of idea of the task we face. Note also that many of the \emph{definitions} here are yet to be formalised in Lean, and this needs to be done before we can start talking about formalising theorems.

\section{Results from class field theory}

We start with the local case. In fact we restrict to the $p$-adic case, but only for simplicity of exposition because it's all we'll need (and, to be frank, because I'm not 100 percent of what is true in the function field case).
```

# Class field theory

The TeX appendix begins with the local case and, for simplicity, speaks only
about finite extensions of `ℚ_p`. The point is not that the global theory is
absent, but that local class field theory and local Galois cohomology already
contain most of the background phenomena the FLT project eventually needs.

Let `K` be such a finite extension of `ℚ_p`. The TeX appendix begins by fixing
notation for the profinite completion `\widehat{ℤ}` because arithmetic and
geometric Frobenius are stated there in terms of explicit maps to
`\widehat{ℤ}`. Concretely, `\widehat{ℤ} \cong \prod_p \mathbf Z_p`.

:::theorem "maximal_unramified_extension_placeholder" (parent := "bestiary_appendix")
For a finite extension `K / ℚ_p`, the maximal unramified extension `K^un` in a
chosen algebraic closure should be Galois over `K` with Galois group
canonically identifiable with `\widehat{ℤ}` in two ways. One of these
identifications sends `1` to arithmetic Frobenius, namely the endomorphism
inducing `x \mapsto x^q` on the residue field of `K^un`, where `q` is the size
of the residue field of `K`. The other sends `1` to geometric Frobenius, which
is the inverse of arithmetic Frobenius.
:::

:::proof "maximal_unramified_extension_placeholder"
The TeX appendix is explicit about the normalization issue here: there are two
equally natural identifications, one sending `1` to arithmetic Frobenius and
the other to geometric Frobenius. The point of recording both is not pedantry;
later local-global statements genuinely depend on the chosen normalization.
:::

```tex "bestiary/class_field_theory/maximal_unramified_extension"
\begin{theorem}\label{maximal_unramified_extension_of_p-adic_field}\notready The maximal unramified extension $K^{un}$ in a given algebraic closure of $K$
    is Galois over $K$ with Galois group ``canonically'' isomorphic to $\widehat{\Z}$ in two ways; one of these two isomorphisms identifies $1\in\widehat{\Z}$ with an arithmetic Frobenius (the endomorphism inducing $x\mapsto x^q$ on the residue field of $K^{un}$, where $q$ is the size of the residue field of $K$). The other identifies 1 with geometric Frobenius (defined to be the inverse of arithmetic Frobenius).
\end{theorem}

It is impossible to say which of the two canonical isomorphisms is ``the most canonical''; people working in different areas make different choices in order to locally minimise the number of minus signs in their results.
```

:::definition "local_weil_group_placeholder" (parent := "bestiary_appendix")
The appendix records the local Weil group and local class field theory among
the core background items still waiting for polished Lean-facing statements.
The Weil group is the pullback of the surjection `G_K \twoheadrightarrow
\widehat{ℤ}` from {uses "maximal_unramified_extension_placeholder"}[] along
the continuous map `ℤ \to \widehat{ℤ}`. Equivalently, it is the topological
group with inertia as an open normal subgroup and quotient isomorphic to the
integers.
:::

:::theorem "local_class_field_theory_placeholder" (parent := "bestiary_appendix")
Local class field theory is one of the major background theorems still waiting
to be integrated into the main project narrative from this appendix. In the
TeX source it is stated for finite extensions of `ℚ_p` as the reciprocity
theorem giving two canonical isomorphisms of topological abelian groups
between `K^\times` and the abelianization of the Weil group attached to
{uses "local_weil_group_placeholder"}[].
:::

:::proof "local_class_field_theory_placeholder"
In the TeX appendix this is stated for finite extensions of `ℚ_p`, not because
the function-field case is irrelevant in principle, but because the FLT project
only needs the p-adic case and even that already carries most of the relevant
phenomena.
:::

```tex "bestiary/class_field_theory/local_class_field_theory"
As a result, the absolute Galois group of $K$ surjects onto $\widehat{\Z}$; its kernel is said to be the \emph{inertia subgroup} of this Galois group. Now pull back this surjection along the continuous map from $\Z$ (with its discrete topology) to $\widehat{\Z}$, in the category of topological groups. We end up with a group containing the inertia group as an open normal subgroup, and with quotient isomorphic to the integers.

\begin{definition}\label{local_Weil_group}\uses{maximal_unramified_extension_of_p-adic_field}\notready The topological group described above is called the \emph{Weil group} of $K$.
\end{definition}

The following theorem is nontrivial.

\begin{theorem}\label{local_class_field_theory}\uses{local_Weil_group}\notready If $K$ is a finite extension of $\Q_p$ then there are two ``canonical'' isomorphisms of topological abelian groups, between $K^\times$ and the abelianisation of the Weil group of $K$.
\end{theorem}
\begin{proof} This is the main theorem of local class field theory; see for example the relevant articles in~\cite{cf} or many other places.
\end{proof}

Note that Mar\'ia In\'es de Frutos Fern\'andez and Filippo Nuccio are working on a formalisation of the proof of this using Lubin--Tate formal groups.
```

:::theorem "local_galois_cohomology_package" (parent := "bestiary_appendix")
The local cohomology package includes finiteness, cohomological dimension two,
top-degree identifications, Poincaré duality, and Euler-Poincaré formulas.
These are exactly the kinds of local-cohomological inputs that surface in the
local conditions leading up to {uses "modularity_lifting_theorem"}[]; the old
appendix cites Serre's *Galois Cohomology* text
{Informal.citep serreGalCoh}[] throughout this package.
:::

```tex "bestiary/class_field_theory/local_galois_cohomology"
Now let $M$ be an abelian group (with the discrete topology) equipped with a continuous
action of $G_K$, the Galois group $\GK$ where we fix an algebraic closure $\Kbar$ of $K$. Note that
if one doesn't want to choose an algebraic closure of $K$ one can instead think of $M$ as being an
etale sheaf of abelian groups on $\Spec(K)$.

Continuous group cohomology $H^i(G_K,M)$ in this setting can be defined using continuous cocycles and continuous coboundaries, or just as a colimit of usual group cohomology over the finite quotients of this absolute Galois group (or as etale cohomology, if you prefer). Here are some of the facts we will need about cohomology in this situation. A nice summary is that cohomology of a local Galois group behaves like the cohomology of a compact connected 2-manifold. All the theorems below will need extensive planning.

\begin{theorem}
    \label{local_galois_coh_finite}
    \notready
    If $M$ is finite then the cohomology groups $H^i(G_K,M)$ are all finite.
\end{theorem}
\begin{proof}
    This is Proposition~14 in section~5.2 of~\cite{serre-galcoh}.
\end{proof}

\begin{theorem} ["the dimension is 2"]\label{local_galois_coh_dim_two}\notready
  If $M$ is torsion then $H^i(G_K,M)=0$ for $i>2$.
\end{theorem}
\begin{proof} This follows from Proposition~15 in~section 5.3 of~\cite{serre-galcoh}.
\end{proof}

\begin{theorem} ["top degree"]
    \label{local_galois_coh_top_degree}
    \notready
    $H^2(G_K,\mu_n)$ is ``canonically'' isomorphic to $\Z/n\Z$.
\end{theorem}
\begin{proof} This is also included in Lemma 2 of section 5.2 of \cite{serre-galcoh} (Serre just writes that the groups are equal; he clearly is not a Lean user. I can see no explanation in his book of this use of the equality symbol. When the statement of this ``theorem'' is formalised in Lean it may well actually be a definition, giving the map).
\end{proof}

\begin{theorem}\notready There is a ``canonical'' isomorphism $H^2(K,\mu_\infty)=\Q/\Z$.
\end{theorem}
\begin{proof}\notready
This is in Theorem II.5.2 in~\cite{serre-galcoh}.
\end{proof}

\begin{theorem} ["Poincar\'e duality"]\label{local_galois_coh_poincare}\notready
    If $\mu=\bigcup_{n\geq1}\mu_n$ and $M':=\Hom(M,\mu)$ is the dual of $M$ then for
    $0\leq i\leq 2$ the cup product pairing $H^i(G_K,M)\times H^{2-i}(G_K,M')\to H^2(G_K,\mu)=\Q/\Z$ is perfect.
\end{theorem}
\begin{proof}\notready This is Theorem 2 in section 5.2 in \cite{serre-galcoh}. Note again
    the dubious (as far as Lean is concerned) use of the equality symbol.
\end{proof}

\begin{theorem} ["Euler-Poincar\'e characteristic"]\label{local_galois_coh_euler_poincare}\notready
    If $h^i(M)$ denotes the order of $H^i(G_K,M)$ then $h^0(M)-h^1(M)+h^2(M)=0$.
\end{theorem}
```

:::theorem "local_galois_cohomology_finiteness" (parent := "bestiary_appendix")
For finite coefficients `M`, the local Galois cohomology groups `H^i(G_K,M)`
are finite for all `i`.
:::

:::theorem "local_galois_cohomology_dimension_two" (parent := "bestiary_appendix")
For torsion coefficients, local Galois cohomology vanishes above degree `2`,
so `H^i(G_K,M)=0` for `i>2`.
:::

:::theorem "local_galois_cohomology_top_degree" (parent := "bestiary_appendix")
The top-degree group `H^2(G_K, \mu_n)` should be canonically identifiable with
`\mathbf{Z}/n\mathbf{Z}`.
:::

:::theorem "local_galois_cohomology_poincare_duality" (parent := "bestiary_appendix")
If `\mu = \bigcup_{n\geq 1}\mu_n` and `M' := \Hom(M,\mu)`, then for
`0 \leq i \leq 2` the cup product pairing
`H^i(G_K,M) \times H^{2-i}(G_K,M') \to H^2(G_K,\mu)=\Q/\Z`
should be perfect.
:::

:::theorem "local_galois_cohomology_euler_characteristic" (parent := "bestiary_appendix")
If `h^i(M)` denotes the order of `H^i(G_K,M)`, then the Euler-Poincare
characteristic formula should read `h^0(M)-h^1(M)+h^2(M)=0`.
:::

The appendix then explicitly summarizes the package by analogy: cohomology of a
local Galois group behaves like the cohomology of a compact connected
2-manifold.

The TeX notes also remark, more than once, that the word “canonical” is doing a
lot of work in these statements. In a Lean-facing treatment many of the claimed
equalities will have to become explicitly constructed maps or chosen
identifications rather than informal appeals to canonicality.

We now move onto the global case. If `N` is a number field, that is, a finite
extension of `\Q`, then its finite adeles are obtained by tensoring `N` with
`\widehat{\Z}`, its archimedean factor is obtained by tensoring `N` with `\R`,
and the full ring of adeles is the product of those two pieces.

:::theorem "global_class_field_theory_placeholder" (parent := "bestiary_appendix")
If `N` is a finite extension of `\Q`, then there are two "canonical"
isomorphisms of topological groups between the profinite abelian groups
`π_0(\A_N^\times/N^\times)` and `\GN^{\ab}`. One sends local uniformisers to
arithmetic Frobenii and the other to geometric Frobenii, and each global
isomorphism is compatible with the local isomorphisms above.
This is the global continuation of {uses "local_class_field_theory_placeholder"}[].
:::

:::proof "global_class_field_theory_placeholder"
This is the global backdrop for the local reciprocity package above and the
Skinner--Wiles class-field-theory trick below. The appendix uses it to explain
why the relevant solvable extensions can be constructed with prescribed local
behavior.
:::

:::theorem "skinner_wiles_cft_trick_placeholder" (parent := "bestiary_appendix")
Let `S` be a finite set of places of a number field `K`. For each `v \in S`
let `L_v/K_v` be a finite Galois extension. Then there is a finite solvable
Galois extension `L/K` such that if `w` is a place of `L` dividing `v \in S`,
then `L_w/K_v` is isomorphic to `L_v/K_v` as a `K_v`-algebra. Moreover, if
`K^{\avoid}/K` is any finite extension then we can choose `L` to be linearly
disjoint from `K^{\avoid}`.
This is recorded as a consequence of {uses "global_class_field_theory_placeholder"}[].
:::

:::proof "skinner_wiles_cft_trick_placeholder"
This is the background theorem later referenced in the modularity lifting story
as the class-field-theory part of the Skinner--Wiles trick.
:::

:::theorem "poitou_tate_duality_placeholder" (parent := "bestiary_appendix")
The project will also eventually need Poitou--Tate duality, but the appendix
records it only at the level of dependencies because even the surrounding
Galois-cohomology language is still being assembled. It depends on the local
Galois-cohomology package summarized by {uses "local_galois_cohomology_package"}[].
:::

# Structures on the points of an affine variety

The TeX appendix now switches from class field theory to a different kind of
background problem: how to put topological and manifold structures on points of
algebraic varieties.

:::definition "topology_on_affine_variety_points_placeholder" (parent := "bestiary_appendix")
If `X = Spec(A)` is affine of finite type over a field `K` and `R` is a
topological `K`-algebra, then the `R`-points of `X` should inherit the subspace
topology coming from the product topology on maps `A → R`.
:::

:::theorem "affine_variety_point_topology_computation" (parent := "bestiary_appendix")
When an affine variety is embedded as a closed subscheme of affine space, the
point-set topology described above should agree with the induced subspace
topology from the ambient finite-dimensional `R`-space.
This is the first check on {uses "topology_on_affine_variety_points_placeholder"}[].
:::

:::proof "affine_variety_point_topology_computation"
The appendix treats this as the key sanity check on the abstract definition of
the topology on `X(R)`: once an affine scheme is concretely embedded in affine
space, the formal topology should recover the one a working mathematician would
write down by hand.
:::

:::definition "manifold_on_affine_variety_points_placeholder" (parent := "bestiary_appendix")
For smooth affine varieties over `ℝ`, `ℂ`, or finite extensions of `ℚ_p`, the
point set should carry a natural manifold structure. This is meant to build on
the topology supplied by {uses "topology_on_affine_variety_points_placeholder"}[].
:::

:::theorem "lie_group_from_algebraic_group_placeholder" (parent := "bestiary_appendix")
For affine algebraic groups over `ℝ` or `ℂ`, the real or complex points should
form Lie groups. This is the concrete corollary of
{uses "manifold_on_affine_variety_points_placeholder"}[].
:::

:::proof "lie_group_from_algebraic_group_placeholder"
The TeX appendix treats this as the concrete corollary of the manifold
construction on algebraic-variety points.
:::

:::proof "manifold_on_affine_variety_points_placeholder"
The appendix presents this as the conjectural bridge from algebraic geometry to
the analytic spaces on which automorphic forms live.
:::

The TeX appendix adds that the smooth case is the only one relevant in
applications, and even then the right generality for the manifold statement is
not yet settled.

# Algebraic groups and automorphic forms

Here the appendix becomes very candid: even stating the definitions correctly in
Lean is expected to be a substantial project, and some of the draft
generalizations may still contain imprecision.

The TeX source is also frank that, for the actual FLT project, one only needs
these definitions in much narrower settings: abelian algebraic groups and inner
forms of `GL₂` over totally real fields. The appendix works in greater
generality only to keep the long-term target visible.

:::definition "connected_reductive_group_placeholder" (parent := "bestiary_appendix")
An affine algebraic group `G` of finite type over a field `k` is said to be
`connected` if it is connected as a scheme, and `reductive` if `G_{\overline{k}}`
has no nontrivial smooth connected unipotent normal `k`-subgroup.
:::

:::proof "connected_reductive_group_placeholder"
The point of the appendix is triage rather than completion: it marks the
high-level objects that the project will eventually need to state precisely.
They are later specialized in the modularity-lifting chapter and in
{uses "automorphic_form_for_gln"}[].
:::

:::definition "automorphic_form_placeholder" (parent := "bestiary_appendix")
An automorphic form is a function `\phi : G(\A_N) \to \bbC` satisfying the
following conditions:

- `\phi` is locally constant on `G(\A_N^f)` and `C^\infty` on `G(N_\infty)`;
  equivalently, for every `g_\infty`, `\phi(-, g_\infty)` is locally constant,
  and for every `g_f`, `\phi(g_f, -)` is smooth.
- `\phi` is left-invariant under `G(N)`.
- `\phi` is right-`U_\infty`-finite, meaning the space spanned by the
  translates `x \mapsto \phi(xu)` as `u` varies over `U_\infty` is finite-dimensional.
- `\phi` is right-`K_f`-finite, where `K_f` is one, or equivalently any,
  compact open subgroup of `G(\A_N^f)`.
- `\phi` is `\mathcal z`-finite, where `\mathcal z` is the center of the
  universal enveloping algebra of the Lie algebra of `G(N_\infty)`.
- For every `g_f`, the function `g_\infty \mapsto \phi(g_f g_\infty)` is
  slowly increasing.

The chapter is treating this as the package assembled from
{uses "connected_reductive_group_placeholder"}[],
{uses "lie_group_from_algebraic_group_placeholder"}[],
{uses "slowly_increasing_well_defined_placeholder"}[], and
{uses "affine_variety_point_topology_computation"}[].
:::

:::definition "slowly_increasing_placeholder" (parent := "bestiary_appendix")
The appendix also isolates the slowly-increasing growth condition used in the
general definition of an automorphic form. A function `f : G(N_\infty) \to \bbC`
is slowly increasing if there exists a norm `||-||_\rho` coming from a fixed
finite-dimensional representation `\rho` with finite kernel and a
`U_\infty`-invariant Hermitian form, together with constants `C > 0` and
`n \geq 1`, such that `|f(x)| \leq C ||x||_\rho^n` for all `x`.
This is the same growth condition formalized in the `GL_n/ℚ` development as
{uses "AutomorphicForm.GLn.IsSlowlyIncreasing"}[].
:::

:::theorem "slowly_increasing_well_defined_placeholder" (parent := "bestiary_appendix")
The slowly-increasing condition should be independent of the auxiliary choice
of finite-dimensional representation used to define the norm at infinity.
Equivalently, if `\rho` and `\rho'` are two such choices, then the resulting
norms are comparable up to a power. This depends on
{uses "slowly_increasing_placeholder"}[].
:::

:::definition "cuspidal_automorphic_representation_placeholder" (parent := "bestiary_appendix")
The eventual automorphic-representation theory is meant to include cusp forms,
their decomposition into irreducible pieces, and the local tensor-product
decomposition of admissible representations. This sits on top of
{uses "automorphic_form_actions_placeholder"}[] and
{uses "automorphic_representation_local_decomposition_placeholder"}[].
:::

:::definition "automorphic_form_actions_placeholder" (parent := "bestiary_appendix")
The spaces of automorphic forms and cusp forms should carry the natural
`(G(\A_N^f)\times U_\infty,\mathfrak g)`-module structures coming from right
translation and differential operators. The Lie algebra `\mathfrak g` of
`G(N_\infty)` acts by differential operators, and the differential of the
`U_\infty`-action agrees with the action of its Lie algebra viewed inside
`\mathfrak g`. This depends on
{uses "automorphic_form_placeholder"}[].
:::

:::theorem "automorphic_representation_local_decomposition_placeholder" (parent := "bestiary_appendix")
An admissible automorphic representation should decompose as a restricted tensor
product of local representations, unramified at almost all finite places. This
is the representation-theoretic consequence of
{uses "automorphic_form_actions_placeholder"}[].
:::

:::proof "automorphic_representation_local_decomposition_placeholder"
This is the global representation-theoretic package behind later chapters such
as {uses "automorphic_form_for_gln"}[]. The TeX appendix cites Flath's theorem
for this decomposition and uses it to explain why restricted products appear so
inevitably in automorphic representation theory.
:::

# Galois representations

At this point the TeX appendix records that the compatible-family definition was
already formalized modulo Frobenius elements. The surrounding Galois-side
theorem remains a much more distant target.

The appendix specifically credits Ivan Farabella for the compatible-family
definition and Jou Glasheen for the Frobenius existence input that makes such a
definition usable.

:::definition "compatible_family_placeholder" (parent := "bestiary_appendix") (lean := "GaloisRepFamily.isCompatible")
The appendix records the notion of a compatible family of Galois
representations: a common coefficient field, a finite bad set, a monic degree
`d` polynomial `F_\mathfrak p(X) \in E[X]` for each finite place
`{\mathfrak p} \notin S`, and for each prime `\ell` and embedding
`E \to \Qlbar` a continuous representation
`G_K \to \GL_d(\Qlbar)` unramified outside `S` and the primes above `\ell`,
with Frobenius characteristic polynomials matching the prescribed
`F_\mathfrak p(X)` away from `\ell`. In Lean this is tracked by
{uses "GaloisRepFamily.isCompatible"}[] and the surrounding family structure
`GaloisRepFamily`.
:::

:::theorem "automorphic_to_galois_representation_placeholder" (parent := "bestiary_appendix")
One of the major missing theorem statements is the construction of compatible
Galois representations from automorphic representations of an inner form of
`GL_2` over a totally real field, with reflex field `E`. The TeX source states
this for automorphic representations that are weight `2` discrete series at
every infinite place, with the bad set `S` given by the ramified places and
the Frobenius polynomial at `\mathfrak p` given by the monic polynomial with
roots the two Satake parameters. This depends on
{uses "compatible_family_placeholder"}[],
{uses "automorphic_representation_local_decomposition_placeholder"}[], and
{uses "shimura_varieties_placeholder"}[].
:::

:::proof "automorphic_to_galois_representation_placeholder"
The appendix is very clear that this is far beyond the current Lean frontier.
But it is also one of the decisive theorems for the FLT strategy, because it is
the place where automorphic information is converted back into compatible
families of Galois representations.
:::

# Algebraic geometry

The appendix becomes sharply concrete again here. It points out that the proof
of Mazur's torsion theorem starts with algebraic-geometry language that Lean was
still far from handling, and uses that as a benchmark for how much surrounding
infrastructure is still missing.

The TeX chapter is especially pointed here: at the time of writing, Lean's
algebraic geometry could not even get through the first sentence of Mazur's
paper, and it recommends that sentence itself as a natural first milestone for
anyone who wants to formalize Mazur's theorem seriously.

:::definition "shimura_varieties_placeholder" (parent := "bestiary_appendix")
The project still needs precise Lean definitions of the compact Shimura curves
and surfaces attached to suitable inner forms of GL2.
:::

:::proof "shimura_varieties_placeholder"
The appendix emphasizes that even stating the right Shimura-theoretic objects is
nontrivial. They are not decorative geometry; they are the source of the Galois
representations that later chapters want to attach to automorphic forms.
:::

:::theorem "moret_bailly_placeholder" (parent := "bestiary_appendix")
Moret--Bailly's theorem on points with prescribed local behavior is one of the
major geometric inputs still tracked from the appendix.
:::

:::proof "moret_bailly_placeholder"
The TeX appendix presents this theorem as a key input to potential modularity;
see {Informal.citep moretBailly1990}[].
:::

The theorem is recorded there with all of the local prescribed-behavior and
linearly-disjointness data visible, precisely because that is the form needed
later in potential modularity arguments.

# Algebra

The appendix closes with one deliberately elementary-looking but strategically
useful classification theorem: finite subgroups of `PGL₂`.

:::theorem "finite_subgroups_of_pgl2_placeholder" (parent := "bestiary_appendix")
The appendix records the classification of finite subgroups of
`PGL₂(\overline{𝔽}_p)` as a background algebraic input still to be stated
cleanly.
:::

:::proof "finite_subgroups_of_pgl2_placeholder"
The appendix gives the usual list: cyclic, dihedral, `A₄`, `S₄`, `A₅`, and the
finite groups of Lie type `PSL₂(k)` and `PGL₂(k)`. The point of keeping this in
the appendix is not because the classification is obscure, but because the
surrounding representation-theoretic infrastructure is still being assembled.

The TeX appendix closes with the aside that this one should at least be easy to
state, even if the surrounding project is not.
:::
