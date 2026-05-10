import Verso
import VersoManual
import VersoBlueprint
import Verso.Doc.ArgParse

open Lean
open Verso Doc Elab
open Verso.ArgParse
open Verso.Genre Manual
open Verso.Output.Html

namespace FLTBlueprint.TeXReview

structure TexConfig where
  label? : Option Informal.Data.Label := none
  slot : String := Informal.Data.defaultTexSourceSlot
  accuracy : Nat := 1001
  warnBelow : Nat := 860
deriving BEq, Repr, ToJson, FromJson, Quote

structure TexReviewData where
  label? : Option Informal.Data.Label := none
  slot : String := Informal.Data.defaultTexSourceSlot
  accuracy : Nat := 1001
  warnBelow : Nat := 860
  content : String
deriving BEq, Repr, ToJson, FromJson, Quote

private def texSlot : ValDesc DocElabM String := {
  description := "a TeX witness slot name"
  signature := CanMatch.Ident ∪ CanMatch.String
  get := fun
    | .name id =>
      pure id.getId.toString
    | .str s =>
      let slot := s.getString.trimAscii.toString
      if slot.isEmpty then
        throwErrorAt s "Expected a non-empty TeX witness slot"
      else
        pure slot
    | other =>
      throwError "Expected a TeX witness slot identifier or string, got {toMessageData other}"
}

