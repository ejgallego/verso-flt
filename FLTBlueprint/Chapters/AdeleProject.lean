import Verso
import VersoManual
import VersoBlueprint
import FLT.NumberField.AdeleRing
import FLT.NumberField.Completion.Finite
import FLT.DedekindDomain.Completion.BaseChange
import FLT.DedekindDomain.FiniteAdeleRing.BaseChange

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Adeles" =>

:::group "adele_project"
The adele miniproject develops the finite adeles, infinite adeles, and full
adeles of a number field together with the local compactness and base-change
results needed later in the project.
:::


# Status

:::definition "adele_project_status" (parent := "adele_project")
This is an active miniproject.
:::

```tex "adele_project/status"
\section{Status}

This is an active miniproject.
```


The chapter is also explicit that finite adeles and full adeles sit at slightly
different levels of generality. The finite adele construction works naturally
for Dedekind domains, while the full adele ring uses archimedean places and so
is genuinely number-field-specific.
```tex "adele_project/lt-witness-47"
The chapter is also explicit that finite adeles and full adeles sit at slightly
```


# Goals

:::definition "adele_ring_goals" (parent := "adele_project")
The TeX blueprint lists four main targets: define the adeles, prove local
compactness, prove base change along finite field extensions, and prove that
the number field sits discretely with compact quotient. The chapter also lists a
fifth meta-goal: get the finished adele infrastructure into mathlib once the
core statements are formalized cleanly.
:::
```tex "adele_project/lt-witness-54"
:::definition "adele_ring_goals" (parent := "adele_project")
```


```tex "adele_project/goals"
\section{The goal}

There are several goals to this miniproject.

\begin{enumerate}
  \item Define the adeles $\A_K$ of a number field~$K$ and
    give them the structure of a $K$-algebra;
  \item Prove that $\A_K$ is a locally compact topological ring;
  \item Base change: show that if $L/K$ is a finite extension of number fields then the
    natural map $L\otimes_K\A_K\to\A_L$ is an isomorphism, both algebraic and
    topological;
  \item Prove that $K \subseteq \A_K$ is a discrete subgroup and the quotient
    is compact;
  \item Get this stuff into mathlib.
\end{enumerate}
```

The chapter also stresses a useful distinction. Finite adeles are algebraic
objects and can be defined for general Dedekind domains. Full adeles are more
arithmetic: they add the archimedean factor and use special properties of number
fields.
```tex "adele_project/lt-witness-83"
The chapter also stresses a useful distinction. Finite adeles are algebraic
```


The TeX chapter begins the miniproject by spelling out “cheap” definitions
before switching back to the literature and mathlib definitions. That contrast
is important because it explains both what one morally wants the adeles to be
and why the harness still follows the restricted-product implementation.
```tex "adele_project/lt-witness-88"
The TeX chapter begins the miniproject by spelling out “cheap” definitions
```


:::definition "finite_adeles_for_dedekind_domains" (parent := "adele_project")
The finite-adele construction extends beyond number fields to general Dedekind
domains by taking the restricted product of local fraction fields with respect
to their local integer rings.
:::
```tex "adele_project/lt-witness-93"
:::definition "finite_adeles_for_dedekind_domains" (parent := "adele_project")
```


:::proof "finite_adeles_for_dedekind_domains"
The TeX chapter stresses this point because it affects API design. Many of the
local and finite-adelic constructions should be developed at Dedekind-domain
generality, even though the final FLT application only needs number fields.

That is why the current chapter oscillates between number-field language and the
more general “Dedekind domain with field of fractions” setup.
:::
```tex "adele_project/lt-witness-99"
:::proof "finite_adeles_for_dedekind_domains"
```


:::definition "cheap_finite_adele_definition" (parent := "adele_project")
A cheap definition of the finite adeles of a number field `K` is
$`K \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}`$, equipped with the
`$\widehat{\mathbf{Z}}`-module topology.
:::
```tex "adele_project/lt-witness-108"
:::definition "cheap_finite_adele_definition" (parent := "adele_project")
```


:::definition "cheap_infinite_adele_definition" (parent := "adele_project")
A cheap definition of the infinite adeles is `K ⊗_ℚ ℝ`, equipped with its
finite-dimensional real vector-space topology.
:::
```tex "adele_project/lt-witness-114"
:::definition "cheap_infinite_adele_definition" (parent := "adele_project")
```


:::definition "cheap_full_adele_definition" (parent := "adele_project")
The cheap full adele ring is the product of the finite and infinite adeles,
with the product topology.
:::
```tex "adele_project/lt-witness-119"
:::definition "cheap_full_adele_definition" (parent := "adele_project")
```


:::definition "restricted_product_adele_definition" (parent := "adele_project")
The literature and mathlib instead define finite adeles as the restricted
product of the local completions `K_v` with respect to their compact open
integer subrings.
:::
```tex "adele_project/lt-witness-124"
:::definition "restricted_product_adele_definition" (parent := "adele_project")
```


:::proof "restricted_product_adele_definition"
This is the definition the chapter chooses to follow, precisely because it is
already the mathlib-facing one and generalizes well to the Dedekind-domain API.

The TeX chapter also stresses that mathlib's full adele ring is the product of
the finite adeles with the archimedean completions, so one should think of the
cheap tensor-product definitions and the restricted-product definitions as
different presentations of the same intended object rather than as competing
mathematics.
:::
```tex "adele_project/lt-witness-130"
:::proof "restricted_product_adele_definition"
```


# Local compactness

:::theorem "adele_local_compactness" (parent := "adele_project") (lean := "NumberField.AdeleRing.locallyCompactSpace")
The adeles of a number field should form a locally compact topological ring.
This local compactness is one of the inputs needed by {uses "local_integer_ring_compact_open"}[].
:::
```tex "adele_project/lt-witness-143"
:::theorem "adele_local_compactness" (parent := "adele_project") (lean := "NumberField.AdeleRing.locallyCompactSpace")
```


:::theorem "local_integer_ring_compact_open" (parent := "adele_project") (lean := "NumberField.instCompactSpaceAdicCompletionIntegers")
For a nonarchimedean completion of a number field, the local integer ring
should be a compact open subgroup.
:::

```tex "adele_project/local-compactness-compact-open"
\begin{theorem}
  \label{NumberField.instCompactSpaceAdicCompletionIntegers}
  \lean{NumberField.instCompactSpaceAdicCompletionIntegers}
  \discussion{451}
  \leanok
  If $K$ is a number field and $v$ is a nonzero prime ideal of the integers of $K$,
  then the integers of $K_v$ is a compact open subgroup.
\end{theorem}
\begin{proof} Openness should follow from the fact that the integers are
  $\{x : v(x)<v(1/\pi)\}$ where $\pi$ is a uniformizer. Compactness needs
  finiteness of the residue field $\mathcal{O}_K/v$.
\end{proof}
```

:::proof "adele_local_compactness"
The full adele ring is the product of the finite and infinite adeles. The
finite part is a restricted product over compact open integer rings, so
mathlib's `RestrictedProduct.locallyCompactSpace_of_addGroup` applies once
{uses "local_integer_ring_compact_open"}[] is available. The infinite part is a
finite product of archimedean completions, hence a finite-dimensional real
topological vector space and therefore locally compact.

The chapter is explicit that this is now meant to be proved using the
restricted-product topology rather than the older ad hoc topology from the
first external adele formalization. That is why the local compactness theorem
for restricted products in mathlib is the real harness-facing endpoint here.
:::

```tex "adele_project/local-compactness-adele-ring"
Once we have this, the above result from mathlib gives us
\begin{theorem}
  \lean{NumberField.AdeleRing.locallyCompactSpace}
  \label{NumberField.AdeleRing.locallyCompactSpace}
  \uses{NumberField.instCompactSpaceAdicCompletionIntegers}
  \discussion{253}
  \leanok
  The adeles of a number field are locally compact.
\end{theorem}
\begin{proof}
  The adeles of a number field are a product of the finite adeles and the infinite adeles
  so it suffices to prove that the finite and infinite adeles are locally compact.
\end{proof}
```

The TeX miniproject also records the project status here: Salvatore Mercuri had
already formalized local compactness in an external adele-ring repo, and the
question for the blueprint was how to refactor that proof so it fits mathlib's
restricted-product API cleanly. It also notes the specific local input one
needs: for number fields, unlike a general Dedekind domain, the local integer
rings are compact because the residue fields are finite.
```tex "adele_project/lt-witness-198"
The TeX miniproject also records the project status here: Salvatore Mercuri had
```


# Base change

:::theorem "adele_base_change" (parent := "adele_project")
For a finite extension $`L/K`$, the adele ring of $`L`$ should identify with
$`L \otimes_K \mathbf{A}_K`$ as both an algebra and a topological space.
This is one of the basic background results for {uses "adelic_division_algebra_setup"}[] and {uses "haar_character_goal"}[].
:::

```tex "adele_project/base-change"
\section{Base change}

The ``theorem'' we want is that if $L/K$ is a finite extension of number fields,
then $\A_L=L\otimes_K\A_K$. This isn't a theorem though, this is actually a \emph{definition}
(the map between the two objects) and a theorem about
the definition (that it's an isomorphism).
```

