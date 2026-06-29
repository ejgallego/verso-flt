import Lake
open Lake DSL

require FLT from "./FLT"
require VersoBlueprint from git "https://github.com/leanprover/verso-blueprint.git" @ "0b0a58d97ccbb7294a898b9e3a1289b5781fee4d"
require mathlib from git "https://github.com/leanprover-community/mathlib4.git" @ "fabf563a7c95a166b8d7b6efca11c8b4dc9d911f"

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
