# TeX to Verso Porting Task Board

Generated from `FLT/blueprint/src/chapter/*.tex` by `scripts/update_porting_todo.py`.

This board is driven by source markers rather than stale cross-chapter match counts.
The harness migration is largely done: most direct-port chapters now keep the remaining open source in local `tex` blocks, and the main work left is selective chapter fidelity rather than broad infrastructure.
This board is not an LT certification report. Strict LT now also requires every translated informal block in the Verso chapter to sit next to a labeled `tex` witness block; check that separately with `python3 scripts/check_lt_source_pairs.py`.
It treats `\leanok` and `\mathlibok` as closed, and surfaces explicit `\notready`,
placeholder Lean targets, and unfinished proof sketches as open work.
When a source block is still open, keep the raw TeX nearby in a labeled `tex` block instead of rewriting it into placeholder prose.

## Snapshot
- Mapped TeX chapters scanned: 16
- Source nodes scanned: 501
- Chapters with open work: 14
- Open source nodes: 288

## Introduction
- Source: `ch01introduction.tex` -> `Introduction.lean`
- Scanned nodes: 0
- [x] No formal statements or proof sketches are currently flagged as open in the source.
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
- Open work: 12 source nodes need port attention (10 formal statements, 2 proof sketches).
- Tasks:
- [ ] `FermatLastTheorem.of_odd_primes` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FermatLastTheorem.of_odd_primes}`; lean: `\lean{FermatLastTheorem.of_odd_primes}`.
  - source:
```tex
\begin{lemma}\label{FermatLastTheorem.of_odd_primes}\lean{FermatLastTheorem.of_odd_primes}\leanok
  If there is a counterexample to Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$
  with $p$ an odd prime.
\end{lemma}
```
- [ ] `fermatLastTheoremThree` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{fermatLastTheoremThree}`; lean: `\lean{fermatLastTheoremThree}`.
  - source:
```tex
\begin{lemma}\label{fermatLastTheoremThree}\lean{fermatLastTheoremThree}\leanok
\discussion{16}
  There are no solutions in positive integers to $a^3+b^3=c^3$.
\end{lemma}
```
- [ ] `FermatLastTheorem.of_p_ge_5` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FermatLastTheorem.of_p_ge_5}`; lean: `\lean{FermatLastTheorem.of_p_ge_5}`.
  - source:
```tex
\begin{corollary}\label{FermatLastTheorem.of_p_ge_5}\lean{FermatLastTheorem.of_p_ge_5}\leanok If there is a counterexample to
  Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$ with $p$ prime and $p\geq 5$.
\end{corollary}
```
- [ ] `FreyPackage` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FreyPackage}`; lean: `\lean{FreyPackage}`.
  - source:
```tex
\begin{definition}\label{FreyPackage}\lean{FreyPackage}\leanok A \emph{Frey package} $(a,b,c,p)$
is three nonzero pairwise-coprime integers $a$, $b$, $c$, with $a\equiv3\pmod4$ and $b\equiv0\pmod2$,
and a prime $p\geq5$, such that $a^p+b^p=c^p$.\end{definition}
```
- [ ] `FreyPackage.of_not_FermatLastTheorem_p_ge_5` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FreyPackage.of_not_FermatLastTheorem_p_ge_5}`; lean: `\lean{FreyPackage.of_not_FermatLastTheorem_p_ge_5}`.
  - source:
```tex
\begin{lemma}
  \label{FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \lean{FreyPackage.of_not_FermatLastTheorem_p_ge_5}
  \leanok
  \discussion{19}
  If Fermat's Last Theorem is false for $p \ge 5$ and prime, then there exists a Frey package.
\end{lemma}
```
- [ ] `FreyCurve` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FreyCurve}`; lean: `\lean{FreyPackage.freyCurve}`; uses: `\uses{FreyPackage}`.
  - source:
```tex
\begin{definition}[Frey]
  \label{FreyCurve}
  \lean{FreyPackage.freyCurve}
  \uses{FreyPackage}\discussion{21}
  \leanok
  Given a Frey package $(a,b,c,p)$, the corresponding \emph{Frey curve} (considered by Frey and,
  before him, Hellegouarch) is the elliptic curve over $\Q$ defined by the equation
  $Y^2=X(X-a^p)(X+b^p).$
\end{definition}
```
- [ ] `Mazur_Frey` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Mazur_Frey}`; lean: `\lean{Mazur_Frey}`; uses: `\uses{FreyCurve}`.
  - source:
```tex
\begin{theorem}[Mazur]
  \label{Mazur_Frey}
  \lean{Mazur_Frey}
  \uses{FreyCurve}
  \leanok
  If $\rho$ is the mod $p$ Galois representation associated to a Frey package $(a,b,c,p)$ then
  $\rho$ is irreducible.
\end{theorem}
```
- [ ] `proof @180` needs attention: proof sketch still reads as unfinished.
  - metadata: uses: `\uses{Frey_curve_irreducible}`.
  - source:
```tex
\begin{proof}
  \uses{Frey_curve_irreducible}
  \notready
  This follows from a profound and long result of Mazur \cite{mazur-torsion} from 1977,
  namely the fact that the torsion subgroup of an elliptic curve over $\Q$ can have size at most~16.
  In fact there is still a little more work which needs to be done to deduce the theorem from
  Mazur's result. A pre-1990 reference for the full proof of this claim is Proposition~6
  in~\S4.1 of~\cite{serreconj}.
\end{proof}
```
- [ ] `Wiles_Frey` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Wiles_Frey}`; lean: `\lean{Wiles_Frey}`; uses: `\uses{FreyCurve}`.
  - source:
```tex
\begin{theorem}[Wiles,Taylor--Wiles, Ribet,\ldots]
  \label{Wiles_Frey}
  \lean{Wiles_Frey}
  \uses{FreyCurve}
  \leanok
  If $\rho$ is the mod $p$ Galois representation associated to a Frey package $(a,b,c,p)$ then
  $\rho$ is reducible.
\end{theorem}
```
- [ ] `proof @202` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
%  \uses{modularity_lifting_theorem,frey_curve_hardly_ramified,moret-bailly}
  This is the main content of Wiles' magnum opus.
  We omit the argument for now, although later on in this project
  we will have a lot to say about a proof of this.
\end{proof}
```
- [ ] `FreyPackage.false` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FreyPackage.false}`; lean: `\lean{FreyPackage.false}`; uses: `\uses{Mazur_Frey, Wiles_Frey}`.
  - source:
```tex
\begin{corollary}
  \label{FreyPackage.false}
  \lean{FreyPackage.false}
  \uses{Mazur_Frey, Wiles_Frey}
  \leanok
  There is no Frey package.
\end{corollary}
```
- [ ] `FLT` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FLT}`; lean: `\lean{Wiles_Taylor_Wiles}`.
  - source:
```tex
\begin{corollary}
  \label{FLT}
  \lean{Wiles_Taylor_Wiles}
  \leanok
  Fermat's Last Theorem is true. In other words, there are no positive integers $a,b,c$ and
  natural $n\geq3$ such that $a^n+b^n=c^n$.
\end{corollary}
```
- Representative source:
```tex
\begin{lemma}\label{FermatLastTheorem.of_odd_primes}\lean{FermatLastTheorem.of_odd_primes}\leanok
  If there is a counterexample to Fermat's Last Theorem, then there is a counterexample $a^p+b^p=c^p$
  with $p$ an odd prime.
\end{lemma}
```

## Elliptic curves, and the Frey Curve
- Source: `ch03freyold.tex` -> `EllipticFrey.lean`
- Scanned nodes: 66
- Open work: 36 source nodes need port attention (33 formal statements, 3 proof sketches).
- Tasks:
- [ ] `WeierstrassCurve.n_torsion_card` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{WeierstrassCurve.n_torsion_card}`; lean: `\lean{WeierstrassCurve.n_torsion_card}`.
  - source:
```tex
\begin{theorem}\label{WeierstrassCurve.n_torsion_card}\lean{WeierstrassCurve.n_torsion_card}\notready
  Let $n$ be a positive integer, let $F$ be a separably closed
  field with $n$ nonzero in $F$, and let $E$ be an elliptic curve over $F$. Then the $n$-torsion $E(K)[n]$
  in the $F$-points of $E$ is a finite group of size $n^2$.
\end{theorem}
```
- [ ] `group_theory_lemma` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{group_theory_lemma}`; lean: `\lean{group_theory_lemma}`.
  - source:
```tex
\begin{lemma}\label{group_theory_lemma}\lean{group_theory_lemma}
  Say $n$ is a positive integer, $r$ is a natural, and $A$ is an abelian group. Assume that for all $d\mid n$, the $d$-torsion $A[d]$ of $A$ has size $d^r$. Then $A[n]\cong (\Z/n\Z)^r$.
\end{lemma}
```
- [ ] `Elliptic_curve_n_torsion_2d` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Elliptic_curve_n_torsion_2d}`; lean: `\lean{WeierstrassCurve.n_torsion_dimension}`.
  - source:
```tex
\begin{corollary}\label{Elliptic_curve_n_torsion_2d}\lean{WeierstrassCurve.n_torsion_dimension}\leanok
  Let $n$ be a positive integer, let $F$ be a separably closed
  field with $n$ nonzero in $F$, and let $E$ be an elliptic curve over $F$. Then the $n$-torsion $E(F)[n]$
  in the $F$-points of $E$ is a finite group isomorphic to $(\Z/n\Z)^2$.
\end{corollary}
```
- [ ] `Elliptic_curve_det_n_torsion` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Elliptic_curve_det_n_torsion}`; uses: `\uses{Elliptic_curve_n_torsion_2d}`.
  - source:
```tex
\begin{theorem}\label{Elliptic_curve_det_n_torsion}\uses{Elliptic_curve_n_torsion_2d} If $E$ is an elliptic curve over a field $k$, and $n$ is a positive integer which is nonzero in $k$, then the determinant of the 2-dimensional representation of $\Gal(k^{\sep}/k)$ on $E(k^{\sep})[n]$ is the mod $n$ cyclotomic character.
\end{theorem}
```
- [ ] `proof @46` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
  This presumably should be done via the Weil pairing. I have not yet put any thought into a feasible way to formalise this.
\end{proof}
```
- [ ] `EllipticCurve.GoodReduction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{EllipticCurve.GoodReduction}`.
  - source:
```tex
\begin{definition}\label{EllipticCurve.GoodReduction} Let $E$ be an elliptic curve over the field of fractions $K$ of a valuation ring $R$ with maximal ideal $\m$. We say $E$ has \emph{good reduction over $R$} if $E$ has a model with
coefficients in $R$ and the reduction mod $\m$ is still non-singular. If $E$ is an elliptic curve
over a number field $N$ and $P$ is a maximal ideal of its integer ring $\calO_N$, then one says that $E$ has \emph{good reduction at $P$} if $E$ has good reduction over the $\calO_{N,P}$, the localisation of $\calO_N$ at $P$.
\end{definition}
```
- [ ] `Frey_curve_good_reduction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_good_reduction}`; uses: `\uses{FreyCurve, EllipticCurve.GoodReduction}`.
  - source:
```tex
\begin{lemma}\label{Frey_curve_good_reduction}\uses{FreyCurve, EllipticCurve.GoodReduction} If $E$ is the Frey curve $Y^2=X(X-a^\ell)(X+b^\ell)$ associated to a
  Frey package $(a,b,c,\ell)$, and if $p$ is a prime
  not dividing $abc$ (and in particular if $p>2$), then $E$ has good reduction at~$p$.
\end{lemma}
```
- [ ] `finite_flat_group_scheme` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{finite_flat_group_scheme}`.
  - source:
```tex
\begin{definition}\label{finite_flat_group_scheme} If $R$ is a commutative ring, then
  a \emph{finite flat group scheme} over $R$ is the spectrum of a commutative Hopf algebra $H/R$
  which is finite and flat as an $R$-module.
\end{definition}
```
- [ ] `good_reduction_implies_unramified` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{good_reduction_implies_unramified}`.
  - source:
```tex
\begin{theorem}\label{good_reduction_implies_unramified}\notready If $E$ is an elliptic curve over a number
  field $N$ and $E$ has good reduction at a maximal ideal $P$ of $\calO_N$, and if furthermore
  $n\not\in P$, then the Galois representation on the $n$-torsion of $E$ is unramified.
\end{theorem}
```
- [ ] `good_reduction_implies_flat` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{good_reduction_implies_flat}`; uses: `\uses{finite_flat_group_scheme}`.
  - source:
```tex
\begin{theorem}\label{good_reduction_implies_flat}\uses{finite_flat_group_scheme}\notready If $E$ is an elliptic curve over a number field
  $N$ and $E$ has good reduction at a maximal ideal $P$ of $\calO_N$ containing the prime number $p$,
  then the Galois representation on the $p$-torsion of $E$ comes from a finite flat group scheme
  over the localisation $\calO_{N,P}$.
\end{theorem}
```
- [ ] `EllipticCurve.MultiplicativeReduction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{EllipticCurve.MultiplicativeReduction}`.
  - source:
```tex
\begin{definition}\label{EllipticCurve.MultiplicativeReduction} Let $E$ be an elliptic curve over the field of fractions $K$ of a valuation ring $R$ with maximal ideal $\m$. We say $E$ has \emph{multiplicative reduction over $R$} if $E$ has a model with coefficients in $R$ and which reduces mod $R/\m$ to a plane cubic with one singularity, which is an ordinary double point.
  We say that the reduction is \emph{split} if the two tangent lines at the ordinary double point
  are both defined over $R/\m$, and \emph{non-split} otherwise.
\end{definition}
```
- [ ] `Frey_curve_mult_reduction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_mult_reduction}`; uses: `\uses{EllipticCurve.MultiplicativeReduction}`.
  - source:
```tex
\begin{lemma}\label{Frey_curve_mult_reduction}\uses{EllipticCurve.MultiplicativeReduction} If $E$ is the Frey curve $Y^2=X(X-a^\ell)(X+b^\ell)$ associated to a Frey
  package $(a,b,c,\ell)$, and if $p$ is an odd prime
  which divides $abc$, then $E$ has multiplicative reduction at~$p$.
\end{lemma}
```
- [ ] `Frey_curve_mult_reduction_at_two` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_mult_reduction_at_two}`; uses: `\uses{EllipticCurve.MultiplicativeReduction}`.
  - source:
```tex
\begin{lemma}\label{Frey_curve_mult_reduction_at_two}\uses{EllipticCurve.MultiplicativeReduction}  If $E$ is the Frey curve $Y^2=X(X-a^\ell)(X+b^\ell)$ associated to a Frey package
  $(a,b,c,\ell)$ then $E$ has multiplicative reduction at 2.
\end{lemma}
```
- [ ] `Tate_curve_uniformisation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Tate_curve_uniformisation}`; uses: `\uses{EllipticCurve.MultiplicativeReduction}`.
  - source:
```tex
\begin{theorem}\label{Tate_curve_uniformisation}\uses{EllipticCurve.MultiplicativeReduction}\notready If $E$ is an elliptic curve over a field
  complete with respect to a nontrivial nonarchimedean (real-valued) norm $K$ and if $E$ has split
  multiplicative reduction, then there is a Galois-equivariant injection
  $(K^{\sep})^\times/q^{\mathbb{Z}}\to E(K^{\sep})$, where $q\in K^\times$ satisfies
  $|q|=|j(E)|^{-1}$.
\end{theorem}
```
- [ ] `multiplicative_reduction_torsion` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{multiplicative_reduction_torsion}`.
  - source:
```tex
\begin{corollary}\label{multiplicative_reduction_torsion} If $E$ is an elliptic curve
  over a field $K$ complete with respect to a nontrivial nonarchimedean (real-valued) norm
  and with perfect residue field, and if $E$ has multiplicative reduction, then there's
  an unramified character $\chi$ of $\Gal(K^{\sep}/K)$ whose square is 1, such that for
  all positive integers $n$ with $n\not=0$ in $K$, the
  $n$-torsion $E(K^{\sep})[n]$ is an extension of $\chi$ by $\epsilon\chi$, where $\epsilon$ is the
  cyclotomic character. Furthermore, the element of $K^\times/(K^\times)^\ell$ corresponding
  to this extension is given by the $q$-invariant of the curve.
\end{corollary}
```
- [ ] `hardly_ramified` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified}`.
  - source:
```tex
\begin{definition}\label{hardly_ramified}\notready Let $\ell\geq5$ be a prime and let $V$ be a
  2-dimensional vector space over $\Z/\ell\Z$. A representation
  $\rho: \GQ\to \GL(V)$ is said to be \emph{hardly ramified} if it satisfies the following four axioms:
  \begin{enumerate}
  \item $\det(\rho)$ is the mod $\ell$ cyclotomic character;
  \item $\rho$ is unramified outside $2\ell$;
  \item The semisimplification of the restriction of $\rho$ to $\Gal(\Qbar_2/\Q_2)$ is unramified;
  \item The restriction of $\rho$ to $\GQl$ comes from a finite flat group scheme.
  \end{enumerate}
\end{definition}
```
- [ ] `Frey_curve_good` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_good}`.
  - source:
```tex
 \begin{theorem}\label{Frey_curve_good}\notready If $p\not=\ell$ is a prime not dividing $abc$ then
  $\rho$ is unramified at~$p$.
 \end{theorem}
