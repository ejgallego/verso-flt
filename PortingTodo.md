# TeX to Verso Porting Task Board

Generated from the active chapter list in `FLT/blueprint/src/content.tex` by `scripts/update_porting_todo.py`.

This board is driven by source markers rather than stale cross-chapter match counts.
It follows the authoritative upstream blueprint chapter list from `content.tex`; commented-out or replaced chapter files are ignored.
The harness migration is largely done: most direct-port chapters now keep the remaining open source in local `tex` blocks, and the main work left is selective source-side formalization debt rather than broad infrastructure.
This board is not an LT certification report. It tracks source-side formalization debt in the active TeX source, not exact LT drift in the local Verso port.
Strict LT status should be checked separately with `python3 tools/verso-harness/scripts/check_lt_source_pairs.py --project-root .`, `python3 scripts/check_blueprint_node_kinds.py`, `python3 tools/verso-harness/scripts/check_lt_similarity.py --project-root .`, and `python3 tools/verso-harness/scripts/status_lt.py --project-root .`.
A chapter can therefore be LT-clean locally and still appear here if the active TeX source lacks `\lean{...}` targets or still contains unfinished proof sketches.
It ignores legacy `\leanok`, `\mathlibok`, and `\notready` markers for backlog purposes,
and surfaces placeholder Lean targets, including outer-repo-only placeholder `(lean := ...)` attachments, missing Lean targets on unfinished labeled source items, and unfinished proof sketches as open work.
Reviewed prose `\ref{...}` suggestions are tracked separately in `UpstreamSuggestions.md` and are not counted as open work here.
When a source block is still open, keep the raw TeX nearby in a labeled `tex` block instead of rewriting it into placeholder prose.

## Snapshot
- Mapped TeX chapters scanned: 14
- Source nodes scanned: 435
- Chapters with open work: 7
- Open source nodes: 50
- Missing source `\lean{...}` targets: 50
- Placeholder Lean targets: 0
- Unfinished proof sketches: 0

## Introduction
- Source: `ch01introduction.tex` -> `Introduction.lean`
- Scanned nodes: 0
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\chapter{Introduction}

Fermat's Last Theorem is the statement that if $a,b,c,n$ are positive whole numbers with $n\geq 3$,
then $a^n+b^n\not=c^n$. It is thus the claim that a family of \emph{Diophantine equations}
($a^3+b^3=c^3, a^4+b^4=c^4,\ldots$) has no positive integer solutions.
Diophantus was a Greek mathematician who lived around 1800
years ago, and he would have been able to understand the statement of the theorem (he knew about
positive integers, addition and multiplication).

Fermat's Last Theorem was explicitly raised by Fermat in 1637, and was proved by Wiles (with the
proof completed in joint work with Taylor) in 1994. There are now several proofs but all of them
go broadly in the same direction, using elliptic curves and modular forms.
```

## First reductions of the problem
- Source: `ch02reductions.tex` -> `Reductions.lean`
- Scanned nodes: 18
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\begin{lemma}\label{FermatLastTheorem.of_odd_primes}\lean{FermatLastTheorem.of_odd_primes}\leanok
  If there is a counterexample to Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$
  with $p$ an odd prime.
\end{lemma}
```

## Reducibility of {\it p
- Source: `ch03freyreduction.tex` -> `HardlyRamified.lean`
- Scanned nodes: 16
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\begin{remark} We make some remarks to orient the reader.
  \begin{itemize}
    \item Any complete local Noetherian ring with finite residue field is a coefficient ring,
      if the ring is equipped with the $\m$-adic topology where $\m$ is the maximal ideal.
      In this case, all powers of $\m$ are open.
    \item In particular finite fields, and integer rings of finite extensions
      of $\Q_p$, are coefficient rings.
    \item If $R$ is a coefficient ring then $R$ is isomorphic to the projective limit
      of the finite rings $R/I$ as $I$ runs over the open ideals of~$R$.
    \item A non-Noetherian example of a coefficient ring is the projective limit over $n$ of
