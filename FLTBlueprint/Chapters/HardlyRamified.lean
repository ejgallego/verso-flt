import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Reducibility Of p-Torsion Of The Frey Curve" =>

:::group "hardly_ramified_program"
This chapter deduces reducibility of the Frey-curve torsion representation from
three deeper theorems about hardly ramified Galois representations.
:::

# Overview

In the reductions chapter we reduced Fermat's Last Theorem, modulo a hard
theorem from the `1970`s, to the assertion that `p`-torsion in the Frey curve
is reducible. In this chapter we deduce that assertion from three more complex
claims about hardly ramified Galois representations. One of those three claims
is comparatively close to Fontaine's work from the `1980`s on the
nonexistence of nontrivial abelian schemes over `\mathbf{Z}`. The other two
lie deeper and use techniques developed in the `1990`s and later around
Wiles-style `R = T` arguments.

The strategic point is the same one emphasized in the TeX source: just as
Minkowski's theorem says that a number field unramified at every prime must be
trivial, one expects a two-dimensional mod `p` Galois representation with very
little ramification to be forced into a very small class. The goal of the
chapter is to make that slogan precise enough to apply it to the Frey curve.

# Hardly Ramified Representations

Let $`(a,b,c,p)` be a Frey package, let `E` be the corresponding Frey curve
over $`\Q`, and let
$`\rho : \GQ \to \Aut(E(\Qbar)[p])`
be the `2`-dimensional Galois representation on the `p`-torsion of `E`. Our
goal is to prove that `\rho` is reducible.

To leverage the arithmetic of the Frey curve, we need a definition that
packages exactly how little ramification this representation has. Before giving
that definition, the TeX chapter pauses to specify the coefficient rings over
which the local conditions will be phrased.

:::definition "coefficient_ring_definition" (parent := "hardly_ramified_program")
A coefficient ring is a local pro-Artinian topological ring with finite residue
field. Equivalently, it is a profinite local ring with finite residue field for
which additive translates of open ideals form a basis for the topology.
:::

```tex "coefficient_ring_definition"
We say that a topological ring is \emph{pro-Artinian} if it is a projective
limit of Artin local rings each equipped with the discrete topology, and if it
has the projective limit topology. We are only concerned with local
pro-Artinian rings with finite residue field; such things can be checked to be
the same thing as topological local rings with finite residue field whose
underlying topological space is profinite, and such that additive translates of
open ideals form a basis for the topology. Let us call such rings
``coefficient rings'' for now.
```

The TeX chapter records several orientation remarks about coefficient rings.

- Any complete local Noetherian ring with finite residue field is a coefficient ring when equipped with its maximal-ideal-adic topology.
- In particular, finite fields and integer rings of finite extensions of $`\Q_p` are coefficient rings.
- If `R` is a coefficient ring, then `R` is the projective limit of the finite local rings `R / I` as `I` ranges over the open ideals of `R`.
- The TeX chapter also highlights non-Noetherian examples built from square-zero variables `\varepsilon_i`; these are useful because they make representability statements easier to formulate.
- The category of coefficient rings is equivalent to the pro-category of the category of finite local rings.
- A coefficient ring is pseudocompact in Grothendieck's sense, although pseudocompact local rings are more general because they may have infinite residue field.
- If `R` has residue characteristic `\ell`, then there is a unique continuous map $`\mathbf{Z}_\ell \to R`, so coefficient rings of characteristic `\ell` naturally carry `\ell`-adic cyclotomic characters.
- For deformation theory it is often convenient to fix the integer ring $`\mathcal{O}` in a finite extension of $`\Q_\ell` and work with coefficient `\mathcal{O}`-algebras rather than arbitrary coefficient rings.

Because a coefficient ring with residue characteristic `\ell` is naturally a
$`\mathbf{Z}_\ell`-algebra, we can talk about the `\ell`-adic cyclotomic
character with values in that ring. We are now ready to define hardly ramified
representations.

:::definition "hardly_ramified_definition" (parent := "hardly_ramified_program")
Let `R` be a coefficient ring with finite residue field of characteristic
$`\ell \ge 3`, and let `V` be a finite free `R`-module of rank `2` equipped
with the product topology. A continuous representation
$`\rho : \GQ \to \GL_R(V)` is hardly ramified if it satisfies four conditions:

- `\det(\rho)` is the cyclotomic character
- `\rho` is unramified outside $`2\ell`
- at $`2` there is a $`G_{\mathbf{Q}_2}`-stable short exact sequence $`0 \to R \to V \to R \to 0` whose quotient character is unramified and has square trivial
- at $`\ell`, for every open ideal `I` of `R`, the finite-image representation obtained from `\rho` modulo `I` comes from a finite flat group scheme

This is the organizing definition behind the chapter.
:::