This isn't a theorem though, this is actually a definition of the map between
the two objects and a theorem about the definition, that it is an isomorphism.
```tex "adele_project/lt-witness-222"
The ``theorem'' we want is that if $L/K$ is a finite extension of number fields,
then $\A_L=L\otimes_K\A_K$. This isn't a theorem though, this is actually a \emph{definition}
(the map between the two objects) and a theorem about
the definition (that it's an isomorphism).
```


In fact the full claim is that it is both a homeomorphism and an $L$-algebra
isomorphism. Before we can prove the theorem, we need to make the definition.
```tex "adele_project/lt-witness-226"
The goal in this subsection is to spell out the following argument: Assume that
$L\otimes_KK_v\cong\prod_{w|v}L_w$
algebraically and topologically for all $v$, with $B\otimes_AA_v$ identified with $\prod_{w|v}B_w$.
Then $L\otimes_K\A_K^\infty\cong\A_L^\infty$, algebraically and topologically. Here
the tensor products $L\otimes_K R$ (for $R$ a $K$-algebra with a topology) are all being
given the $R$-module topology, which if we choose a basis for $L/K$ is just the product
topology.
```


## Base Change For Nonarchimedean Completions

As pointed out above, the theory of finite adeles works fine for Dedekind
domains. So for the time being let `A` be a Dedekind domain. Recall that the
height one spectrum of `A` is the nonzero prime ideals of `A`.
```tex "adele_project/lt-witness-233"
As pointed out above, the theory of finite adeles works fine for Dedekind domains.
So for the time being let~$A$ be a Dedekind domain. Recall that the \emph{height one spectrum}
of $A$ is the nonzero prime ideals of~$A$.
```


Note that because we stick to the literature, rather than to common sense,
fields are Dedekind domains in mathlib, and the height one spectrum of a field
is empty.
```tex "adele_project/lt-witness-239"
Note that because we stick to the literature, rather than to common sense,
fields are Dedekind domains in mathlib, and the
height one spectrum of a field is empty.
```


:::definition "finite_adele_base_change_map" (parent := "adele_project") (lean := "IsDedekindDomain.FiniteAdeleRing.mapSemialgHom")
Before proving finite-adele base change, one first defines the natural map
$`\mathbf{A}_{A,K}^\infty \to \mathbf{A}_{B,L}^\infty` induced by the local maps
on completions.
:::
```tex "adele_project/lt-witness-244"
:::definition "finite_adele_base_change_map" (parent := "adele_project") (lean := "IsDedekindDomain.FiniteAdeleRing.mapSemialgHom")
```


:::definition "local_completion_map" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom")
Given a finite extension `L/K` and places `w | v`, there is a natural map from
the completion `K_v` to the completion `L_w`.
:::
```tex "adele_project/lt-witness-250"
:::definition "local_completion_map" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom")
```


It is defined by completing the inclusion `K → L` at the finite places `v` and
`w` (which can be done because the previous lemma shows that the map is
uniformly continuous for the `v`-adic and `w`-adic topologies).
```tex "adele_project/lt-witness-255"
The next lemma explains how these valuations are related.
```


:::theorem "local_valuation_compatibility" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.valuation_comap")
The `v`-adic and `w`-adic valuations are related by the ramification index:
`e · w(i(k)) = v(k)` in additive-valuation normalization.
:::
```tex "adele_project/lt-witness-259"
:::theorem "local_valuation_compatibility" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.valuation_comap")
```


:::proof "local_valuation_compatibility"
Standard (and formalized).
:::

```tex "adele_project/base-change-valuation"
\begin{lemma}
  \label{IsDedekindDomain.HeightOneSpectrum.valuation_comap}
  \lean{IsDedekindDomain.HeightOneSpectrum.valuation_comap}
  \leanok
  If $i:K\to L$ denotes the inclusion then for $k\in K$ we have
  $e\times w(i(k))=v(k)$, where $e$ is the ramification index of $w/v$
  (recall that valuations here are written additively, unlike in mathlib).
\end{lemma}
\begin{proof}
  \leanok
  Standard (and formalized).
\end{proof}
```

:::theorem "local_module_topology_for_completion" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology")
After base change to a local completion, the topology on `L_w` should agree with
the `K_v`-module topology.
This is the topological sharpening of {uses "local_completion_map"}[] and
{uses "local_valuation_compatibility"}[].
:::
```tex "adele_project/lt-witness-285"
:::theorem "local_module_topology_for_completion" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology")
```


:::proof "local_module_topology_for_completion"
Giving `L_w` the `K_v`-algebra structure coming from the natural map
`K_v→L_w`, the `w`-adic topology on `L_w` is the `K_v`-module topology.
:::

```tex "adele_project/base-change-local-topology"
\begin{theorem}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \leanok
  \discussion{326}
  Giving $L_w$ the $K_v$-algebra structure coming from the natural map $K_v\to L_w$,
  the $w$-adic topology on $L_w$ is the $K_v$-module topology.
\end{theorem}
\begin{proof}
  Any basis for $L$ as a $K$-vector space spans $L_w$ as a $K_v$-module, so $L_w$ is
  finite-dimensional over $K_v$ and the module topology is the same as the product
  topology.
\end{proof}
```

Because of the commutative diagram, we can view `L_w` as an
`L⊗_KK_v`-algebra.
```tex "adele_project/lt-witness-317"
Because of the commutative diagram
```


:::theorem "finite_primes_above_v_are_finite" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.Extension.finite")
For a fixed finite place `v` of `K`, there are only finitely many places `w` of
`L` lying above it.
:::
```tex "adele_project/lt-witness-320"
:::theorem "finite_primes_above_v_are_finite" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.Extension.finite")
```


:::proof "finite_primes_above_v_are_finite"
This is a standard fact about Dedekind domains. The key input is mathlib's
theorem `primesOver_finite`.
:::

```tex "adele_project/base-change-finite-fibres"
\begin{lemma}
  \lean{IsDedekindDomain.HeightOneSpectrum.Extension.finite}
  \label{IsDedekindDomain.HeightOneSpectrum.Extension.finite}
  \leanok
  There are only finitely many primes $w$ of $B$ lying above $v$.
\end{lemma}
\begin{proof}
  \leanok
  This is a standard fact about Dedekind domains. The key input is
  mathlib's theorem {\tt primesOver\_finite}.
\end{proof}
```

The TeX chapter writes `w | v` for this finite set of places above `v`, and
then takes the product of the local completion maps over all such `w`.
```tex "adele_project/lt-witness-345"
The TeX chapter writes `w | v` for this finite set of places above `v`, and
```


:::theorem "nonarchimedean_base_change_local_decomposition" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv")
For a fixed finite place `v` of `K`, the algebra
$`L \otimes_K K_v` decomposes as the finite product of the completions
$`\prod_{w \mid v} L_w`.
This is the local theorem behind {uses "local_completion_map"}[] and
{uses "finite_primes_above_v_are_finite"}[].
:::
```tex "adele_project/lt-witness-348"
:::theorem "nonarchimedean_base_change_local_decomposition" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv")
```


:::proof "nonarchimedean_base_change_local_decomposition"
My current proposal to formalize this is as follows. The map is surjective
because the image is dense and closed; this has been formalized already. It is
also a `K_v`-algebra homomorphism if we give `L_w` the obvious `K_v`-algebra
structure. Thus we can conclude the result if we can prove that both spaces are
finite-dimensional and have the same dimension. The `K_v`-dimension of
`L⊗_KK_v` is equal to the `K`-dimension of `L`, which is `∑_{w|v} e_w f_w`
using the standard notation that `e_w` is the ramification index of `w` and
`f_w` the residue degree. So it suffices to prove that `[L_w:K_v]=e_wf_w`.
We already have that `e_w` (defined globally) is equal to the local ramification
index (defined as the factor by which the valuations differ on `K`).
:::

```tex "adele_project/base-change-local-decomposition"
\begin{theorem}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \leanok
  The product of the maps $K_v\to L_w$ for $w|v$ is a natural ring map $K_v\to\prod_{w|v}L_w$
  lying over $K\to L$.
\end{theorem}
```

:::theorem "product_local_completion_module_topology" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology")
For fixed `v`, the product topology on $`\prod_{w \mid v} L_w` is the
`K_v`-module topology.
This packages the finite-product topological step immediately after the local
algebraic decomposition.
It packages {uses "local_module_topology_for_completion"}[] over the finite set
of places above `v`.
:::
```tex "adele_project/lt-witness-385"
:::theorem "product_local_completion_module_topology" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology")
```


:::proof "product_local_completion_module_topology"
This is a finite product of `K_v`-modules each of which has the `K_v`-module
topology by {uses "local_module_topology_for_completion"}[], and the product
topology is the module topology for a finite product of modules each of which
has the module topology.
:::

```tex "adele_project/base-change-summary"
The adeles of a number field $K$ are the product of the finite and infinite
adeles, and mathlib knows that they're a $K$-algebra and a topological ring.

The finite adele ring of $L$ is then obtained by comparing the restricted
products place by place, first through the local decompositions and then by a
relabelling of places.
```

