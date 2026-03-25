import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "An Example Of An Automorphic Form" =>

:::group "automorphic_example_program"
The old chapter develops one explicit quaternionic automorphic example to guide
the general definitions used later in the modularity-lifting story.
:::

# Introduction

:::definition "quaternionic_modular_form_example" (parent := "automorphic_example_program")
The chapter studies a concrete space of quaternionic modular forms, with the
eventual claim that a specific weight-2 level-2 example is one-dimensional.
:::

:::proof "quaternionic_modular_form_example"
The TeX chapter motivates this example through the role of `R = T`
theorems in the proof of Fermat's Last Theorem. For Wiles, the `R` came from
elliptic curves and the `T` came from classical modular forms. In the FLT
project’s preferred route, the relevant `T` comes instead from quaternionic
automorphic forms.

That shift is one reason the example matters. The chapter is not logically
essential to the proof, but it is meant to prevent the general quaternionic
theory from appearing out of nowhere. The explicit example serves as a test case
for what infrastructure the later chapters should actually build.

The TeX version is also personal in tone here: it says the author first learned
these objects by playing with explicit examples as a PhD student, and that this
is why the blueprint pauses for a concrete worked example before launching into
the totally real general theory.
:::

# A quaternion algebra

:::definition "hamilton_quaternion_algebra_over_q" (parent := "automorphic_example_program")
The example starts with Hamilton's quaternion algebra
$`\mathbf{Q} \oplus \mathbf{Q} i \oplus \mathbf{Q} j \oplus \mathbf{Q} k`$,
viewed as a noncommutative analogue of `2 × 2` matrices over `ℚ`.
:::

:::definition "hurwitz_quaternion_order" (parent := "automorphic_example_program")
The example is built from Hamilton's quaternions over $`\mathbf{Q}`$ together
with the Hurwitz order, which plays the role of an integral structure analogous
to `GL₂(ℤ)`.
:::

:::proof "hurwitz_quaternion_order"
The old TeX chapter explains that the Hurwitz order is preferred over the more
naive lattice `ℤ ⊕ ℤ i ⊕ ℤ j ⊕ ℤ k` because it is a maximal order and a
Euclidean domain. That makes it the natural arithmetic input for a concrete
automorphic-form computation.
:::

# Zhat

:::definition "profinite_completion_zhat" (parent := "automorphic_example_program") (lean := "ZHat")
The profinite completion $`\widehat{\mathbf{Z}}`$ is introduced as compatible
residue classes modulo all positive integers.
The chapter uses it as a low-level entry point to the adelic viewpoint.
:::

```tex "ZHat"
\section{\texorpdfstring{$\Zhat$}{Zhat}}

\begin{definition}\label{ZHat}\lean{ZHat}\leanok The profinite completion $\Zhat$ of $\Z$ is the set of
    all compatible collections $c=(c_N)_N$ of elements of $\Z/N\Z$ indexed by $\N^+:=\{1,2,3,\ldots\}$.
    A collection is said to be \emph{compatible} if for all positive integers
    $D\mid N$, we have $c_N$ mod $D$ equals $c_D$.
\end{definition}
```

The TeX chapter motivates this detour historically. Classical automorphic forms
are functions on symmetric spaces such as the upper half-plane, but when one
works over number fields with nontrivial class group the classical approach
becomes awkward: Hecke operators want prime ideals, not just principal positive
integers. The adelic viewpoint fixes this, and `\widehat{Z}` is introduced as a
low-level toy model for the finite adelic direction.

:::theorem "zhat_is_a_ring" (parent := "automorphic_example_program") (lean := "ZHat.commRing")
The set of compatible residue-class collections forms a ring, naturally sitting
inside the product of all `ℤ / Nℤ`.
This is the ring structure on {uses "profinite_completion_zhat"}[].
:::

:::proof "zhat_is_a_ring"
The point here is not depth but orientation: all ring operations are inherited
componentwise, and compatibility with reduction maps is preserved by those same
operations.
:::

```tex "ZHat.commRing"
\begin{lemma}
    \label{ZHat.commRing}
    \lean{ZHat.commRing}
    \uses{ZHat}
    \leanok
    $\Zhat$ is a subring of $\prod_{N\geq1}(Z/N\Z)$ and in particular is a ring.
\end{lemma}
\begin{proof} \leanok Follow your nose.
\end{proof}
```