```tex "hardly_ramified_definition"
\begin{definition}
  \lean{GaloisRepresentation.IsHardlyRamified}
  \label{hardly_ramified}
  \leanok
  Let $R$ be a coefficient ring with finite residue field of characteristic $\ell\geq3$.
  Let $V$ be a finite free $R$-module of rank~2, equipped with the product topology. A
  continuous representation $\rho: \GQ\to \GL_R(V)$ is said to be \emph{hardly ramified} if it
  satisfies the following four conditions:
\end{definition}
```

The point of the definition is that it packages four distinct local facts into
one reusable hypothesis. The determinant condition comes from the Weil pairing,
the ramification condition records the minimal bad places of the Frey curve,
the upper-triangular behavior at `2` reflects semistability there, and the
finite-flat condition at `\ell` is what makes the representation visible to
deformation theory as a geometric object rather than an arbitrary local system.

:::theorem "frey_torsion_hardly_ramified" (parent := "hardly_ramified_program")
The `\ell`-torsion representation in the Frey curve attached to a Frey package
`(a,b,c,\ell)` is hardly ramified.
This is the formal bridge from {uses "frey_curve_definition"}[] to the general
reducibility theorem below.
:::

```tex "frey_torsion_hardly_ramified"
\begin{theorem}
  \lean{FreyCurve.torsion_isHardlyRamified}
  \label{Frey_curve_hardly_ramified}
  \uses{hardly_ramified}
  \leanok
  The $\ell$-torsion $\rho:\GQ\to\GL_2(\Z/\ell\Z)$ in the Frey curve associated to a Frey
  package $(a,b,c,\ell)$ is hardly ramified.
\end{theorem}
```

:::proof "frey_torsion_hardly_ramified"
This theorem compresses the arithmetic of the Frey curve into the single
definition {uses "hardly_ramified_definition"}[].

The general elliptic-curve input is classical: the torsion is two-dimensional
and its determinant is cyclotomic, as explained in Silverman
{Informal.citep silvermanArithmeticEllipticCurves}[]. The Frey-specific work is
in the local conditions. The TeX chapter points to Serre's discussion of the
Frey curve and Serre's conjecture {Informal.citep serreModularityConjecture}[]
for the remaining facts: away from `2` and `\ell` the representation is
unramified, at `2` semistability and the Tate-curve analysis produce the
required unramified one-dimensional quotient of order at most `2`, and at
`\ell` the torsion is finite flat.

In the current blueprint, those arithmetic ingredients are spelled out through
{uses "elliptic_curve_torsion_determinant_cyclotomic"}[],
{uses "frey_curve_unramified_away_from_two_and_l"}[],
{uses "frey_curve_local_shape_at_two"}[], and
{uses "frey_curve_flat_at_l"}[].
:::

The TeX chapter inserts one important remark here: for hardly ramified mod
`\ell` representations, irreducible and absolutely irreducible are the same.
Because `\ell \ge 3` and the determinant is cyclotomic, complex conjugation
already has two distinct eigenvalues defined over the ground field. So the
later deformation-theoretic statements are not hiding any extra
absolutely-irreducible hypothesis.

:::theorem "hardly_ramified_reducible" (parent := "hardly_ramified_program")
If $`\ell \ge 3` is prime and
$`\rho : \GQ \to \GL_2(\mathbf{Z}/\ell\mathbf{Z})`
is hardly ramified, then `\rho` is reducible.
This is the key theorem about hardly ramified representations.
:::

The TeX chapter stresses that this is a consequence of Serre's conjecture,
now a theorem of Khare and Wintenberger
{Informal.citep khareWintenbergerII}[], but that the blueprint isolates a route
to this special case using the project's preferred modularity-lifting
infrastructure.

Given this theorem, the Wiles-side theorem from the reductions chapter is an
easy corollary.

:::theorem "frey_torsion_not_irreducible" (parent := "hardly_ramified_program")
The Frey curve torsion representation is not irreducible.
This is the direct Frey-curve specialization of
{uses "hardly_ramified_reducible"}[], and the modularity-side endpoint used in
{uses "wiles_frey_not_irreducible"}[] and therefore in
{uses "no_frey_package"}[].
:::

:::proof "frey_torsion_not_irreducible"
Combine {uses "frey_torsion_hardly_ramified"}[] with
{uses "hardly_ramified_reducible"}[].
:::

Our job of reducing FLT to theorems from the `1980`s is therefore reduced to
proving the general hardly ramified reducibility theorem stated above.

# Hardly Ramified Mod p Representations Are Reducible

The TeX chapter now states three theorems from which that general reducibility
theorem easily follows.

:::theorem "hardly_ramified_lifts" (parent := "hardly_ramified_program")
If `\ell \ge 3` is prime and
$`\overline{\rho} : \GQ \to \GL_2(\mathbf{Z}/\ell\mathbf{Z})`
is hardly ramified and irreducible, then there exists a finite extension
$`K / \Q_\ell` with integer ring $`\mathcal{O}` and a hardly ramified
$`\ell`-adic representation
$`\rho : \GQ \to \GL_2(\mathcal{O})`
whose reduction is isomorphic to $`\overline{\rho}`.
This is the first bridge away from characteristic `\ell`.
:::