:::theorem "nonarchimedean_base_change_local_homeomorphism" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv")
If `L \otimes_K K_v` is given the `K_v`-module topology, then the local
algebraic isomorphism
$`L \otimes_K K_v \cong \prod_{w \mid v} L_w`
is also a homeomorphism.
This is the topological sharpening of
{uses "nonarchimedean_base_change_local_decomposition"}[] and {uses "product_local_completion_module_topology"}[].
:::
```tex "adele_project/lt-witness-410"
:::theorem "nonarchimedean_base_change_local_homeomorphism" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv")
```


:::proof "nonarchimedean_base_change_local_homeomorphism"
Indeed, it is a `K_v`-algebra isomorphism between two modules each of which
have the module topology, and any module map is automatically continuous for
the module topologies.
:::
```tex "adele_project/lt-witness-419"
:::proof "nonarchimedean_base_change_local_homeomorphism"
```


:::theorem "nonarchimedean_integral_decomposition" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral")
The same local decomposition identifies the integral subring
$`B \otimes_A A_v`$ with the product of the local integer rings
$`\prod_{w \mid v} B_w`$.
This is the integral refinement of
{uses "nonarchimedean_base_change_local_decomposition"}[].
:::
```tex "adele_project/lt-witness-426"
:::theorem "nonarchimedean_integral_decomposition" (parent := "adele_project") (lean := "IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral")
```


:::proof "nonarchimedean_integral_decomposition"
Certainly the image of the integral elements are integral. The argument in the
other direction is more delicate. My original plan was to follow
Cassels--Froehlich, Cassels' article Global fields, section 12 lemma, p61,
which proves it for all but finitely many primes, but a PR by Matthew Jasper
gives another approach which works for all primes.
Jasper's argument is to show that the closure of `A` in `K_v` is `A_v` for a
valuation on a Dedekind domain, and then that the closure of `A` in
$`\prod_{v \in S} K_v`$ is $`\prod_{v \in S} A_v`$ for `S` a finite set of valuations
(using the Chinese remainder theorem). Applying this to `B` we get that the
closure of `B` in $`\prod_{w \mid v} L_w`$ is $`\prod_{w \mid v} B_w`$. He then shows that this
closure is the image of $`B \otimes_A \mathcal{O}_v`$ by showing that this image
is closed because it's open), giving surjectivity; injectivity follows from the
statement that $`L \otimes_K K_v = \prod_{w \mid v} L_w`$.
:::
```tex "adele_project/lt-witness-434"
:::proof "nonarchimedean_integral_decomposition"
```


For all finite places `v` of `A` we have shown that the natural map
$`L \otimes_K K_v \to \prod_w L_w`$ is an isomorphism of `L`-algebras, and that if
$`L \otimes_K K_v`$ has the `K_v`-module topology and each `L_w` has the valuation
topology then this map is also a homeomorphism. Furthermore we have shown that
there is an induced algebraic isomorphism $`B \otimes_A A_v \cong \prod_w B_w`$ on the subrings of
the left and right hand sides.
```tex "adele_project/lt-witness-447"
A summary of the local picture at this stage, exactly as in the TeX chapter:
```


Hence there is a natural `L`-algebra homomorphism
$`L \otimes_K \A_{A,K}^\infty \to \A_{B,L}^\infty`$.

```tex "adele_project/lt-witness-463a"
Hence there's a natural $L$-algebra homomorphism $L\otimes_K\A_{A,K}^\infty\to\A_{B,L}^\infty$.
```

Our next goal in this section is the following two results. First the algebraic
claim.
```tex "adele_project/lt-witness-459"
The TeX chapter now introduces an auxiliary restricted product `R`, namely the
```


:::theorem "finite_adele_base_change_algebraic" (parent := "adele_project") (lean := "IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv")
The natural map $`L \otimes_K \A_{A,K}^\infty \to \A_{B,L}^\infty`$ is an
isomorphism.
:::
```tex "adele_project/lt-witness-468"
\begin{proof}
  \proves{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}
  Follows immediately from theorem~\ref{IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv}
  and theorem~\ref{IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}.
\end{proof}
```


:::theorem "tensor_product_module_base_change" (parent := "adele_project")
If $`M`$ is any $`K`$-module then the canonical map
$`B \otimes_A M \to L \otimes_K M`$ is an isomorphism.
:::
```tex "adele_project/lt-witness-484"
\begin{corollary}
  \label{IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}
  %%% \uses{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv} -- uncomment to break leanblueprint
  \lean{IsDedekindDomain.linearEquivTensorProductModule}
  \leanok
  If $M$ is any $K$-module then the canonical map $B\otimes_A M\to L\otimes_K M$
  is an isomorphism.
\end{corollary}
```


:::proof "tensor_product_module_base_change"
We can factor this map as
$`B \otimes_A M \cong B \otimes_A (K \otimes_K M) \cong
(B \otimes_A K) \otimes_K M \to L \otimes_K M`$, and we just showed that the
latter map was an isomorphism.
:::
```tex "adele_project/lt-witness-489"
\begin{proof}
  \leanok
  We can factor this map as $B\otimes_AM\cong B\otimes_A(K\otimes_KM)\cong
  (B\otimes_A K)\cong_KM\to L\otimes_KM$ and we just showed that the latter map was an
  isomorphism.
\end{proof}
```


The reason we care about this is the following.
```tex "adele_project/lt-witness-500"
The reason we care about this is the following.
```


:::theorem "tensor_product_commutes_with_products_for_finite_presentation" (parent := "adele_project")
If $`R`$ is a commutative ring, if $`M`$ is a finitely presented $`R`$-module
and if $`N_i`$ are a collection of $`R`$-modules, then the canonical map
$`M \otimes_R \prod_i N_i \to \prod_i (M \otimes_R N_i)`$ is an isomorphism.
:::
```tex "adele_project/lt-witness-506"
\begin{theorem}
  \label{pi_tensorProduct_of_finitePresentation}
  If $R$ is a commutative ring, if $M$ is a finitely presented $R$-module
  and if $N_i$ are a collection of $R$-modules, then the canonical map
  $M\otimes_R\prod_i N_i\to\prod_i(M\otimes_R N_i)$ is an isomorphism.
\end{theorem}
```


:::proof "tensor_product_commutes_with_products_for_finite_presentation"
If `M` is finite and free then Maddy Crim has already formalized this in FLT.
For the general case present $`M`$ as $`R^a \to R^b \to M \to 0`$ and use that
tensor products and arbitrary products preserve surjections.
:::
```tex "adele_project/lt-witness-513"
\begin{proof} If $M$ is finite and free then Maddy Crim has already formalized this
  in FLT. For the general case present $M$ as $R^a\to R^b\to M\to 0$ and use that tensor
  products and arbitrary products preserve surjections.
\end{proof}
```


:::definition "restricted_product_relabel_isomorphism" (parent := "adele_project")
Let `V` and `W` be index sets, and let `f:W→V` be a map with finite fibres. Let
`X_v` be sets, with subsets `C_v`, let `Y_w` be sets with subsets `D_w`, and
say for all `v ∈ V` we're given a bijection $`X_v \to \prod_{w \mid f(w)=v} Y_w`$,
identifying `C_v` with $`\prod_{w:f(w)=v} D_w`$. Then there's an induced bijection between the
restricted products `∏'_v(X_v,C_v)` and `∏'_w(Y_w,D_w)`.
:::
```tex "adele_project/lt-witness-521"
\begin{definition}
  \label{RestrictedProduct.relabelIso}
  Let $V$ and $W$ be index sets, and let $f:W\to V$ be a map with finite fibres.
  Let $X_v$ be sets, with subsets $C_v$, let $Y_w$ be sets with subsets $D_w$,
  and say for all $v\in V$ we're given a bijection $X_v\to\prod_{w|f(w)=v}Y_w$,
  identifying $C_v$ with $\prod_{w:f(w)=v}D_w$. Then there's an induced bijection between
  the restricted products $\prod'_v(X_v,C_v)$ and $\prod'_w(Y_w,D_w)$.
\end{definition}
```


:::proof "restricted_product_relabel_isomorphism"
This is a standard corollary of the previous theorem and the fact that tensor
products commute with filtered colimits.
:::
```tex "adele_project/lt-witness-527"
\begin{proof} Let $V$ be the finite places of $K$ and $W$ the finite places of $L$,
  let $X_v$ be $B\otimes_A K_v$, let $C_v$ be $B\otimes_A A_v$, let $Y_w$ be $L_w$,
  let $D_w$ be $B_w$ and the result follows from the previous definition, given
  theorem~\ref{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}.
\end{proof}
```


:::theorem "restricted_product_relabel_homeomorphism" (parent := "adele_project")
In the same setup as `RestrictedProduct.relabelIso`
(`V, W` index sets, `f : W → V`, `C_v ⊆ X_v` and `D_w ⊆ Y_w`, bijections
`b_v : X_v → ∏_{w | f(w) = v} Y_w` identifying `C_v` with `∏_{w | f(w) = v} D_w`), if all the
`X_v` and `Y_w` are furthermore topological spaces, all the `C_v` and `D_w` are
open, and all the `b_v` are homeomorphisms, then the induced
map `∏'_v(X_v,C_v) → ∏'_w(Y_w,D_w)` is also a homeomorphism.
:::
```tex "adele_project/lt-witness-533"
\begin{theorem} In the same setup as definition~\ref{RestrictedProduct.relabelIso}
  ($V,W$ index sets, $f:W\to V$,
  $C_v\subseteq X_v$ and $D_w\subseteq Y_w$, bijections $b_v:X_v\to\prod_{w:f(w)=v}Y_w$
  identifying $C_v$ with $\prod_{w:f(w)=v}D_w$), if all the $X_v$ and $Y_w$ are furthermore
  topological spaces, all the $C_v$ and $D_w$ are open, and all the $b_v$ are homeomorphisms,
  then the induced
  map $\prod'_v(X_v,C_v)\to\prod'_w(Y_w,D_w)$ is also a homeomorphism.
\end{theorem}
```