:::theorem "zhat_nontrivial" (parent := "automorphic_example_program") (lean := "ZHat.nontrivial")
The elements `0` and `1` are distinct in $`\widehat{\mathbf{Z}}`$.
This is an immediate consequence of the ring structure from
{uses "zhat_is_a_ring"}[].
:::

:::proof "zhat_nontrivial"
The TeX proof just evaluates both elements at `2`: their images in `ℤ/2ℤ` are
different, so the compatible collections themselves are different.
:::

```tex "ZHat.nontrivial"
\begin{lemma}
    \label{ZHat.nontrivial}
    \lean{ZHat.nontrivial}
    \uses{ZHat.commRing}
    \leanok
    $0\not=1$ in $\Zhat$.
\end{lemma}
\begin{proof}
    \leanok
    Recall that you can evaluate an element of $\Zhat$ at a positive integer.
    Evaluating $0$ at 2 gives $0$, and evaluating $1$ at $2$ gives $1$, and these
    are distinct elements of $\Z/2\Z$, so $0\not=1$ in $\Zhat$.
\end{proof}
```

:::theorem "zhat_char_zero" (parent := "automorphic_example_program") (lean := "ZHat.charZero")
The natural map from the natural numbers into $`\widehat{\mathbf{Z}}`$ is
injective.
This amplifies the basic separation argument already visible in
{uses "zhat_nontrivial"}[].
:::

:::proof "zhat_char_zero"
The TeX chapter treats this as an immediate generalization of
{uses "zhat_nontrivial"}[]: two different naturals can be separated by reducing
modulo a suitable integer.
:::

```tex "ZHat.charZero"
\begin{lemma}
    \label{ZHat.charZero}
    \lean{ZHat.charZero}
    \leanok
    The map from the naturals into $\Zhat$ sending $n$ to $n$ is injective.
\end{lemma}
\begin{proof}
    \leanok
    Generalise the above idea. Feel free to write up a LaTeX proof and PR it.
\end{proof}
```

:::theorem "zhat_is_not_the_integers" (parent := "automorphic_example_program") (lean := "ZHat.e_not_in_Int")
The profinite completion contains the image of the integers, but it is much
larger than `ℤ`.
:::

:::proof "zhat_is_not_the_integers"
The TeX chapter immediately follows the ring construction with this warning.
`ℤ` embeds into `\widehat{\mathbf{Z}}` by reduction modulo every positive
integer, but the target has far more compatible residue-class collections than
those coming from a single integer.

That gap is not a pathology; it is exactly why the profinite completion is a
useful finite-adelic toy model rather than just a verbose restatement of `ℤ`.
:::

:::definition "example_element_of_zhat" (parent := "automorphic_example_program") (lean := "ZHat.e")
The TeX blueprint highlights the formal infinite sum
$`0! + 1! + 2! + \cdots`$ as a concrete element of $`\widehat{\mathbf{Z}}`$
that is not visibly an integer.
The construction uses the ring object from {uses "zhat_is_a_ring"}[].
:::

:::proof "example_element_of_zhat"
Modulo any positive integer `N`, the factorial series stabilizes after
`(N-1)!`, because every subsequent term is divisible by `N`. So the sequence of
partial factorial sums defines a compatible adelic-style object even though the
naive infinite sum diverges in the ordinary real sense.
:::

:::theorem "factorial_element_not_integer" (parent := "automorphic_example_program") (lean := "ZHat.e_not_in_Int")
The factorial-series element of $`\widehat{\mathbf{Z}}`$ is not in the image of
`ℤ`.
This is the nontriviality statement attached to
{uses "example_element_of_zhat"}[].
:::

:::proof "factorial_element_not_integer"
The TeX argument is a neat size estimate. If the element were an ordinary
integer `n`, then reducing modulo a suitable large factorial would force `n` to
lie strictly between two distinct ordinary integers that represent the same
residue class, which is impossible. The same idea works for positive and
negative `n`.

So the factorial example is not just a curiosity: it is the first explicit
witness that `\widehat{\mathbf{Z}}` is genuinely larger than `ℤ`.
:::

:::theorem "zhat_torsionfree" (parent := "automorphic_example_program") (lean := "ZHat.torsionfree")
Multiplication by a positive integer is injective on $`\widehat{\mathbf{Z}}`.
This is the torsion-freeness input later reused in the `\widehat{\mathbf{Q}}`
discussion.
The TeX proof uses {uses "zhat_is_a_ring"}[] and {uses "zhat_char_zero"}[].
:::