:::proof "hardly_ramified_lifts"
The TeX file leaves the proof as future work, but its role is very clear. This
theorem says that irreducibility does not trap us inside the residual
representation: the relevant deformation problem is nonempty, and one can pass
to a genuine characteristic-zero representation while preserving the same
determinant, ramification restrictions, condition at `2`, and flatness
condition at `\ell`.

That is exactly the input needed to make the later modularity-lifting and
potential-modularity machinery available.
:::

:::theorem "hardly_ramified_compatible_family" (parent := "hardly_ramified_program")
A hardly ramified `\ell`-adic representation with irreducible reduction spreads
out to a compatible family over a number field. In particular, one can choose a
place `\lambda` above `\ell` recovering the original representation, and the
Frobenius characteristic polynomials agree across the family away from the
finitely many excluded primes.
This is the theorem that makes it legal to move from the original prime
`\ell` to a specialization at `3`.
:::

:::proof "hardly_ramified_compatible_family"
This is the gateway from one local deformation problem to a global family where
the switch to `3` can be analyzed. The original Frey package singles out one
prime, but the eventual contradiction is cleanest at `3`; a compatible family
is exactly what makes that comparison legitimate.

The TeX theorem is more detailed, quantifying over the odd-characteristic
finite places `\mu` of a number field `M` and requiring equality of Frobenius
characteristic polynomials for the resulting `\mu`-adic representations away
from the excluded primes. Inside the blueprint, that detailed statement is the
precise form of the strategy already signaled by
{uses "compatible_family_step"}[].
:::

In particular, one can move from an irreducible hardly ramified mod `\ell`
representation to a hardly ramified `3`-adic representation and hence to a
hardly ramified mod `3` representation.

:::theorem "hardly_ramified_mod_three" (parent := "hardly_ramified_program")
If `k` is a finite field of characteristic `3` and
$`\overline{\rho} : \GQ \to \GL_2(k)` is hardly ramified, then
$`\overline{\rho}` is an extension of the cyclotomic character by the trivial
representation.
This is the almost-complete classification of the mod `3` case recorded in the
TeX chapter.
:::

:::proof "hardly_ramified_mod_three"
This is the first place where the prime `3` becomes special rather than merely
convenient. The local conditions are rigid enough in characteristic `3` that
there is essentially no room for exotic irreducible behavior.

For the later contradiction, the key point is that the semisimplification is
already the expected reducible object.
:::

:::theorem "hardly_ramified_three_adic" (parent := "hardly_ramified_program")
If $`L / \Q_3` is a finite extension with integer ring `\mathcal{O}_L` and
$`\rho_3 : \GQ \to \GL_2(\mathcal{O}_L)` is hardly ramified, then, viewed as a
representation to $`\GL_2(L)`, one has
$`\rho_3^{ss} = 1 \oplus \chi_3`.
This is the `3`-adic classification theorem from which the final Frobenius
constraints are read off.
:::

:::proof "hardly_ramified_three_adic"
The TeX chapter presents this as the easiest of the three deep inputs. It is
the stage where the Fontaine-style discriminant argument enters: the mod `3`
classification and the local flatness and tameness hypotheses force any
would-be irreducible extension to cut out a number field with impossibly small
root discriminant.

So this theorem is where the chapter uses the historical input recorded as
{uses "odlyzko_root_discriminant_bound"}[], ultimately in the numerical form of
Poitou and Odlyzko {Informal.citep poitouOdlyzkoBounds}[].
:::

:::proof "hardly_ramified_reducible"
Assume for contradiction that a hardly ramified mod `\ell` representation
$`\overline{\rho}` is irreducible. By {uses "hardly_ramified_lifts"}[],
$`\overline{\rho}` lifts to a hardly ramified `\ell`-adic representation
`\rho`. By {uses "hardly_ramified_compatible_family"}[], that lift belongs to a
compatible family. Moving to the place above `3` and applying
{uses "hardly_ramified_three_adic"}[] shows that for primes $`p \nmid 6\ell`
the Frobenius characteristic polynomial is forced to be $`(X-p)(X-1)`.

Compatibility carries the same characteristic polynomials back to the original
`\ell`-adic representation and hence to $`\overline{\rho}`. By the Chebotarev
density theorem, $`\overline{\rho}` and $`1 \oplus \chi_\ell` have the same
characteristic polynomials everywhere, and Brauer--Nesbitt then forces
$`\overline{\rho}` to be reducible. That contradicts the assumption of
irreducibility.
:::

The TeX chapter closes with one final orientation remark: among these three
deep inputs, the `3`-adic theorem is the easiest, while the lifting and
compatible-family theorems are the places where modern `R = T`-style machinery
really enters.
