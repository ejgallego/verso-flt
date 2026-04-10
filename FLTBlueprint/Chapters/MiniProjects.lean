import FLTBlueprint.Chapters.AdeleProject
import FLTBlueprint.Chapters.AutomorphicFormExample
import FLTBlueprint.Chapters.FrobeniusProject
import FLTBlueprint.Chapters.FujisakiProject
import FLTBlueprint.Chapters.HaarCharacters
import FLTBlueprint.Chapters.HeckeOperators
import FLTBlueprint.Chapters.LanglandsGLn
import FLTBlueprint.Chapters.ModularityLifting
import FLTBlueprint.Chapters.Overview
import FLTBlueprint.Chapters.QuaternionAlgebras
import Verso
import VersoManual
import VersoBlueprint
import FLTBlueprint.TeXPrelude

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

:::definition "miniproject_definition" (parent := "legacy_blueprint_map")
A miniproject is a bottom-up workstream with a concrete local theorem or API
goal, intended to make progress on one reusable mathematical package without
waiting for the entire FLT proof spine to be formalized first.
:::

:::definition "miniproject_success_story" (parent := "legacy_blueprint_map")
The Frobenius miniproject is the model success case: it isolated a theorem of
independent interest, reached a sorry-free formalization, and upstreamed the
result to mathlib. See the status section of the Frobenius miniproject
chapter.
:::

:::definition "overview_chapter_port" (parent := "legacy_blueprint_map")
The large expository chapters are no longer just placeholders: the proof
overview, the modularity-lifting interface, the quaternionic example chapter,
and the `GL_n`/Langlands chapter now exist as substantial Verso chapters.
This map records how the miniprojects feed those broader expository chapters
such as {uses "modularity_lifting_theorem"}[],
{uses "MatrixRing.isCentralSimple"}[],
{uses "HurwitzRatHat.completed_units"}[], and
{uses "automorphic_form_for_gln"}[].
:::

:::definition "adeles_miniproject" (parent := "legacy_blueprint_map")
The adeles mini-project covers local compactness, base change, and global
compactness statements needed throughout the automorphic side of the argument.
Its current chapter centers on {uses "adele_ring_goals"}[] and culminates in
{uses "adele_discrete_cocompact_embedding"}[].
:::

:::definition "haar_characters_miniproject" (parent := "legacy_blueprint_map")
The Haar characters mini-project packages the measure-theoretic and restricted
product constructions that feed into the adelic viewpoint.
Its main interface node is {uses "haar_character_goal"}[], and its later adelic
payoff is {uses "NumberField.AdeleRing.units_mem_ringHaarCharacter_ker"}[].
:::

:::definition "frobenius_miniproject" (parent := "legacy_blueprint_map")
The Frobenius mini-project tracks the algebra needed to state Frobenius
elements cleanly in the settings used by the Galois side of the proof.
The core output is the general surjectivity theorem
{uses "IsFractionRing.stabilizerHom_surjective"}[], with arithmetic consequences recorded in
{uses "frobenius_elements_classical_corollary"}[].
:::

:::definition "quaternion_algebras_miniproject" (parent := "legacy_blueprint_map")
The quaternion algebra mini-project supplies the concrete automorphic spaces
used in the totally definite setting adopted by the FLT strategy.
Its central nodes are
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm"}[] and
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional"}[].
:::

:::definition "hecke_operators_miniproject" (parent := "legacy_blueprint_map")
The Hecke operator mini-project develops the local-to-global Hecke algebra
machinery attached to those quaternionic automorphic forms.
The abstract formalism is centered on {uses "abstract_hecke_operator"}[] and
its concrete application on {uses "concrete_hecke_action"}[].
:::

:::definition "fujisaki_miniproject" (parent := "legacy_blueprint_map")
Fujisaki's lemma and its surrounding infrastructure sit at the interface
between adelic constructions and the automorphic representation-theoretic
chapters.
Its goal is {uses "fujisaki_lemma_goal"}[], and its main theorem is
{uses "NumberField.AdeleRing.DivisionAlgebra.compact_quotient"}[].
:::

:::theorem "adelic_automorphic_cluster" (parent := "legacy_blueprint_map")
Several miniprojects form one coherent automorphic cluster: adeles and Haar
characters build the ambient locally compact spaces, Fujisaki supplies the
crucial compact quotient, quaternion algebras define the automorphic spaces, and
Hecke operators act on them.
:::

:::proof "adelic_automorphic_cluster"
This dependency story is one of the main reasons to keep the legacy map visible.
The chain runs through
{uses "adele_ring_goals"}[],
{uses "haar_character_goal"}[],
{uses "NumberField.AdeleRing.DivisionAlgebra.compact_quotient"}[],
{uses "TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm"}[], and
{uses "concrete_hecke_action"}[].

These chapters are mathematically distinct, but in the project graph they form
one bottom-up route toward the `T` side of the modularity-lifting theorems.
:::

:::theorem "galois_side_miniproject_cluster" (parent := "legacy_blueprint_map")
On the Galois side, the Frobenius miniproject supplies reusable residue-field
and decomposition-group technology that supports later discussions of
compatible families and Frobenius characteristic polynomials.
:::

:::proof "galois_side_miniproject_cluster"
This workstream is more independent than the adelic cluster, which is why it
was able to mature quickly and be upstreamed. Its formal theorem
{uses "IsFractionRing.stabilizerHom_surjective"}[] does not rely on the whole FLT setup, but
it feeds naturally into the later representation-theoretic chapters whenever
Frobenius elements need to be chosen or compared.
:::
