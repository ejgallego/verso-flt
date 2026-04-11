import Lake
open Lake DSL

require FLT from "./FLT"
require VersoBlueprint from git "https://github.com/ejgallego/verso-blueprint.git" @ "v4.28.0"
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