```
- [ ] `Frey_curve_j` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_j}`; lean: `\lean{FreyCurve.j}`; uses: `\uses{FreyCurve}`.
  - source:
```tex
\begin{theorem}\label{Frey_curve_j}\lean{FreyCurve.j}\leanok\uses{FreyCurve} If $(a,b,c,\ell)$ is a Frey package then the $j$-invariant of the corresponding Frey curve is $2^8(C^2-AB)^3/A^2B^2C^2$, where $A=a^\ell$, $B=b^\ell$ and $C=c^\ell$.
\end{theorem}
```
- [ ] `proof @220` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
  \leanok
  Apply the explicit formula (presumably already in mathlib)
\end{proof}
```
- [ ] `FreyCurve.j_valuation_of_bad_prime` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FreyCurve.j_valuation_of_bad_prime}`; lean: `\lean{FreyCurve.j_valuation_of_bad_prime}`; uses: `\uses{Frey_curve_j}`.
  - source:
```tex
\begin{corollary}
  \label{FreyCurve.j_valuation_of_bad_prime}
  \lean{FreyCurve.j_valuation_of_bad_prime}
  \uses{Frey_curve_j}\leanok
  If $(a,b,c,\ell)$ is a Frey package and the $j$-invariant of the corresponding Frey curve is $j$, and if $2<p\mid abc$, then the $p$-adic valuation $v_p(j)$ of $j$ is a multiple of $\ell$.
\end{corollary}
```
- [ ] `Frey_curve_unram` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_unram}`.
  - source:
```tex
\begin{corollary}\label{Frey_curve_unram}\notready If $(a,b,c,\ell)$ is a Frey package, if $2<p\mid abc$
  is a prime with $p\not=\ell$, then the $\ell$-torsion in the Frey curve is unramified
  at $p$.
\end{corollary}
```
- [ ] `frey_curve_unramified` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{frey_curve_unramified}`.
  - source:
```tex
\begin{corollary}\label{frey_curve_unramified}\notready If $(a,b,c,\ell)$ is a Frey package, then the $\ell$-torsion in the Frey curve is unramified at all primes $p\not=2,\ell$.
\end{corollary}
```
- [ ] `frey_curve_at_2` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{frey_curve_at_2}`.
  - source:
```tex
\begin{corollary}\label{frey_curve_at_2}\notready If $(a,b,c,\ell)$ is a Frey package, then the
  semisimplification of the restriction of the $\ell$-torsion $\rho$ in the associated Frey curve
  to $\Gal(\Qbar_2/\Q_2)$ is unramified.
\end{corollary}
```
- [ ] `Frey_curve_mod_ell_rep_at_ell` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_mod_ell_rep_at_ell}`; uses: `\uses{finite_flat_group_scheme}`.
  - source:
```tex
\begin{theorem}\label{Frey_curve_mod_ell_rep_at_ell}\uses{finite_flat_group_scheme}\notready Let $\rho$ be the $\ell$-torsion in the
  Frey curve associated to a Frey package $(a,b,c,\ell)$. Then the restriction of $\rho$ to $\GQl$ comes from a finite flat group scheme.
\end{theorem}
```
- [ ] `frey_curve_hardly_ramified` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{frey_curve_hardly_ramified}`; uses: `\uses{hardly_ramified}`.
  - source:
```tex
\begin{theorem}\label{frey_curve_hardly_ramified}\uses{hardly_ramified}\notready Let $\rho$ be the Galois representation on the
  $\ell$-torsion of the Frey curve coming from a Frey package $(a,b,c,\ell)$. Then $\rho$ is hardly
  ramified.
\end{theorem}
```
- [ ] `mazur` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{mazur}`.
  - source:
```tex
\begin{theorem}\label{mazur}\notready Let $E$ be an elliptic curve over $\Q$. Then the torsion subgroup
  of $E$ has size at most 16.
\end{theorem}
```
- [ ] `proof @309` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}\notready
  This is the main theorem of~\cite{mazur-torsion}. Formalising this result will be a highly
  non-trivial project; note that this theorem is used in all known proofs of FLT, so there
  seems to be no way around it.
\end{proof}
```
- [ ] `Frey_characters_are_unramified` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_characters_are_unramified}`.
  - source:
```tex
\begin{theorem}\label{Frey_characters_are_unramified}\notready With notation as above, the characters
  $\alpha$ and $\beta$ are unramified at $p$ for all primes $p\not=\ell$.
\end{theorem}
```
- [ ] `Frey_characters_at_ell` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_characters_at_ell}`.
  - source:
```tex
\begin{theorem}\label{Frey_characters_at_ell}\notready One of $\alpha$ and $\beta$ is unramified at $\ell$.
\end{theorem}
```
- [ ] `Frey_characters_trivial` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_characters_trivial}`.
  - source:
```tex
\begin{corollary}\label{Frey_characters_trivial} One of $\alpha$ and $\beta$ is trivial.
\end{corollary}
```
- [ ] `Frey_curve_reducible_structure` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_reducible_structure}`.
  - source:
```tex
\begin{theorem}\label{Frey_curve_reducible_structure}\notready If $\rho$ is reducible, then either $\rho$
  has a trivial 1-dimensional submodule or a trivial 1-dimensional quotient (here ``trivial'' means
  that the Galois group $\GQ$ acts trivially).
\end{theorem}
```
- [ ] `Frey_curve_trivial_submodule` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_trivial_submodule}`.
  - source:
```tex
\begin{lemma}\label{Frey_curve_trivial_submodule} If $\rho$ has a trivial 1-dimensional submodule then the
  Frey curve has a non-trivial point of order $\ell$.
\end{lemma}
```
- [ ] `Frey_curve_no_trivial_submodule` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_no_trivial_submodule}`.
  - source:
```tex
\begin{corollary}\label{Frey_curve_no_trivial_submodule} $\rho$ cannot have a trivial 1-dimensional submodule.
\end{corollary}
```
- [ ] `Elliptic_curve_quotient_by_finite_subgroup` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Elliptic_curve_quotient_by_finite_subgroup}`.
  - source:
```tex
\begin{theorem}\label{Elliptic_curve_quotient_by_finite_subgroup}\notready If $p$ is a prime and
  if $E$ is an elliptic curve over a field $K$ of characteristic not equal to $p$,
   and if $C\subseteq E(K^{\sep})[p]$ is a Galois-stable
  subgroup of order $p$, then there's an elliptic curve $E':=$``$E/C$'' over $K$ and an isogeny of elliptic
  curves $E\to E'$ over $K$ inducing a Galois-equivariant surjection $E(K^{\sep})\to E'(K^{\sep})$
  with kernel precisely $C$.
\end{theorem}
```
- [ ] `Frey_curve_no_trivial_quotient` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_no_trivial_quotient}`.
  - source:
```tex
\begin{corollary}\label{Frey_curve_no_trivial_quotient} $\rho$ cannot have a trivial 1-dimensional quotient.
\end{corollary}
```
- [ ] `Frey_curve_irreducible` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_irreducible}`.
  - source:
```tex
\begin{theorem}\label{Frey_curve_irreducible} The $\ell$-torsion in the Frey curve associated to a Frey package $(a,b,c,\ell)$ is irreducible.
\end{theorem}
```
- Representative source:
```tex
\begin{theorem}\label{WeierstrassCurve.n_torsion_card}\lean{WeierstrassCurve.n_torsion_card}\notready
  Let $n$ be a positive integer, let $F$ be a separably closed
  field with $n$ nonzero in $F$, and let $E$ be an elliptic curve over $F$. Then the $n$-torsion $E(K)[n]$
  in the $F$-points of $E$ is a finite group of size $n^2$.
\end{theorem}
```

## Reducibility of {\it p
- Source: `ch03freyreduction.tex` -> `HardlyRamified.lean`
- Scanned nodes: 16
- Open work: 12 source nodes need port attention (8 formal statements, 4 proof sketches).
- Tasks:
- [ ] `hardly_ramified` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified}`; lean: `\lean{GaloisRepresentation.IsHardlyRamified}`.
  - source:
```tex
\begin{definition}
  \lean{GaloisRepresentation.IsHardlyRamified}
  \label{hardly_ramified}
  \leanok
  Let $R$ be a coefficient ring with finite residue field of characteristic $\ell\geq3$.
  Let $V$ be a finite free $R$-module of rank~2, equipped with the product topology. A
  continuous representation $\rho: \GQ\to \GL_R(V)$ is said to be \emph{hardly ramified} if it
  satisfies the following four conditions:
  \begin{enumerate}
  \item $\det(\rho):\GQ\to R^\times$ is the cyclotomic character;
```
- [ ] `Frey_curve_hardly_ramified` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Frey_curve_hardly_ramified}`; lean: `\lean{FreyCurve.torsion_isHardlyRamified}`; uses: `\uses{hardly_ramified}`.
  - source:
```tex
\begin{theorem}
  \lean{FreyCurve.torsion_isHardlyRamified}
  \label{Frey_curve_hardly_ramified}
  \uses{hardly_ramified}
  \leanok
  The $\ell$-torsion $\rho:\GQ\to\GL_2(\Z/\ell\Z)$ in the Frey curve associated to a Frey
  package $(a,b,c,\ell)$ is hardly ramified.
\end{theorem}
```
- [ ] `hardly_ramified_reducible` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified_reducible}`; lean: `\lean{FreyCurve.torsion_not_isIrreducible}`.
  - source:
```tex
\begin{theorem}
  \lean{FreyCurve.torsion_not_isIrreducible}
  \label{hardly_ramified_reducible}
  \leanok
  If $\ell\geq 3$ is a prime and $\rho:\GQ\to\GL_2(\Z/\ell\Z)$ is hardly ramified,
  then $\rho$ is reducible.
\end{theorem}
```
- [ ] `Wiles_Frey_again` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Wiles_Frey_again}`; lean: `\lean{Wiles_Frey}`.
  - source:
```tex
\begin{theorem}
  \label{Wiles_Frey_again}
  \lean{Wiles_Frey}
  \leanok
  If $\overline{\rho}$ is the mod $p$ Galois representation associated to a Frey package $(a,b,c,p)$ then
  $\overline{\rho}$ is reducible.
\end{theorem}
```
- [ ] `hardly_ramified_lifts` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified_lifts}`; lean: `\lean{GaloisRepresentation.IsHardlyRamified.lifts}`; uses: `\uses{hardly_ramified}`.
  - source:
```tex
\begin{theorem}
  \lean{GaloisRepresentation.IsHardlyRamified.lifts}
  \label{hardly_ramified_lifts}
  \uses{hardly_ramified}
  \leanok
  If $\ell\geq3$ is prime and $\overline{\rho}:\GQ\to\GL_2(\Z/\ell\Z)$
  is hardly ramified and irreducible, then there exists a finite extension~$K$ of $\Q_\ell$
  with integer ring~$\calO$ and maximal ideal $\mathfrak{m}$
  and a hardly ramified representation
  $\rho:\GQ\to\GL_2(\calO)$ whose reduction modulo~$\m$ is isomorphic to $\rho$.
```
- [ ] `proof @177` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
  Omitted for now {\bf TODO}
\end{proof}
```
- [ ] `hardly_ramified_spreads_out` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified_spreads_out}`; lean: `\lean{GaloisRepresentation.IsHardlyRamified.mem_isCompatible}`; uses: `\uses{hardly_ramified}`.
  - source:
```tex
\begin{theorem}
  \lean{GaloisRepresentation.IsHardlyRamified.mem_isCompatible}
  \label{hardly_ramified_spreads_out}
  \uses{hardly_ramified}
  \leanok
  If $\ell\geq3$ is prime, $K$ is a finite extension of $\Q_\ell$
  with integers $\calO$ and if $\rho:\GQ\to\GL_2(\calO)$ is a hardly ramified representation
  whose reduction is irreducible,
  then there exists a number field $M$ and, for each finite place $\mu$ of $M$
  of characteristic prime to 2, with completion $M_\mu$ having integer ring $R_\mu$,
```
- [ ] `proof @207` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
  Omitted for now {\bf TODO}
\end{proof}
```
- [ ] `hardly_ramified_mod3_reducible` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified_mod3_reducible}`; lean: `\lean{GaloisRepresentation.IsHardlyRamified.mod_three}`; uses: `\uses{hardly_ramified}`.
  - source:
```tex
\begin{theorem}
  \lean{GaloisRepresentation.IsHardlyRamified.mod_three}
  \label{hardly_ramified_mod3_reducible}
  \uses{hardly_ramified}
  \leanok
  Suppose $k$ is a finite field of characteristic 3, and suppose
  $\overline{rho}:\GQ\to\GL_2(k)$ is hardly ramified. Then $\overline{\rho}$ is an extension
  of the cyclotomic character by the trivial representation.
\end{theorem}
```
- [ ] `proof @225` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
  Omitted for now. {\bf TODO}
\end{proof}
```
- [ ] `hardly_ramified_3adic_reducible` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{hardly_ramified_3adic_reducible}`; lean: `\lean{GaloisRepresentation.IsHardlyRamified.three_adic}`; uses: `\uses{hardly_ramified, hardly_ramified_mod3_reducible}`.
  - source:
```tex
\begin{theorem}
  \lean{GaloisRepresentation.IsHardlyRamified.three_adic}
  \label{hardly_ramified_3adic_reducible}
  \uses{hardly_ramified, hardly_ramified_mod3_reducible}
  \leanok
  Suppose $L/\Q_3$ is a finite extension, with integer ring $\calO_L$, and suppose
  $\rho_3:\GQ\to\GL_2(\calO_L)$ is hardly ramified. Then (considered as a representation
  to $\GL_2(L)$) $\rho_3^{ss}=1\oplus\chi_3$
  where $1$ is the trivial character and $\chi_3$ is the 3-adic cyclotomic character.
\end{theorem}
```
- [ ] `proof @242` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}
  Omitted for now {\bf TODO}
\end{proof}
```
- Representative source:
```tex
\begin{definition}
  \lean{GaloisRepresentation.IsHardlyRamified}
  \label{hardly_ramified}
  \leanok
  Let $R$ be a coefficient ring with finite residue field of characteristic $\ell\geq3$.
  Let $V$ be a finite free $R$-module of rank~2, equipped with the product topology. A
  continuous representation $\rho: \GQ\to \GL_R(V)$ is said to be \emph{hardly ramified} if it
  satisfies the following four conditions:
  \begin{enumerate}
  \item $\det(\rho):\GQ\to R^\times$ is the cyclotomic character;
  \item $\rho$ is unramified outside $2\ell$;
  \item The restriction of $\rho$ to $\Gal(\Qbar_2/\Q_2)$ is reducible (more precisely,
```

## An overview of the proof
- Source: `ch04overview.tex` -> `Overview.lean`
- Scanned nodes: 2
- Open work: 1 source nodes need port attention (1 formal statements, 0 proof sketches).
- Tasks:
- [ ] `modularity_lifting_theorem` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{modularity_lifting_theorem}`; uses: `\uses{Skinner_Wiles_CFT_trick,local_galois_coh_dim_two,local_galois_coh_top_degree,
      local_galois_coh_poincare,local_galois_coh_euler_poincare,IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv,
      automorphic_representation_local_decomposition,cuspidal_automorphic_representation,
      Galois_representation_from_automorphic_representation_on_GL_2_form, moret-bailly,
      local_galois_coh_finite}`.
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
- Open work: 36 source nodes need port attention (36 formal statements, 0 proof sketches).
- Tasks:
- [ ] `ZHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat}`; lean: `\lean{ZHat}`.
  - source:
```tex
\begin{definition}\label{ZHat}\lean{ZHat}\leanok The profinite completion $\Zhat$ of $\Z$ is the set of
    all compatible collections $c=(c_N)_N$ of elements of $\Z/N\Z$ indexed by $\N^+:=\{1,2,3,\ldots\}$.
    A collection is said to be \emph{compatible} if for all positive integers
    $D\mid N$, we have $c_N$ mod $D$ equals $c_D$.
\end{definition}
```
- [ ] `ZHat.commRing` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.commRing}`; lean: `\lean{ZHat.commRing}`; uses: `\uses{ZHat}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.commRing}
    \lean{ZHat.commRing}
    \uses{ZHat}
    \leanok
    $\Zhat$ is a subring of $\prod_{N\geq1}(Z/N\Z)$ and in particular is a ring.
\end{lemma}
```
- [ ] `ZHat.nontrivial` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.nontrivial}`; lean: `\lean{ZHat.nontrivial}`; uses: `\uses{ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.nontrivial}
    \lean{ZHat.nontrivial}
    \uses{ZHat.commRing}
    \leanok
    $0\not=1$ in $\Zhat$.
