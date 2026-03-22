import FLT.Assumptions.KnownIn1980s
import FLT.Assumptions.Mazur
import FLT.Assumptions.Odlyzko
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Historical Inputs" =>

:::group "historical_inputs"
During the current project phase, the FLT formalization is allowed to assume
results that were known before 1990 while the reduction chain is made precise.
This chapter records the highest-signal assumptions that are already surfaced as
Lean declarations.
:::

:::definition "known_in_1980s_phase_boundary" (parent := "historical_inputs")
The `knownin1980s` axiom marks results that the project treats as available in
the first phase: they should be derivable from the pre-1990 literature even
when the corresponding formal proof is not yet present in the repository.
:::

:::theorem "mazur_torsion_bound" (parent := "historical_inputs") (lean := "Mazur_statement")
Mazur's theorem bounds the size of the torsion subgroup of an elliptic curve
over $`\\mathbf{Q}`$.
Within the FLT strategy, this is the key external input behind
{uses "mazur_frey_irreducible"}[].
:::

:::proof "mazur_torsion_bound"
The assumption is recorded as a Lean axiom so the reduction chain can remain
explicit while the full geometric proof stays outside the current phase.
:::

:::theorem "odlyzko_root_discriminant_bound"
  (parent := "historical_inputs") (lean := "Odlyzko_statement")
Odlyzko-Poitou discriminant bounds rule out certain totally complex number
fields with too-small root discriminant.
In the planned FLT route, this is part of the $`3`$-adic contradiction after
passing to a compatible family.
:::

:::proof "odlyzko_root_discriminant_bound"
This assumption is one of the explicit numerical inputs used to analyze the
specialization at $`3`$ after the modularity-lifting stage.
:::