the rings $\Z/p\Z[\varepsilon_1,\ldots,\varepsilon_n]/(\forall i,j,\varepsilon_i\varepsilon_j=0)$;
these rings are convenient to include as coefficient rings for technical reasons; they make
```

## An overview of the proof
- Source: `ch04overview.tex` -> `Overview.lean`
- Scanned nodes: 2
- Open work: 1 source-side formalization items need attention (1 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `modularity_lifting_theorem` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{modularity_lifting_theorem}`; uses: `\uses{Skinner_Wiles_CFT_trick,local_galois_coh_dim_two,local_galois_coh_top_degree,
      local_galois_coh_poincare,local_galois_coh_euler_poincare,IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv,
      automorphic_representation_local_decomposition,cuspidal_automorphic_representation,
      Galois_representation_from_automorphic_representation_on_GL_2_form, moret-bailly,
      local_galois_coh_finite}`; flags: `\notready`.
  - source:
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
```
- Representative source:
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

## An example of an automorphic form
- Source: `ch05automorphicformexample.tex` -> `AutomorphicFormExample.lean`
- Scanned nodes: 66
- Open work: 1 source-side formalization items need attention (1 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `Hurwitz.surjective_pnat_quotient` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{Hurwitz.surjective_pnat_quotient}`; uses: `\uses{Hurwitz}`.
  - source:
```tex
\begin{theorem}
    \label{Hurwitz.surjective_pnat_quotient}
    \uses{Hurwitz}
    If $N$ is a positive natural then the obvious map $\calO\to\calOhat/N\calOhat$ is surjective.
\end{theorem}
```
- Representative source:
```tex
\begin{theorem}
    \label{Hurwitz.surjective_pnat_quotient}
    \uses{Hurwitz}
    If $N$ is a positive natural then the obvious map $\calO\to\calOhat/N\calOhat$ is surjective.
\end{theorem}
```

## Stating the modularity lifting theorems
- Source: `ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`
- Scanned nodes: 4
- Open work: 1 source-side formalization items need attention (1 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `IsCentralSimple.baseChange` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsCentralSimple.baseChange}`.
  - source:
```tex
\begin{lemma}
    \label{IsCentralSimple.baseChange} % no Lean yet because Lean didn't seem to know L \otimes_K D was a ring
    %\uses{IsCentralSimple}
    If $D$ is a central simple algebra over~$K$ and $L/K$ is a field extension, then $L\otimes_KD$
    is a central simple algebra over~$L$.
\end{lemma}
```
- Representative source:
```tex
\begin{lemma}
    \label{IsCentralSimple.baseChange} % no Lean yet because Lean didn't seem to know L \otimes_K D was a ring
    %\uses{IsCentralSimple}
    If $D$ is a central simple algebra over~$K$ and $L/K$ is a field extension, then $L\otimes_KD$
    is a central simple algebra over~$L$.
\end{lemma}
```

## Automorphic forms and the Langlands Conjectures
- Source: `ch07exampleGLn.tex` -> `LanglandsGLn.lean`
- Scanned nodes: 13
- Open work: 4 source-side formalization items need attention (4 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `instLieAlgebraAction` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{instLieAlgebraAction}`.
  - source:
```tex
\begin{definition}
  \label{instLieAlgebraAction}
There is a natural action of the real Lie algebra of $\GL_n(\R)$ on the complex vector space of
smooth complex-valued functions on $\GL_n(\R)$.
\end{definition}
```
- [ ] `instComplexLieAlgebraAction` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{instComplexLieAlgebraAction}`; uses: `\uses{instLieAlgebraAction}`.
  - source:
```tex
\begin{definition}
  \label{instComplexLieAlgebraAction}
  \uses{instLieAlgebraAction}

  This extends to is a natural complex Lie algebra action of the complexification of
  the real Lie algebra, on the smooth complex functions on $\GL_n(\R)$.

\end{definition}
```
- [ ] `instUniversalEnvelopingAlgebraAction` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{instUniversalEnvelopingAlgebraAction}`; uses: `\uses{instComplexLieAlgebraAction}`.
  - source:
```tex
\begin{definition}
  \label{instUniversalEnvelopingAlgebraAction}
  \uses{instComplexLieAlgebraAction}
By functoriality, we get an action of the universal enveloping algebra of this
complexified Lie algebra on the smooth complex functions.

\end{definition}
```
- [ ] `instCentreAction` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{instCentreAction}`; uses: `\uses{instUniversalEnvelopingAlgebraAction}`.
  - source:
```tex
\begin{definition}
\label{instCentreAction}
\uses{instUniversalEnvelopingAlgebraAction}
Thus the \emph{centre} $\Z_n$ of this universal enveloping algebra also acts on the smooth
complex functions.

\end{definition}
```
- Representative source:
```tex
\begin{definition}
  \label{instLieAlgebraAction}
