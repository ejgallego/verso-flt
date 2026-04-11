# Upstream Suggestions

This file records reviewed upstream-facing suggestions for the TeX blueprint
sources in `FLT/blueprint/src/chapter/*.tex`.

These are not local LT drift:
- the local Verso port now leaves them as prose references on purpose
- `FLT/` is read-only in this repository unless explicitly authorized
- the question is whether an upstream TeX prose `\ref{...}` should instead be
  promoted to an explicit TeX `\uses{...}`

`strong` means the prose reference looks like real dependency metadata.
`env` means the prose reference occurs inside a theorem-like environment or
proof and may deserve upstream review, but is lower-confidence.

There is also a small class of stronger source issues:
- `dangling uses target` means the TeX source already contains a `\uses{...}`
  edge to a label that is never defined as a graph-visible blueprint node

There is a separate class of source-side debt that this file now tracks:
- `missing source \lean target` means the active TeX source has a labeled
  graph-visible block but does not provide any `\lean{...}` attachment
- these are upstream/source issues only; the local Verso port must not
  legalize them with local-only `(lean := "...")` attachments

## Current Queue

### Definite Source Issues

- `dangling uses target: Frey_curve_irreducible`
  Seen from [ch02reductions.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/ch02reductions.tex).
  The label exists only in inactive source file
  [ch03freyold.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/ch03freyold.tex),
  while the active replacement chapter is `ch03freyreduction.tex`.
  In the active TeX source this is a stale cross-chapter dependency.