:::proof "zhat_torsionfree"
The TeX proof is coordinatewise. If `N z = 0` in `\widehat{\mathbf{Z}}`, then in
particular the `(Nj)`-coordinate is annihilated by `N`, forcing the `j`-th
coordinate to vanish after reducing modulo `j`. Since this works for every
positive `j`, the whole compatible collection is zero.
:::

:::theorem "zhat_multiples_criterion" (parent := "automorphic_example_program") (lean := "ZHat.multiples")
An element of $`\widehat{\mathbf{Z}}`$ is divisible by `N` if and only if its
`N`-th coordinate is zero.
This is the divisibility criterion used repeatedly later in
{uses "qhat_lowest_terms"}[] and {uses "qhat_additive_decomposition"}[].
The TeX proof uses {uses "zhat_is_a_ring"}[].
:::

:::proof "zhat_multiples_criterion"
Necessity is immediate. For sufficiency, the TeX proof constructs the quotient
coordinatewise by dividing the `(Nj)`-coordinate by `N`, using compatibility and
the vanishing of the `N`-th coordinate to show that this makes sense.

This criterion becomes a basic tool once the chapter moves from
`\widehat{\mathbf{Z}}` to `\widehat{\mathbf{Q}}`.
:::

# More Advanced Remarks On Zhat Versus Q

This section can be skipped on first reading.

The TeX chapter steps back here and explains why `\widehat{\mathbf{Z}}` is not
just a curiosity. Seen abstractly, it is the profinite completion of the
additive group `ℤ`. But the blueprint wants to emphasize a different point:
completing before localizing gives a far more arithmetic object than the usual
route through `ℚ` and then `ℝ`.

Even though the profinite completion of the additive group `ℚ` vanishes, one
can still form a local profinite completion by setting
`\widehat{\mathbf{Q}} := \mathbf{Q} \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}`.
The TeX chapter identifies this with the finite adeles of `ℚ`, and more
generally identifies `F \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}` with the
finite adeles of a number field `F`. The full adelic ring is obtained by also
including the archimedean factor `F \otimes_{\mathbf{Q}} \mathbf{R}`.

# Qhat And Tensor Products

:::definition "qhat_definition" (parent := "automorphic_example_program") (lean := "QHat")
The finite-adelic toy model for `ℚ` is
$`\widehat{\mathbf{Q}} := \mathbf{Q} \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}`.
This construction is built from {uses "profinite_completion_zhat"}[].
:::

:::proof "qhat_definition"
This is the place where the example chapter starts meeting the later adele
infrastructure. The chapter introduces `\widehat{\mathbf{Q}}` as a low-level
route to finite adeles before the general restricted-product formalism is in
place.
:::

```tex "QHat"
\begin{definition}
    \label{QHat}
    \lean{QHat}
    \uses{ZHat}
    \leanok
    The profinite completion $\Qhat$ of $\Q$ is the tensor product $\Q\otimes_{\Z}\Zhat$,
    or $\Qhat=\Q\otimes\Zhat$ for short.
\end{definition}
```

# A Crash Course In Tensor Products

:::definition "tensor_product_crash_course" (parent := "automorphic_example_program")
The tensor-product interlude is included only to explain how to build and
manipulate elements of $`\widehat{\mathbf{Q}}`: pure tensors, finite sums of
pure tensors, and the non-uniqueness of tensor expressions.
:::

:::proof "tensor_product_crash_course"
The TeX chapter is unusually candid here. It does not try to give a grand
categorical account of tensor products; it just explains the minimum needed to
read the example. A general tensor need not have a canonical form, and equality
between pure tensors can be subtle, but in `\widehat{\mathbf{Q}}` one gets a
surprisingly concrete simplification.
:::

:::theorem "qhat_canonical_form" (parent := "automorphic_example_program") (lean := "QHat.canonicalForm")
Every element of $`\widehat{\mathbf{Q}}`$ can be written as a pure tensor
$`q \otimes z`, and even in the form $`\frac{1}{N} \otimes z`.
This is the first structural theorem about the tensor-product object from
{uses "qhat_definition"}[] and {uses "zhat_is_a_ring"}[].
:::

