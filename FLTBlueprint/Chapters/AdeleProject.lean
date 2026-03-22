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

# Goals

:::definition "adele_ring_goals" (parent := "adele_project")
The TeX blueprint lists four main targets: define the adeles, prove local
compactness, prove base change along finite field extensions, and prove that
the number field sits discretely with compact quotient.
:::

# Local compactness

:::theorem "adele_local_compactness" (parent := "adele_project")
The adeles of a number field should form a locally compact topological ring.
:::

:::proof "adele_local_compactness"
The finite adele part is a restricted product over compact open integer
subgroups, and the infinite part is finite-dimensional real linear algebra.
:::

# Base change

:::theorem "adele_base_change" (parent := "adele_project")
For a finite extension $`L/K`$, the adele ring of $`L`$ should identify with
$`L \otimes_K \mathbf{A}_K`$ as both an algebra and a topological space.
:::

:::proof "adele_base_change"
The old blueprint splits this into finite and infinite pieces and develops the
local completion maps place by place before assembling the global theorem.
:::

# Discreteness and compactness

:::theorem "adele_discrete_cocompact_embedding" (parent := "adele_project")
The embedding of a number field into its adeles should be discrete with compact
quotient.
:::