- `dangling uses target: ZHat.eq_zero_of_mul_eq_zero`
  Seen from [AutomorphicFormExample.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AutomorphicFormExample.lean#L1140), mirroring
  `\uses{ZHat.eq_zero_of_mul_eq_zero}` in
  [ch05automorphicformexample.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/ch05automorphicformexample.tex).
  The Lean theorem exists in [QHat.lean](/home/egallego/lean/verso-flt/FLT/FLT/Data/QHat.lean#L191), but there is no TeX `\label{ZHat.eq_zero_of_mul_eq_zero}`
  and no graph-visible Verso node with that label, so the generated blueprint graph
  resolves it as unresolved.

- `dangling uses target: MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det`
  Seen in [HaarCharacterProject.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/HaarCharacterProject.tex).
  The likely cause is a malformed multi-label source line:
  `\label{MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det, MeasureTheory.addEquivAddHaarChar_eq_ringHaarChar_det_of_existsListTransvecEtc}`
  which the source tooling reads as one label rather than two.

- `dangling uses target: MeasureTheory.mulEquivHaarChar_smul_preimage`
  Seen in [HaarCharacterProject.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/HaarCharacterProject.tex).
  The likely intended target is
  `MeasureTheory.addEquivAddHaarChar_smul_preimage`, which is the actual
  label in the local port and surrounding source.

- `dangling uses target: addHaarScalarFactor.left_mul_eq_right_mul`
  Seen in [FujisakiProject.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/FujisakiProject.tex).
  This looks like an outdated/stale label name. The nearby relevant local node is
  [NumberField.AdeleRing.isCentralSimple_addHaarScalarFactor_left_mul_eq_right_mul](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L1715).

- `dangling uses target: nolean-compactopen-matrix`
  Seen in [HeckeOperatorProject.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/HeckeOperatorProject.tex).
  The likely intended target is
  [M2.localFullLevel.isCompact](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HeckeOperators.lean#L892),
  which is the actual graph-visible node for compactness of the local matrix ring.

### Active Source Missing `\lean{...}` Targets

- High priority, concrete existing declaration:
  `IsDedekindDomain.AKLB.finitePresentation`
  Seen from [AdeleMiniproject.tex](/home/egallego/lean/verso-flt/FLT/blueprint/src/chapter/AdeleMiniproject.tex) via
  [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L967).
  The TeX source has an active labeled theorem but no `\lean{...}` target.
  The surrounding proof text explicitly points to
  `Module.finitePresentation_of_finite`, which already exists in mathlib/FLT-facing dependencies.
  This is the clearest current upstream candidate for adding a source-authorized `\lean{...}`.

- Medium priority, active proof-spine / miniproject labels with no obvious exact declaration found in the current tree:
  `Hurwitz.surjective_pnat_quotient`
  `IsCentralSimple.baseChange`
  `IsDedekindDomain.dvd_norm`
  `IsDedekindDomain.AKLB.surjective_tensorProduct_map`
  `IsDedekindDomain.FiniteAdeleRing.tensorProduct_algEquiv`
  `pi_tensorProduct_of_finitePresentation`
  `RestrictedProduct.relabelIso`
  `IsDedekindDomain.pi_tensorProduct`
  `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux1`
  `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2`
  `IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv`
  `nolean-compactopen-GL2`
  `nolean-compactopen-U1p`
  `nolean-hecke-algebra-commutative-noetherian`
  `nolean-product-of-U-alpha`
  These are active-source labels and not `\notready`, so they are reasonable upstream review targets.
  However, current local triage did not find a clearly matching existing declaration name for them.
  Upstream action here should start by checking whether the intended formal declaration now exists before adding any `\lean{...}` target.

- Lower priority, active but broad API / expository labels with no obvious current declaration match:
  `instLieAlgebraAction`
  `instComplexLieAlgebraAction`
  `instUniversalEnvelopingAlgebraAction`
  `instCentreAction`
  `topology_on_affine_variety_points`
  `topology_on_affine_variety_computation`
  `cuspidal_automorphic_form_decomposition`
  `compatible_family`
  These are active-source labels, but they currently look more like conceptual API or expository interface points than obvious already-formalized declarations.
  They should stay source-side debt until upstream/source review identifies a real declaration to cite.

### Reductions

- [Reductions.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/Reductions.lean#L509)
  `FreyPackage.false`
  `env: Mazur_Frey, Wiles_Frey`

### Automorphic Form Example

- [AutomorphicFormExample.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AutomorphicFormExample.lean#L837)
  `QHat.lowestTerms`
  `env: ZHat.multiples`
- [AutomorphicFormExample.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AutomorphicFormExample.lean#L1668)
  `Hurwitz.quot_rem`
  `env: Hurwitz.exists_near`
- [AutomorphicFormExample.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AutomorphicFormExample.lean#L1907)
  `HurwitzRatHat.completed_units`
  `env: Hurwitz.left_ideal_princ, HurwitzRatHat.canonicalForm`

### Adele Project

- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L370)
  `IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap`
  `env: IsDedekindDomain.HeightOneSpectrum.valuation_comap`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L395)
  `IsDedekindDomain.HeightOneSpectrum.adicCompletionComapSemialgHom.mapadicCompletionIntegers`
  `env: IsDedekindDomain.HeightOneSpectrum.valued_adicCompletionComap`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L622)
  `IsDedekindDomain.HeightOneSpectrum.prodAdicCompletionComap_isModuleTopology`
  `env: IsDedekindDomain.HeightOneSpectrum.adicCompletionComap_isModuleTopology`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1036)
  `RestrictedProduct.relabelIso`
  `env: IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1052)
  `restricted_product_relabel_homeomorphism`
  `env: RestrictedProduct.relabelIso`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1159)
  `IsDedekindDomain.FiniteAdeleRing.IntegraltensorProductAlgEquiv_aux2`
  `env: IsDedekindDomain.HeightOneSpectrum.adicCompletionComapAlgEquiv_integral`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1217)
  `IsDedekindDomain.FiniteAdeleRing.baseChangeAlgEquiv`
  `env: IsDedekindDomain.AKLB.tensorProduct_module_algEquiv, IsDedekindDomain.FiniteAdeleRing.baseChangeIntegralAlgEquiv`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1484)
  `NumberField.InfinitePlace.Completion.baseChange_surjective`
  `env: NumberField.InfinitePlace.Completion.denseRange_algebraMap_subtype_pi`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1530)
  `NumberField.InfinitePlace.Completion.baseChange_injective`
  `env: NumberField.InfinitePlace.Completion.baseChange_surjective, NumberField.InfinitePlace.Completion.finrank_pi_eq_finrank_tensorProduct`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1575)
  `NumberField.InfinitePlace.Completion.baseChangeEquiv`
  `strong: NumberField.InfinitePlace.Completion.piExtension`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1601)
  `NumberField.InfinitePlace.Completion.baseChangeEquiv`
  `env: NumberField.InfinitePlace.Completion.baseChange, NumberField.InfinitePlace.Completion.baseChange_injective, NumberField.InfinitePlace.Completion.baseChange_surjective`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1639)
  `NumberField.InfinitePlace.Completion.piEquiv`
  `env: NumberField.InfinitePlace.Completion.baseChangeEquiv`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1672)
  `NumberField.InfiniteAdeleRing.piEquiv`
  `env: NumberField.InfinitePlace.Completion.piEquiv`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1740)
  `NumberField.InfiniteAdeleRing.baseChangeAlgEquiv`
  `env: NumberField.InfinitePlace.Completion.baseChangeEquiv`
- [AdeleProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AdeleProject.lean#L1785)
  `NumberField.InfiniteAdeleRing.baseChangeEquiv`
  `env: NumberField.InfiniteAdeleRing.baseChangeAlgEquiv`

### Haar Characters

- [HaarCharacters.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L212)
  `MeasureTheory.addEquivAddHaarChar_comap`
  `env: MeasureTheory.addEquivAddHaarChar_smul_map`
- [HaarCharacters.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L339)
  `MeasureTheory.addEquivAddHaarChar_smul_integral_comap`
  `env: MeasureTheory.addEquivAddHaarChar_comap`
- [HaarCharacters.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L366)
  `MeasureTheory.addEquivAddHaarChar_trans`
  `strong: MeasureTheory.addEquivAddHaarChar_smul_map`
- [HaarCharacters.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L1059)
  `product_ring_haar_character_formula`
  `env: MeasureTheory.addEquivAddHaarChar_prodCongr`
- [HaarCharacters.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L1222)
  `MeasureTheory.mulEquivHaarChar_eq_one_of_compactSpace`
  `env: MeasureTheory.addEquivAddHaarChar_smul_preimage`
- [HaarCharacters.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/HaarCharacters.lean#L1256)
  `MeasureTheory.addEquivAddHaarChar_eq_addEquivAddHaarChar_of_isOpenEmbedding`
  `strong: MeasureTheory.addEquivAddHaarChar_comap`

### Fujisaki Project

- [FujisakiProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/FujisakiProject.lean#L253)
  `NumberField.AdeleRing.DivisionAlgebra.Aux.existsE`
  `env: NumberField.AdeleRing.discrete, Rat.AdeleRing.cocompact`
- [FujisakiProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/FujisakiProject.lean#L411)
  `NumberField.AdeleRing.DivisionAlgebra.Aux.X_meets_kernel`
  `env: NumberField.AdeleRing.DivisionAlgebra.Aux.existsE`
- [FujisakiProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/FujisakiProject.lean#L592)
  `NumberField.AdeleRing.DivisionAlgebra.Aux.antidiag_mem_C`
  `strong: NumberField.AdeleRing.units_mem_ringHaarCharacter_ker`
- [FujisakiProject.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/FujisakiProject.lean#L897)
  `NumberField.FiniteAdeleRing.DivisionAlgebra.finiteDoubleCoset`
  `env: NumberField.FiniteAdeleRing.DivisionAlgebra.units_cocompact`

### Quaternion Algebras

- [QuaternionAlgebras.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/QuaternionAlgebras.lean#L450)
  `TotallyDefiniteQuaternionAlgebra.WeightTwoAutomorphicForm.finiteDimensional`
  `strong: Fujisaki_project`