:::proof "qhat_canonical_form"
This is one of the nice surprises in the TeX chapter. A general tensor product
does not admit such a simple normal form, but here one can clear denominators in
a finite sum of pure tensors and move all integer factors across the tensor
symbol. What remains is a single pure tensor with one rational denominator.

So `\widehat{\mathbf{Q}}` is much more concrete than an arbitrary tensor
product, even though it is still best viewed conceptually as a tensor product.
:::

```tex "QHat.canonicalForm"
\begin{lemma}
    \label{QHat.canonicalForm}
    \lean{QHat.canonicalForm}
    \uses{QHat,ZHat.commRing}
    \leanok
    Every element of $\Qhat:=\Q\otimes\Zhat$ can be written as $q\otimes_t z$ with $q\in\Q$ and $z\in\Zhat$.
    Furthermore one can even assume that $q=\frac{1}{N}$ for some positive integer $N$.
\end{lemma}
\begin{proof} \leanok
    A proof I would write on the board would look like the following. Take a general
    element of $\Qhat$; we know it can be expressed as a finite sum
    $\sum_i q_i\otimes_t z_i$ with $q_i\in\Q$ and $z_i\in\Zhat$. Now choose a large
    positive integer $N$, the lowest common multiple of all the denominators showing up in the
    $q_i$, and then rewrite $\sum_i q_i\otimes_t z_i$ as $\sum_i \frac{n_i}{N}\otimes z_i$ with
    $n_i\in\Z$. Now using the fundamental fact that $na\otimes_t b=a\otimes_t nb$ for $n\in\Z$,
    we can rewrite the sum as $\sum_i \frac{1}{N}\otimes_t n_i z_i$
    which is equal to the pure tensor $\frac{1}{N}\otimes(\sum_i n_i z_i)$.

    In Lean I would prove this using {\tt TensorProduct.induction\_on}, which quickly
    reduces us to the claim that the sum of two pure tensors is pure, which we can prove
    using the above technique whilst avoiding the general theory of finite sums.
\end{proof}
```

```tex "QHat.IsCoprime"
\begin{definition}
    \label{QHat.IsCoprime}
    \lean{QHat.IsCoprime}
    \uses{ZHat.commRing}
    \leanok
    If $N\in\N^+$ and $z\in\Zhat$ then we say that $N$ and $z$ are \emph{coprime} if
    $z_N\in(\Z/N\Z)^\times$. We write $z/N$ as notation
    for the element $\frac{1}{N}\otimes_tz$.
\end{definition}

\begin{lemma}
    \label{QHat.lowestTerms}
    \lean{QHat.lowestTerms}
    \uses{QHat.IsCoprime}
    \leanok
    Every element of $\Qhat$ can be uniquely written as $z/N$ with $z\in\Zhat$, $N\in\N^+$,
    and with $N$ and $z$ coprime.
\end{lemma}
\begin{proof}
    Existence: by the previous lemma, an arbitrary element can be written as $z/N$; let $D$
    be the greatest common divisor of $N$ and $z_N$ (lifted to a natural). If $D=1$
    then the fraction is by definition in lowest terms. However if $1<D\mid N$ then $z_D$
    is the reduction of $z_N$ and is hence 0. By lemma~\ref{ZHat.multiples} we deduce that $z=Dy$
    is a multiple of~$D$, and hence $z/N=\frac{1}{N}\otimes_tDy=\frac{1}{E}\otimes y$, where
    $E=N/D$. Now if a natural divided both $y_E$ and $E$ then this natural would divide both $z_N/D$
    and $N/D$, contradicting the fact that $D$ is the greatest common divisor.

    Uniqueness: if $z/N=w/M$, we deduce $1\otimes_t Mz=1\otimes_t Nw$,
    and by injectivity of $\Zhat\to\Qhat$ we deduce that $Mz=Nw=y$.
    In particular, if $L$ is the lowest common multiple of $M$ and $N$ then $y_L$ is a multiple of both $M$ and $N$ and is
    hence zero, so $y=Lx$ is a multiple of~$L$ by~\ref{ZHat.multiples}, and we deduce
    from torsionfreeness that $z=(L/M)x$ and $w=(L/N)x$. If some prime divided $L/M$
    then it would have to divide~$N$ which means that $z$ is not in lowest terms;
    similarly if some prime divided $L/N$ then $w/M$ would not be in lowest terms.
    We deduce that $L=M=N$ and hence $z=w$ by torsionfreeness.
\end{proof}
```

