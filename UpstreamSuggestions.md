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

## Current Queue

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
