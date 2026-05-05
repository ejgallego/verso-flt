import Lake
open Lake DSL

require FLT from "./FLT"
require VersoBlueprint from git "https://github.com/leanprover/verso-blueprint.git" @ "v4.29.0"
require mathlib from git "https://github.com/leanprover-community/mathlib4" @ "18a09f90937aa1f3ffe6b80159ca7fa3bf15f981"

package FLTBlueprint where
  precompileModules := false
  leanOptions := #[
    ⟨`experimental.module, true⟩,
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩,
    ⟨`maxSynthPendingDepth, .ofNat 3⟩,
    -- `math.lint` is registered in `VersoBlueprint.MathLint`,
    -- so v4.28.0 requires the weak form here for early-built modules.
    ⟨`weak.verso.blueprint.math.lint, true⟩,
    -- `strictResolve` is registered in `VersoBlueprint.Informal.ExternalCode`,
    -- so v4.28.0 requires the weak form here for non-ExternalCode modules.
    ⟨`weak.verso.blueprint.externalCode.strictResolve, true⟩,
    ⟨`weak.verso.code.warnLineLength, .ofNat 0⟩
  ]

@[default_target]
lean_lib FLTBlueprint where

lean_exe «blueprint-gen» where
  root := `FLTBlueprintMain
  supportInterpreter := true
