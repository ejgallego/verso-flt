import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Miniproject: Adeles" =>

:::group "adele_project"
The adele miniproject develops the finite adeles, infinite adeles, and full
adeles of a number field together with the local compactness and base-change
results needed later in the project.
:::

The old TeX chapter is very explicit that this is both a mathematical and a
library-design project. Some pieces already live in mathlib, some have been
proved in external repos, and some still need to be formalized in a way that
fits the existing restricted-product API cleanly.

# Goals

:::definition "adele_ring_goals" (parent := "adele_project")
The TeX blueprint lists four main targets: define the adeles, prove local
compactness, prove base change along finite field extensions, and prove that
the number field sits discretely with compact quotient.
:::

The chapter also stresses a useful distinction. Finite adeles are algebraic
objects and can be defined for general Dedekind domains. Full adeles are more
arithmetic: they add the archimedean factor and use special properties of number
fields.

:::definition "cheap_finite_adele_definition" (parent := "adele_project")
A cheap definition of the finite adeles of a number field `K` is
$`K \otimes_{\mathbf{Z}} \widehat{\mathbf{Z}}`$, equipped with the
`$\widehat{\mathbf{Z}}`-module topology.
:::

:::definition "cheap_infinite_adele_definition" (parent := "adele_project")
A cheap definition of the infinite adeles is `K ⊗_ℚ ℝ`, equipped with its
finite-dimensional real vector-space topology.
:::

:::definition "cheap_full_adele_definition" (parent := "adele_project")
The cheap full adele ring is the product of the finite and infinite adeles,
with the product topology.
:::

:::definition "restricted_product_adele_definition" (parent := "adele_project")
The literature and mathlib instead define finite adeles as the restricted
product of the local completions `K_v` with respect to their compact open
integer subrings.
:::

:::proof "restricted_product_adele_definition"
This is the definition the chapter chooses to follow, precisely because it is
already the mathlib-facing one and generalizes well to the Dedekind-domain API.
:::

# Local compactness

:::theorem "adele_local_compactness" (parent := "adele_project")
The adeles of a number field should form a locally compact topological ring.
This local compactness is one of the inputs needed by {uses "compact_quotient_for_division_algebra"}[].
:::

:::theorem "local_integer_ring_compact_open" (parent := "adele_project")
For a nonarchimedean completion of a number field, the local integer ring
should be a compact open subgroup.
:::

:::proof "adele_local_compactness"
The finite adele part is a restricted product over compact open integer
subgroups, and the infinite part is finite-dimensional real linear algebra.
This is exactly why {uses "local_integer_ring_compact_open"}[] is the key local
input in the TeX chapter.
:::

# Base change

:::theorem "adele_base_change" (parent := "adele_project")
For a finite extension $`L/K`$, the adele ring of $`L`$ should identify with
$`L \otimes_K \mathbf{A}_K`$ as both an algebra and a topological space.
This is one of the basic background results for {uses "adelic_division_algebra_setup"}[] and {uses "haar_character_goal"}[].
:::

:::proof "adele_base_change"
The old blueprint splits this into finite and infinite pieces and develops the
local completion maps place by place before assembling the global theorem.
:::

The TeX chapter is also careful about the logical shape of this statement:
`A_L = L ⊗_K A_K` is really a construction plus an isomorphism theorem, not just
a bare equality.

:::definition "local_completion_map" (parent := "adele_project")
Given a finite extension `L/K` and places `w | v`, there is a natural map from
the completion `K_v` to the completion `L_w`.
:::

:::theorem "local_valuation_compatibility" (parent := "adele_project")
The `v`-adic and `w`-adic valuations are related by the ramification index:
`e · w(i(k)) = v(k)` in additive-valuation normalization.
:::

:::proof "local_valuation_compatibility"
This valuation identity is what makes the local completion map uniformly
continuous, and therefore what allows the local part of base change to be
defined at all.
:::

:::theorem "local_module_topology_for_completion" (parent := "adele_project")
After base change to a local completion, the topology on `L_w` should agree with
the `K_v`-module topology.
:::

# Discreteness and compactness

:::theorem "adele_discrete_cocompact_embedding" (parent := "adele_project")
The embedding of a number field into its adeles should be discrete with compact
quotient, echoing the commutative prototype behind {uses "fujisaki_lemma_goal"}[].
:::

:::proof "adele_discrete_cocompact_embedding"
In the TeX chapter this statement is positioned as the commutative prototype for
the later division-algebra compactness theorem. The point is not just that `K`
sits inside its adeles, but that the quotient carries genuine compactness
content that later noncommutative arguments should imitate.
:::