:::proof "restricted_product_relabel_homeomorphism"
I have only thought about the cofinite filter case, where this should follow
easily from the definition of the topology.
:::
```tex "adele_project/lt-witness-541"
\begin{proof} I have only thought about the cofinite filter case, where this
  should follow easily from the definition of the topology.
\end{proof}
```


:::theorem "finite_adele_base_change_integral" (parent := "adele_project")
The natural map $`B \otimes_A \A_K^\infty \to \A_L^\infty`$ is a `B`-algebra
isomorphism.
:::
```tex "adele_project/lt-witness-548"
\begin{theorem}
  \label{IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv}
  \uses{RestrictedProduct.relabelIso,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}
  The natural map $B\otimes_A\A_K^\infty\to\A_L^\infty$ is a $B$-algebra
  isomorphism.
\end{theorem}
```


:::proof "finite_adele_base_change_integral"
This map factors through the auxiliary ring~`R` so the result follows from the
previous two constructions.
:::

```tex "adele_project/base-change-finite-relabel"
\begin{corollary}
  \label{IsDedekindDomain.pi_tensorProduct}
  \uses{IsDedekindDomain.AKLB.finitePresentation,pi_tensorProduct_of_finitePresentation}
  If $S$ is a finite set of nonzero primes of $A$ then the natural map
  $B\otimes((\prod_{v\in S}K_v)\times(\prod_{v\notin S}A_v))\to
  (\prod_{v\in S}(B\otimes_AK_v))\times(\prod_{v\notin S}(B\otimes_AA_v))$
  is an isomorphism.
\end{corollary}
\begin{proof} Follows from the previous two theorems.
\end{proof}

Recall that $\A_K^\infty$ is the finite adeles of $K$,
defined as the restricted product of the $K_v$ with respect to the $A_v$,
where $v$ runs through the nonzero primes of $A$. Let $R$ denote the restricted
product of the $B\otimes_A K_v$ with respect to the $B\otimes_A A_v$.

\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1}
  \uses{IsDedekindDomain.pi_tensorProduct}
  The natural map $B\otimes_A\A_K^\infty\to R$ is a $B$-algebra isomorphism.
\end{corollary}
\begin{proof} This follows from the previous corollary and the fact that
  tensor products commute with filtered colimits.
\end{proof}

Recall from earlier in this section that if $v$ is a finite place of $A$ then the natural map from
$B\otimes_A K_v$ to $L\otimes_KK_v$ is an isomorphism, and recall from the previous section
that the natural map from $L\otimes_KK_v$ to $\prod_{w|v}L_w$ was also an isomorphism.
This isomorphism sends $B\otimes_A A_v$ to $\prod_{w|v}B_w$ (I thank Matthew Jasper for
pointing out to me that this statement was true at all primes, not just at unramified primes).
Finally, the set of $w$ of $B$ dividing a fixed place $v$ of $A$ is finite.
Let's now formalize the abstract statement which we need. Rather than following the
notation for restricted product in the literature and writing $\A_K^\infty=\prod'_vK_v$
with the $\mathcal{O}_v$ implicit, we will write $\prod'_v(K_v,\mathcal{O}_v)$ in the below.

\begin{definition}
  \label{RestrictedProduct.relabelIso}
  Let $V$ and $W$ be index sets, and let $f:W\to V$ be a map with finite fibres.
  Let $X_v$ be sets, with subsets $C_v$, let $Y_w$ be sets with subsets $D_w$,
  and say for all $v\in V$ we're given a bijection $X_v\to\prod_{w|f(w)=v}Y_w$,
  identifying $C_v$ with $\prod_{w:f(w)=v}D_w$. Then there's an induced bijection between
  the restricted products $\prod'_v(X_v,C_v)$ and $\prod'_w(Y_w,D_w)$.
\end{definition}

\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}
  \uses{RestrictedProduct.relabelIso}
  The ring $R$ introduced above (the restricted
  product of the $B\otimes_A K_v$ with respect to the $B\otimes_A A_v$)
  is isomorphic to $\mathbb{A}_L$.
\end{corollary}
\begin{proof} Let $V$ be the finite places of $K$ and $W$ the finite places of $L$,
  let $X_v$ be $B\otimes_A K_v$, let $C_v$ be $B\otimes_A A_v$, let $Y_w$ be $L_w$,
  let $D_w$ be $B_w$ and the result follows from the previous definition, given
  theorem~\ref{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}.
\end{proof}
From this, we can deduce the theorem we claimed earlier:

\begin{theorem}
  \label{IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv}
  \uses{RestrictedProduct.relabelIso,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}
  The natural map $B\otimes_A\A_K^\infty\to\A_L^\infty$ is a $B$-algebra
  isomorphism.
\end{theorem}
\begin{proof}
  This map factors through the auxiliary ring~$R$ so the result follows
  from the previous two constructions.
\end{proof}

Because this map factors through the isomorphism $B\otimes_A\A_K^\infty\to L\otimes_K\A_K^\infty$
we can finally deduce that the natural map $L\otimes_K\A_K^\infty\to\A_L^\infty$ is an algebraic
  isomorphism.
\begin{proof}
  \proves{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}
  Follows immediately from theorem~\ref{IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv}
  and theorem~\ref{IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}.
\end{proof}
```

:::theorem "finite_adele_base_change_topological" (parent := "adele_project") (lean := "IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv")
The same finite-adele base-change map is also a homeomorphism when the source is
given the module topology and the target the restricted-product topology.
This is the topological companion to
{uses "finite_adele_base_change_algebraic"}[].
The local topological input is {uses "nonarchimedean_base_change_local_homeomorphism"}[].
:::
```tex "adele_project/lt-witness-653"
:::theorem "finite_adele_base_change_topological" (parent := "adele_project") (lean := "IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv")
```


:::proof "finite_adele_base_change_topological"
The TeX chapter insists that this is a separate theorem, not a formality. The
key issue is that the restricted-product topology is not the naive subspace
topology from the full product, so one must check carefully that the local
homeomorphisms from
{uses "nonarchimedean_base_change_local_homeomorphism"}[] respect the chosen
open compact subrings and that restricted products commute with finite products
in the required way.

The TeX proof then adds one more module-topology observation: after identifying
each `B \otimes_A A_v` with a finite power of `A_v`, the restricted product of
those finite powers has the expected module topology because restricted products
commute with finite products. This is the last step that turns the algebraic
finite-adele base-change isomorphism into a homeomorphism.
:::