:::definition "qhat_coprime_definition" (parent := "automorphic_example_program") (lean := "QHat.IsCoprime")
If $`N \in \mathbf{N}^+`$ and $`z \in \widehat{\mathbf{Z}}`$ then `N` and `z`
are called coprime when the `N`-th coordinate of `z` is a unit modulo `N`.
This is the coprimality notion used in the lowest-terms theorem, and it depends
on {uses "zhat_is_a_ring"}[].
:::

:::theorem "qhat_lowest_terms" (parent := "automorphic_example_program") (lean := "QHat.lowestTerms")
Every element of $`\widehat{\mathbf{Q}}`$ should admit a lowest-terms
representation $`z/N`, where the `N`-th coordinate of `z` is a unit modulo `N`.
This theorem depends on the coprime definition {uses "qhat_coprime_definition"}[]
and on {uses "qhat_canonical_form"}[].
:::

:::proof "qhat_lowest_terms"
The TeX argument combines {uses "qhat_canonical_form"}[] with
{uses "zhat_multiples_criterion"}[]. If a common divisor survives in both the
denominator and the relevant residue coordinate, one divides it out inside
`\widehat{\mathbf{Z}}`; uniqueness is then proved by comparing two such
representations through a common multiple and using torsionfreeness.
:::

:::theorem "qhat_rational_embedding_injective" (parent := "automorphic_example_program") (lean := "QHat.injective_rat")
The natural map from `ℚ` into $`\widehat{\mathbf{Q}}`$ is injective.
This is one of the two basic embedding results for the tensor-product model
{uses "qhat_definition"}[] and {uses "zhat_is_a_ring"}[].
:::

:::proof "qhat_rational_embedding_injective"
The TeX chapter proves this using flatness of `ℚ` over `ℤ`. Its practical role
is to justify regarding ordinary rational numbers as honest elements of the
finite-adelic toy model.
:::

```tex "QHat.injective_rat"
\begin{lemma}
    \label{QHat.injective_rat}
    \lean{QHat.injective_rat}
    \uses{QHat,ZHat.commRing}
    \leanok
    The ring homomorphism $\Q\to\Qhat$ sending $q$ to $q\otimes_t 1$
    is injective.
\end{lemma}
\begin{proof} \leanok
    We have seen that the map from $\Z$ to $\Zhat$ is
    injective. Now $\Q$ is a flat $\Z$-module, because it's
    torsion-free, so tensoring up we deduce that the map
    from $\Q=\Q\otimes\Z$ to $\Qhat=\Q\otimes\Zhat$ is also injective.
    There is no doubt a more elementary proof of this fact.
\end{proof}
```

:::theorem "qhat_zhat_embedding_injective" (parent := "automorphic_example_program") (lean := "QHat.injective_zHat")
The natural map from $`\widehat{\mathbf{Z}}`$ into $`\widehat{\mathbf{Q}}`$ is
injective.
This is the companion embedding statement, using the torsion-freeness package
from {uses "zhat_torsionfree"}[] and the tensor-product model {uses "qhat_definition"}[].
:::

:::proof "qhat_zhat_embedding_injective"
This is the companion to {uses "qhat_rational_embedding_injective"}[]. The TeX
proof uses torsionfreeness of `\widehat{\mathbf{Z}}` to justify treating
`\widehat{\mathbf{Z}}` as a genuine subring of `\widehat{\mathbf{Q}}`.
:::

```tex "QHat.injective_zHat"
\begin{lemma}
    \label{QHat.injective_zHat}
    \lean{QHat.injective_zHat}
    \uses{QHat, ZHat.torsionfree}
    \leanok
    The ring homomorphism $\Zhat\to\Qhat$ sending
    $z$ to $1\otimes_t z$ is injective.
\end{lemma}
\begin{proof} \leanok
    The map from $\Z$ to $\Q$ is injective, and we have seen
    that $\Zhat$ is a torsion-free and thus flat $\Z$-module,
    so the map from $\Zhat$ to $\Qhat$ is also injective.
\end{proof}
```

# Additive Structure Of Qhat

:::theorem "qhat_intersection_q_and_zhat" (parent := "automorphic_example_program") (lean := "QHat.rat_meet_zHat")
Inside $`\widehat{\mathbf{Q}}`, the intersection of `ℚ` and
$`\widehat{\mathbf{Z}}`$ is exactly `ℤ`.
The TeX proof uses the lowest-terms package from {uses "qhat_lowest_terms"}[].
:::

