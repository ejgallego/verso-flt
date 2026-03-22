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

:::definition "profinite_completion_zhat" (parent := "automorphic_example_program")
The profinite completion $`\widehat{\mathbf{Z}}`$ is introduced as compatible
residue classes modulo all positive integers.
The chapter uses it as a low-level entry point to the adelic viewpoint.
:::

The TeX chapter motivates this detour historically. Classical automorphic forms
are functions on symmetric spaces such as the upper half-plane, but when one
works over number fields with nontrivial class group the classical approach
becomes awkward: Hecke operators want prime ideals, not just principal positive
integers. The adelic viewpoint fixes this, and `\widehat{Z}` is introduced as a
low-level toy model for the finite adelic direction.

:::theorem "zhat_is_a_ring" (parent := "automorphic_example_program")
The set of compatible residue-class collections forms a ring, naturally sitting
inside the product of all `ℤ / Nℤ`.
:::

:::proof "zhat_is_a_ring"
The point here is not depth but orientation: all ring operations are inherited
componentwise, and compatibility with reduction maps is preserved by those same
operations.
:::

:::theorem "zhat_is_not_the_integers" (parent := "automorphic_example_program")
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

:::definition "example_element_of_zhat" (parent := "automorphic_example_program")
The TeX blueprint highlights the formal infinite sum
$`0! + 1! + 2! + \cdots`$ as a concrete element of $`\widehat{\mathbf{Z}}`$
that is not visibly an integer.
:::

:::proof "example_element_of_zhat"
Modulo any positive integer `N`, the factorial series stabilizes after
`(N-1)!`, because every subsequent term is divisible by `N`. So the sequence of
partial factorial sums defines a compatible adelic-style object even though the
naive infinite sum diverges in the ordinary real sense.
:::

:::theorem "factorial_element_not_integer" (parent := "automorphic_example_program")
The factorial-series element of $`\widehat{\mathbf{Z}}`$ is not in the image of
`ℤ`.
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

:::theorem "zhat_torsionfree" (parent := "automorphic_example_program")
Multiplication by a positive integer is injective on $`\widehat{\mathbf{Z}}`.
:::

:::proof "zhat_torsionfree"
The TeX proof is coordinatewise. If `N z = 0` in `\widehat{\mathbf{Z}}`, then in
particular the `(Nj)`-coordinate is annihilated by `N`, forcing the `j`-th
coordinate to vanish after reducing modulo `j`. Since this works for every
positive `j`, the whole compatible collection is zero.
:::

:::theorem "zhat_multiples_criterion" (parent := "automorphic_example_program")
An element of $`\widehat{\mathbf{Z}}`$ is divisible by `N` if and only if its
`N`-th coordinate is zero.
:::

:::proof "zhat_multiples_criterion"
Necessity is immediate. For sufficiency, the TeX proof constructs the quotient
coordinatewise by dividing the `(Nj)`-coordinate by `N`, using compatibility and
the vanishing of the `N`-th coordinate to show that this makes sense.

This criterion becomes a basic tool once the chapter moves from
`\widehat{\mathbf{Z}}` to `\widehat{\mathbf{Q}}`.
:::

# Qhat and tensor products

:::definition "qhat_definition" (parent := "automorphic_example_program")
The finite-adelic toy model for `ℚ` is
$`\widehat{\mathbf{Q}} := \mathbf{Q} \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}`.
More generally, the TeX chapter explains that
$`F \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}` should be viewed as the finite
adeles of a number field `F`.
:::

:::proof "qhat_definition"
This is the place where the example chapter starts meeting the later adele
infrastructure. The chapter introduces `\widehat{\mathbf{Q}}` as a low-level
route to finite adeles before the general restricted-product formalism is in
place; compare the broader blueprint node {uses "cheap_finite_adele_definition"}[].
:::

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

:::theorem "qhat_canonical_form" (parent := "automorphic_example_program")
Every element of $`\widehat{\mathbf{Q}}`$ can be written as a pure tensor
$`q \otimes z`, and even in the form $`\frac{1}{N} \otimes z`.
:::

:::proof "qhat_canonical_form"
This is one of the nice surprises in the TeX chapter. A general tensor product
does not admit such a simple normal form, but here one can clear denominators in
a finite sum of pure tensors and move all integer factors across the tensor
symbol. What remains is a single pure tensor with one rational denominator.

So `\widehat{\mathbf{Q}}` is much more concrete than an arbitrary tensor
product, even though it is still best viewed conceptually as a tensor product.
:::

:::definition "qhat_lowest_terms" (parent := "automorphic_example_program")
Every element of $`\widehat{\mathbf{Q}}`$ should admit a lowest-terms
representation $`z/N`, where the `N`-th coordinate of `z` is a unit modulo `N`.
:::

:::proof "qhat_lowest_terms"
The TeX argument combines {uses "qhat_canonical_form"}[] with
{uses "zhat_multiples_criterion"}[]. If a common divisor survives in both the
denominator and the relevant residue coordinate, one divides it out inside
`\widehat{\mathbf{Z}}`; uniqueness is then proved by comparing two such
representations through a common multiple and using torsionfreeness.
:::

:::theorem "qhat_intersection_q_and_zhat" (parent := "automorphic_example_program")
Inside $`\widehat{\mathbf{Q}}`, the intersection of `ℚ` and
$`\widehat{\mathbf{Z}}`$ is exactly `ℤ`.
:::

:::proof "qhat_intersection_q_and_zhat"
Once lowest terms are available, the argument is short. A rational element of
`\widehat{\mathbf{Z}}` has a fraction representation `z/N`, but also the obvious
integral representation with denominator `1`; uniqueness of lowest terms forces
`N = 1`.
:::

:::theorem "qhat_additive_decomposition" (parent := "automorphic_example_program")
Every element of $`\widehat{\mathbf{Q}}`$ can be written additively as
$`q + z` with `q ∈ ℚ` and $`z ∈ \widehat{\mathbf{Z}}`.
:::

:::proof "qhat_additive_decomposition"
The TeX proof again starts from a lowest-terms expression `z/N`. One lifts the
`N`-th residue coordinate of `z` to an actual integer `t`, and then the
difference `z - t` becomes divisible by `N` inside `\widehat{\mathbf{Z}}` by
{uses "zhat_multiples_criterion"}[]. This rewrites `z/N` as a rational number
plus an element of `\widehat{\mathbf{Z}}`.

Conceptually, this explains how `ℚ` and `\widehat{\mathbf{Z}}` sit inside the
finite adeles of `ℚ`, which is exactly the kind of bookkeeping the later
quaternionic construction needs.
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