There is a natural action of the real Lie algebra of $\GL_n(\R)$ on the complex vector space of
smooth complex-valued functions on $\GL_n(\R)$.
\end{definition}
```

## Miniproject: Frobenius elements
- Source: `FrobeniusProject.tex` -> `FrobeniusProject.lean`
- Scanned nodes: 22
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\begin{definition}
  \label{IsFractionRing.stabilizerHom}
  \lean{IsFractionRing.stabilizerHom}
  Choose $g\in D_Q$. Then the action of $g$ on $B$ gives us an induced
  $A/P$-algebra automorphism of $B/Q$ which extends to a $K$-algebra automorphism $\phi(g)$ of $L$.
  This construction $g\mapsto \phi(g)$ defines a group homomorphism from $D_Q$
  to $\Aut(L/K)$ (all the proofs implicit in the definition here are straightforward).
  \mathlibok
\end{definition}
```

## Miniproject: Adeles
- Source: `AdeleMiniproject.tex` -> `AdeleProject.lean`
- Scanned nodes: 95
- Open work: 10 source-side formalization items need attention (10 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `IsDedekindDomain.dvd_norm` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.dvd_norm}`.
  - source:
```tex
\begin{lemma}
  \label{IsDedekindDomain.dvd_norm}
  If $0\not=b\in B$ then there exists $0\not=a\in A$ such that $b$ divides
  the image of $a$ in $B$.
\end{lemma}
```
- [ ] `IsDedekindDomain.AKLB.surjective_tensorProduct_map` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.AKLB.surjective_tensorProduct_map}`; uses: `\uses{IsDedekindDomain.dvd_norm}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.AKLB.surjective_tensorProduct_map}
  \uses{IsDedekindDomain.dvd_norm}
  The $A$-bilinear map $B\times K\to L$ sending $(b,k)$ to $bk$ is surjective.
\end{corollary}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv}`; uses: `\uses{IsDedekindDomain.dvd_norm}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv}
  \uses{IsDedekindDomain.dvd_norm}
  The natural map $B\otimes_AK\to L$ is a $B$-algebra isomorphism.
\end{corollary}
```
- [ ] `IsDedekindDomain.AKLB.finitePresentation` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.AKLB.finitePresentation}`.
  - source:
```tex
\begin{theorem} $B$ is a finitely-presented $A$-module.
  \label{IsDedekindDomain.AKLB.finitePresentation}
\end{theorem}
```
- [ ] `pi_tensorProduct_of_finitePresentation` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{pi_tensorProduct_of_finitePresentation}`.
  - source:
```tex
\begin{theorem}
  \label{pi_tensorProduct_of_finitePresentation}
  If $R$ is a commutative ring, if $M$ is a finitely presented $R$-module
  and if $N_i$ are a collection of $R$-modules, then the canonical map
  $M\otimes_R\prod_i N_i\to\prod_i(M\otimes_R N_i)$ is an isomorphism.
\end{theorem}
```
- [ ] `IsDedekindDomain.pi_tensorProduct` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.pi_tensorProduct}`; uses: `\uses{IsDedekindDomain.AKLB.finitePresentation,pi_tensorProduct_of_finitePresentation}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.pi_tensorProduct}
  \uses{IsDedekindDomain.AKLB.finitePresentation,pi_tensorProduct_of_finitePresentation}
  If $S$ is a finite set of nonzero primes of $A$ then the natural map
  $B\otimes((\prod_{v\in S}K_v)\times(\prod_{v\notin S}A_v))\to
  (\prod_{v\in S}(B\otimes_AK_v))\times(\prod_{v\notin S}(B\otimes_AA_v))$
  is an isomorphism.
\end{corollary}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1}`; uses: `\uses{IsDedekindDomain.pi_tensorProduct}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1}
  \uses{IsDedekindDomain.pi_tensorProduct}
  The natural map $B\otimes_A\A_K^\infty\to R$ is a $B$-algebra isomorphism.
\end{corollary}
```
- [ ] `RestrictedProduct.relabelIso` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{RestrictedProduct.relabelIso}`.
  - source:
```tex
\begin{definition}
  \label{RestrictedProduct.relabelIso}
  Let $V$ and $W$ be index sets, and let $f:W\to V$ be a map with finite fibres.
  Let $X_v$ be sets, with subsets $C_v$, let $Y_w$ be sets with subsets $D_w$,
  and say for all $v\in V$ we're given a bijection $X_v\to\prod_{w|f(w)=v}Y_w$,
  identifying $C_v$ with $\prod_{w:f(w)=v}D_w$. Then there's an induced bijection between
  the restricted products $\prod'_v(X_v,C_v)$ and $\prod'_w(Y_w,D_w)$.
\end{definition}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}`; uses: `\uses{RestrictedProduct.relabelIso}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}
  \uses{RestrictedProduct.relabelIso}
  The ring $R$ introduced above (the restricted
  product of the $B\otimes_A K_v$ with respect to the $B\otimes_A A_v$)
  is isomorphic to $\mathbb{A}_L$.
\end{corollary}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv}`; uses: `\uses{RestrictedProduct.relabelIso,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}`.
  - source:
```tex
\begin{theorem}
  \label{IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv}
  \uses{RestrictedProduct.relabelIso,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1,
  IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2}
  The natural map $B\otimes_A\A_K^\infty\to\A_L^\infty$ is a $B$-algebra
  isomorphism.
\end{theorem}
```
- Representative source:
```tex
\begin{lemma}
  \label{IsDedekindDomain.dvd_norm}
  If $0\not=b\in B$ then there exists $0\not=a\in A$ such that $b$ divides
  the image of $a$ in $B$.
\end{lemma}
```

## Miniproject: Haar Characters
- Source: `HaarCharacterProject.tex` -> `HaarCharacters.lean`
- Scanned nodes: 78
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\begin{definition}
  \label{MeasureTheory.addEquivAddHaarChar}
  \lean{MeasureTheory.addEquivAddHaarChar}
  \leanok
  If $A$ is a locally compact topological additive abelian group,
  if $\mu$ is a regular Haar measure on $A$, and if $\phi:A\to A$ is an
  additive homeomorphism, then we let $d_A(\phi)$ denote the unique positive
  real number such that $\mu(X)=d_A(\phi)(\phi_*\mu)(X)$ for any Borel set~$X$.
\end{definition}
```

## Miniproject: Fujisaki's Lemma
- Source: `FujisakiProject.tex` -> `FujisakiProject.lean`
- Scanned nodes: 28
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\begin{theorem}
  \label{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \lean{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}
  \leanok
  If $D$ is a division algebra then
  the quotient $D^\times\backslash D_{\A}^{(1)}$
  with its quotient topology coming from $D_{\A}^{(1)}$, is compact.
\end{theorem}
```

## Miniproject: Quaternion algebras
- Source: `QuaternionAlgebraProject.tex` -> `QuaternionAlgebras.lean`
- Scanned nodes: 7
- [x] No source-side formalization debt is currently flagged in the active TeX source.
- Representative source:
```tex
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}
  \leanok
  The space of $R$-valued \emph{automorphic forms} for $D^\times$ is the set of
  functions $f:D_{\A^\infty}^\times\to R$ satisfying the following axioms:
  \begin{itemize}
    \item $f(dg)=f(g)$ for all $d\in D^\times$ and $g\in D_{\A^\infty}^\times$.
    \item $f(gz)=f(g)$ for all $g\in D_{\A^\infty}^\times$.
    \item There exists a compact open subgroup $U\subseteq (D_{\A^f}^\times)$ such that $f(gu)=f(g)$ for all $g\in D_{\A^\infty}^\times$ and $u\in U$.
  \end{itemize}
\end{definition}
```