def TexConfig.parse : ArgParse DocElabM TexConfig :=
  (fun (labelArg? : Option (Verso.ArgParse.WithSyntax String)) (slotArg? : Option String)
      accuracy warnBelow =>
    {
      label? := labelArg?.map (fun labelArg => Informal.LabelNameParsing.parse labelArg.val)
      slot := slotArg?.getD Informal.Data.defaultTexSourceSlot
      accuracy
      warnBelow
    }) <$> ((some <$> .positional `label (.withSyntax .string)) <|> pure none)
        <*> .named `slot texSlot true
        <*> .namedD `accuracy .nat 1001
        <*> .namedD `warnBelow .nat 860

instance : FromArgs TexConfig DocElabM where
  fromArgs := TexConfig.parse

private def boundedPerMille (value : Nat) : Nat :=
  min value 1000

private def hasAccuracy (value : Nat) : Bool :=
  value <= 1000

private def percentText (perMille : Nat) : String :=
  let value := boundedPerMille perMille
  s!"{value / 10}.{value % 10}%"

private def accuracyStatusClass (accuracy warnBelow : Nat) : String :=
  if !hasAccuracy accuracy then
    "flt-tex-accuracy-none"
  else if accuracy == 1000 then
    "flt-tex-accuracy-ok"
  else if accuracy < warnBelow then
    "flt-tex-accuracy-low"
  else
    "flt-tex-accuracy-warn"

private def accuracyTitle (accuracy : Nat) : String :=
  if hasAccuracy accuracy then
    s!"LT token accuracy {percentText accuracy}"
  else
    "LT token accuracy has not been recorded for this block"

private def accuracyHtml (accuracy warnBelow : Nat) : Verso.Output.Html :=
  let className := "flt-tex-accuracy " ++ accuracyStatusClass accuracy warnBelow
  if hasAccuracy accuracy then
    {{
      <span class={{className}} title={{accuracyTitle accuracy}}>
        <span class="flt-tex-accuracy-label">"Accuracy"</span>
        <span class="flt-tex-accuracy-value">{{percentText accuracy}}</span>
      </span>
    }}
  else
    {{
      <span class={{className}} title={{accuracyTitle accuracy}}>
        <span class="flt-tex-accuracy-label">"Accuracy"</span>
        <span class="flt-tex-accuracy-value">"pending"</span>
      </span>
    }}

private def slotSuffix (slot : String) : String :=
  if slot == Informal.Data.defaultTexSourceSlot || slot == "statement" then
    ""
  else if slot == "proof" then
    " proof"
  else
    s!" {slot}"

private def sourceLabel
    (st : TraverseState) (ctxt : TraverseContext) (data : TexReviewData) : String :=
  match data.label? with
  | none => "Original TeX code"
  | some label =>
    let fallback := s!"Original TeX{slotSuffix data.slot} code for {label}"
    match Informal.TraversalIndex.Nodes.data? st label with
    | none => fallback
    | some blockData =>
      let blockData := blockData.withResolvedNumbering st (Informal.numberedPartPrefix? ctxt)
      let title := blockData.displayTitle st (Informal.numberedPartPrefix? ctxt)
      if data.slot == "proof" then
        s!"Original TeX code for proof of {title}"
      else
        s!"Original TeX code for {title}"

def texReviewCss : CSS :=
r#"
.flt-tex-review {
  margin: 0.75rem 0 1.2rem;
  border: 1px solid #d8d3c5;
  border-radius: 6px;
  background: #fbfaf6;
  overflow: hidden;
}
.flt-tex-review summary {
  display: flex;
  align-items: center;
  justify-content: space-between;
  gap: 0.75rem;
  margin: 0;
  padding: 0.38rem 0.75rem;
  border-bottom: 1px solid #d8d3c5;
  background: #f1eddf;
  color: #4d4637;
  cursor: pointer;
  font-family: var(--verso-structure-font-family);
  font-size: 0.82rem;
  font-weight: 650;
  line-height: 1.35;
  list-style: none;
}
.flt-tex-review summary::-webkit-details-marker {
  display: none;
}
.flt-tex-review-title {
  min-width: 0;
}
.flt-tex-review pre {
  margin: 0;
  padding: 0.85rem 1rem;
  overflow-x: auto;
  background: transparent;
}
.flt-tex-review code {
  font-family: var(--verso-code-font-family);
  font-size: 0.9rem;
  line-height: 1.45;
}
.flt-tex-accuracy {
  display: inline-flex;
  flex: 0 0 auto;
  align-items: center;
  gap: 0.3rem;
  padding: 0.08rem 0.42rem;
  border: 1px solid color-mix(in srgb, var(--flt-tex-accuracy-color) 38%, transparent);
  border-radius: 999px;
  background: color-mix(in srgb, var(--flt-tex-accuracy-color) 9%, white);
  color: var(--flt-tex-accuracy-color);
  font-size: 0.72rem;
  font-weight: 700;
  line-height: 1.2;
}
.flt-tex-accuracy-ok {
  --flt-tex-accuracy-color: #4f7e66;
}
.flt-tex-accuracy-warn {
  --flt-tex-accuracy-color: #8f661f;
}
.flt-tex-accuracy-low {
  --flt-tex-accuracy-color: #a04655;
}
.flt-tex-accuracy-none {
  --flt-tex-accuracy-color: #68737d;
}
"#

block_extension texReviewBlock (data : TexReviewData) where
  data := ToJson.toJson data
  traverse _ _ _ := pure none
  extraCss := [texReviewCss]
  toTeX := some <| fun _ _ _ _ _ => pure .empty
  toHtml :=
    open Verso.Doc.Html in
    some <| fun _ _ _ json _ => do
      let .ok (data : TexReviewData) := FromJson.fromJson? json
        | HtmlT.logError s!"Malformed FLT TeX review block metadata: {json.compress}"
          return .empty
      let st ← HtmlT.state
      let ctxt ← HtmlT.context
      let label := sourceLabel st ctxt data
      return {{
        <details class="flt-tex-review">
          <summary>
            <span class="flt-tex-review-title">{{label}}</span>
            {{accuracyHtml data.accuracy data.warnBelow}}
          </summary>
          <pre><code>{{data.content}}</code></pre>
        </details>
      }}

end FLTBlueprint.TeXReview

open FLTBlueprint.TeXReview

@[code_block]
def tex : CodeBlockExpanderOf TexConfig
  | cfg, contents => do
    if let some label := cfg.label? then
      Informal.Environment.registerTexSource label cfg.slot { raw := contents.getString }
    let data : TexReviewData := {
      label? := cfg.label?
      slot := cfg.slot
      accuracy := cfg.accuracy
      warnBelow := cfg.warnBelow
      content := contents.getString
    }
    ``(Verso.Doc.Block.other (FLTBlueprint.TeXReview.texReviewBlock $(quote data)) #[])