\end{lemma}
```
- [ ] `ZHat.charZero` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.charZero}`; lean: `\lean{ZHat.charZero}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.charZero}
    \lean{ZHat.charZero}
    \leanok
    The map from the naturals into $\Zhat$ sending $n$ to $n$ is injective.
\end{lemma}
```
- [ ] `ZHat.e` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.e}`; lean: `\lean{ZHat.e}`; uses: `\uses{ZHat.commRing}`.
  - source:
```tex
\begin{definition}
    \label{ZHat.e}
    \lean{ZHat.e}
    \uses{ZHat.commRing}
    \leanok
    The infinite sum $0!+1!+2!+3!+4!+5!+\cdots$ looks
    like it makes no sense at all; it is the sum of an infinite series of larger and larger
    positive numbers.
    However, the sum is \emph{finite} modulo $N$ for every positive integer $N$, because
    all the terms from $N!$ onwards are multiples of $N$ and thus are zero in $\Z/N\Z$.
```
- [ ] `ZHat.e_def` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.e_def}`; lean: `\lean{ZHat.e_def}`; uses: `\uses{ZHat.e}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.e_def}
    \lean{ZHat.e_def}
    \uses{ZHat.e}
    \leanok
    The collection $(e_N)_N$ is an element of $\Zhat$.
\end{lemma}
```
- [ ] `ZHat.e_not_in_Int` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.e_not_in_Int}`; lean: `\lean{ZHat.e_not_in_Int}`; uses: `\uses{ZHat.e}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.e_not_in_Int}
    \lean{ZHat.e_not_in_Int}
    \uses{ZHat.e}
    \leanok
    The element $(e_N)_N$ of $\Zhat$ is not in $\Z$.
\end{lemma}
```
- [ ] `ZHat.torsionfree` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.torsionfree}`; lean: `\lean{ZHat.torsionfree}`; uses: `\uses{ZHat.commRing, ZHat.charZero}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.torsionfree}
    \lean{ZHat.torsionfree}
    \uses{ZHat.commRing, ZHat.charZero}
    \leanok
    If $0<N$ is an integer then multiplication by $N$ is injective on $\Zhat$.
\end{lemma}
```
- [ ] `ZHat.multiples` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ZHat.multiples}`; lean: `\lean{ZHat.multiples}`; uses: `\uses{ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{ZHat.multiples}
    \lean{ZHat.multiples}
    \uses{ZHat.commRing}
    \leanok
    The multiples of~$N$ in $\Zhat$ are precisely the compatible collections $(z_i)_i\in\Zhat$
    with $z_N=0$.
\end{lemma}
```
- [ ] `QHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat}`; lean: `\lean{QHat}`; uses: `\uses{ZHat}`.
  - source:
```tex
\begin{definition}
    \label{QHat}
    \lean{QHat}
    \uses{ZHat}
    \leanok
    % blue node
    The profinite completion $\Qhat$ of $\Q$ is the tensor product $\Q\otimes_{\Z}\Zhat$,
    or $\Qhat=\Q\otimes\Zhat$ for short.
\end{definition}
```
- [ ] `example @289` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{example} Recall that the sum of all the factorials is an element $e\in\Zhat$, and $22/7$ is certainly
a rational number, so we can make the element $\frac{22}{7}\otimes_te\in\Qhat$.
\end{example}
```
- [ ] `QHat.canonicalForm` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.canonicalForm}`; lean: `\lean{QHat.canonicalForm}`; uses: `\uses{QHat,ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.canonicalForm}
    \lean{QHat.canonicalForm}
    \uses{QHat,ZHat.commRing}
    \leanok
    Every element of $\Qhat:=\Q\otimes\Zhat$ can be written as $q\otimes_t z$ with $q\in\Q$ and $z\in\Zhat$.
    Furthermore one can even assume that $q=\frac{1}{N}$ for some positive integer $N$.
\end{lemma}
```
- [ ] `QHat.IsCoprime` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.IsCoprime}`; lean: `\lean{QHat.IsCoprime}`; uses: `\uses{ZHat.commRing}`.
  - source:
```tex
\begin{definition}
    \label{QHat.IsCoprime}
    \lean{QHat.IsCoprime}
    \uses{ZHat.commRing}
    \leanok
    If $N\in\N^+$ and $z\in\Zhat$ then we say that $N$ and $z$ are \emph{coprime} if
    $z_N\in(\Z/N\Z)^\times$. We write $z/N$ as notation
    for the element $\frac{1}{N}\otimes_tz$.
\end{definition}
```
- [ ] `QHat.lowestTerms` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.lowestTerms}`; lean: `\lean{QHat.lowestTerms}`; uses: `\uses{QHat.IsCoprime}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.lowestTerms}
    \lean{QHat.lowestTerms}
    \uses{QHat.IsCoprime}
    \leanok
    Every element of $\Qhat$ can be uniquely written as $z/N$ with $z\in\Zhat$, $N\in\N^+$,
    and with $N$ and $z$ coprime.
\end{lemma}
```
- [ ] `QHat.injective_rat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.injective_rat}`; lean: `\lean{QHat.injective_rat}`; uses: `\uses{QHat,ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.injective_rat}
    \lean{QHat.injective_rat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The ring homomorphism $\Q\to\Qhat$ sending $q$ to $q\otimes_t 1$
    is injective.
\end{lemma}
```
- [ ] `QHat.injective_zHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.injective_zHat}`; lean: `\lean{QHat.injective_zHat}`; uses: `\uses{QHat, ZHat.torsionfree}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.injective_zHat}
    \lean{QHat.injective_zHat}
    \uses{QHat, ZHat.torsionfree}
    \leanok
    The ring homomorphism $\Zhat\to\Qhat$ sending
    $z$ to $1\otimes_t z$ is injective.
\end{lemma}
```
- [ ] `QHat.rat_meet_zHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.rat_meet_zHat}`; lean: `\lean{QHat.rat_meet_zHat}`; uses: `\uses{QHat,ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.rat_meet_zHat}
    \lean{QHat.rat_meet_zHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The intersection of $\Q$ and $\Zhat$ in $\Qhat$ is $\Z$.
\end{lemma}
```
- [ ] `QHat.rat_join_zHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.rat_join_zHat}`; lean: `\lean{QHat.rat_join_zHat}`; uses: `\uses{QHat,ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.rat_join_zHat}
    \lean{QHat.rat_join_zHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The sum of $\Q$ and $\Zhat$ in $\Qhat$ is $\Qhat$.
    More precisely, every element of $\Qhat$ can be written as $q+z$ with $q\in\Q$ and $z\in\Zhat$,
    or more precisely as $q\otimes_t 1+1\otimes_t z$.
\end{lemma}
```
- [ ] `Qhat.unitsrat_meet_unitszHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Qhat.unitsrat_meet_unitszHat}`; lean: `\lean{QHat.unitsrat_meet_unitszHat}`; uses: `\uses{QHat,ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{Qhat.unitsrat_meet_unitszHat}
    \lean{QHat.unitsrat_meet_unitszHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The intersection of $\Q^\times$ and $\Zhat^\times$ in $\Qhat^\times$ is $\Z^\times$.
\end{lemma}
```
- [ ] `QHat.unitsrat_join_unitszHat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QHat.unitsrat_join_unitszHat}`; lean: `\lean{QHat.unitsrat_join_unitszHat}`; uses: `\uses{QHat,ZHat.commRing}`.
  - source:
```tex
\begin{lemma}
    \label{QHat.unitsrat_join_unitszHat}
    \lean{QHat.unitsrat_join_unitszHat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The product of $\Q^\times$ and $\Zhat^\times$ in $\Qhat^\times$ is all of $\Qhat^\times$.
    More precisely, every element of $\Qhat^\times$ can be written as $qz$ with $q\in\Q^\times$
    and $z\in\Zhat^\times$.
\end{lemma}
```
- [ ] `Hurwitz` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz}`; lean: `\lean{Hurwitz}`.
  - source:
```tex
\begin{definition}
    \label{Hurwitz}
    \lean{Hurwitz}
    \leanok
        The Hurwitz quaternions are the set $\calO := \Z\oplus\Z \omega\oplus\Z i\oplus
    \Z i\omega$ (as an abstract abelian group or as a subgroup of the usual quaternions).
    Here $\omega=\frac{-1+(i+j+k)}{2}$ and note that $(i+j+k)^2=-3$.
    We have $\overline{\omega}=\omega^2=-(\omega+1)$. A general quaternion
    $a+bi+cj+dk$ is a Hurwitz quaternion if either $a,b,c,d\in\Z$
    or $a,b,c,d\in\Z+\frac{1}{2}$.
```
- [ ] `Hurwitz.ring` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.ring}`; lean: `\lean{Hurwitz.ring}`; uses: `\uses{Hurwitz}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.ring}
    \lean{Hurwitz.ring}
    \uses{Hurwitz}
    \leanok
    The Hurwitz quaternions form a ring.
\end{lemma}
```
- [ ] `Hurwitz.starRing` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.starRing}`; lean: `\lean{Hurwitz.starRing}`; uses: `\uses{Hurwitz.ring}`.
  - source:
```tex
\begin{definition}
    \label{Hurwitz.starRing}
    \lean{Hurwitz.starRing}
    \uses{Hurwitz.ring}
    \leanok
    There's a conjugation map (which we'll call "star") from the Hurwitz quaternions to themselves, sending
    integers to themselves and purely imaginary elements like $2\omega+1$ to minus themselves.
    It satisfies $(x^*)^*=x$, $(xy)^*=y^*x^*$ and $(x+y)^*=x^*+y^*$. In particular, the Hurwitz
    quaternions are a "star ring" in the sense of mathlib.
\end{definition}
```
- [ ] `Hurwitz.norm` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm}`; lean: `\lean{Hurwitz.norm}`; uses: `\uses{Hurwitz}`.
  - source:
```tex
\begin{definition}
    \label{Hurwitz.norm}
    \lean{Hurwitz.norm}
    \uses{Hurwitz}
    \leanok
    The Hurwitz quaternions come equipped with an integer-valued norm, which is
    $a^2+b^2+c^2+d^2$ on $a+bi+cj+dk$ but needs to be modified a bit to deal with $\omega$.
\end{definition}
```
- [ ] `Hurwitz.norm_eq_mul_conj` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm_eq_mul_conj}`; lean: `\lean{Hurwitz.norm_eq_mul_conj}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.norm_eq_mul_conj}
    \lean{Hurwitz.norm_eq_mul_conj}
    \leanok
    We have $N(x)=x\overline{x}$.
\end{lemma}
```
- [ ] `Hurwitz.norm_zero` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm_zero}`; lean: `\lean{Hurwitz.norm_zero}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.norm_zero}
    \lean{Hurwitz.norm_zero}
    \uses{Hurwitz.norm}
    \leanok
    The norm of $0$ is $0$.
\end{lemma}
```
- [ ] `Hurwitz.norm_one` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm_one}`; lean: `\lean{Hurwitz.norm_one}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.norm_one}
    \lean{Hurwitz.norm_one}
    \uses{Hurwitz.norm}
    \leanok
    The norm of $1$ is $1$.
\end{lemma}
```
- [ ] `Hurwitz.norm_mul` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm_mul}`; lean: `\lean{Hurwitz.norm_mul}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.norm_mul}
    \lean{Hurwitz.norm_mul}
    \uses{Hurwitz.norm}
    \leanok
    The norm of a product is the product of the norms.
\end{lemma}
```
- [ ] `Hurwitz.norm_nonneg` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm_nonneg}`; lean: `\lean{Hurwitz.norm_nonneg}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.norm_nonneg}
    \lean{Hurwitz.norm_nonneg}
    \uses{Hurwitz.norm}
    \leanok
    The norm of an element is nonnegative.
\end{lemma}
```
- [ ] `Hurwitz.norm_eq_zero` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.norm_eq_zero}`; lean: `\lean{Hurwitz.norm_eq_zero}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.norm_eq_zero}
    \lean{Hurwitz.norm_eq_zero}
    \uses{Hurwitz.norm}
    \leanok
    The norm of an element is zero if and only if the element is zero.
\end{lemma}
```
- [ ] `Hurwitz.exists_near` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.exists_near}`; lean: `\lean{Hurwitz.exists_near}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.exists_near}
    \lean{Hurwitz.exists_near}
    \uses{Hurwitz.norm}
    \leanok
    Given a ``usual'' quaternion $a=x+yi+zj+wk$ with $x,y,z,w\in\R$,
    there exists a Hurwitz quaternion $q$ such that $N(a-q)<1$.
\end{lemma}
```
- [ ] `Hurwitz.quot_rem` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.quot_rem}`; lean: `\lean{Hurwitz.quot_rem}`; uses: `\uses{Hurwitz.norm, Hurwitz.exists_near}`.
  - source:
```tex
\begin{lemma}
    \label{Hurwitz.quot_rem}
    \lean{Hurwitz.quot_rem}
    \uses{Hurwitz.norm, Hurwitz.exists_near}
    \leanok
    Given two Hurwitz quaternions $a$ and $b$ with $b$ nonzero, there exists
    $q$ and $r$ such that $a=qb+r$ and $N(r)<N(b)$.
\end{lemma}
```
- [ ] `Hurwitz.left_ideal_princ` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.left_ideal_princ}`; lean: `\lean{Hurwitz.left_ideal_princ}`; uses: `\uses{Hurwitz.norm}`.
  - source:
```tex
\begin{corollary}
    \label{Hurwitz.left_ideal_princ}
    \lean{Hurwitz.left_ideal_princ}
    \uses{Hurwitz.norm}
    \leanok
    All left ideals of $\calO$ are principal.
\end{corollary}
```
- [ ] `Hurwitz.surjective_pnat_quotient` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Hurwitz.surjective_pnat_quotient}`; uses: `\uses{Hurwitz}`.
  - source:
```tex
\begin{theorem}
    \label{Hurwitz.surjective_pnat_quotient}
    \uses{Hurwitz}
    If $N$ is a positive natural then the obvious map $\calO\to\calOhat/N\calOhat$ is surjective.
\end{theorem}
```
- [ ] `HurwitzRatHat.canonicalForm` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{HurwitzRatHat.canonicalForm}`; lean: `\lean{HurwitzRatHat.canonicalForm}`; uses: `\uses{QHat, ZHat, Hurwitz}`.
  - source:
```tex
\begin{lemma}
    \label{HurwitzRatHat.canonicalForm}
    \lean{HurwitzRatHat.canonicalForm}
    \uses{QHat, ZHat, Hurwitz}
    \leanok
    Every element of $\widehat{D}$ can be written as $z/N$ with $z\in\calOhat$ and $N\in\N^+$.
\end{lemma}
```
- [ ] `HurwitzRatHat.completed_units` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{HurwitzRatHat.completed_units}`; lean: `\lean{HurwitzRatHat.completed_units}`; uses: `\uses{HurwitzRatHat.canonicalForm}`.
  - source:
```tex
\begin{theorem}
    \label{HurwitzRatHat.completed_units}
    \lean{HurwitzRatHat.completed_units}
    \uses{HurwitzRatHat.canonicalForm}
    \leanok
    The group of units of $\widehat{D}$ is $D^\times\calOhat^\times$.
    More precisely, every element of $\widehat{D}^\times$ can be written as a product $\delta u$
    with $\delta\in D^\times$ and $u\in\calOhat^\times$.
\end{theorem}
```
- Representative source:
```tex
\begin{definition}\label{ZHat}\lean{ZHat}\leanok The profinite completion $\Zhat$ of $\Z$ is the set of
    all compatible collections $c=(c_N)_N$ of elements of $\Z/N\Z$ indexed by $\N^+:=\{1,2,3,\ldots\}$.
    A collection is said to be \emph{compatible} if for all positive integers
    $D\mid N$, we have $c_N$ mod $D$ equals $c_D$.
\end{definition}
```

## Stating the modularity lifting theorems
- Source: `ch06automorphicrepresentations.tex` -> `ModularityLifting.lean`
- Scanned nodes: 4
- Open work: 2 source nodes need port attention (2 formal statements, 0 proof sketches).
- Tasks:
- [ ] `MatrixRing.isCentralSimple` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MatrixRing.isCentralSimple}`.
  - source:
```tex
\begin{lemma}
    \label{MatrixRing.isCentralSimple}
    %\lean{MatrixRing.isCentralSimple}
    %\uses{IsCentralSimple}
    \discussion{47}
    \leanok
    If $n\geq1$ then the $n\times n$ matrices $M_n(K)$ are a central simple algebra over~$K$.
\end{lemma}
```
- [ ] `IsCentralSimple.baseChange` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
    \label{MatrixRing.isCentralSimple}
    %\lean{MatrixRing.isCentralSimple}
    %\uses{IsCentralSimple}
    \discussion{47}
    \leanok
    If $n\geq1$ then the $n\times n$ matrices $M_n(K)$ are a central simple algebra over~$K$.