```tex "adele_project/base-change-finite-topology"
\begin{definition} If $X_v$ and $Y_v$ are families of topological spaces indexed by $v\in V$,
  if $f_v:X_v\to Y_v$ is a continuous map sending the subset $C_v\subseteq X_v$ into
  $D_v\subseteq Y_v$ then there's an induced continuous map $\prod'_v(X_v,C_v)\to\prod'_v(Y_v,D_v)$.
\end{definition}

\begin{definition} If all the $f_v$ are homeomorphisms identifying $C_v$ with $D_v$ then
  the induced map on restricted products is also a homeomorphism (proof: apply the previous
  construction to $f_v$ and their inverses)
\end{definition}

We now allow a slight change of index set. Unfortunately I don't think that we can deduce
the results just stated above from this one, in Lean, because the product of $Y_w$ over a
set of size 1 is not definitionally equal to $Y_w$.

Recall definition~\ref{RestrictedProduct.relabelIso}, giving us a bijection between two restricted
products.

\begin{theorem} In the same setup as definition~\ref{RestrictedProduct.relabelIso}
  ($V,W$ index sets, $f:W\to V$,
  $C_v\subseteq X_v$ and $D_w\subseteq Y_w$, bijections $b_v:X_v\to\prod_{w:f(w)=v}Y_w$
  identifying $C_v$ with $\prod_{w:f(w)=v}D_w$), if all the $X_v$ and $Y_w$ are furthermore
  topological spaces, all the $C_v$ and $D_w$ are open, and all the $b_v$ are homeomorphisms,
  then the induced
  map $\prod'_v(X_v,C_v)\to\prod'_w(Y_w,D_w)$ is also a homeomorphism.
\end{theorem}
\begin{proof} I have only thought about the cofinite filter case, where this
  should follow easily from the definition of the topology.
\end{proof}

\begin{corollary} $\mathbb{\A_L^\infty}$ is homeomorphic to $\prod_v(B\otimes_AK_v,B\otimes_AA_v)$.
\end{corollary}
\begin{proof} Follows from the previous theorem with $X_v=B\otimes_AK_v$ $D_w=L_w$ etc.
\end{proof}

Recall that if $$R$$ is a commutative ring, and two $$R$$-modules both have the $$R$$-module
topology, then any $$R$$-linear morphism between them is automatically continuous. We know
that $\A_L^\infty$ is $\A_K^\infty$-linearly isomorphic to $L\otimes_K\A_K^\infty$ and our claim is that
if $L\otimes_K\A_K^\infty$ is given the $\A_K^\infty$-module topology then this isomorphism is also a
homeomorphism; to prove this, we thus just need to check that $\A_L^\infty$ has the $\A_K^\infty$-module
topology. Equivalently, by the previous result, we need to check that
the restricted product topology on the $\A_K^\infty$-algebra $\prod'_v(B\otimes_AK_v,B\otimes_AA_v)$
is the $\A_K^\infty$-module topology.

We now need to make restricted products of modules into modules over restricted product of rings.
The API, which should be straightforward so we don't give details here, is: if $R_v$ are rings
with subrings $S_v$ and if $M_v$ are $R_v$-modules with $S_v$-stable submodules $N_v$, then
$\prod'_v(M_v,N_v)$ is naturally a module over $\prod'_v(R_v,S_v)$, and that $R_v$-morphisms
$M_v\to M_v'$ sending $N_v$ to $N_v'$ induce $\prod'_v(R_s,S_v)$-linear maps
$\prod'_v(M_v,N_v)\to\prod'_v(M'_v,N'_v)$. From this one deduces that isomorphisms on the factors
induce isomorphisms on the restricted products.


Now $A_v$ is a PID, so $B\otimes_AA_v$ is free (as it is finitely-generated and torsion-free).
This means that there is an isomorphism $B\otimes_AA_v\cong(A_v)^n$, which extends to an isomorphism
$B\otimes_AK_v\cong K_v^n$. These isomorphisms are also homeomorphisms. If we fix such isomorphisms
for all $v$ then we get an induced $\A_K^\infty$-module isomorphism + homeomorphism
$\prod'_v(B\otimes_AK_v,B\otimes_AA_v)=\prod'_v(K_n^n,A_v^n)$. So it suffices to prove
that the $\prod'_v(K_v,A_v)$-module $\prod'_v(K_v^n,A_v^n)$ has the $\prod'_v(K_v,A_v)$-module
topology. This follows from the fact that the product topology on two modules with the
module topology is the module topology (a fact in mathlib) and the following result.

\begin{lemma}
  If $X_v$ and $Y_v$ are topological spaces with open subspaces $C_v$ and $D_v$, then
  the obvious bijection $\prod'_v(X_v \times Y_v,C_v\times D_v) \cong
  \left(\prod'_v(X_v,C_v)\right)\times\left(\prod'_v(Y_v,D_v)\right)$ is a homeomorphism,
  where the restricted products have the restricted product topology and the binary
  product has the product topology.
\end{lemma}
\begin{proof} This should hopefully be straightforward using {\tt RestrictedProduct.continuous\_dom\_prod}
\end{proof}

As a corollary one can prove by induction on $n$ that the restricted product of $n$th powers
is homeomorphic to the $n$th power of the restricted product and this is the result
we require.
\end{proof}
```

:::theorem "infinite_place_weak_approximation" (parent := "adele_project")
For any finite set of infinite places, the diagonal embedding of a number field
into the corresponding product of completions is dense.
:::
```tex "adele_project/lt-witness-755"
:::theorem "infinite_place_weak_approximation" (parent := "adele_project")
```


:::proof "infinite_place_weak_approximation"
The TeX chapter uses this as the analytic input for infinite-adele base change.
The proof is a version of weak approximation: construct elements that converge
to `1` in one archimedean place and to `0` in the others, then linearly combine
them to approximate any chosen tuple.
:::
```tex "adele_project/lt-witness-760"
:::proof "infinite_place_weak_approximation"
```


:::theorem "infinite_place_dimension_count" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the `K_v`-dimension of
$`\prod_{w \mid v} L_w` matches the `K_v`-dimension of $`L \otimes_K K_v`.
:::
```tex "adele_project/lt-witness-767"
:::theorem "infinite_place_dimension_count" (parent := "adele_project")
```


:::proof "infinite_place_dimension_count"
The TeX chapter separates this dimension count from the actual map construction,
because surjectivity of the infinite-place base-change map is ultimately proved
by combining weak approximation with finite-dimensional linear algebra.
:::
```tex "adele_project/lt-witness-772"
:::proof "infinite_place_dimension_count"
```


:::definition "infinite_place_local_base_change_map" (parent := "adele_project")
At a fixed infinite place `v` of `K`, there is a natural map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`.
:::
```tex "adele_project/lt-witness-778"
:::definition "infinite_place_local_base_change_map" (parent := "adele_project")
```


:::proof "infinite_place_local_base_change_map"
The TeX chapter builds this in two stages: first a map `K_v → ∏_{w|v} L_w`,
then the induced `L`-linear map on the tensor product. This mirrors the
nonarchimedean completion story as closely as possible.
:::
```tex "adele_project/lt-witness-783"
:::proof "infinite_place_local_base_change_map"
```


:::theorem "infinite_place_local_base_change_surjective" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the local infinite-place base-change map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`
is surjective.
:::
```tex "adele_project/lt-witness-789"
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChange_surjective}
  \lean{NumberField.InfinitePlace.Completion.baseChange_surjective}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  For a fixed infinite place $v$ of $K$, the map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ is
  surjective.
\end{theorem}
```


:::proof "infinite_place_local_base_change_surjective"
Let $`(x_i)_i`$ be a `K_v`-basis of $`\prod_{w \mid v} L_w`$. By the density of
`L` in $`\prod_{w \mid v} L_w`, we can find $`\alpha_i \in L`$ arbitrarily close
to $`x_i`$ with respect to the sup norm when embedded globally in
$`\prod_{w \mid v} L_w`. In particular, it is possible to choose such
$`\alpha_i`$ so that the matrix representing the vector
$`((\alpha_i)_{w \mid v})_i`$ in the basis $`(x_i)_i`$ has nonzero determinant.
Since $`(\alpha_i)_{w \mid v}`$ is the image of $`1 \otimes \alpha_i`$ under
base change, we have that $`(1 \otimes \alpha_i)_i`$ also forms a basis of
$`L \otimes_K K_v`$, and base change is surjective.
:::
```tex "adele_project/lt-witness-795"
\begin{proof}
  Let $(x_i)_i$ be a $K_v$-basis of $\prod_{w\mid v}L_w$. By the density of $L$ in
  $\prod_{w\mid v}L_w$
  (Theorem~\ref{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}), we can
  find $\alpha_i \in L$ arbitrarily close to $x_i\prod_{w\mid v}L_w$ with respect to the sup norm
  when embedded globally in $\prod_{w\mid v}L_w$.
  In particular, it is possible to choose such $\alpha_i$ so that the matrix representing
  the vector $((\alpha_i)_{w \mid v})_i$ in the basis $(x_i)_i$ has non-zero determinant.
  Since $(\alpha_i)_{w \mid v}$ is the image of $1\otimes \alpha_i$ under base change, we have
  that $(1 \otimes \alpha_i)_i$ also forms a basis of $L\otimes_K K_v$, and base change
  is surjective.
\end{proof}
```


:::theorem "infinite_place_local_base_change_injective" (parent := "adele_project")
For a fixed infinite place `v` of `K`, the local infinite-place base-change map
$`L \otimes_K K_v \to \prod_{w \mid v} L_w`
is injective.
:::
```tex "adele_project/lt-witness-802"
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChange_injective}
  \lean{NumberField.InfinitePlace.Completion.baseChange_injective}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  For a fixed infinite place $v$ of $K$, the map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ is
  injective.
\end{theorem}
```


:::proof "infinite_place_local_base_change_injective"
The `L`-algebra map $`L \otimes_K K_v \to \prod_{w \mid v} L_w`$ can
equivalently be thought of as `K_v`-linear, which is injective, because it is
surjective by {uses "infinite_place_local_base_change_surjective"}[], and both
sides have the same `K_v`-dimension by {uses "infinite_place_dimension_count"}[].
:::
```tex "adele_project/lt-witness-808"
\begin{proof}
  The $L$-algebra map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ can equivalently be thought of
  as $K_v$-linear, which is injective, because it is surjective by
  Theorem~\ref{NumberField.InfinitePlace.Completion.baseChange_surjective}, and both side have the same
  $K_v$-dimension by
  Theorem~\ref{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}.
\end{proof}
```


:::theorem "infinite_place_local_module_topology" (parent := "adele_project")
If `w \mid v` is an infinite place of `L` lying above an infinite place `v` of
`K`, then `L_w` has the `K_v`-module topology.
:::
```tex "adele_project/lt-witness-815"
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  \lean{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  \leanok
  If $w \mid v$ is an infinite place of $L$ lying above the infinite place $v$ of $K$, then
  $L_w$ has the $K_v$-module topology.
\end{theorem}
```


:::proof "infinite_place_local_module_topology"
Because `L_w` is a finite-dimensional normed `K_v`-vector space, there exists a
`K_v`-linear homeomorphism $`L_w \cong K_v^n`$, from which `L_w` has the
`K_v`-module topology.
:::
```tex "adele_project/lt-witness-820"
\begin{proof}
  Because $L_w$ is a finite-dimensional normed $K_v$ vector space, there exists a $K_v$-linear
  linear homeomorphism $L_w \cong K_v^n$, from which $L_w$ has the $K_v$-module topology.
\end{proof}
```


