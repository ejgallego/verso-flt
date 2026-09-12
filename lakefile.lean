import Lake
open Lake DSL

require FLT from "./FLT"
require VersoBlueprint from git "https://github.com/leanprover/verso-blueprint.git" @ "0e37300311c055dfb838a84ba195ea3751750572"
require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "f30f4b18d1058ce1879f7254ef066ebaed3515f2"

package FLTBlueprint where
  precompileModules := false
  leanOptions := #[
    ⟨`experimental.module, true⟩,
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩,
    ⟨`maxSynthPendingDepth, .ofNat 3⟩,
    ⟨`weak.verso.blueprint.math.lint, true⟩,
    ⟨`weak.verso.blueprint.externalCode.strictResolve, true⟩,
    ⟨`weak.verso.code.warnLineLength, .ofNat 0⟩
  ]

@[default_target]
lean_lib FLTBlueprint where

lean_exe «blueprint-gen» where
  root := `FLTBlueprintMain
  supportInterpreter := true