\end{lemma}
```

## Automorphic forms and the Langlands Conjectures
- Source: `ch07exampleGLn.tex` -> `LanglandsGLn.lean`
- Scanned nodes: 13
- Open work: 10 source nodes need port attention (10 formal statements, 0 proof sketches).
- Tasks:
- [ ] `AutomorphicForm.GLn.IsSmooth` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AutomorphicForm.GLn.IsSmooth}`; lean: `\lean{AutomorphicForm.GLn.IsSmooth}`.
  - source:
```tex
\begin{definition}
  \label{AutomorphicForm.GLn.IsSmooth}
  \lean{AutomorphicForm.GLn.IsSmooth}
  A function $f:\GL_n(\A_{\Q}^f)\times\GL_n(\R)\to\bbC$ is \emph{smooth}
  if it has the following three properties.

  \begin{enumerate}
    \item $f$ is continuous.
    \item For all $x\in\GL_n(\A_{\Q}^f)$, the function $y\mapsto f(x,y)$ is smooth.
    \item For all $y\in\GL_n(\R)$, the function $x\mapsto f(x,y)$ is locally constant.
```
- [ ] `AutomorphicForm.GLn.IsSlowlyIncreasing` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AutomorphicForm.GLn.IsSlowlyIncreasing}`; lean: `\lean{AutomorphicForm.GLn.IsSlowlyIncreasing}`.
  - source:
```tex
\begin{definition}
  \label{AutomorphicForm.GLn.IsSlowlyIncreasing}
  \lean{AutomorphicForm.GLn.IsSlowlyIncreasing}
  \leanok
  We say that a function $f:\GL_n(\R)\to\bbC$ is \emph{slowly-increasing}
  if there's some real constant $C$ and positive integer $n$ such that $|f(M)|\leq Cs(M)^n$
  for all $M\in\GL_n(\R)$.
\end{definition}
```
- [ ] `AutomorphicForm.GLn.Weight` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AutomorphicForm.GLn.Weight}`; lean: `\lean{AutomorphicForm.GLn.Weight}`.
  - source:
```tex
\begin{definition}
  \label{AutomorphicForm.GLn.Weight}
  \lean{AutomorphicForm.GLn.Weight}

The \emph{weight} of an automorphic form for $\GL_n/\Q$ can be thought of as a finite-dimensional
continuous complex representation $\rho$ of a maximal compact subgroup of $\GL_n(\R)$,
and it's convenient to choose one (they're all conjugate) so we choose $O_n(\R)$.
\end{definition}
```
- [ ] `instLieAlgebraAction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{instLieAlgebraAction}`.
  - source:
```tex
\begin{definition}
  \label{instLieAlgebraAction}
There is a natural action of the real Lie algebra of $\GL_n(\R)$ on the complex vector space of
smooth complex-valued functions on $\GL_n(\R)$.
\end{definition}
```
- [ ] `instComplexLieAlgebraAction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `instUniversalEnvelopingAlgebraAction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `instCentreAction` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `AutomorphicForm.GLn.AutomorphicFormForGLnOverQ` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AutomorphicForm.GLn.AutomorphicFormForGLnOverQ}`; lean: `\lean{AutomorphicForm.GLn.AutomorphicFormForGLnOverQ}`; uses: `\uses{AutomorphicForm.GLn.IsSmooth, AutomorphicForm.GLn.IsSlowlyIncreasing,
    AutomorphicForm.GLn.Weight, instCentreAction}`.
  - source:
```tex
\begin{definition}
  \label{AutomorphicForm.GLn.AutomorphicFormForGLnOverQ}
  \lean{AutomorphicForm.GLn.AutomorphicFormForGLnOverQ}
  \uses{AutomorphicForm.GLn.IsSmooth, AutomorphicForm.GLn.IsSlowlyIncreasing,
    AutomorphicForm.GLn.Weight, instCentreAction}
  A smooth function $f:\GL_n(\A_{\Q}^f)\times\GL_n(\R)\to\bbC$ is
  an $O_n(\R)$-\emph{automorphic form} on $\GL_n(\A_{\Q})$ if it satisfies the following
  five conditions.
  \begin{enumerate}
    \item (periodicity) For all $g\in\GL_n(\Q)$, we have $f(gx,gy)=f(x,y)$.
```
- [ ] `lemma @164` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{lemma} The group $\GL_n(\A_{\Q}^f)$ acts (on the left) on the space of automorphic forms
  for $\GL_n(\A_{\Q})$ by the formula $(g\cdot f)(x,y)=f(xg,y)$.
\end{lemma}
```
- [ ] `lemma @186` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{lemma} This function is well-defined, i.e., it sends a $U$-invariant form to
  a $U$-invariant form which is independent of the choice of $g_i$.
\end{lemma}
```
- Representative source:
```tex
\begin{definition}
  \label{AutomorphicForm.GLn.IsSmooth}
  \lean{AutomorphicForm.GLn.IsSmooth}
  A function $f:\GL_n(\A_{\Q}^f)\times\GL_n(\R)\to\bbC$ is \emph{smooth}
  if it has the following three properties.

  \begin{enumerate}
    \item $f$ is continuous.
    \item For all $x\in\GL_n(\A_{\Q}^f)$, the function $y\mapsto f(x,y)$ is smooth.
    \item For all $y\in\GL_n(\R)$, the function $x\mapsto f(x,y)$ is locally constant.
  \end{enumerate}
\end{definition}
```

## The Global Langlands conjectures
- Source: `global_langlands.tex` -> `GlobalLanglands.lean`
- Scanned nodes: 0
- [x] No formal statements or proof sketches are currently flagged as open in the source.
- Representative source:
```tex
This is not imported right now.

\chapter{The Global Langlands conjectures}

\section{Overview of the chapter}

In this section we discuss the problem of attempting to state the motivic global Langlands conjectures for connected reductive groups over number fields. More precisely, the goal is to formally state the Buzzard--Gee version of the conjecture, which applies to algebraic automorphic representations. The main difficulties here are in writing down precisely what is meant by phrases such as ``automorphic representation'', ``connected reductive group'', ``local-global compatibility'', ``de Rham Galois representation'', and so on; these words hide a large amount of technical material.

\section{Statement of the conjecture}

Let $R$ be a commutative base ring; it will often be a field but we shall develop the theory in more generality when there is no extra effort needed to do.
```

## Miniproject: Frobenius elements
- Source: `FrobeniusProject.tex` -> `FrobeniusProject.lean`
- Scanned nodes: 22
- Open work: 12 source nodes need port attention (12 formal statements, 0 proof sketches).
- Tasks:
- [ ] `IsFractionRing.stabilizerHom` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsFractionRing.stabilizerHom}`; lean: `\lean{IsFractionRing.stabilizerHom}`.
  - source:
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
- [ ] `IsFractionRing.stabilizerHom_surjective` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsFractionRing.stabilizerHom_surjective}`; lean: `\lean{IsFractionRing.stabilizerHom_surjective}`; uses: `\uses{IsFractionRing.stabilizerHom}`.
  - source:
```tex
\begin{theorem}
  \label{IsFractionRing.stabilizerHom_surjective}
  \lean{IsFractionRing.stabilizerHom_surjective}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  The map $g\mapsto \phi_g$ from $D_Q$ to $\Aut(L/K)$ defined above is surjective.
\end{theorem}
```
- [ ] `MulSemiringAction.charpoly` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MulSemiringAction.charpoly}`; lean: `\lean{MulSemiringAction.charpoly}`.
  - source:
```tex
\begin{definition}
  \label{MulSemiringAction.charpoly}
  \lean{MulSemiringAction.charpoly}
  \mathlibok
  If $b\in B$ then define the \emph{characteristic polynomial}
  $F_b(X) \in B[X]$ of $b$ to be $\prod_{g\in G}(X-g\cdot b)$.
\end{definition}
```
- [ ] `MulSemiringAction.monic_charpoly` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MulSemiringAction.monic_charpoly}`; lean: `\lean{MulSemiringAction.monic_charpoly}`; uses: `\uses{MulSemiringAction.charpoly}`.
  - source:
```tex
\begin{lemma}
  \label{MulSemiringAction.monic_charpoly}
  \lean{MulSemiringAction.monic_charpoly}
  \uses{MulSemiringAction.charpoly}
  \mathlibok
  $F_b$ is monic.
\end{lemma}
```
- [ ] `Algebra.IsInvariant.charpoly_mem_lifts` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Algebra.IsInvariant.charpoly_mem_lifts}`; lean: `\lean{Algebra.IsInvariant.charpoly_mem_lifts}`; uses: `\uses{MulSemiringAction.charpoly}`.
  - source:
```tex
\begin{lemma}
  \label{Algebra.IsInvariant.charpoly_mem_lifts}
  \lean{Algebra.IsInvariant.charpoly_mem_lifts}
  \uses{MulSemiringAction.charpoly}
  \mathlibok
  $F_b$ is the lift of some monic polynomial $M_b$ in $A[X]$.
\end{lemma}
```
- [ ] `Algebra.IsInvariant.isIntegral` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Algebra.IsInvariant.isIntegral}`; lean: `\lean{Algebra.IsInvariant.isIntegral}`.
  - source:
```tex
\begin{theorem}
  \label{Algebra.IsInvariant.isIntegral}
  \lean{Algebra.IsInvariant.isIntegral}
  \mathlibok
  $B/A$ is integral.
\end{theorem}
```
- [ ] `fixed_of_fixed1_aux1` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{fixed_of_fixed1_aux1}`.
  - source:
```tex
\begin{lemma}
  \label{fixed_of_fixed1_aux1}
  \mathlibok
  There exist elements $a,b \in B$, with $a \notin Q$ and $a$ in the image of $A$ such that
  for all $g\in G$,
  \begin{itemize}
    \item If $g \cdot Q = Q$, then $g \cdot b \equiv a \pmod{Q}$.
    \item If $g \cdot Q \neq Q$, then $g \cdot b \equiv 0 \pmod{Q}$.
  \end{itemize}
\end{lemma}
```
- [ ] `fixed_of_fixed1_aux2` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{fixed_of_fixed1_aux2}`.
  - source:
```tex
\begin{lemma}
  \label{fixed_of_fixed1_aux2}
  \mathlibok
  Let $b_0 \in B$.
  Suppose that the image of $b_0$ in the quotient $B/Q$ is fixed by the stabilizer subgroup
  $D_Q$.
  Then there exist elements $a,b \in B$, with $a\notin Q$ and $a$ in the image of $A$ such that
  for all $g\in G$,
  \begin{itemize}
    \item If $g \cdot Q = Q$, then $g \cdot b \equiv ab_0 \pmod{Q}$.
```
- [ ] `FixedPoints.toAlgAut_surjective` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{FixedPoints.toAlgAut_surjective}`; lean: `\lean{FixedPoints.toAlgAut_surjective}`.
  - source:
```tex
\begin{theorem}
  \label{FixedPoints.toAlgAut_surjective}
  \lean{FixedPoints.toAlgAut_surjective}
  Let $H$ be a finite group acting on a field $F$ by field automorphisms.
  Then the map $H \to \Aut(F/F^H)$ is surjective.
  \mathlibok
\end{theorem}
```
- [ ] `fixed_of_fixed1` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{fixed_of_fixed1}`; uses: `\uses{IsFractionRing.stabilizerHom}`.
  - source:
```tex
\begin{proposition}
  \label{fixed_of_fixed1}
  \uses{IsFractionRing.stabilizerHom}
  \mathlibok
  Let $b_0 \in B/Q$.
  Suppose that $b_0$ is fixed by the stabilizer subgroup $D_Q$.
  Then $b_0$ is fixed by $\Aut(L/K)$.
\end{proposition}
```
- [ ] `IsAlgebraic.exists_smul_eq_mul` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsAlgebraic.exists_smul_eq_mul}`; lean: `\lean{IsAlgebraic.exists_smul_eq_mul}`.
  - source:
```tex
\begin{lemma}
  \label{IsAlgebraic.exists_smul_eq_mul}
  \lean{IsAlgebraic.exists_smul_eq_mul}
  \mathlibok
  If $R/S$ is an algebraic extension of integral domains, then any fraction $a/b$ with $a,b\in R$
  can be written as $c/d$ with $c\in R$ and $d\in S$.
\end{lemma}
```
- [ ] `fixed_of_fixed2` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{fixed_of_fixed2}`.
  - source:
```tex
\begin{proposition}
  \label{fixed_of_fixed2}
  \mathlibok
  Let $x \in L$.
  Suppose that $x$ is fixed by the stabilizer subgroup $D_Q$.
  Then $x$ is fixed by the automorphism group $\Aut(L/K)$.
\end{proposition}
```
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
- Open work: 52 source nodes need port attention (52 formal statements, 0 proof sketches).
- Tasks:
- [ ] `NumberField.instCompactSpaceAdicCompletionIntegers` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.instCompactSpaceAdicCompletionIntegers}`; lean: `\lean{NumberField.instCompactSpaceAdicCompletionIntegers}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.instCompactSpaceAdicCompletionIntegers}
  \lean{NumberField.instCompactSpaceAdicCompletionIntegers}
  \discussion{451}
  \leanok
  If $K$ is a number field and $v$ is a nonzero prime ideal of the integers of $K$,
  then the integers of $K_v$ is a compact open subgroup.
\end{theorem}
```
- [ ] `NumberField.AdeleRing.locallyCompactSpace` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.locallyCompactSpace}`; lean: `\lean{NumberField.AdeleRing.locallyCompactSpace}`; uses: `\uses{NumberField.instCompactSpaceAdicCompletionIntegers}`.
  - source:
```tex
\begin{theorem}
  \lean{NumberField.AdeleRing.locallyCompactSpace}
  \label{NumberField.AdeleRing.locallyCompactSpace}
  \uses{NumberField.instCompactSpaceAdicCompletionIntegers}
  \discussion{253}
  \leanok
  The adeles of a number field are locally compact.
\end{theorem}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.valuation_comap` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.valuation_comap}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.valuation_comap}`.
  - source:
```tex
\begin{lemma}
  \label{IsDedekindDomain.HeightOneSpectrum.valuation_comap}
  \lean{IsDedekindDomain.HeightOneSpectrum.valuation_comap}
  \leanok
  If $i:K\to L$ denotes the inclusion then for $k\in K$ we have
  $e\times w(i(k))=v(k)$, where $e$ is the ramification index of $w/v$
  (recall that valuations here are written additively, unlike in mathlib).
\end{lemma}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.valuation_comap}`.
  - source:
```tex
\begin{definition}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \uses{IsDedekindDomain.HeightOneSpectrum.valuation_comap}
  \leanok
  There's a natural ring map $K_v\to L_w$ extending the map $K\to L$.
  It is defined by completing
  the inclusion $K\to L$ at the finite places $v$ and $w$ (which can be done
  because the previous lemma shows that the map is uniformly continuous for the $v$-adic
  and $w$-adic topologies).
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.valuation_comap,
  IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}`.
  - source:
```tex
\begin{lemma}
  \lean{IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap}
  \label{IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap}
  \uses{IsDedekindDomain.HeightOneSpectrum.valuation_comap,
  IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \leanok
  If $i_v:K_v\to L_w$ denotes the map of the previous definition
  then for $x\in K_v$ we have
  $e\times w(i(k))=v(k)$, where $e$ is the ramification index of $w/v$.
\end{lemma}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap}`.
  - source:
```tex
\begin{lemma}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers}
  \uses{IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap}
  \leanok
  The map $i_v:K_v\to L_w$ sends the integer ring $A_v$ into $B_w$.
\end{lemma}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}`.
  - source:
```tex
\begin{theorem}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \leanok
  \discussion{326}
  Giving $L_w$ the $K_v$-algebra structure coming from the natural map $K_v\to L_w$,
  the $w$-adic topology on $L_w$ is the $K_v$-module topology.
\end{theorem}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.Extension.finite` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.Extension.finite}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.Extension.finite}`.
  - source:
```tex
\begin{lemma}
  \lean{IsDedekindDomain.HeightOneSpectrum.Extension.finite}
  \label{IsDedekindDomain.HeightOneSpectrum.Extension.finite}
  \leanok
  There are only finitely many primes $w$ of $B$ lying above $v$.
\end{lemma}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}`.
  - source:
```tex
\begin{definition}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom'}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom}
  \leanok
  The product of the maps $K_v\to L_w$ for $w|v$ is a natural ring map $K_v\to\prod_{w|v}L_w$
  lying over $K\to L$.
\end{definition}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom',
  IsDedekindDomain.HeightOneSpectrum.Extension.finite}`.
  - source:
```tex
\begin{theorem}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom',
  IsDedekindDomain.HeightOneSpectrum.Extension.finite}
  \leanok
  The induced $L$-algebra homomorphism $L\otimes_KK_v\to\prod_{w|v}L_w$ is an
  isomorphism of rings.
\end{theorem}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}`.
  - source:
```tex
\begin{theorem}
  \label{IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology}
  \lean{IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology}
  \leanok
  For $v$ fixed, the product topology on $\prod_{w|v}L_w$ is the $K_v$-module
  topology.