:::theorem "infinite_place_local_base_change_homeomorphism" (parent := "adele_project")
Let `v` be an infinite place of `K`. There is a natural `L`-algebra
homeomorphism $`L \otimes_K K_v \cong \prod_{w \mid v} L_w`$, whose restriction
to $`1 \otimes_K K_v`$ corresponds to the map constructed above.
:::
```tex "adele_project/lt-witness-826"
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  \lean{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.baseChange,
    NumberField.InfinitePlace.Completion.baseChange_surjective,
    NumberField.InfinitePlace.Completion.baseChange_injective,
    NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  Let $v$ be an infinite place of $K$. There is a natural $L$-algebra homeomorphism
  $L\otimes_K K_v \cong_L \prod_{w\mid v}L_w$, whose restriction to $1\otimes_K K_v$ corresponds to
  the map in~\ref{NumberField.InfinitePlace.Completion.piExtension}.
\end{theorem}
```


:::proof "infinite_place_local_base_change_homeomorphism"
The map constructed above is an `L`-algebra isomorphism by
{uses "infinite_place_local_base_change_surjective"}[] and
{uses "infinite_place_local_base_change_injective"}[]. Every `K_v`-algebra
isomorphism between two `K_v`-module topological spaces is a homeomorphism.
Since this `L`-algebra isomorphism can equivalently be viewed as a
`K_v`-algebra isomorphism, it is also a homeomorphism.
:::
```tex "adele_project/lt-witness-832"
\begin{proof}
  The map in~\ref{NumberField.InfinitePlace.Completion.baseChange} is an $L$-algebra
  isomorphism by Theorem~\ref{NumberField.InfinitePlace.Completion.baseChange_surjective}
  and Theorem~\ref{NumberField.InfinitePlace.Completion.baseChange_injective}.
  Every $K_v$-algebra isomorphism between two $K_v$-module topological spaces is a homeomorphism.
  Since the $L$-algebra isomorphism of
  Definition~\ref{NumberField.InfinitePlace.Completion.baseChange} can equivalently be viewed as
  a $K_v$-algebra isomorphism, it is also a homeomorphism.
\end{proof}
```


:::theorem "infinite_adele_base_change" (parent := "adele_project")
If `K -> L` is a ring homomorphism between two number fields, then there is a
natural isomorphism, both topological and algebraic,
$`L \otimes_K K_\infty \cong L_\infty`.
:::
```tex "adele_project/lt-witness-841"
\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.baseChangeEquiv}
  \lean{NumberField.InfiniteAdeleRing.baseChangeEquiv,
    NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}
  \leanok
  \uses{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}
  If $K\to L$ is a ring homomorphism between two number fields then there is a natural isomorphism
  (both topological and algebraic) $L\otimes_KK_\infty\cong L_\infty$.
\end{theorem}
```


:::proof "infinite_adele_base_change"
Since both sides of the `L`-algebra isomorphism in the algebraic
infinite-adele base-change construction have the `K_\infty`-module topology,
and since the isomorphism can equivalently be viewed as a `K_\infty`-linear
isomorphism, it is also a homeomorphism.
:::
```tex "adele_project/lt-witness-849"
\begin{proof}
  Since both sides of the $L$-algebra isomorphism
  in~\ref{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv} have the $K_{\infty}$-module topology,
  and since the isomorphism can equivalently be viewed as a $K_{\infty}$-linear isomorphism,
  it is also a homeomorphism.
\end{proof}
```


:::proof "adele_base_change"
Follows from the previous results.
:::
```tex "adele_project/lt-witness-865"
\begin{proof}
  \leanok
  Follows from the previous results.
\end{proof}
```


:::theorem "adele_base_change_module_topology" (parent := "adele_project")
If `K -> L` is a ring homomorphism between two number fields, then the topology
on `\A_L` is the `\A_K`-module topology, where the module structure comes from
the natural map `\A_K -> \A_L`.
:::
```tex "adele_project/lt-witness-877"
\begin{theorem}
  \label{NumberField.AdeleRing.baseChange_moduleTopology}
  \lean{NumberField.AdeleRing.instBaseChangeIsModuleTopology}
  \leanok
  \uses{NumberField.AdeleRing.baseChangeEquiv}
  If $K\to L$ is a ring homomorphism between two number fields then the topology on $\A_L$
  is the $\A_K$-module topology, where the module structure comes from the
  natural map $\A_K\to\A_L$.
\end{theorem}
```


