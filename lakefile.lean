import Lake
open Lake DSL

require FLT from "./FLT"
require verso from git "https://github.com/leanprover/verso.git" @ "v4.29.0-rc6"
require VersoBlueprint from git "https://github.com/ejgallego/verso-blueprint.git" @
  "7e15d20e6a03859de535a359bca3760c039858b2"

package FLTBlueprint where
  precompileModules := false
  leanOptions := #[
    ⟨`experimental.module, true⟩,
    ⟨`pp.unicode.fun, true⟩,
    ⟨`autoImplicit, false⟩,
    ⟨`relaxedAutoImplicit, false⟩,
    ⟨`maxSynthPendingDepth, .ofNat 3⟩
  ]

@[default_target]
lean_lib FLTBlueprint where

lean_exe «blueprint-gen» where
  root := `FLTBlueprintMain
  supportInterpreter := true