\end{theorem}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology}`.
  - source:
```tex
\begin{theorem}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapContinuousAlgEquiv}
  \uses{IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology}
  If we give $L\otimes_KK_v$ the $K_v$-module topology then the $L$-algebra isomorphism
  $L\otimes_K K_v\cong\prod_{w|v}L_w$ is also a homeomorphism.
\end{theorem}
```
- [ ] `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}`; lean: `\lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv}`.
  - source:
```tex
\begin{theorem}
  \lean{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}
  \label{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv}
  \leanok
  The isomorphism $L\otimes_KK_v\to\prod_{w|v}L_w$ induces an isomorphism
  $B\otimes_AA_v\to \prod_{w|v}B_w$
  for all $v$ in the height one spectrum of $A$.
\end{theorem}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.mapSemialgHom` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.mapSemialgHom}`; lean: `\lean{IsDedekindDomain.FiniteAdeleRing.mapSemialgHom}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom,
  IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers}`.
  - source:
```tex
\begin{definition}
  \label{IsDedekindDomain.FiniteAdeleRing.mapSemialgHom}
  \lean{IsDedekindDomain.FiniteAdeleRing.mapSemialgHom}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom,
  IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers}
  \leanok
  There's a natural ring homomorphism
  $\A_{A,K}^\infty\to\A_{B,L}^\infty$ lying over $K\to L$.
\end{definition}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}`; lean: `\lean{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral,
    RestrictedProduct.relabelIso,
    IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv,
    IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}`.
  - source:
```tex
\begin{theorem}
  \label{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}
  \lean{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral,
    RestrictedProduct.relabelIso,
    IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv,
    IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}
  \leanok
  \discussion{243}
  This natural map $L\otimes_K\A_{A,K}^\infty\to\A_{B,L}^\infty$ is an isomorphism.
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv}`; lean: `\lean{IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv}`; uses: `\uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}`.
  - source:
```tex
\begin{theorem}
  \label{IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv}
  \lean{IsDedekindDomain.FiniteAdeleRing.baseChangeContinuousAlgEquiv}
  \uses{IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral}
  \leanok
The induced $L$-algebra morphism
  $L\otimes_K\A_{A,K}^\infty\to\A_{B,L}^\infty$ is a topological isomorphism.
\end{theorem}
```
- [ ] `IsDedekindDomain.dvd_norm` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.dvd_norm}`.
  - source:
```tex
\begin{lemma}
  \label{IsDedekindDomain.dvd_norm}
  If $0\not=b\in B$ then there exists $0\not=a\in A$ such that $b$ divides
  the image of $a$ in $B$.
\end{lemma}
```
- [ ] `IsDedekindDomain.AKLB.surjective_tensorProduct_map` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.AKLB.surjective_tensorProduct_map}`; uses: `\uses{IsDedekindDomain.dvd_norm}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.AKLB.surjective_tensorProduct_map}
  \uses{IsDedekindDomain.dvd_norm}
  The $A$-bilinear map $B\times K\to L$ sending $(b,k)$ to $bk$ is surjective.
\end{corollary}
```
- [ ] `IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv}`; uses: `\uses{IsDedekindDomain.dvd_norm}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv}
  \uses{IsDedekindDomain.dvd_norm}
  The natural map $B\otimes_AK\to L$ is a $B$-algebra isomorphism.
\end{corollary}
```
- [ ] `IsDedekindDomain.AKLB.tensorProduct_module_algEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}`; lean: `\lean{IsDedekindDomain.linearEquivTensorProductModule}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.AKLB.tensorProduct_module_algEquiv}
  %%% \uses{IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv} -- uncomment to break leanblueprint
  \lean{IsDedekindDomain.linearEquivTensorProductModule}
  \leanok
  If $M$ is any $K$-module then the canonical map $B\otimes_A M\to L\otimes_K M$
  is an isomorphism.
\end{corollary}
```
- [ ] `IsDedekindDomain.AKLB.finitePresentation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.AKLB.finitePresentation}`.
  - source:
```tex
\begin{theorem} $B$ is a finitely-presented $A$-module.
  \label{IsDedekindDomain.AKLB.finitePresentation}
\end{theorem}
```
- [ ] `pi_tensorProduct_of_finitePresentation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `IsDedekindDomain.pi_tensorProduct` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1}`; uses: `\uses{IsDedekindDomain.pi_tensorProduct}`.
  - source:
```tex
\begin{corollary}
  \label{IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1}
  \uses{IsDedekindDomain.pi_tensorProduct}
  The natural map $B\otimes_A\A_K^\infty\to R$ is a $B$-algebra isomorphism.
\end{corollary}
```
- [ ] `RestrictedProduct.relabelIso` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `definition @604` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{definition} If $X_v$ and $Y_v$ are families of topological spaces indexed by $v\in V$,
  if $f_v:X_v\to Y_v$ is a continuous map sending the subset $C_v\subseteq X_v$ into
  $D_v\subseteq Y_v$ then there's an induced continuous map $\prod'_v(X_v,C_v)\to\prod'_v(Y_v,D_v)$.
\end{definition}
```
- [ ] `definition @609` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{definition} If all the $f_v$ are homeomorphisms identifying $C_v$ with $D_v$ then
  the induced map on restricted products is also a homeomorphism (proof: apply the previous
  construction to $f_v$ and their inverses)
\end{definition}
```
- [ ] `theorem @621` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{theorem} In the same setup as definition~\ref{RestrictedProduct.relabelIso}
  ($V,W$ index sets, $f:W\to V$,
  $C_v\subseteq X_v$ and $D_w\subseteq Y_w$, bijections $b_v:X_v\to\prod_{w:f(w)=v}Y_w$
  identifying $C_v$ with $\prod_{w:f(w)=v}D_w$), if all the $X_v$ and $Y_w$ are furthermore
  topological spaces, all the $C_v$ and $D_w$ are open, and all the $b_v$ are homeomorphisms,
  then the induced
  map $\prod'_v(X_v,C_v)\to\prod'_w(Y_w,D_w)$ is also a homeomorphism.
\end{theorem}
```
- [ ] `corollary @633` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{corollary} $\mathbb{\A_L^\infty}$ is homeomorphic to $\prod_v(B\otimes_AK_v,B\otimes_AA_v)$.
\end{corollary}
```
- [ ] `lemma @665` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{lemma}
  If $X_v$ and $Y_v$ are topological spaces with open subspaces $C_v$ and $D_v$, then
  the obvious bijection $\prod'_v(X_v \times Y_v,C_v\times D_v) \cong
  \left(\prod'_v(X_v,C_v)\right)\times\left(\prod'_v(Y_v,D_v)\right)$ is a homeomorphism,
  where the restricted products have the restricted product topology and the binary
  product has the product topology.
\end{lemma}
```
- [ ] `NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}`; lean: `\lean{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  \lean{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  \leanok
  Let $S$ be a set of infinite places of $K$. The image of $K$ under the embedding
  $K\hookrightarrow (K_v)_{v\in S}; k \mapsto (k)_v$ is dense in the product topology.
\end{theorem}
```
- [ ] `NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}`; lean: `\lean{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  \lean{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  For a fixed infinite place $v$ of $K$, we have
  $\text{dim}_{K_v} \prod_{w\mid v} L_w = \text{dim}_{K_v} L\otimes_K K_v$.
\end{theorem}
```
- [ ] `NumberField.InfinitePlace.Completion.piExtension` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.piExtension}`; lean: `\lean{NumberField.InfinitePlace.Completion.piExtension}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.InfinitePlace.Completion.piExtension}
  \lean{NumberField.InfinitePlace.Completion.piExtension}
  \leanok
  Let $v$ be an infinite place of $K$. There is a continuous $K$-algebra homomorphism
  $K_v \to \prod_{w\mid v}L_w$, whose restriction to $K$ corresponds to the global embedding
  of $K$ into $(L_w)_w$.
\end{definition}
```
- [ ] `NumberField.InfinitePlace.Completion.baseChange` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.baseChange}`; lean: `\lean{NumberField.InfinitePlace.Completion.baseChange}`; uses: `\uses{NumberField.InfinitePlace.Completion.piExtension}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.InfinitePlace.Completion.baseChange}
  \lean{NumberField.InfinitePlace.Completion.baseChange}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.piExtension}
  Let $v$ be an infinite place of $K$. There is a natural $L$-algebra homomorphism
  $L\otimes_K K_v \to \prod_{w\mid v}L_w$, whose restriction to $1\otimes_K K_v$ corresponds to
  the map in~\ref{NumberField.InfinitePlace.Completion.piExtension}.
\end{definition}
```
- [ ] `NumberField.InfinitePlace.Completion.baseChange_surjective` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.baseChange_surjective}`; lean: `\lean{NumberField.InfinitePlace.Completion.baseChange_surjective}`; uses: `\uses{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChange_surjective}
  \lean{NumberField.InfinitePlace.Completion.baseChange_surjective}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi}
  For a fixed infinite place $v$ of $K$, the map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ is
  surjective.
\end{theorem}
```
- [ ] `NumberField.InfinitePlace.Completion.baseChange_injective` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.baseChange_injective}`; lean: `\lean{NumberField.InfinitePlace.Completion.baseChange_injective}`; uses: `\uses{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.baseChange_injective}
  \lean{NumberField.InfinitePlace.Completion.baseChange_injective}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct}
  For a fixed infinite place $v$ of $K$, the map $L\otimes_K K_v \to\prod_{w\mid v}L_w$ is
  injective.
\end{theorem}
```
- [ ] `NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}`; lean: `\lean{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  \lean{NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}
  \leanok
  If $w \mid v$ is an infinite place of $L$ lying above the infinite place $v$ of $K$, then
  $L_w$ has the $K_v$-module topology.
\end{theorem}
```
- [ ] `NumberField.InfinitePlace.Completion.baseChangeEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.baseChangeEquiv}`; lean: `\lean{NumberField.InfinitePlace.Completion.baseChangeEquiv}`; uses: `\uses{NumberField.InfinitePlace.Completion.baseChange,
    NumberField.InfinitePlace.Completion.baseChange_surjective,
    NumberField.InfinitePlace.Completion.baseChange_injective,
    NumberField.InfinitePlace.Completion.instIsModuleTopologyValEqComapAlgebraMap_fLT}`.
  - source:
```tex
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
```
- [ ] `NumberField.InfinitePlace.Completion.piEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfinitePlace.Completion.piEquiv}`; lean: `\lean{NumberField.InfinitePlace.Completion.piEquiv}`; uses: `\uses{NumberField.InfinitePlace.Completion.baseChangeEquiv}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfinitePlace.Completion.piEquiv}
  \lean{NumberField.InfinitePlace.Completion.piEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  Let $v$ be an infinite place of $K$. There is a natural $K_v$-linear homeomorphism
  $K_v^{[L:K]} \cong_{K_v} \prod_{w\mid v}L_w$.
\end{theorem}
```
- [ ] `NumberField.InfiniteAdeleRing.piEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfiniteAdeleRing.piEquiv}`; lean: `\lean{NumberField.InfiniteAdeleRing.piEquiv}`; uses: `\uses{NumberField.InfinitePlace.Completion.piEquiv}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.piEquiv}
  \lean{NumberField.InfiniteAdeleRing.piEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.piEquiv}
  There is a natural $K_{\infty}$-linear homeomorphism
  $K_{\infty}^{[L:K]} \cong_{K_{\infty}} L_{\infty}$.
\end{theorem}
```
- [ ] `NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}`; lean: `\lean{NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}`; uses: `\uses{NumberField.InfiniteAdeleRing.piEquiv}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}
  \lean{NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}
  \leanok
  \uses{NumberField.InfiniteAdeleRing.piEquiv}
  $L_{\infty}$ has the $K_{\infty}$-module topology.
\end{theorem}
```
- [ ] `NumberField.InfiniteAdeleRing.baseChangeAlgEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}`; lean: `\lean{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}`; uses: `\uses{NumberField.InfinitePlace.Completion.baseChangeEquiv}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}
  \lean{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}
  \leanok
  \uses{NumberField.InfinitePlace.Completion.baseChangeEquiv}
  There is a natural $L$-algebra isomorphism
  $L \otimes_K K_{\infty} \cong_L L_{\infty}$.
\end{theorem}
```
- [ ] `NumberField.InfiniteAdeleRing.baseChangeEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.InfiniteAdeleRing.baseChangeEquiv}`; lean: `\lean{NumberField.InfiniteAdeleRing.baseChangeEquiv,
    NumberField.InfiniteAdeleRing.instIsModuleTopology_fLT}`; uses: `\uses{NumberField.InfiniteAdeleRing.baseChangeAlgEquiv}`.
  - source:
```tex
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
- [ ] `NumberField.AdeleRing.baseChangeEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.baseChangeEquiv}`; lean: `\lean{NumberField.AdeleRing.baseChangeEquiv}`; uses: `\uses{NumberField.InfiniteAdeleRing.baseChangeEquiv,
  IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.AdeleRing.baseChangeEquiv}
  \lean{NumberField.AdeleRing.baseChangeEquiv}
  \leanok
  \uses{NumberField.InfiniteAdeleRing.baseChangeEquiv,
  IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv}
  If $K\to L$ is a ring homomorphism between two number fields then there is a natural isomorphism
  (both topological and algebraic) $L\otimes_K\A_K\cong\A_L$.
\end{theorem}
```
- [ ] `NumberField.AdeleRing.baseChange_moduleTopology` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.baseChange_moduleTopology}`; lean: `\lean{NumberField.AdeleRing.instBaseChangeIsModuleTopology}`; uses: `\uses{NumberField.AdeleRing.baseChangeEquiv}`.
  - source:
```tex
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
- [ ] `Rat.AdeleRing.zero_discrete` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Rat.AdeleRing.zero_discrete}`; lean: `\lean{Rat.AdeleRing.zero_discrete}`.
  - source:
```tex
\begin{theorem}
  \lean{Rat.AdeleRing.zero_discrete}
  \label{Rat.AdeleRing.zero_discrete}
  \leanok
  There's an open subset of $\A_{\Q}$ whose intersection with $\Q$ is $\{0\}$.
\end{theorem}
```
- [ ] `NumberField.AdeleRing.zero_discrete` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.zero_discrete}`; lean: `\lean{NumberField.AdeleRing.zero_discrete}`; uses: `\uses{Rat.AdeleRing.zero_discrete,NumberField.AdeleRing.baseChangeEquiv}`.
  - source:
```tex
\begin{theorem}
  \lean{NumberField.AdeleRing.zero_discrete}
  \label{NumberField.AdeleRing.zero_discrete}
  \uses{Rat.AdeleRing.zero_discrete,NumberField.AdeleRing.baseChangeEquiv}
  \leanok
  There's an open subset of $\A_{K}$ whose intersection with $K$ is $\{0\}$.
\end{theorem}
```
- [ ] `NumberField.AdeleRing.discrete` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.discrete}`; lean: `\lean{NumberField.AdeleRing.discrete}`; uses: `\uses{NumberField.AdeleRing.zero_discrete}`.
  - source:
```tex
\begin{theorem}
  \lean{NumberField.AdeleRing.discrete}
  \label{NumberField.AdeleRing.discrete}
  \uses{NumberField.AdeleRing.zero_discrete}
  \leanok
  The additive subgroup $K$ of $\A_K$ is discrete.
\end{theorem}
```
- [ ] `Rat.AdeleRing.cocompact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Rat.AdeleRing.cocompact}`; lean: `\lean{Rat.AdeleRing.cocompact}`.
  - source:
```tex
\begin{theorem}
  \lean{Rat.AdeleRing.cocompact}
  \label{Rat.AdeleRing.cocompact}
  \leanok
  The quotient $\A_{\Q}/\Q$ is compact.
\end{theorem}
```
- [ ] `NumberField.AdeleRing.cocompact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.cocompact}`; lean: `\lean{NumberField.AdeleRing.cocompact}`; uses: `\uses{Rat.AdeleRing.cocompact,NumberField.AdeleRing.baseChangeEquiv}`.
  - source:
```tex
\begin{theorem}
  \lean{NumberField.AdeleRing.cocompact}
  \label{NumberField.AdeleRing.cocompact}
  \uses{Rat.AdeleRing.cocompact,NumberField.AdeleRing.baseChangeEquiv}
  \leanok
  The quotient $\A_K/K$ is compact.
\end{theorem}
```
- Representative source:
```tex
\begin{theorem}
  \label{NumberField.instCompactSpaceAdicCompletionIntegers}
  \lean{NumberField.instCompactSpaceAdicCompletionIntegers}
  \discussion{451}
  \leanok
  If $K$ is a number field and $v$ is a nonzero prime ideal of the integers of $K$,
  then the integers of $K_v$ is a compact open subgroup.