:::proof "adele_base_change_module_topology"
Indeed `\A_L \cong L \otimes_K \A_K` is a homeomorphism, and the right hand
side has the `\A_K`-module topology.
:::
```tex "adele_project/lt-witness-883"
\begin{proof}
  \leanok
  Indeed $\A_L\cong L\otimes_K\A_K$ is a homeomorphism, and
  the right hand side has the $\A_K$-module topology.
\end{proof}
```
```tex "adele_project/base-change-infinite"
\subsection{Base change for infinite adeles}

Recall that if $K$ is a number field then the infinite adeles of $K$ are defined
to be the product $\prod_{v\mid\infty} K_v$ of all the completions of $K$ at the
infinite places.

The result we need here is that if $L/K$ is a finite extension of number fields,
then the map $K\to L$ extends to a continuous $K$-algebra map $K_\infty\to L_\infty$,
and thus to a continuous $L$-algebra isomorphism $L\otimes_KK_\infty\to L_\infty$.
Perhaps a cheap proof would be to deduce it from the fact that $K_\infty=K\otimes_{\Q}\R$.

The overall strategy is to first establish, for each infinite place $v$ of $K$, homeomorphisms
between for the completion $K_v$ and the product $\prod_{w\mid v}L_w$ of completions of $L$ at
all infinite places $w$ of $L$ lying above $v$.
We then use these homeomorphisms to construct base change for the infinite adele ring.

\subsubsection{Weak approximation at infinite places}

First, we require a preliminary result that $K$ is dense inside any product of
completions $\prod_{v\in S} K_v$ of $K$ at infinite places.

\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  \lean{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  \leanok
  Let $S$ be a set of infinite places of $K$. The image of $K$ under the embedding
  $K\hookrightarrow (K_v)_{v\in S}; k \mapsto (k)_v$ is dense in the product topology.
\end{theorem}
\begin{proof}
  Let $(K, v)$ denote $K$ equipped with the topology induced by the infinite place $v$.
  It suffices to show that the image of $K$ under the embedding
  $K\hookrightarrow \prod_{v\mid \infty}(K, v)$ is dense in the product topology.
  By a standard analytic argument, for each $v$ it is possible to select a sequence $(x_n^{(v)})_n$
  with the property that $x_n^{(v)} \to 1$ in $v$'s topology, while $x_n^{(v)} \to 0$ in any other
  infinite place's topology.
  Let $(z_v)_v \in \prod_{v\mid \infty}(K, v)$.
  For each $v$, the sequence $y_n := \sum_{v\mid\infty} x_n^{(v)}z_v$ in $K$ converges to
  $z_v$ in $v$'s topology.
  So the embedded image of $y_n$ in $\prod_{v\mid \infty}(K, v)$ converges to $(z_v)_v$ in the
  product topology.
\end{proof}

\subsubsection{Dimensionality of $\prod_{w\mid v}L_w$ as a $K_v$-vector space}

This subsection contains a result that the $K_v$-dimension of
$L \otimes_K K_v$ is equal to the $K_v$-dimension of $\prod_{w\mid v}L_w$.

\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  \lean{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  For a fixed infinite place $v$ of $K$, we have
  $\text{dim}_{K_v} \prod_{w\mid v} L_w = \text{dim}_{K_v} L\otimes_K K_v$.
\end{theorem}

\subsubsection{Base change at infinite places}

\begin{definition}
  \label{NumberField.InfinitePlace.Completion.piExtension}
  \lean{NumberField.InfinitePlace.Completion.piExtension}
  \leanok
  Let $v$ be an infinite place of $K$. There is a continuous $K$-algebra homomorphism
  $K_v \to \prod_{w\mid v}L_w$, whose restriction to $K$ corresponds to the global embedding
  of $K$ into $(L_w)_w$.
\end{definition}

The map in~\ref{NumberField.InfinitePlace.Completion.piExtension} can be lifted to an
$L$-algebra homomorphism defined on $L\otimes_K K_v$.

\begin{definition}
  \label{NumberField.InfinitePlace.Completion.baseChange}
  \lean{NumberField.InfinitePlace.Completion.baseChange}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.piExtension}
  Let $v$ be an infinite place of $K$. There is a natural $L$-algebra homomorphism
  $L\otimes_K K_v \to \prod_{w\mid v}L_w$, whose restriction to $1\otimes_K K_v$ corresponds to
  the map in~\ref{NumberField.InfinitePlace.Completion.piExtension}.
\end{definition}

\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChange_surjective}
  \lean{NumberField.InfinitePlace.Completion.baseChange_surjective}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  For a fixed infinite place $v$ of $K$, the map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ is
  surjective.
\end{theorem}
\begin{proof}
  Let $(x_i)_i$ be a $K_v$-basis of $\prod_{w\mid v}L_w$. By the density of $L$ in
  $\prod_{w\mid v}L_w$
  (Theorem~\ref{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}), we can
  find $\alpha_i \in L$ arbitrarily close to $x_i\prod_{w\mid v}L_w$ with respect to the sup norm
  when embedded globally in $\prod_{w\mid v}L_w$.
  In particular, it is possible to choose such $\alpha_i$ so that the matrix representing
  the vector $((\alpha_i)_{w \mid v})_i$ in the basis $(x_i)_i$ has non-zero determinant.
  Since $(\alpha_i)_{w \mid v}$ is the image of $1\otimes \alpha_i$ under base change, we have
  that $(1 \otimes \alpha_i)_i$ also forms a basis of $L\otimes_K K_v$, and base change
  is surjective.
\end{proof}

\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChange_injective}
  \lean{NumberField.InfinitePlace.Completion.baseChange_injective}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  For a fixed infinite place $v$ of $K$, the map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ is
  injective.
\end{theorem}
\begin{proof}
  The $L$-algebra map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ can equivalently be thought of
  as $K_v$-linear, which is injective, because it is surjective by
  Theorem~\ref{NumberField.InfinitePlace.Completion.baseChange_surjective}, and both side have the same
  $K_v$-dimension by
  Theorem~\ref{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}.
\end{proof}

We have established that the map of
Definition~\ref{NumberField.InfinitePlace.Completion.baseChange} gives an $L$-algebra isomorphism
between $L\otimes_K K_v$ and $\prod_{w\mid v}L_w$.
The left-hand side is given the $K_v$-module topology, while we show that the right-hand side also
has the $K_v$-module topology.
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  \leanok
  If $w \mid v$ is an infinite place of $L$ lying above the infinite place $v$ of $K$, then
  $L_w$ has the $K_v$-module topology.
\end{theorem}
\begin{proof}
  Because $L_w$ is a finite-dimensional normed $K_v$ vector space, there exists a $K_v$-linear
  linear homeomorphism $L_w \cong K_v^n$, from which $L_w$ has the $K_v$-module topology.
\end{proof}

\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  \lean{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.baseChange,
    NumberField.InfinitePlace.Completion.baseChange_surjective,
    NumberField.InfinitePlace.Completion.baseChange_injective,
    NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  Let $v$ be an infinite place of $K$. There is a natural $L$-algebra homeomorphism
  $L\otimes_K K_v \cong_L \prod_{w\mid v}L_w$, whose restriction to $1\otimes_K K_v$ corresponds to
  the map in~\ref{NumberField.InfinitePlace.Completion.piExtension}.
\end{theorem}
\begin{proof}
  The map in~\ref{NumberField.InfinitePlace.Completion.baseChange} is an $L$-algebra
  isomorphism by Theorem~\ref{NumberField.InfinitePlace.Completion.baseChange_surjective}
  and Theorem~\ref{NumberField.InfinitePlace.Completion.baseChange_injective}.
  Every $K_v$-algebra isomorphism between two $K_v$-module topological spaces is a homeomorphism.
  Since the $L$-algebra isomorphism of
  Definition~\ref{NumberField.InfinitePlace.Completion.baseChange} can equivalently be viewed as
  a $K_v$-algebra isomorphism, it is also a homeomorphism.
\end{proof}

\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.piEquiv}
  \lean{NumberField.InfinitePlace.Completion.piEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  Let $v$ be an infinite place of $K$. There is a natural $K_v$-linear homeomorphism
  $K_v^{[L:K]} \cong_{K_v} \prod_{w\mid v}L_w$.
\end{theorem}
\begin{proof}
  Compose the $K_v$-linear isomorphism $K_v^{[L:K]} \cong \prod_{w\mid v}L_w$ with the $K_v$-linear
  version of base change~\ref{NumberField.InfinitePlace.Completion.baseChangeEquiv} to get the
  isomorphism in the statement.
  Since both sides have the $K_v$-module topology, then this is also a homeomorphism.
\end{proof}

\subsubsection{Base change for the infinite adele ring}

First, we induce a $K_{\infty}$-algebra on $L_{\infty}$ from the action of each $K_v$ on
$\prod_{w\mid v}L_w$.
Specifically, this means that for $x \in K_{\infty}$ and $y \in L_{\infty}$, we have
$(x \cdot y)_w = x_{v_w} \cdot y_w$, where $v_w$ is the restriction of $w$ to $K$.
We show that $L_{\infty}$ has the $K_{\infty}$-module topology.

\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.piEquiv}
  \lean{NumberField.InfiniteAdeleRing.piEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.piEquiv}
  There is a natural $K_{\infty}$-linear homeomorphism
  $K_{\infty}^{[L:K]} \cong_{K_{\infty}} L_{\infty}$.
\end{theorem}
\begin{proof}
  Using the isomorphisms $K_v^{[L:K]} \cong_{K_v} \prod_{w\mid v}L_w$ from
  Theorem~\ref{NumberField.InfinitePlace.Completion.piEquiv}, we clearly have a bijection
  $K_{\infty}^{[L:K]} \cong \prod_v\prod_{w \mid v} L_w \cong \prod_w L_w$.
  The $K_v$-linearity of each component isomorphism extends to $K_{\infty}$-linearity if the
  action of $\prod_v K_v$ on $\prod_w L_w$ is constant on the fibers of the restriction map on
  infinite places.
  In other words, if, for all $x \in K_{\infty}$ and $y \in L_{\infty}$, we have
  $(x \cdot y)_w = x_{v_w} \cdot y_w$, which is true by definition.
\end{proof}

\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}
  \lean{NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}
  \leanok
  \uses{NumberField.InfiniteAdeleRing.piEquiv}
  $L_{\infty}$ has the $K_{\infty}$-module topology.
\end{theorem}
\begin{proof}
  Since $L_{\infty}$ is homeomorphic to a finite product of $K_{\infty}$ as a $K_{\infty}$-vector
  space, it has the $K_{\infty}$-module topology.
\end{proof}

\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}
  \lean{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  There is a natural $L$-algebra isomorphism
  $L \otimes_K K_{\infty} \cong_L L_{\infty}$.
\end{theorem}
\begin{proof}
  This follows from the following chain of isomorphisms:
  \[
    L \otimes_K K_{\infty} \cong_L \prod_v (L \otimes_K K_v) \cong_L
      \prod_v \prod_{w\mid v}L_w \cong_L L_{\infty} .
  \]
  The first isomorphism is the standard $L$-algebra isomorphism
  $L \otimes_K \prod_v K_v \cong_L \prod_v (L \otimes_K K_v)$.
  The second isomorphism is given by the component $L$-algebra isomorphisms
  $L \otimes_K K_v \cong_L \prod_{w\mid v}L_w$ from
  Theorem~\ref{NumberField.InfinitePlace.Completion.baseChangeEquiv}.
\end{proof}

It remains to show that the map in~\ref{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv} is a
homeomorphism.
Since both sides have the $K_{\infty}$-module topology, and since the $L$-algebra isomorphism
of~\ref{NumberField.InfiniteAdeleRing.baseChangeALgEquiv} can equivalently be viewed as a
$K_{\infty}$-linear isomorphism, it is also a homeomorphism.

\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.baseChangeEquiv}
  \lean{NumberField.InfiniteAdeleRing.baseChangeEquiv,
    NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}
  \leanok
  \uses{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}
  If $K\to L$ is a ring homomorphism between two number fields then there is a natural isomorphism
  (both topological and algebraic) $L\otimes_KK_\infty\cong L_\infty$.
\end{theorem}
\begin{proof}
  Since both sides of the $L$-algebra isomorphism
  in~\ref{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv} have the $K_{\infty}$-module topology,
  and since the isomorphism can equivalently be viewed as a $K_{\infty}$-linear isomorphism,
  it is also a homeomorphism.
\end{proof}
\end{theorem}
```

# Discreteness and compactness

We need that if `K` is a number field then `K\subseteq\mathbb{A}_K` is discrete,
and the quotient (with the quotient topology) is compact. Here is a proposed
proof.
```tex "adele_project/lt-witness-1147"
\section{Discreteness and compactness}

We need that if $K$ is a number field then
$K\subseteq\mathbb{A}_K$ is discrete, and the quotient (with the
quotient topology) is compact. Here is a proposed proof.
```


:::theorem "rational_adele_zero_neighborhood" (parent := "adele_project")
There is an open subset of the rational adeles whose intersection with `ℚ` is
just `{0}`.
:::
```tex "adele_project/lt-witness-1153"
\begin{theorem}
  \lean{Rat.AdeleRing.zero_discrete}
  \label{Rat.AdeleRing.zero_discrete}
  \leanok
  There's an open subset of $\A_{\Q}$ whose intersection with $\Q$ is $\{0\}$.
\end{theorem}
```