:::proof "qhat_intersection_q_and_zhat"
Once lowest terms are available, the argument is short. A rational element of
`\widehat{\mathbf{Z}}` has a fraction representation `z/N`, but also the obvious
integral representation with denominator `1`; uniqueness of lowest terms forces
`N = 1`.
:::

:::theorem "qhat_additive_decomposition" (parent := "automorphic_example_program") (lean := "QHat.rat_join_zHat")
Every element of $`\widehat{\mathbf{Q}}`$ can be written additively as
$`q + z` with `q ∈ ℚ` and $`z ∈ \widehat{\mathbf{Z}}`.
This is the additive companion to {uses "qhat_intersection_q_and_zhat"}[].
The TeX proof starts from {uses "qhat_lowest_terms"}[].
:::

:::proof "qhat_additive_decomposition"
The TeX proof again starts from {uses "qhat_lowest_terms"}[] and then a
lowest-terms expression `z/N`. One lifts the
`N`-th residue coordinate of `z` to an actual integer `t`, and then the
difference `z - t` becomes divisible by `N` inside `\widehat{\mathbf{Z}}` by
{uses "zhat_multiples_criterion"}[]. This rewrites `z/N` as a rational number
plus an element of `\widehat{\mathbf{Z}}`.

Conceptually, this explains how `ℚ` and `\widehat{\mathbf{Z}}` sit inside the
finite adeles of `ℚ`, which is exactly the kind of bookkeeping the later
quaternionic construction needs.
:::

# Multiplicative Structure Of The Units Of Qhat

:::theorem "qhat_units_intersection" (parent := "automorphic_example_program") (lean := "QHat.unitsrat_meet_unitszHat")
Inside the unit group of $`\widehat{\mathbf{Q}}`, the intersection of
`ℚ^×` with $`\widehat{\mathbf{Z}}^×` is `ℤ^×`.
This is the multiplicative analogue of
{uses "qhat_intersection_q_and_zhat"}[].
:::

:::proof "qhat_units_intersection"
The TeX chapter proves this by combining {uses "qhat_lowest_terms"}[] with the additive
intersection statement: a unit that is both rational and integral must already
be an ordinary integer, and unit conditions force that integer to be `±1`.
:::

:::theorem "qhat_units_factorization" (parent := "automorphic_example_program") (lean := "QHat.unitsrat_join_unitszHat")
Every unit of $`\widehat{\mathbf{Q}}`$ factors as a product of a rational unit
and a unit of $`\widehat{\mathbf{Z}}`.
The TeX proof explicitly uses {uses "qhat_canonical_form"}[] and the
divisibility criterion {uses "zhat_multiples_criterion"}[].
:::

:::proof "qhat_units_factorization"
This is the multiplicative counterpart to
{uses "qhat_additive_decomposition"}[]. The TeX proof turns invertibility in
`\widehat{\mathbf{Q}}` into a divisibility statement in `\widehat{\mathbf{Z}}`,
then extracts a minimal positive integer generator of the corresponding ideal.

The TeX chapter notes that the resulting factorization is unique up to sign,
because the intersection of `ℚ^×` and `\widehat{\mathbf{Z}}^×` is exactly
`ℤ^×`.
:::

# The Hurwitz quaternions

:::definition "hurwitz_quaternions_definition" (parent := "automorphic_example_program")
The Hurwitz quaternions are the lattice
$`\mathcal{O} = \mathbf{Z} \oplus \mathbf{Z}\omega \oplus \mathbf{Z}i \oplus \mathbf{Z}i\omega`
inside Hamilton's quaternions.
:::

:::proof "hurwitz_quaternions_definition"
The TeX chapter rewrites this in the more concrete coordinate form too: a
quaternion `a + bi + cj + dk` is Hurwitz precisely when either all four
coordinates are integers or all four lie in `\mathbf{Z} + \frac12`.
:::

```tex "Hurwitz"
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
\end{definition}
```

:::theorem "hurwitz_quaternions_form_ring" (parent := "automorphic_example_program")
The Hurwitz quaternions form a ring.
This is the first algebraic consequence of
{uses "hurwitz_quaternions_definition"}[].
:::