## Miniproject: Hecke Operators
- Source: `HeckeOperatorProject.tex` -> `HeckeOperators.lean`
- Scanned nodes: 43
- Open work: 4 source-side formalization items need attention (4 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `nolean-compactopen-GL2` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{nolean-compactopen-GL2}`.
  - source:
```tex
\begin{lemma} $GL_2(\calO_v)$ is a compact open subgroup of $GL_2(K_v)$.
  \label{nolean-compactopen-GL2}
\end{lemma}
```
- [ ] `nolean-compactopen-U1p` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{nolean-compactopen-U1p}`.
  - source:
```tex
\begin{lemma}
  \label{nolean-compactopen-U1p} $U_v$ is a compact open subgroup of $GL_2(K_v)$.
\end{lemma}
```
- [ ] `nolean-hecke-algebra-commutative-noetherian` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{nolean-hecke-algebra-commutative-noetherian}`.
  - source:
```tex
\begin{theorem}
  \label{nolean-hecke-algebra-commutative-noetherian}
  Say~$R$ is a Noetherian ring. Then the subalgebra of the $R$-linear endomorphisms
  of $A^U$ generated by the Hecke operators $T_v$ for $v\notin S$ and $U_{v,\alpha}$ for $v\in S$
  is a Noetherian commutative ring.
\end{theorem}
```
- [ ] `nolean-product-of-U-alpha` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{nolean-product-of-U-alpha}`.
  - source:
```tex
\begin{lemma}
  \label{nolean-product-of-U-alpha}
  If $v\in S$ and $\begin{pmatrix}1&*\\0&1\end{pmatrix}\subseteq\Gamma_v\subseteq\begin{pmatrix}*&*\\0&*\end{pmatrix}$
  then $U_{\alpha,v}U_{\beta,v}=U_{\alpha\beta,v}$.
\end{lemma}
```
- Representative source:
```tex
\begin{lemma} $GL_2(\calO_v)$ is a compact open subgroup of $GL_2(K_v)$.
  \label{nolean-compactopen-GL2}
\end{lemma}
```

## Appendix: A collection of results which are needed in the proof.
- Source: `chtopbestiary.tex` -> `Bestiary.lean`
- Scanned nodes: 43
- Open work: 29 source-side formalization items need attention (29 missing source `\lean{...}` targets, 0 placeholder Lean targets, 0 unfinished proof sketches).
- Tasks:
- [ ] `maximal_unramified_extension_of_p-adic_field` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{maximal_unramified_extension_of_p-adic_field}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{maximal_unramified_extension_of_p-adic_field}\notready The maximal unramified extension $K^{un}$ in a given algebraic closure of $K$
    is Galois over $K$ with Galois group ``canonically'' isomorphic to $\widehat{\Z}$ in two ways; one of these two isomorphisms identifies $1\in\widehat{\Z}$ with an arithmetic Frobenius (the endomorphism inducing $x\mapsto x^q$ on the residue field of $K^{un}$, where $q$ is the size of the residue field of $K$). The other identifies 1 with geometric Frobenius (defined to be the inverse of arithmetic Frobenius).
\end{theorem}
```
- [ ] `local_Weil_group` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_Weil_group}`; uses: `\uses{maximal_unramified_extension_of_p-adic_field}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{local_Weil_group}\uses{maximal_unramified_extension_of_p-adic_field}\notready The topological group described above is called the \emph{Weil group} of $K$.
\end{definition}
```
- [ ] `local_class_field_theory` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_class_field_theory}`; uses: `\uses{local_Weil_group}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{local_class_field_theory}\uses{local_Weil_group}\notready If $K$ is a finite extension of $\Q_p$ then there are two ``canonical'' isomorphisms of topological abelian groups, between $K^\times$ and the abelianisation of the Weil group of $K$.
\end{theorem}
```
- [ ] `local_galois_coh_finite` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_galois_coh_finite}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}
    \label{local_galois_coh_finite}
    \notready
    If $M$ is finite then the cohomology groups $H^i(G_K,M)$ all finite.
\end{theorem}
```
- [ ] `local_galois_coh_dim_two` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_galois_coh_dim_two}`; flags: `\notready`.
  - source:
```tex
\begin{theorem} ["the dimension is 2"]\label{local_galois_coh_dim_two}\notready
  If $M$ is torsion then $H^i(G_K,M)=0$ if $i>2$.
\end{theorem}
```
- [ ] `local_galois_coh_top_degree` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_galois_coh_top_degree}`; flags: `\notready`.
  - source:
```tex
\begin{theorem} ["top degree"]
    \label{local_galois_coh_top_degree}
    \notready
    $H^2(G_K,\mu_n)$ is ``canonically'' isomorphic to $\Z/n\Z$.
\end{theorem}
```
- [ ] `local_galois_coh_poincare` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_galois_coh_poincare}`; flags: `\notready`.
  - source:
```tex
\begin{theorem} ["Poincar\'e duality"]\label{local_galois_coh_poincare}\notready
    If $\mu=\bigcup_{n\geq1}\mu_n$ and $M':=\Hom(M,\mu)$ is the dual of $M$ then for
    $0\leq i\leq 2$ the cup product pairing $H^i(G_K,M)\times H^{2-i}(G_K,M')\to H^2(G_K,\mu)=\Q/\Z$ is perfect.
\end{theorem}
```
- [ ] `local_galois_coh_euler_poincare` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{local_galois_coh_euler_poincare}`; flags: `\notready`.
  - source:
```tex
\begin{theorem} ["Euler-Poincar\'e characteristic"]\label{local_galois_coh_euler_poincare}\notready
    If $h^i(M)$ denotes the order of $H^i(G_K,M)$ then $h^0(M)-h^1(M)+h^2(M)=0$.
\end{theorem}
```
- [ ] `global_class_field_theory` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{global_class_field_theory}`; uses: `\uses{local_class_field_theory}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{global_class_field_theory}\uses{local_class_field_theory}\notready If $N$ is a finite extension of $\Q$ then there are two ``canonical'' isomorphisms of topological groups between the profinite abelian groups $\pi_0(\A_N^\times/N^\times)$ and $\GN^{\ab}$; one sends local uniformisers to arithmetic Frobenii and the other to geometric Frobenii; each of the global isomorphisms is compatible with the local isomorphisms above.
\end{theorem}
```
- [ ] `Skinner_Wiles_CFT_trick` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{Skinner_Wiles_CFT_trick}`; uses: `\uses{global_class_field_theory}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{Skinner_Wiles_CFT_trick}\uses{global_class_field_theory}\notready Let $S$ be a finite set of places of a number field $K$ . For each $v \in S$
let $L_v/K_v$ be a finite Galois extension. Then there is a finite solvable Galois extension
$L/K$ such that if $w$ is a place of $L$ dividing $v \in S$, then $L_w/K_v$ is isomorphic to $L_v/K_v$ as $K_v$-algebra. Moreover, if $K^{\avoid} /K$ is
any finite extension then we can choose $L$ to be linearly disjoint from $K^{\avoid}$.
\end{theorem}
```
- [ ] `topology_on_affine_variety_points` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{topology_on_affine_variety_points}`.
  - source:
```tex
\begin{definition}\label{topology_on_affine_variety_points} If $X$ is an affine scheme of finite
    type over $K$, and if $R$ is a $K$-algebra which is also a topological ring, then we define a topology on the $R$-points $X(R)$ of $K$ by embedding the $K$-algebra homomorphisms from $A$ to $R$ into the set-theoretic maps from $A$ to $R$ with its product topology, and giving it the subspace topology.
\end{definition}
```
- [ ] `topology_on_affine_variety_computation` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{topology_on_affine_variety_computation}`; uses: `\uses{topology_on_affine_variety_points}`.
  - source:
```tex
\begin{theorem}\label{topology_on_affine_variety_computation}\uses{topology_on_affine_variety_points}
    If $X$ is as above and $X\to\mathbb{A}^n_K$ is a closed immersion, then the induced map from $X(R)$ with its topology as above to $R^n$ is an embedding of topological spaces (that is, a homeomorphism onto its image).
\end{theorem}
```
- [ ] `manifold_on_algebraic_variety_points` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{manifold_on_algebraic_variety_points}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{manifold_on_algebraic_variety_points}\notready Let $K$ be a field equipped with an isomorphism to the reals, complexes, or a finite extension of the $p$-adic numbers. Let $X$ be a smooth affine algebraic variety over $K$. Then the points $X(K)$ naturally inherit the structure of a manifold over $K$.
\end{definition}
```
- [ ] `manifold_on_algebraic_variety_computation` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{manifold_on_algebraic_variety_computation}`; uses: `\uses{manifold_on_algebraic_variety_points}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{manifold_on_algebraic_variety_computation}\uses{manifold_on_algebraic_variety_points}\notready
    If $X$ is as in the previous definition and $X\to\mathbb{A}^n_K$ is a closed immersion, then the induced map from $X(K)$ with its manifold structure to $K^n$ is an embedding of manifolds.
\end{theorem}
```
- [ ] `lie_group_from_algebraic_group` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{lie_group_from_algebraic_group}`; uses: `\uses{manifold_on_algebraic_variety_computation}`; flags: `\notready`.
  - source:
```tex
\begin{corollary}\label{lie_group_from_algebraic_group}\uses{manifold_on_algebraic_variety_computation}\notready
    If $G$ is an affine algebraic group of finite type over $K=\R$ or $\bbC$ then $G(K)$ is naturally a real or complex Lie group.
\end{corollary}
```
- [ ] `connected_reductive_group` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{connected_reductive_group}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{connected_reductive_group}\notready An affine algebraic group~$G$ of finite type over a field~$k$ is said to be \emph{connected} if it is connected as a scheme, and \emph{reductive} if $G_{\overline{k}}$ has no nontrivial smooth connected unipotent normal $k$-subgroup.
\end{definition}
```
- [ ] `slowly_increasing` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{slowly_increasing}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{slowly_increasing}\notready A function $f : G(N_\infty)\to\bbC$ is \emph{slowly-increasing} if there exists some $C>0$
    and $n\geq1$ such that $|f(x)\leq C||x||_\rho^n$.
\end{definition}
```
- [ ] `slowly_increasing_well_defined` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{slowly_increasing_well_defined}`; uses: `\uses{slowly_increasing}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{slowly_increasing_well_defined}\uses{slowly_increasing}\notready This is independent of the choice of $\rho$ as above.
\end{theorem}
```
- [ ] `automorphic_form` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{automorphic_form}`; uses: `\uses{slowly_increasing_well_defined,connected_reductive_group, lie_group_from_algebraic_group, topology_on_affine_variety_computation}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{automorphic_form}\uses{slowly_increasing_well_defined,connected_reductive_group, lie_group_from_algebraic_group, topology_on_affine_variety_computation}\notready An \emph{automorphic form} is a function $\phi:G(\A_N)\to\bbC$ satisfying the following conditions:
    \begin{itemize}
        \item $\phi$ is locally constant on $G(\A_N^f)$ and $C^\infty$ on $G(N_\infty)$. In other words, for every $g_\infty$, $\phi(-,g_\infty)$ is locally constant, and for every $g_f$, $\phi(g_f,-)$ is smooth.
        \item $\phi$ is left-invariant under $G(N)$;
        \item $\phi$ is right-$U_\infty$-finite (that is, the space spanned by $x\mapsto \phi(xu)$ as $u$ varies over $U_\infty$ is finite-dimensional);
        \item $\phi$ is right $K_f$-finite, where $K_f$ is one (or equivalently all) compact open subgroups of $G(\A_N^f)$;
        \item $\phi$ is $\mathcal{z}$-finite, where $\mathcal{z}$ is the centre of the universal enveloping algebra of the Lie algebra of $G(N_\infty)$, acting via differential operators. Equivalently $\phi$ is annihiliated by a finite index ideal of this centre, so morally $\phi$ satisfies lots of differential equations of a certain type;
        \item For all $g_f$, the function $g_\infty\mapsto \phi(g_f g\infty)$ is slowly-increasing in the sense above.
    \end{itemize}
\end{definition}
```
- [ ] `cuspidal_automorphic_form` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{cuspidal_automorphic_form}`; uses: `\uses{automorphic_form}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{cuspidal_automorphic_form}\uses{automorphic_form}\notready An automorphic form is \emph{cuspidal} (or ``a cusp form'') if it furthermore satisfies $\int_{U(N)\backslash U(\A_N)}\phi(ux)du=0$, where $P$ runs through all the proper parabolic subgroups of $G$ defined over $N$ and $U$ is the unipotent radical of $P$, and the integral is with respect to the measure coming from Haar measure.
\end{definition}
```
- [ ] `automorphic_form_actions` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{automorphic_form_actions}`; uses: `\uses{automorphic_form}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{automorphic_form_actions}\uses{automorphic_form}\notready The group $G(\A_N)$ acts on itself on the right, and this induces a left action of its
    subgroup $G(\A_N^f)\times U_\infty$ on the spaces of automorphic forms and cusp forms. The Lie algebra $\mathfrak{g}$ of $G(N_\infty)$ also acts, via differential operators. Furthermore the actions of $\mathfrak{g}$ and $U_\infty$ are compatible in the sense that the differential of the $U_\infty$ action is the action of its Lie algebra considered as a subalgebra of $\mathfrak{g}$. We say that the spaces are $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-modules.
\end{definition}
```
- [ ] `cuspidal_automorphic_form_decomposition` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{cuspidal_automorphic_form_decomposition}`; uses: `\uses{cuspidal_automorphic_form, automorphic_form_actions}`.
  - source:
```tex
\begin{theorem}\label{cuspidal_automorphic_form_decomposition}\uses{cuspidal_automorphic_form, automorphic_form_actions} The cusp forms decompose as a (typically infinite) direct sum of irreducible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-modules.
\end{theorem}
```
- [ ] `cuspidal_automorphic_representation` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{cuspidal_automorphic_representation}`; uses: `\uses{cuspidal_automorphic_form_decomposition}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{cuspidal_automorphic_representation}\uses{cuspidal_automorphic_form_decomposition}\notready A cuspidal automorphic representation is an irreducible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-module isomorphic to an irreducible summand of the space of cusp forms.
\end{definition}
```
- [ ] `automorphic_representation` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{automorphic_representation}`; uses: `\uses{automorphic_form_actions}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{automorphic_representation}\uses{automorphic_form_actions}\notready An automorphic representation is an irreducible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-module isomorphic to an irreducible subquotient of the space of automorphic forms.
\end{definition}
```
- [ ] `automorphic_representation_local_decomposition` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{automorphic_representation_local_decomposition}`; uses: `\uses{automorphic_representation}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{automorphic_representation_local_decomposition}\uses{automorphic_representation}\notready An irreducible admissible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-module is a restricted tensor product of irreducible representations $\pi_v$ of $G(N_v)$ as $v$ runs through the finite places of $N$, tensored with a tensor product of irreducible $(\mathfrak{g}_v,U_{\infty,v})$-modules as $v$ runs through the infinite places of $N$. The representations $\pi_v$ are unramified for all but finitely many $v$.
\end{theorem}
```
- [ ] `compatible_family` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{compatible_family}`.
  - source:
```tex
\begin{definition}\label{compatible_family}\discussion{23} Let $N$ be a number field. A \emph{compatible family of $d$-dimensional Galois representations over $N$} is a finite set of finite places $S$ of $N$,
a number field $E$, a monic degree $d$ polynomial $F_{\p}(X)\in E[X]$ for each finite place $\p$ of $K$ not in $S$ and, for each prime number $\ell$ and field embedding $\phi : E\to\Qlbar$ (or essentially equivalently for each finite place of $E$), a continuous homomorphism $\rho:\GK\to\GL_2(\Qlbar)$ unramified outside $S$ and the primes of $K$ above $\ell$, such that $\rho(\Frob_\p)$ has characteristic polynomial $P_\pi(X)$ if $\pi$ lies above a prime number $p\not=\ell$ with $p\not\in S$.
\end{definition}
```
- [ ] `Galois_representation_from_automorphic_representation_on_GL_2_form` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{Galois_representation_from_automorphic_representation_on_GL_2_form}`; uses: `\uses{automorphic_representation,Shimura_varieties,compatible_family}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{Galois_representation_from_automorphic_representation_on_GL_2_form}\uses{automorphic_representation,Shimura_varieties,compatible_family}\notready Given an automorphic representation $\pi$ for an inner form of $\GL_2$ over a totally real field and with reflex field~$E$, such that $\pi$ is weight 2 discrete series at every infinite place, there exists a compatible family of 2-dimensional Galois representations associated to $\pi$, with $S$ being the places at which $\pi$ is ramified, and $F_{\p}(X)$ being the monic polynomial with roots the two Satake parameters for $\pi$ at $\p$.
\end{theorem}
```
- [ ] `Shimura_varieties` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{Shimura_varieties}`; flags: `\notready`.
  - source:
```tex
\begin{definition}\label{Shimura_varieties}\notready We need the definition of (the canonical model over $F$ of) the Shimura curve attached to an inner form of $\GL_2$ with precisely one split infinite place, and the same for the Shimura surface associated to an inner form split at two infinite places (and ramified elsewhere, so it's compact).
\end{definition}
```
- [ ] `moret-bailly` needs attention: no `\lean{...}` target.
  - metadata: labels: `\label{moret-bailly}`; flags: `\notready`.
  - source:
```tex
\begin{theorem}\label{moret-bailly}\notready Let $K^{\avoid}/K$ be a Galois extension of number fields. Suppose also
that $S$ is a finite set of places of $K$. For $v\in S$ let $L_v/K_v$ be a finite Galois extension.
Suppose also that $T /K$ is a smooth, geometrically connected curve and that for each
$v\in S$ we are given a nonempty, $\Gal(L_v/K_v)$-invariant, open subset $\Omega_v\subseteq (L_v)$.
Then there is a finite Galois extension $L/K$ and a point $P ∈ T (L)$ such that
\begin{itemize}
\item $L/K$ is Galois and linearly disjoint from $K^{\avoid}$ over $K$;
\item if $v\in S$ and $w$ is a prime of $L$ above $v$ then $L_w /K_v$ is isomorphic to $L_v/K_v$;
\item and $P \in\Omega_v\subseteq T (L_v) \cong (L_w)$ via one such $K_v$-algebra morphism
(this makes sense as $\Omega_v$ is $\Gal(L_v/K v)$-invariant).
```
- Representative source:
```tex
\begin{theorem}\label{maximal_unramified_extension_of_p-adic_field}\notready The maximal unramified extension $K^{un}$ in a given algebraic closure of $K$
    is Galois over $K$ with Galois group ``canonically'' isomorphic to $\widehat{\Z}$ in two ways; one of these two isomorphisms identifies $1\in\widehat{\Z}$ with an arithmetic Frobenius (the endomorphism inducing $x\mapsto x^q$ on the residue field of $K^{un}$, where $q$ is the size of the residue field of $K$). The other identifies 1 with geometric Frobenius (defined to be the inverse of arithmetic Frobenius).
\end{theorem}
```