:::proof "rational_adele_zero_neighborhood"
Use `\prod_p{\Z_p}\times(-1,1)`. Any rational `q` in this set is a `p`-adic
integer for all primes `p` and hence, writing it in lowest terms as `q=n/d`,
satisfies `p\nmid d`, meaning that `d=\pm1` and thus `q\in\Z`. The fact
that `q\in(-1,1)` implies `q=0`.
:::
```tex "adele_project/lt-witness-1158"
\begin{proof}
  Use $\prod_p{\Z_p}\times(-1,1)$. Any rational $q$ in this set is a $p$-adic
  integer for all primes $p$ and hence (writing it in lowest terms as $q=n/d$)
  satisfies $p\nmid d$, meaning that $d=\pm1$ and thus $q\in\Z$. The fact
  that $q\in(-1,1)$ implies $q=0$.
\end{proof}
```


:::theorem "number_field_adele_zero_neighborhood" (parent := "adele_project")
There is an open subset of the adeles of a number field whose intersection with
the number field is just `{0}`.
:::
```tex "adele_project/lt-witness-1165"
\begin{theorem}
  \lean{NumberField.AdeleRing.zero_discrete}
  \label{NumberField.AdeleRing.zero_discrete}
  \uses{Rat.AdeleRing.zero_discrete,NumberField.AdeleRing.baseChangeEquiv}
  \leanok
  There's an open subset of $\A_{K}$ whose intersection with $K$ is $\{0\}$.
\end{theorem}
```


:::proof "number_field_adele_zero_neighborhood"
By a previous result, we have `\A_K=K\otimes_{\Q}\A_{\Q}`.
Choose a basis of `K/\Q`; then `K` can be identified with `\Q^n\subseteq(\A_{\Q})^n`
and the open subset from the rational case may be taken coordinatewise.
This gives an open subset of `\A_K` whose intersection with `K` is still `{0}`.
:::
```tex "adele_project/lt-witness-1170"
\begin{proof}
  By a previous result, we have $\A_K=K\otimes_{\Q}\A_{\Q}$.
  Choose a basis of $K/\Q$; then $K$ can be identified with $\Q^n\subseteq(\A_{\Q})^n$
  and the result follows from the previous theorem.
\end{proof}
```


:::theorem "number_field_adele_discrete_embedding" (parent := "adele_project")
The additive subgroup `K` of `\mathbf{A}_K` is discrete.
:::
```tex "adele_project/lt-witness-1180"
\begin{theorem}
  \lean{NumberField.AdeleRing.discrete}
  \label{NumberField.AdeleRing.discrete}
  \uses{NumberField.AdeleRing.zero_discrete}
  \leanok
  The additive subgroup $K$ of $\A_K$ is discrete.
\end{theorem}
```


:::proof "number_field_adele_discrete_embedding"
If `x\in K` and `U` is the open subset in the previous lemma, then
it's easily checked that `K\cap U=\{0\}` implies `K\cap (U+x)=\{x\}`,
and `U+x` is open.
:::
```tex "adele_project/lt-witness-1184"
\begin{proof}
  If $x\in K$ and $U$ is the open subset in the previous lemma, then
  it's easily checked that $K\cap U=\{0\}$ implies $K\cap (U+x)=\{x\}$,
  and $U+x$ is open.
\end{proof}
```


:::theorem "rational_adele_quotient_compact" (parent := "adele_project")
The quotient `\mathbf{A}_{\mathbf{Q}} / \mathbf{Q}` is compact.
:::
```tex "adele_project/lt-witness-1190"
\begin{theorem}
  \lean{Rat.AdeleRing.cocompact}
  \label{Rat.AdeleRing.cocompact}
  \leanok
  The quotient $\A_{\Q}/\Q$ is compact.
\end{theorem}
```


:::proof "rational_adele_quotient_compact"
The space `\prod_p\Z_p\times[0,1]` is a product of compact spaces
and is hence compact. I claim that it surjects onto `\A_{\Q}/\Q`. Indeed,
if `a\in\A_{\Q}` then for the finitely many prime numbers `p\in S` such that `a_p\not\in\Z_p`
we have `a_p\in\frac{r_p}{p^{n_p}}+\Z_p` with `r_p/p^{n_p}\in\Q`.
If we set `q=\sum_{p\in S}\frac{r_p}{p^{n_p}}\in\Q`, then
`a-q\in \prod_p\Z_p\times\R`. Subtracting `\lfloor a_{\infty}-q\rfloor` moves
the archimedean coordinate into `\prod_p\Z_p\times[0,1)`, so every class in
`\A_{\Q}/\Q` has a representative in the compact set.
:::
```tex "adele_project/lt-witness-1194"
\begin{proof}
  The space $\prod_p\Z_p\times[0,1]\subseteq\A_{\Q}$ is a product of compact spaces
  and is hence compact. I claim that it surjects onto $\A_{\Q}/\Q$. Indeed,
  if $a\in\A_{\Q}$ then for the finitely many prime numbers $p\in S$ such that $a_p\not\in\Z_p$
  we have $a_p\in\frac{r_p}{p^{n_p}}+\Z_p$ with $r_p/p^{n_p}\in\Q$.
  If we set $q=\sum_{p\in S}\frac{r_p}{p^{n_p}}\in\Q$, then
  $a-q\in \prod_p\Z_p\times\R$. Subtracting $\lfloor a_{\infty}-q\rfloor$ moves
  the archimedean coordinate into $[0,1)$, so every class in $\A_{\Q}/\Q$ has a
  representative in the compact set.
\end{proof}
```


```tex "adele_project/discreteness-compactness"
\section{Discreteness and compactness}

We need that if $K$ is a number field then
$K\subseteq\mathbb{A}_K$ is discrete, and the quotient (with the
quotient topology) is compact. Here is a proposed proof.

\begin{theorem}
  \lean{Rat.AdeleRing.zero_discrete}
  \label{Rat.AdeleRing.zero_discrete}
  \leanok
  There's an open subset of $\A_{\Q}$ whose intersection with $\Q$ is $\{0\}$.
\end{theorem}
\begin{proof}
  Use $\prod_p{\Z_p}\times(-1,1)$. Any rational $q$ in this set is a $p$-adic
  integer for all primes $p$ and hence, writing it in lowest terms as $q=n/d$,
  has no prime divisor in the denominator. So $d=\pm1$, which forces
  $q\in\Z$, and the interval condition $q\in(-1,1)$ then implies $q=0$.
\end{proof}

\begin{theorem}
  \lean{NumberField.AdeleRing.zero_discrete}
  \label{NumberField.AdeleRing.zero_discrete}
  \uses{Rat.AdeleRing.zero_discrete,NumberField.AdeleRing.baseChangeEquiv}
  \leanok
  There's an open subset of $\A_{K}$ whose intersection with $K$ is $\{0\}$.
\end{theorem}
\begin{proof}
  By a previous result, we have $\A_K=K\otimes_{\Q}\A_{\Q}$.
  Choose a $\Q$-basis of $K$; then $K$ identifies with $\Q^n$ inside
  $(\A_{\Q})^n$, and the open subset from the rational case may be taken
  coordinatewise. This gives an open subset of $\A_K$ whose intersection with
  $K$ is still $\{0\}$.
\end{proof}

\begin{theorem}
  \lean{NumberField.AdeleRing.discrete}
  \label{NumberField.AdeleRing.discrete}
  \uses{NumberField.AdeleRing.zero_discrete}
  \leanok
  The additive subgroup $K$ of $\A_K$ is discrete.
\end{theorem}
\begin{proof}
  If $x\in K$ and $U$ is the open subset in the previous lemma, then
  it's easily checked that $K\cap U=\{0\}$ implies $K\cap (U+x)=\{x\}$,
  and $U+x$ is open.
\end{proof}

For compactness we follow the same approach.

\begin{theorem}
  \lean{Rat.AdeleRing.cocompact}
  \label{Rat.AdeleRing.cocompact}
  \leanok
  The quotient $\A_{\Q}/\Q$ is compact.
\end{theorem}
\begin{proof}
  The space $\prod_p\Z_p\times[0,1]\subseteq\A_{\Q}$ is a product of compact spaces
  and is hence compact. I claim that it surjects onto $\A_{\Q}/\Q$. Indeed,
  if $a\in\A_{\Q}$ then for the finitely many prime numbers $p\in S$ such that $a_p\not\in\Z_p$
  we have $a_p\in\frac{r_p}{p^{n_p}}+\Z_p$ with $r_p/p^{n_p}\in\Q$.
  If we set $q=\sum_{p\in S}\frac{r_p}{p^{n_p}}\in\Q$, then
  $a-q\in \prod_p\Z_p\times\R$. Subtracting $\lfloor a_{\infty}-q\rfloor$ moves
  the archimedean coordinate into $[0,1)$, so every class in $\A_{\Q}/\Q$ has a
  representative in the compact set.
\end{proof}

\begin{theorem}
  \lean{NumberField.AdeleRing.cocompact}
  \label{NumberField.AdeleRing.cocompact}
  \uses{Rat.AdeleRing.cocompact,NumberField.AdeleRing.baseChangeEquiv}
  \leanok
  The quotient $\A_K/K$ is compact.
\end{theorem}
\begin{proof}
  We proceed as in the discreteness proof above, by reducing to $\Q$. Choosing a
  $\Q$-basis of $K$ identifies $K$ with $\Q^n$ and gives
  $\A_K/K\cong(\A_{\Q}/\Q)^n$. Compactness then follows from the previous
  theorem.
\end{proof}
```
