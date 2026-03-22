import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Legacy Blueprint Map" =>

:::group "legacy_blueprint_map"
The old LaTeX blueprint organized much of the supporting mathematics as
mini-projects. The first Verso port keeps those workstreams visible so the new
graph still reflects the shape of the project while chapter-by-chapter
migration is ongoing.
:::

:::definition "overview_chapter_port" (parent := "legacy_blueprint_map")
The large expository chapters on the overall proof strategy, automorphic
representations, and the Langlands input will be migrated into richer Verso
chapters after the build pipeline is stable on the new toolchain.
:::

:::definition "adeles_miniproject" (parent := "legacy_blueprint_map")
The adeles mini-project covers local compactness, base change, and global
compactness statements needed throughout the automorphic side of the argument.
:::

:::definition "haar_characters_miniproject" (parent := "legacy_blueprint_map")
The Haar characters mini-project packages the measure-theoretic and restricted
product constructions that feed into the adelic viewpoint.
:::

:::definition "frobenius_miniproject" (parent := "legacy_blueprint_map")
The Frobenius mini-project tracks the algebra needed to state Frobenius
elements cleanly in the settings used by the Galois side of the proof.
:::

:::definition "quaternion_algebras_miniproject" (parent := "legacy_blueprint_map")
The quaternion algebra mini-project supplies the concrete automorphic spaces
used in the totally definite setting adopted by the FLT strategy.
:::

:::definition "hecke_operators_miniproject" (parent := "legacy_blueprint_map")
The Hecke operator mini-project develops the local-to-global Hecke algebra
machinery attached to those quaternionic automorphic forms.
:::

:::definition "fujisaki_miniproject" (parent := "legacy_blueprint_map")
Fujisaki's lemma and its surrounding infrastructure sit at the interface
between adelic constructions and the automorphic representation-theoretic
chapters.
:::