\end{theorem}
```

## Miniproject: Haar Characters
- Source: `HaarCharacterProject.tex` -> `HaarCharacters.lean`
- Scanned nodes: 78
- Open work: 39 source nodes need port attention (39 formal statements, 0 proof sketches).
- Tasks:
- [ ] `MeasureTheory.addEquivAddHaarChar` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar}`.
  - source:
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
- [ ] `MeasureTheory.addEquivAddHaarChar_eq` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_eq}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_eq}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_eq}
  \lean{MeasureTheory.addEquivAddHaarChar_eq}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \discussion{508}
  \leanok
  $d_A(\phi)$ is independent of choice of regular Haar measure.
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_smul_map` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_smul_map}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_smul_map}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar_eq}`.
  - source:
```tex
\begin{lemma}
  \lean{MeasureTheory.addEquivAddHaarChar_smul_map}
  \label{MeasureTheory.addEquivAddHaarChar_smul_map}
  \uses{MeasureTheory.addEquivAddHaarChar_eq}
  \leanok
  If $\mu$ is any regular Haar measure on $A$ then
  $d_A(\phi)(\phi_*\mu) = \mu.$
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_comap` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_comap}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_smul_eq_comap}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar_smul_map}`.
  - source:
```tex
\begin{corollary}
  \lean{MeasureTheory.addEquivAddHaarChar_smul_eq_comap}
  \label{MeasureTheory.addEquivAddHaarChar_comap}
  \uses{MeasureTheory.addEquivAddHaarChar_smul_map}
  \leanok
  If $\mu$ is any regular Haar measure on $A$ then
  $d_A(\phi)\mu = \phi^*\mu.$
\end{corollary}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_smul_preimage` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_smul_preimage}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_smul_preimage}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_smul_preimage}
  \lean{MeasureTheory.addEquivAddHaarChar_smul_preimage}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \discussion{509}
  \leanok
  If $X$ is a Borel set then $\mu(X)=d_A(\phi)\mu(\phi^{-1}X)$.
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_smul_integral_map` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_smul_integral_map}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_smul_integral_map}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_smul_integral_map}
  \lean{MeasureTheory.addEquivAddHaarChar_smul_integral_map}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \discussion{510}
  \leanok
  If $f:A\to\R$ is a Borel measurable function then
  $d_A(\phi)\int f(x)d\phi_*\mu(x)=\int f(x)d\mu(x)$.
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_smul_integral_comap` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_smul_integral_comap}`; lean: `\lean{MeasureTheory.integral_comap_eq_addEquivAddHaarChar_smul}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar_comap}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_smul_integral_comap}
  \lean{MeasureTheory.integral_comap_eq_addEquivAddHaarChar_smul}
  \uses{MeasureTheory.addEquivAddHaarChar_comap}
  \leanok
  If $f:A\to\R$ is a Borel measurable function then
  $d_A(\phi)\int f(x)d\mu(x)=\int f(x)d\phi^*\mu(x)$.
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_refl` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_refl}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_refl}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_refl}
  \lean{MeasureTheory.addEquivAddHaarChar_refl}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \leanok
  $d_A(id)=1.$
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_trans` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_trans}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_trans}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_trans}
  \lean{MeasureTheory.addEquivAddHaarChar_trans}
  \uses{MeasureTheory.addEquivAddHaarChar}
  \leanok
  \discussion{511}
  $d_A(\phi\circ\psi)=d_A(\phi)d_A(\psi).$
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar}`; lean: `\lean{MeasureTheory.ringHaarChar}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar,MeasureTheory.addEquivAddHaarChar_refl,
  MeasureTheory.addEquivAddHaarChar_trans}`.
  - source:
```tex
\begin{definition}
  \label{MeasureTheory.ringHaarChar}
  \lean{MeasureTheory.ringHaarChar}
  \uses{MeasureTheory.addEquivAddHaarChar,MeasureTheory.addEquivAddHaarChar_refl,
  MeasureTheory.addEquivAddHaarChar_trans}
  \leanok
  We define $\delta_R(u)$ (or just $\delta(u)$ when the ring $R$ is clear) to be $d_R(\ell_u)$.
\end{definition}
```
- [ ] `MeasureTheory.ringHaarChar_mul_integral` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_mul_integral}`; lean: `\lean{MeasureTheory.ringHaarChar_mul_integral}`; uses: `\uses{MeasureTheory.ringHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_mul_integral}
  \lean{MeasureTheory.ringHaarChar_mul_integral}
  \uses{MeasureTheory.ringHaarChar}
  \leanok
  \discussion{514}
  If $f:R\to\R$ is a Borel measurable function and $u\in R^\times$ then
  $\delta_R(u)\int f(ux)d\mu(x)=\int f(x)d\mu(x)$.
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_mul_volume` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_mul_volume}`; lean: `\lean{MeasureTheory.ringHaarChar_mul_volume}`; uses: `\uses{MeasureTheory.ringHaarChar,MeasureTheory.addEquivAddHaarChar_smul_preimage}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_mul_volume}
  \lean{MeasureTheory.ringHaarChar_mul_volume}
  \uses{MeasureTheory.ringHaarChar,MeasureTheory.addEquivAddHaarChar_smul_preimage}
  \leanok
  \discussion{515}
  If $X$ is a Borel subset of $R$ and $r\in R^\times$ then $\mu(rX)=\delta_R(r)\mu(X)$.
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_continuous` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_continuous}`; lean: `\lean{MeasureTheory.ringHaarChar_continuous}`; uses: `\uses{MeasureTheory.ringHaarChar}`.
  - source:
```tex
\begin{corollary}
  \label{MeasureTheory.ringHaarChar_continuous}
  \lean{MeasureTheory.ringHaarChar_continuous}
  \uses{MeasureTheory.ringHaarChar}
  \leanok
  \discussion{516}
  The function $\delta_R:R^\times\to\R_{>0}$ is continuous.
\end{corollary}
```
- [ ] `MeasureTheory.ringHaarChar_real` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_real}`; lean: `\lean{MeasureTheory.ringHaarChar_real}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_real}
  \lean{MeasureTheory.ringHaarChar_real}
  If $R=\R$ then $\delta_R(u)=|u|$.
  \leanok
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_complex` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_complex}`; lean: `\lean{MeasureTheory.ringHaarChar_complex}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_complex}
  \lean{MeasureTheory.ringHaarChar_complex}
  \leanok
  If $R=\bbC$ then $\delta_R(u)=|u|^2$.
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_padic` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_padic}`; lean: `\lean{MeasureTheory.ringHaarChar_padic}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_padic}
  \lean{MeasureTheory.ringHaarChar_padic}
  \leanok
  If $R=\Q_p$ then $\delta_R(u)=|u|_p$, the usual $p$-adic norm.
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}`; uses: `\uses{MeasureTheory.ringHaarChar}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}
  \lean{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det,
    MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}
  \uses{MeasureTheory.ringHaarChar}
  \leanok
  \discussion{517}
  Assume that there's an $F$-basis for $V$ such that $\phi$ is a product of elementary
  and diagonal matrices (note that this is automatic if $F$ is a field and mathlib
```
- [ ] `MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det}`; lean: `\lean{MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det}`.
  - source:
```tex
  \begin{corollary}
  \label{MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det}
  \lean{MeasureTheory.algebra_ringHaarChar_eq_ringHaarChar_det}
  \leanok
  If $u\in R^\times$ then $\delta_R(u)=\delta_F(\det(\ell_u))$.
\end{corollary}
```
- [ ] `IsSimpleRing.mulLeft_det_eq_mulRight_det` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsSimpleRing.mulLeft_det_eq_mulRight_det}`; lean: `\lean{IsSimpleRing.mulLeft_det_eq_mulRight_det}`.
  - source:
```tex
\begin{lemma}
  \label{IsSimpleRing.mulLeft_det_eq_mulRight_det}
  \lean{IsSimpleRing.mulLeft_det_eq_mulRight_det}
  \leanok
  \discussion{518}
  Say $B$ is a finite-dimensional central simple algebra over a field~$k$,
  and $u\in B^\times$. Let $\ell_u:B\to B$ be the $k$-linear mapping $x$ to $ux$ and
  let $r_u:B\to B$ be the $k$-linear map sending $x$ to $xu$. Then
  $\det(\ell_u)=\det(r_u)$.
\end{lemma}
```
- [ ] `IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}`; lean: `\lean{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}`.
  - source:
```tex
\begin{corollary}
  \label{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}
  \lean{IsSimpleRing.ringHaarChar_eq_addEquivAddHaarChar_mulRight}
  \leanok
  If $B$ is a central simple algebra over a locally compact field $F$, and if $u\in B^\times$,
  then $d_B(r_u)=\delta_B(u)$ (recall that the latter is defined to mean $d_B(\ell_u)$).
\end{corollary}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_prodCongr` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_prodCongr}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_prodCongr}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_prodCongr}
  \lean{MeasureTheory.addEquivAddHaarChar_prodCongr}
  \leanok
  \discussion{520}
  If $(A,+)$ and $(B,+)$ are locally compact topological abelian groups,
  and if $\phi:A\to A$ and $\psi:B\to B$ are additive homeomorphisms,
  then $\phi\times\psi:A\times B\to A\times B$ is an additive homeomorphism (this is
  obvious), and
  $d_{A\times B}(\phi\times\psi)=d_A(\phi)d_B(\psi)$.
```
- [ ] `MeasureTheory.addEquivAddHaarChar_piCongrRight` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_piCongrRight}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_piCongrRight}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar_prodCongr}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_piCongrRight}
  \lean{MeasureTheory.addEquivAddHaarChar_piCongrRight}
  \leanok
  \discussion{521}
  \uses{MeasureTheory.addEquivAddHaarChar_prodCongr}
  If $A_i$ are a finite collection of locally compact topological abelian groups,
  with $\phi_i:A_i\to A_i$ additive homeomorphisms, then $d_{\prod_i A_i}(\prod_i\phi_i)=\prod_i d_{A_i}(\phi_i)$.
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_prod` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_prod}`; lean: `\lean{MeasureTheory.ringHaarChar_prod}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar_prodCongr}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_prod}
  \lean{MeasureTheory.ringHaarChar_prod}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_prodCongr}
  If $R$ and $S$ are locally compact topological rings, then $\delta_{R\times S}(r,s)=\delta_R(r)\times\delta_S(s)$.
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_pi` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_pi}`; lean: `\lean{MeasureTheory.ringHaarChar_pi}`; uses: `\uses{MeasureTheory.addEquivAddHaarChar_piCongrRight}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_pi}
  \lean{MeasureTheory.ringHaarChar_pi}
  \leanok
  \uses{MeasureTheory.addEquivAddHaarChar_piCongrRight}
  If $R_i$ are a finite collection of locally compact topological rings,
  and $u_i\in R_i^\times$ then $\delta_{\prod_i R_i}((u_i)_i)=\prod_i\delta_{R_i}(u_i)$.
\end{lemma}
```
- [ ] `Topology.IsOpenEmbedding.isHaarMeasure_comap` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Topology.IsOpenEmbedding.isHaarMeasure_comap}`; lean: `\lean{Topology.IsOpenEmbedding.isHaarMeasure_comap}`.
  - source:
```tex
\begin{lemma}
  \label{Topology.IsOpenEmbedding.isHaarMeasure_comap}
  \lean{Topology.IsOpenEmbedding.isHaarMeasure_comap}
  \leanok
  \discussion{507}
  Let $A$ and $B$ be locally compact topological groups
  and let $f:A\to B$ be both a group homomorphism and open embedding.
  The pullback along $f$ of a Haar measure on $B$ is a Haar measure on $A$.
\end{lemma}
```
- [ ] `Topology.IsOpenEmbedding.regular_comap` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Topology.IsOpenEmbedding.regular_comap}`; lean: `\lean{Topology.IsOpenEmbedding.regular_comap}`.
  - source:
```tex
\begin{lemma}
  \label{Topology.IsOpenEmbedding.regular_comap}
  \lean{Topology.IsOpenEmbedding.regular_comap}
  \leanok
  \discussion{513}
  The pullback of a regular Borel measure along an open
  embedding is a regular Borel measure.
\end{lemma}
```
- [ ] `MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}`; lean: `\lean{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}
  \lean{MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace}
  \leanok
  \discussion{532}
  Say $A$ is a compact topological additive group and $\phi:A\to A$ is an additive isomorphism.
Then $d_A(\phi)=1.$
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding}
  \lean{MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding}
  \leanok
  \discussion{551}
  If $f:A\to B$ is a group homomorphism and open embedding between locally compact
  topological additive groups and if $\alpha:A\to A$ and $\beta:B\to B$ are additive
  homeomorphisms such that the square commutes (i.e., $f\circ\alpha=\beta\circ f$)
  then $d_A(\alpha)=d_B(\beta)$.
\end{lemma}
```
- [ ] `Continuous.restrictedProduct_congrRight` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Continuous.restrictedProduct_congrRight}`; lean: `\lean{Continuous.restrictedProduct_congrRight}`.
  - source:
```tex
\begin{lemma}
  \lean{Continuous.restrictedProduct_congrRight}
  \label{Continuous.restrictedProduct_congrRight}
  \leanok
  \discussion{531}
  If the $A_i$ and $B_i$ are topological spaces and the $\phi_i$ are continuous functions,
  then the restricted product $\phi = \prod'_i\phi_i$ is a continuous function.
\end{lemma}
```
- [ ] `MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}`; lean: `\lean{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}`.
  - source:
```tex
\begin{theorem}
  \label{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}
  \lean{MeasureTheory.addEquivAddHaarChar_restrictedProductCongrRight}
  \leanok
  \discussion{552}
  With $A$, $A_i$, $C_i$, $\phi_i$, $\phi$ defined as above, we have
  $\delta_A(\phi)=\prod_i\delta_{A_i}(\phi_i)$.
\end{theorem}
```
- [ ] `MeasureTheory.ringHaarChar_restrictedProduct` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_restrictedProduct}`; lean: `\lean{MeasureTheory.ringHaarChar_restrictedProduct}`.
  - source:
```tex
\begin{corollary}
  \label{MeasureTheory.ringHaarChar_restrictedProduct}
  \lean{MeasureTheory.ringHaarChar_restrictedProduct}
  \leanok
  \discussion{554}
  If $u=(u_i)_i\in R^\times$ then $\delta_R(u)=\prod_i\delta_{R_i}(u_i)$.
\end{corollary}
```
- [ ] `IsModuleTopology.continuous_bilinear_of_finite_left` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{IsModuleTopology.continuous_bilinear_of_finite_left}`; lean: `\lean{IsModuleTopology.continuous_bilinear_of_finite_left}`.
  - source:
```tex
\begin{lemma}
  \label{IsModuleTopology.continuous_bilinear_of_finite_left}
  \lean{IsModuleTopology.continuous_bilinear_of_finite_left}
  \leanok
  Say $R$ and $S$ are topological rings, and $S$ is an $R$-algebra, finite as an $R$-module.
  Assume that the topology
  on $S$ is the $R$-module topology. Now say $M$ is an $S$-module, and give it the induced
  $R$-module structure. Then the $R$-module topology and $S$-module topology on~$M$ coincide.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv}`; lean: `\lean{NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv}`.
  - source:
```tex
\begin{corollary}
  \label{NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv}
  \lean{NumberField.AdeleRing.ModuleBaseChangeContinuousLinearEquiv}
  \leanok
  If $K$ is a number field and $V$ is an $K$-module, then
  the natural isomorphism $V\otimes_K\A_K=V\otimes_{\Q}\A_{\Q}$ induced by the natural
  isomorphism $\A_K=K\otimes_K\A_{\Q}$ is a homeomorphism if the left hand side has the $\A_K$-module
  topology and the right hand side has the $\A_{\Q}$-module topology.
\end{corollary}
```
- [ ] `NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}`; lean: `\lean{NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}
  \lean{NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul}
  \leanok
  Let $B$ be a finite-dimensional central simple $K$-algebra.
  Say $u\in B_{\A}^\times$, and define $\ell_u$ and $r_u:B_{\A}\to B_{\A}$ by
  $\ell_u(x)=ux$ and $r_u(x)=xu$. Then $d_{B_{\A}}(\ell_u)=d_{B_{\A}}(r_u)$.
\end{theorem}
```
- [ ] `MeasureTheory.ringHaarChar_adeles_rat` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_adeles_rat}`; lean: `\lean{MeasureTheory.ringHaarChar_adeles_rat}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_adeles_rat}
  \lean{MeasureTheory.ringHaarChar_adeles_rat}
  \leanok
  If $x\in\A_{\Q}^\times$ then $\delta_{\A_{\Q}}(x)=\prod_v|x_v|_v.$
\end{lemma}
```
- [ ] `MeasureTheory.ringHaarChar_adeles_units_rat_eq_one` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.ringHaarChar_adeles_units_rat_eq_one}`; lean: `\lean{MeasureTheory.ringHaarChar_adeles_units_rat_eq_one}`.
  - source:
```tex
\begin{lemma}
  \label{MeasureTheory.ringHaarChar_adeles_units_rat_eq_one}
  \lean{MeasureTheory.ringHaarChar_adeles_units_rat_eq_one}
  \leanok
  If $x\in\Q^\times\subseteq\A_{\Q}^\times$ then $\delta_{\A_{\Q}}(x)=1.$
\end{lemma}
```
- [ ] `MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}`; lean: `\lean{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}`.
  - source:
```tex
  \begin{theorem}
    \label{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}
    \lean{MeasureTheory.addHaarScalarFactor_tensor_adeles_eq_one}
    \leanok
    In the above situation ($V$ a finite-dimensional $\Q$-vector space, $\phi:V\cong V$ is
    $\Q$-linear, $\phi_{\A}$ the base extension to $V_{\A}:=V\otimes_{\Q}{\A_{\Q}}$, a continuous linear
    endomorphism of $V_{\A}$ with the $\A_{\Q}$-module topology), we have $d_{V_{\A}}(\phi_{\A})=1.$
  \end{theorem}
```
- [ ] `NumberField.AdeleRing.units_mem_ringHaarCharacter_ker` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}`; lean: `\lean{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}`.
  - source:
```tex
  \begin{corollary}
    \label{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}
    \lean{NumberField.AdeleRing.units_mem_ringHaarCharacter_ker}
    \leanok
    If $B$ is a finite-dimensional $\Q$-algebra (for example a number field, or a quaternion algebra over a number field),
    if $B_{\A}$ denotes the ring $B\otimes_{\Q}\A_{\Q}$, and if $b\in B^\times$,
    then $\delta_{B_{\A}}(b)=1$.
  \end{corollary}
```
- [ ] `NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one}`; lean: `\lean{NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one}`.
  - source:
```tex
  \begin{corollary}
    \label{NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one}
    \lean{NumberField.AdeleRing.addEquivAddHaarChar_mulRight_unit_eq_one}
    \leanok
    If $B$ is a finite-dimensional $\Q$-algebra and
    if $b\in B^\times$ then right multiplication by $b$
    does not change Haar measure on $B_{\A}$.
  \end{corollary}
```
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
- Open work: 16 source nodes need port attention (16 formal statements, 0 proof sketches).
- Tasks:
- [ ] `NumberField.AdeleRing.DivisionAlgebra.compact_quotient` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.compact_quotient}`.
  - source:
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
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.existsE` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \leanok
  There's a compact subset $E$ of $D_{\A}$
  with the property that for all $x\in D_{\A}^{(1)}$,
  the obvious map $xE\to D\backslash D_{\A}$ is not injective.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.E` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.E}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.E}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.existsE}
  \leanok
  We let $E$ denote any compact set satisfying the hypothesis of the previous lemma.
\end{definition}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.X` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.X}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.E}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  \leanok
Define $X:=E-E:=\{e-f:e,f\in E\}\subseteq D_{\A}$.
\end{definition}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.Y` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
Define $Y:=X.X:=\{xy:x,y\in X\}\subseteq D_{\A}$.
\end{definition}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
  $X$ is a compact subset of $D_{\A}$.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.Y_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \leanok
  $Y$ is a compact subset of $D_{\A}$.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X, NumberField.AdeleRing.DivisionAlgebra.Aux.E}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X, NumberField.AdeleRing.DivisionAlgebra.Aux.E}
  % TODO I used E in the statement of the lemma here
  \leanok
  If $\beta\in D_{\A}^{(1)}$ then
$\beta X\cap D^\times\not=\emptyset$.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel'}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
  Similarly, if $\beta\in D_{\A}^{(1)}$ then
  $X\beta^{-1}\cap D^\times\not=\emptyset$.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.T` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.T}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.T}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.T}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.T}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.Y}
  \leanok
  Let $T:=Y\cap D^\times$.
\end{definition}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.T}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.T}
  \leanok
  $T$ is finite.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.C` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.C}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.T,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X}`.
  - source:
```tex
\begin{definition}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.T,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X}
  \leanok
  Define $C:= (T^{-1}.X) \times X\subset D_{\A}\times D_{\A}$.
\end{definition}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C,
    NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.C_compact}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C,
    NumberField.AdeleRing.DivisionAlgebra.Aux.T_finite,
    NumberField.AdeleRing.DivisionAlgebra.Aux.X_compact}
  \leanok
  $C$ is compact.
\end{lemma}
```
- [ ] `NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}`; lean: `\lean{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}`; uses: `\uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C}`.
  - source:
```tex
\begin{lemma}
  \label{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}
  \lean{NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C}
  \uses{NumberField.AdeleRing.DivisionAlgebra.Aux.C}
  \leanok
  For every $\beta\in D_{\A}^{(1)}$, there exists $b\in D^\times$
  and $\nu\in D_{\A}^{(1)}$ such that $\beta=b\nu$ and $(\nu,\nu^{-1})\in C.$
\end{lemma}
```
- [ ] `NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}`; lean: `\lean{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \lean{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \leanok
  $D^\times\backslash(D\otimes_K\A_K^\infty)^\times$ is compact.
\end{theorem}
```
- [ ] `NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}`; lean: `\lean{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}`; uses: `\uses{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}`.
  - source:
```tex
\begin{theorem}
  \label{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  \lean{NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset}
  \uses{NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact}
  \leanok
  If $U$ is an open subgroup of $(D\otimes_K \A_K^\infty)^\times$
  then the double coset space $D^\times\backslash(D\otimes_K \A_K^\infty)^\times/U$ is finite.
\end{theorem}
```
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
- Open work: 6 source nodes need port attention (6 formal statements, 0 proof sketches).
- Tasks:
- [ ] `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}`.
  - source:
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
```
- [ ] `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}`; uses: `\uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}`.
  - source:
```tex
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm}
  \leanok
  Pointwise addition $(f_1+f_2)(g):=f_1(g)+f_2(g)$ makes $S^D(R)$ into an
  additive abelian group.
\end{definition}
```
- [ ] `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}`; uses: `\uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}`.
  - source:
```tex
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup}
  \leanok
  If $R$ is a commutative ring then pointwise scalar multiplication $(r\cdot f)(g):= r\cdot(f(g))$ makes
  $S^D(R)$ into an $R$-module.
\end{definition}
```
- [ ] `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction}`; uses: `\uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}`.
  - source:
```tex
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \leanok
  The group $D_{\A^f}^\times$ acts on the additive abelian group $S^D(R)$ by $(g\cdot f)(x)=f(xg)$.
\end{definition}
```
- [ ] `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel}`; uses: `\uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}`.
  - source:
```tex
\begin{definition}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicFormOfLevel}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.addCommGroup,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.distribMulAction,
    TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  \leanok
  The quaternionic modular forms of level $U$, with notation $S^D(U;R)$, are the $U$-invariants for the $D_{\A^\infty}^\times$-action on $S^D(R)$.
\end{definition}
```
- [ ] `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}`; uses: `\uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}`.
  - source:
```tex
\begin{theorem}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}
  \label{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional}
  \uses{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.module}
  Let $k$ be a field. Then the space $S^D(U;k)$ is a finite-dimensional $k$-vector space.
\end{theorem}
```
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
- Open work: 21 source nodes need port attention (21 formal statements, 0 proof sketches).
- Tasks:
- [ ] `AbstractHeckeOperator.HeckeOperator_toFun` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AbstractHeckeOperator.HeckeOperator_toFun}`; lean: `\lean{AbstractHeckeOperator.HeckeOperator_toFun}`.
  - source:
```tex
\begin{definition}
  \lean{AbstractHeckeOperator.HeckeOperator_toFun}
  \label{AbstractHeckeOperator.HeckeOperator_toFun}
  \leanok
  Assuming $UgV$ is a finite union of cosets $g_iV$,
  we define $[UgV]:A^V\to A^U$ to be the map sending $a\in A^V$
  to $\sum_i g_ia.$
\end{definition}
```
- [ ] `AbstractHeckeOperator.HeckeOperator` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AbstractHeckeOperator.HeckeOperator}`; lean: `\lean{AbstractHeckeOperator.HeckeOperator}`; uses: `\uses{AbstractHeckeOperator.HeckeOperator_toFun}`.
  - source:
```tex
\begin{lemma}
  \lean{AbstractHeckeOperator.HeckeOperator}
  \label{AbstractHeckeOperator.HeckeOperator}
  \uses{AbstractHeckeOperator.HeckeOperator_toFun}
  \leanok
  This function is well-defined (that is, independent of the
  choice of $g_i$), has image in $A^U$ and is $R$-linear.
\end{lemma}
```
- [ ] `AbstractHeckeOperator.comm` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{AbstractHeckeOperator.comm}`; lean: `\lean{AbstractHeckeOperator.comm}`; uses: `\uses{AbstractHeckeOperator.HeckeOperator}`.
  - source:
```tex
\begin{lemma}
  \lean{AbstractHeckeOperator.comm}
  \label{AbstractHeckeOperator.comm}
  \uses{AbstractHeckeOperator.HeckeOperator}
  \leanok
  Say $g,h\in G$ and we have $UgU=\coprod_i g_iU$
  and $UhU=\coprod_j h_j$ and we have $g_ih_j=h_jg_i$ for all $i,j$.
  Then $[UgU][UhU]=[UhU][UgU]$, that is, the Hecke operators
  acting on $A^U$ commute.
\end{lemma}
```
- [ ] `QuotientGroup.mk_image_finite_of_compact_of_open` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{QuotientGroup.mk_image_finite_of_compact_of_open}`; lean: `\lean{QuotientGroup.mk_image_finite_of_compact_of_open}`.
  - source:
```tex
\begin{lemma}
  \lean{QuotientGroup.mk_image_finite_of_compact_of_open}
  \label{QuotientGroup.mk_image_finite_of_compact_of_open}
  \discussion{563}
  \leanok
  If $U$ and $V$ are compact subgroups of a topological group~$G$,
  if $V$ is also open, and if $g\in G$, then the double coset space $UgV$
  is a finite union of left cosets $g_iV$.
\end{lemma}
```
- [ ] `Homeomorph.restrictedProductProd` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Homeomorph.restrictedProductProd}`; lean: `\lean{Homeomorph.restrictedProductProd}`.
  - source:
```tex
\begin{lemma}
  \lean{Homeomorph.restrictedProductProd}
  \label{Homeomorph.restrictedProductProd}
  \leanok
  \discussion{568}
  If $A_i$ is a family of topological spaces equipped with open
  subsets $B_i$, and if $C_i$ is a family of topological spaces equipped
  with open subsets $D_i$, and if we equip $A_i\times C_i$ with the open
  subset $B_i\times D_i$, then the natural bijection
  $\prod'_i(A_i\times C_i)=\left(\prod'_iA_i\right)\times\left(\prod'_iB_i\right)$
```
- [ ] `Homeomorph.restrictedProductPi` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Homeomorph.restrictedProductPi}`; lean: `\lean{Homeomorph.restrictedProductPi}`.
  - source:
```tex
\begin{corollary}
  \lean{Homeomorph.restrictedProductPi}
  \label{Homeomorph.restrictedProductPi}
  \leanok
  \discussion{570}
  Restricted products (with respect to open subspaces) commute with finite products.
  In other words, if $j$ runs through a finite set $J$ and $i$ runs through an arbitrary
  set $I$, and if $X_{ji}$ are topological spaces equipped with open subspaces $Y_{ji}$,
  then the obvious bijection $\prod'_i(\prod_j X_{ji})=\prod_j\left(\prod'_i X_{ji}\right)$
  is a homeomorphism.
```
- [ ] `Homeomorph.restrictedProductMatrix` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Homeomorph.restrictedProductMatrix}`; lean: `\lean{Homeomorph.restrictedProductMatrix}`.
  - source:
```tex
\begin{corollary}
  \label{Homeomorph.restrictedProductMatrix}
  \lean{Homeomorph.restrictedProductMatrix}
  \leanok
  \discussion{571}
  If $X_i$ are topological spaces and the $Y_i$ are open subspaces,
  then the obvious map $M_n(\prod'_iX_i)=\prod'_iM_n(X_i)$ is a homeomorphism.
\end{corollary}
```
- [ ] `Submonoid.units_isOpen` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Submonoid.units_isOpen}`; lean: `\lean{Submonoid.units_isOpen}`.
  - source:
```tex
\begin{lemma}
  \lean{Submonoid.units_isOpen}
  \label{Submonoid.units_isOpen}
  \leanok
  \discussion{587}
  If $M$ is a topological monoid and $U$ is an open submonoid, then
  the units $U^\times$ of $U$ are naturally an open subgroup of $M^\times$.
\end{lemma}
```
- [ ] `Submonoid.units_isCompact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Submonoid.units_isCompact}`; lean: `\lean{Submonoid.units_isCompact}`.
  - source:
```tex
\begin{lemma}
  \lean{Submonoid.units_isCompact}
  \label{Submonoid.units_isCompact}
  \leanok
  \discussion{588}
  If $M$ is a Hausdorff topological monoid and $U$ is a compact submonoid,
  then the units $U^\times$ of $U$ are naturally a compact subgroup of $M^\times$.
\end{lemma}
```
- [ ] `ContinuousMulEquiv.piUnits` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ContinuousMulEquiv.piUnits}`; lean: `\lean{ContinuousMulEquiv.piUnits}`.
  - source:
```tex
\begin{lemma}
  \lean{ContinuousMulEquiv.piUnits}
  \label{ContinuousMulEquiv.piUnits}
  \leanok
  \discussion{581}
  If $U_i$ are topological monoids then the canonical
  group isomorphism $(\prod_i U_i)^\times=\prod_i(U_i^\times)$ is a homeomorphism.
\end{lemma}
```
- [ ] `ContinuousMulEquiv.restrictedProductUnits` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{ContinuousMulEquiv.restrictedProductUnits}`; lean: `\lean{ContinuousMulEquiv.restrictedProductUnits}`.
  - source:
```tex
\begin{theorem}
  \lean{ContinuousMulEquiv.restrictedProductUnits}
  \label{ContinuousMulEquiv.restrictedProductUnits}
  \leanok
  \discussion{582}
  If $M_i$ are a family of topological monoids equipped with open
  submonoids $U_i$, then the canonical map $(\prod'_iM_i)^\times\to\prod'_i(M_i^\times)$
  is a homeomorphism.
\end{theorem}
```
- [ ] `NumberField.isOpenAdicCompletionIntegers` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.isOpenAdicCompletionIntegers}`; lean: `\lean{NumberField.isOpenAdicCompletionIntegers}`.
  - source:
```tex
\begin{lemma}
  \lean{NumberField.isOpenAdicCompletionIntegers}
  \label{NumberField.isOpenAdicCompletionIntegers}
  \leanok
  $\calO_v$ is an open subring of $K_v$.
\end{lemma}
```
- [ ] `NumberField.instCompactSpaceAdicCompletionIntegers` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{NumberField.instCompactSpaceAdicCompletionIntegers}`; lean: `\lean{NumberField.instCompactSpaceAdicCompletionIntegers}`.
  - source:
```tex
\begin{lemma}
  \lean{NumberField.instCompactSpaceAdicCompletionIntegers}
  \label{NumberField.instCompactSpaceAdicCompletionIntegers}
  \leanok
  $\calO_v$ is a compact subring of $K_v$.
\end{lemma}
```
- [ ] `M2.localFullLevel.isOpen` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{M2.localFullLevel.isOpen}`; lean: `\lean{IsDedekindDomain.M2.localFullLevel.isOpen}`.
  - source:
```tex
\begin{lemma} $M_2(\calO_v)$ is an open subring of $M_2(K_v)$.
  \lean{IsDedekindDomain.M2.localFullLevel.isOpen}
  \label{M2.localFullLevel.isOpen}
  \leanok
\end{lemma}
```
- [ ] `M2.localFullLevel.isCompact` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{M2.localFullLevel.isCompact}`; lean: `\lean{IsDedekindDomain.M2.localFullLevel.isCompact}`.
  - source:
```tex
\begin{lemma} $M_2(\calO_v)$ is a compact subring of $M_2(K_v)$.
  \lean{IsDedekindDomain.M2.localFullLevel.isCompact}
  \label{M2.localFullLevel.isCompact}
  \leanok
\end{lemma}
```
- [ ] `nolean-compactopen-GL2` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{nolean-compactopen-GL2}`.
  - source:
```tex
\begin{lemma} $GL_2(\calO_v)$ is a compact open subgroup of $GL_2(K_v)$.
  \label{nolean-compactopen-GL2}
\end{lemma}
```
- [ ] `nolean-compactopen-U1p` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{nolean-compactopen-U1p}`.
  - source:
```tex
\begin{lemma}
  \label{nolean-compactopen-U1p} $U_v$ is a compact open subgroup of $GL_2(K_v)$.
\end{lemma}
```
- [ ] `bijOn_unipotent_mul_diagU1_U1diagU1` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{bijOn_unipotent_mul_diagU1_U1diagU1}`; lean: `\lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.HeckeOperator.Local.bijOn_unipotent_mul_diagU1_U1diagU1}`.
  - source:
```tex
\begin{lemma}
  \lean{TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.HeckeOperator.Local.bijOn_unipotent_mul_diagU1_U1diagU1}
  \label{bijOn_unipotent_mul_diagU1_U1diagU1}
  \leanok
  The double coset space $UgU$ is the disjoint union of $g_tU$ as $t$ ranges
  through $\calO_v/\alpha\calO_v$ and $g_t:=\begin{pmatrix}\alpha&\tilde{t}\\0&1\end{pmatrix}$,
  where $\tilde{t}$ is any lift of $t$ to $\calO_v$.