:::proof "hurwitz_quaternions_form_ring"
This is presented in the TeX chapter as a straightforward algebra check once the
definition of `\omega` and the quaternion multiplication rules are in place.
:::

The TeX chapter immediately notes that this ring is isomorphic to `ℤ^4` as an
additive group, and that `\mathcal{O} \otimes_{\mathbf{Z}} \mathbf{R}` recovers
the usual Hamilton quaternions.

:::definition "hurwitz_quaternion_conjugation" (parent := "automorphic_example_program")
The Hurwitz quaternions carry the usual quaternionic conjugation, making them a
star ring.
This is defined on top of {uses "hurwitz_quaternions_form_ring"}[].
:::

:::definition "hurwitz_quaternion_norm" (parent := "automorphic_example_program")
The Hurwitz quaternions carry an integer-valued norm extending the usual norm on
Hamilton's quaternions.
The subsequent norm lemmas all hang off this definition.
:::

:::theorem "hurwitz_norm_eq_mul_conj" (parent := "automorphic_example_program")
For a Hurwitz quaternion `x`, the norm is `x \overline{x}`.
:::

:::proof "hurwitz_norm_eq_mul_conj"
This is the first norm computation in the TeX chapter. Once the conjugation map
has been defined, the identity is a direct calculation.
:::

:::theorem "hurwitz_norm_zero" (parent := "automorphic_example_program")
The norm of `0` is `0`.
:::

:::proof "hurwitz_norm_zero"
The TeX proof is just a calculation from the definition of the norm.
:::

:::theorem "hurwitz_norm_one" (parent := "automorphic_example_program")
The norm of `1` is `1`.
:::

:::proof "hurwitz_norm_one"
Again this is an immediate calculation from the defining formula.
:::

:::theorem "hurwitz_norm_multiplicative" (parent := "automorphic_example_program")
The norm of a product is the product of the norms.
:::

:::proof "hurwitz_norm_multiplicative"
The TeX chapter treats this as another short calculation, now using the
conjugation identity from {uses "hurwitz_norm_eq_mul_conj"}[].
:::

:::theorem "hurwitz_norm_nonnegative" (parent := "automorphic_example_program")
The norm of a Hurwitz quaternion is nonnegative.
:::

:::proof "hurwitz_norm_nonnegative"
The TeX proof is that the norm is a sum of rational squares.
:::

:::theorem "hurwitz_norm_eq_zero_iff" (parent := "automorphic_example_program")
The norm of a Hurwitz quaternion is zero if and only if the quaternion itself is
zero.
:::

:::proof "hurwitz_norm_eq_zero_iff"
Again the TeX chapter appeals to the fact that the norm is a sum of rational
squares: such a sum vanishes only when every summand vanishes.
:::

:::theorem "hurwitz_exists_near" (parent := "automorphic_example_program")
Every real quaternion lies within norm `< 1` of some Hurwitz quaternion.
:::

:::proof "hurwitz_exists_near"
The TeX argument is a nearest-integer estimate on the four coordinates. The
only subtle case is when all four coordinates are half-integers, in which case
the nearest lattice point is obtained using the shifted Hurwitz lattice rather
than the obvious integer one.
:::

:::theorem "hurwitz_quotient_remainder" (parent := "automorphic_example_program")
Given Hurwitz quaternions `a` and nonzero `b`, there exist `q` and `r` with
`a = qb + r` and `N(r) < N(b)`.
This is the Euclidean-division statement built from
{uses "hurwitz_exists_near"}[].
:::

:::proof "hurwitz_quotient_remainder"
This is Euclidean division in the TeX chapter. One approximates `a/b` by a
Hurwitz quaternion using {uses "hurwitz_exists_near"}[] and then multiplies back
up to produce the remainder estimate.
:::

:::theorem "hurwitz_left_ideal_principal" (parent := "automorphic_example_program")
Every left ideal of the Hurwitz order is principal.
This is the left-ideal consequence of {uses "hurwitz_quotient_remainder"}[].
:::

:::proof "hurwitz_left_ideal_principal"
The TeX proof is the standard Euclidean-domain argument: choose a nonzero
element of minimal norm and apply
{uses "hurwitz_quotient_remainder"}[].
:::

The TeX chapter also remarks that all right ideals are principal too, because
there is an analogous Euclidean statement with `a = bq + r`.

# Profinite completion of the Hurwitz quaternions