\end{lemma}
```
- [ ] `GL2.restrictedProduct` needs attention: missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{GL2.restrictedProduct}`; lean: `\lean{IsDedekindDomain.FiniteAdeleRing.GL2.restrictedProduct}`.
  - source:
```tex
\begin{theorem}
  \lean{IsDedekindDomain.FiniteAdeleRing.GL2.restrictedProduct}
  \label{GL2.restrictedProduct}
  \leanok
  $G$ is isomorphic and homeomorphic
  to the restricted product of $GL_2(K_v)$ with respect
  to the compact open subgroups $GL_2(\calO_v)$.
\end{theorem}
```
- [ ] `nolean-hecke-algebra-commutative-noetherian` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
- [ ] `nolean-product-of-U-alpha` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
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
\begin{definition}
  \lean{AbstractHeckeOperator.HeckeOperator_toFun}
  \label{AbstractHeckeOperator.HeckeOperator_toFun}
  \leanok
  Assuming $UgV$ is a finite union of cosets $g_iV$,
  we define $[UgV]:A^V\to A^U$ to be the map sending $a\in A^V$
  to $\sum_i g_ia.$
\end{definition}
```

## Appendix: A collection of results which are needed in the proof.
- Source: `chtopbestiary.tex` -> `Bestiary.lean`
- Scanned nodes: 43
- Open work: 33 source nodes need port attention (30 formal statements, 3 proof sketches).
- Tasks:
- [ ] `maximal_unramified_extension_of_p-adic_field` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{maximal_unramified_extension_of_p-adic_field}`.
  - source:
```tex
\begin{theorem}\label{maximal_unramified_extension_of_p-adic_field}\notready The maximal unramified extension $K^{un}$ in a given algebraic closure of $K$
    is Galois over $K$ with Galois group ``canonically'' isomorphic to $\widehat{\Z}$ in two ways; one of these two isomorphisms identifies $1\in\widehat{\Z}$ with an arithmetic Frobenius (the endomorphism inducing $x\mapsto x^q$ on the residue field of $K^{un}$, where $q$ is the size of the residue field of $K$). The other identifies 1 with geometric Frobenius (defined to be the inverse of arithmetic Frobenius).
\end{theorem}
```
- [ ] `local_Weil_group` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_Weil_group}`; uses: `\uses{maximal_unramified_extension_of_p-adic_field}`.
  - source:
```tex
\begin{definition}\label{local_Weil_group}\uses{maximal_unramified_extension_of_p-adic_field}\notready The topological group described above is called the \emph{Weil group} of $K$.
\end{definition}
```
- [ ] `local_class_field_theory` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_class_field_theory}`; uses: `\uses{local_Weil_group}`.
  - source:
```tex
\begin{theorem}\label{local_class_field_theory}\uses{local_Weil_group}\notready If $K$ is a finite extension of $\Q_p$ then there are two ``canonical'' isomorphisms of topological abelian groups, between $K^\times$ and the abelianisation of the Weil group of $K$.
\end{theorem}
```
- [ ] `local_galois_coh_finite` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_galois_coh_finite}`.
  - source:
```tex
\begin{theorem}
    \label{local_galois_coh_finite}
    \notready
    If $M$ is finite then the cohomology groups $H^i(G_K,M)$ all finite.
\end{theorem}
```
- [ ] `local_galois_coh_dim_two` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_galois_coh_dim_two}`.
  - source:
```tex
\begin{theorem} ["the dimension is 2"]\label{local_galois_coh_dim_two}\notready
  If $M$ is torsion then $H^i(G_K,M)=0$ if $i>2$.
\end{theorem}
```
- [ ] `local_galois_coh_top_degree` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_galois_coh_top_degree}`.
  - source:
```tex
\begin{theorem} ["top degree"]
    \label{local_galois_coh_top_degree}
    \notready
    $H^2(G_K,\mu_n)$ is ``canonically'' isomorphic to $\Z/n\Z$.
\end{theorem}
```
- [ ] `theorem @61` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - source:
```tex
\begin{theorem}\notready There is a ``canonical'' isomorphism $H^2(K,\mu_\infty)=\Q/\Z$.
\end{theorem}
```
- [ ] `proof @63` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}\notready
This is in Theorem II.5.2 in~\cite{serre-galcoh}.
\end{proof}
```
- [ ] `local_galois_coh_poincare` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_galois_coh_poincare}`.
  - source:
```tex
\begin{theorem} ["Poincar\'e duality"]\label{local_galois_coh_poincare}\notready
    If $\mu=\bigcup_{n\geq1}\mu_n$ and $M':=\Hom(M,\mu)$ is the dual of $M$ then for
    $0\leq i\leq 2$ the cup product pairing $H^i(G_K,M)\times H^{2-i}(G_K,M')\to H^2(G_K,\mu)=\Q/\Z$ is perfect.
\end{theorem}
```
- [ ] `proof @71` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}\notready This is Theorem 2 in section 5.2 in \cite{serre-galcoh}. Note again
    the dubious (as far as Lean is concerned) use of the equality symbol.
\end{proof}
```
- [ ] `local_galois_coh_euler_poincare` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{local_galois_coh_euler_poincare}`.
  - source:
```tex
\begin{theorem} ["Euler-Poincar\'e characteristic"]\label{local_galois_coh_euler_poincare}\notready
    If $h^i(M)$ denotes the order of $H^i(G_K,M)$ then $h^0(M)-h^1(M)+h^2(M)=0$.
\end{theorem}
```
- [ ] `global_class_field_theory` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{global_class_field_theory}`; uses: `\uses{local_class_field_theory}`.
  - source:
```tex
\begin{theorem}\label{global_class_field_theory}\uses{local_class_field_theory}\notready If $N$ is a finite extension of $\Q$ then there are two ``canonical'' isomorphisms of topological groups between the profinite abelian groups $\pi_0(\A_N^\times/N^\times)$ and $\GN^{\ab}$; one sends local uniformisers to arithmetic Frobenii and the other to geometric Frobenii; each of the global isomorphisms is compatible with the local isomorphisms above.
\end{theorem}
```
- [ ] `proof @85` needs attention: proof sketch still reads as unfinished.
  - source:
```tex
\begin{proof}\notready This is the main theorem of global class field theory; see for example Tate's article in~\cite{cf}.
\end{proof}
```
- [ ] `Skinner_Wiles_CFT_trick` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Skinner_Wiles_CFT_trick}`; uses: `\uses{global_class_field_theory}`.
  - source:
```tex
\begin{theorem}\label{Skinner_Wiles_CFT_trick}\uses{global_class_field_theory}\notready Let $S$ be a finite set of places of a number field $K$ . For each $v \in S$
let $L_v/K_v$ be a finite Galois extension. Then there is a finite solvable Galois extension
$L/K$ such that if $w$ is a place of $L$ dividing $v \in S$, then $L_w/K_v$ is isomorphic to $L_v/K_v$ as $K_v$-algebra. Moreover, if $K^{\avoid} /K$ is
any finite extension then we can choose $L$ to be linearly disjoint from $K^{\avoid}$.
\end{theorem}
```
- [ ] `topology_on_affine_variety_points` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{topology_on_affine_variety_points}`.
  - source:
```tex
\begin{definition}\label{topology_on_affine_variety_points} If $X$ is an affine scheme of finite
    type over $K$, and if $R$ is a $K$-algebra which is also a topological ring, then we define a topology on the $R$-points $X(R)$ of $K$ by embedding the $K$-algebra homomorphisms from $A$ to $R$ into the set-theoretic maps from $A$ to $R$ with its product topology, and giving it the subspace topology.
\end{definition}
```
- [ ] `topology_on_affine_variety_computation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{topology_on_affine_variety_computation}`; uses: `\uses{topology_on_affine_variety_points}`.
  - source:
```tex
\begin{theorem}\label{topology_on_affine_variety_computation}\uses{topology_on_affine_variety_points}
    If $X$ is as above and $X\to\mathbb{A}^n_K$ is a closed immersion, then the induced map from $X(R)$ with its topology as above to $R^n$ is an embedding of topological spaces (that is, a homeomorphism onto its image).
\end{theorem}
```
- [ ] `manifold_on_algebraic_variety_points` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{manifold_on_algebraic_variety_points}`.
  - source:
```tex
\begin{definition}\label{manifold_on_algebraic_variety_points}\notready Let $K$ be a field equipped with an isomorphism to the reals, complexes, or a finite extension of the $p$-adic numbers. Let $X$ be a smooth affine algebraic variety over $K$. Then the points $X(K)$ naturally inherit the structure of a manifold over $K$.
\end{definition}
```
- [ ] `manifold_on_algebraic_variety_computation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{manifold_on_algebraic_variety_computation}`; uses: `\uses{manifold_on_algebraic_variety_points}`.
  - source:
```tex
\begin{theorem}\label{manifold_on_algebraic_variety_computation}\uses{manifold_on_algebraic_variety_points}\notready
    If $X$ is as in the previous definition and $X\to\mathbb{A}^n_K$ is a closed immersion, then the induced map from $X(K)$ with its manifold structure to $K^n$ is an embedding of manifolds.
\end{theorem}
```
- [ ] `lie_group_from_algebraic_group` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{lie_group_from_algebraic_group}`; uses: `\uses{manifold_on_algebraic_variety_computation}`.
  - source:
```tex
\begin{corollary}\label{lie_group_from_algebraic_group}\uses{manifold_on_algebraic_variety_computation}\notready
    If $G$ is an affine algebraic group of finite type over $K=\R$ or $\bbC$ then $G(K)$ is naturally a real or complex Lie group.
\end{corollary}
```
- [ ] `connected_reductive_group` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{connected_reductive_group}`.
  - source:
```tex
\begin{definition}\label{connected_reductive_group}\notready An affine algebraic group~$G$ of finite type over a field~$k$ is said to be \emph{connected} if it is connected as a scheme, and \emph{reductive} if $G_{\overline{k}}$ has no nontrivial smooth connected unipotent normal $k$-subgroup.
\end{definition}
```
- [ ] `slowly_increasing` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{slowly_increasing}`.
  - source:
```tex
\begin{definition}\label{slowly_increasing}\notready A function $f : G(N_\infty)\to\bbC$ is \emph{slowly-increasing} if there exists some $C>0$
    and $n\geq1$ such that $|f(x)\leq C||x||_\rho^n$.
\end{definition}
```
- [ ] `slowly_increasing_well_defined` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{slowly_increasing_well_defined}`; uses: `\uses{slowly_increasing}`.
  - source:
```tex
\begin{theorem}\label{slowly_increasing_well_defined}\uses{slowly_increasing}\notready This is independent of the choice of $\rho$ as above.
\end{theorem}
```
- [ ] `automorphic_form` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{automorphic_form}`; uses: `\uses{slowly_increasing_well_defined,connected_reductive_group, lie_group_from_algebraic_group, topology_on_affine_variety_computation}`.
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
- [ ] `cuspidal_automorphic_form` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{cuspidal_automorphic_form}`; uses: `\uses{automorphic_form}`.
  - source:
```tex
\begin{definition}\label{cuspidal_automorphic_form}\uses{automorphic_form}\notready An automorphic form is \emph{cuspidal} (or ``a cusp form'') if it furthermore satisfies $\int_{U(N)\backslash U(\A_N)}\phi(ux)du=0$, where $P$ runs through all the proper parabolic subgroups of $G$ defined over $N$ and $U$ is the unipotent radical of $P$, and the integral is with respect to the measure coming from Haar measure.
\end{definition}
```
- [ ] `automorphic_form_actions` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{automorphic_form_actions}`; uses: `\uses{automorphic_form}`.
  - source:
```tex
\begin{definition}\label{automorphic_form_actions}\uses{automorphic_form}\notready The group $G(\A_N)$ acts on itself on the right, and this induces a left action of its
    subgroup $G(\A_N^f)\times U_\infty$ on the spaces of automorphic forms and cusp forms. The Lie algebra $\mathfrak{g}$ of $G(N_\infty)$ also acts, via differential operators. Furthermore the actions of $\mathfrak{g}$ and $U_\infty$ are compatible in the sense that the differential of the $U_\infty$ action is the action of its Lie algebra considered as a subalgebra of $\mathfrak{g}$. We say that the spaces are $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-modules.
\end{definition}
```
- [ ] `cuspidal_automorphic_form_decomposition` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{cuspidal_automorphic_form_decomposition}`; uses: `\uses{cuspidal_automorphic_form, automorphic_form_actions}`.
  - source:
```tex
\begin{theorem}\label{cuspidal_automorphic_form_decomposition}\uses{cuspidal_automorphic_form, automorphic_form_actions} The cusp forms decompose as a (typically infinite) direct sum of irreducible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-modules.
\end{theorem}
```
- [ ] `cuspidal_automorphic_representation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{cuspidal_automorphic_representation}`; uses: `\uses{cuspidal_automorphic_form_decomposition}`.
  - source:
```tex
\begin{definition}\label{cuspidal_automorphic_representation}\uses{cuspidal_automorphic_form_decomposition}\notready A cuspidal automorphic representation is an irreducible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-module isomorphic to an irreducible summand of the space of cusp forms.
\end{definition}
```
- [ ] `automorphic_representation` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{automorphic_representation}`; uses: `\uses{automorphic_form_actions}`.
  - source:
```tex
\begin{definition}\label{automorphic_representation}\uses{automorphic_form_actions}\notready An automorphic representation is an irreducible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-module isomorphic to an irreducible subquotient of the space of automorphic forms.
\end{definition}
```
- [ ] `automorphic_representation_local_decomposition` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{automorphic_representation_local_decomposition}`; uses: `\uses{automorphic_representation}`.
  - source:
```tex
\begin{theorem}\label{automorphic_representation_local_decomposition}\uses{automorphic_representation}\notready An irreducible admissible $(G(\A_N^f)\times U_\infty,\mathfrak{g})$-module is a restricted tensor product of irreducible representations $\pi_v$ of $G(N_v)$ as $v$ runs through the finite places of $N$, tensored with a tensor product of irreducible $(\mathfrak{g}_v,U_{\infty,v})$-modules as $v$ runs through the infinite places of $N$. The representations $\pi_v$ are unramified for all but finitely many $v$.
\end{theorem}
```
- [ ] `compatible_family` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{compatible_family}`.
  - source:
```tex
\begin{definition}\label{compatible_family}\discussion{23} Let $N$ be a number field. A \emph{compatible family of $d$-dimensional Galois representations over $N$} is a finite set of finite places $S$ of $N$,
a number field $E$, a monic degree $d$ polynomial $F_{\p}(X)\in E[X]$ for each finite place $\p$ of $K$ not in $S$ and, for each prime number $\ell$ and field embedding $\phi : E\to\Qlbar$ (or essentially equivalently for each finite place of $E$), a continuous homomorphism $\rho:\GK\to\GL_2(\Qlbar)$ unramified outside $S$ and the primes of $K$ above $\ell$, such that $\rho(\Frob_\p)$ has characteristic polynomial $P_\pi(X)$ if $\pi$ lies above a prime number $p\not=\ell$ with $p\not\in S$.
\end{definition}
```
- [ ] `Galois_representation_from_automorphic_representation_on_GL_2_form` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Galois_representation_from_automorphic_representation_on_GL_2_form}`; uses: `\uses{automorphic_representation,Shimura_varieties,compatible_family}`.
  - source:
```tex
\begin{theorem}\label{Galois_representation_from_automorphic_representation_on_GL_2_form}\uses{automorphic_representation,Shimura_varieties,compatible_family}\notready Given an automorphic representation $\pi$ for an inner form of $\GL_2$ over a totally real field and with reflex field~$E$, such that $\pi$ is weight 2 discrete series at every infinite place, there exists a compatible family of 2-dimensional Galois representations associated to $\pi$, with $S$ being the places at which $\pi$ is ramified, and $F_{\p}(X)$ being the monic polynomial with roots the two Satake parameters for $\pi$ at $\p$.
\end{theorem}
```
- [ ] `Shimura_varieties` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{Shimura_varieties}`.
  - source:
```tex
\begin{definition}\label{Shimura_varieties}\notready We need the definition of (the canonical model over $F$ of) the Shimura curve attached to an inner form of $\GL_2$ with precisely one split infinite place, and the same for the Shimura surface associated to an inner form split at two infinite places (and ramified elsewhere, so it's compact).
\end{definition}
```
- [ ] `moret-bailly` needs attention: no `\lean{...}` target; missing `\leanok` / `\mathlibok`.
  - metadata: labels: `\label{moret-bailly}`.
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