:::definition "hurwitz_profinite_completion" (parent := "automorphic_example_program")
The profinite completion `\widehat{\mathcal{O}}` of the Hurwitz order is
`\mathcal{O} \otimes \widehat{\mathbf{Z}}`.
:::

The TeX chapter immediately rewrites elements of `\widehat{\mathcal{O}}` as
formal quaternions `a + bi + cj + d\omega` with `a,b,c,d` in
`\widehat{\mathbf{Z}}`.

:::theorem "hurwitz_mod_n_surjective" (parent := "automorphic_example_program")
For every positive integer `N`, the natural map
`\mathcal{O} \to \widehat{\mathcal{O}} / N\widehat{\mathcal{O}}` is surjective.
This is the profinite-completion analogue of the corresponding `\widehat{\mathbf Z}`
surjectivity statement.
:::

:::proof "hurwitz_mod_n_surjective"
The TeX chapter treats this as four copies of the corresponding statement for
`\mathbf{Z} \to \widehat{\mathbf{Z}}/N\widehat{\mathbf{Z}}`.
:::

:::definition "completed_rational_quaternion_algebra" (parent := "automorphic_example_program")
The rational quaternion algebra `D` gives rise to its finite-adelic completion
`\widehat{D} = D \otimes \widehat{\mathbf{Z}}`.
:::

:::theorem "completed_quaternion_canonical_form" (parent := "automorphic_example_program")
Every element of `\widehat{D}` can be written as `z/N` with
`z \in \widehat{\mathcal{O}}` and `N` a positive integer.
This is the quaternionic analogue of {uses "qhat_canonical_form"}[].
:::

:::proof "completed_quaternion_canonical_form"
The TeX chapter says this is proved exactly like the corresponding canonical-form
statement for `\widehat{\mathbf{Q}}`.
:::

The TeX chapter then records the additive analogues of the corresponding
`\widehat{\mathbf{Q}}` statements: `\widehat{\mathcal{O}}` and `D` sit inside
`\widehat{D}` as additive subgroups with
`\widehat{\mathcal{O}} \cap D = \mathcal{O}` and
`\widehat{\mathcal{O}} + D = \widehat{D}`. Because `\mathcal{O}` is just four
copies of `\mathbf{Z}`, these are direct quaternionic analogues of the earlier
adelic statements for `\widehat{\mathbf{Q}}`.

The multiplicative structure is subtler. For a general quaternion algebra it is
not true that `\widehat{D}^\times = D^\times \widehat{\mathcal{O}}^\times`;
there are class-group-style obstructions, encoded by a noncommutative double
coset space. The TeX chapter emphasizes that the Hamilton/Hurwitz example is
special precisely because this obstruction vanishes here.

:::theorem "completed_quaternion_units_factorization" (parent := "automorphic_example_program")
Every unit of `\widehat{D}` can be written as a product of a unit from `D` and a
unit from `\widehat{\mathcal{O}}`.
This is the quaternionic analogue of {uses "qhat_units_factorization"}[].
:::

:::proof "completed_quaternion_units_factorization"
This is the final theorem in the remaining TeX tail. The proof repeats the
lowest-terms style argument from `\widehat{\mathbf{Q}}`, but now with one-sided
ideals in the Hurwitz order replacing principal ideals in `\widehat{\mathbf{Z}}`.
The Euclidean argument for the Hurwitz order is exactly what makes the factorization work.
:::

# Target calculation

:::theorem "one_dimensional_example_space" (parent := "automorphic_example_program")
The target conclusion is that the chosen concrete space of quaternionic modular
forms is one-dimensional.
:::

:::proof "one_dimensional_example_space"
The old blueprint treats this chapter as both a worked example and a source of
API pressure for the later quaternion-algebra and Hecke-operator chapters.
It also makes a methodological point: if this example were completed before
mathlib proves the finite-dimensionality of classical modular-form spaces, then
the first modular-form finite-dimensionality theorem in Lean would be
quaternionic rather than classical.

The enlarged Verso port now makes the chapter's preparatory role clearer too.
Before one can even talk cleanly about adelic quaternionic level structures, one
needs the toy finite-adelic algebra described by
{uses "profinite_completion_zhat"}[] and {uses "qhat_definition"}[] as well as
the concrete integral structure supplied by {uses "hurwitz_quaternion_order"}[].
:::
