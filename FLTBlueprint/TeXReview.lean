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
        <span class="flt-tex-accuracy-main">
          <span class="flt-tex-accuracy-label">"Accuracy"</span>
          <span class="flt-tex-accuracy-value">{{percentText accuracy}}</span>
        </span>
        <span class="flt-tex-accuracy-track" aria-hidden="true">
          <span class="flt-tex-accuracy-fill" style={{"width: " ++ percentText accuracy}}></span>
        </span>
      </span>
    }}
  else
    {{
      <span class={{className}} title={{accuracyTitle accuracy}}>
        <span class="flt-tex-accuracy-main">
          <span class="flt-tex-accuracy-label">"Accuracy"</span>
          <span class="flt-tex-accuracy-value">"pending"</span>
        </span>
      </span>
    }}

private def slotSuffix (slot : String) : String :=
  if slot == Informal.Data.defaultTexSourceSlot || slot == "statement" then
    ""
  else if slot == "proof" then
    " proof"
  else
    s!" {slot}"

private def currentSectionTitle (ctxt : TraverseContext) : String :=
  match ctxt.headers.back? with
  | some header =>
    let title := header.titleString.trimAscii.toString
    if title.isEmpty then
      "current section"
    else
      title
  | none =>
    match ctxt.path.back? with
    | some path => path
    | none => "current section"

private def unlabeledSourceLabel (ctxt : TraverseContext) (data : TexReviewData) : String :=
  if data.content.trimAscii.startsWith "\\chapter" then
    "Original TeX code for chapter source"
  else if data.content.trimAscii.startsWith "\\section" then
    "Original TeX code for section source"
  else if data.content.trimAscii.startsWith "\\subsection" then
    "Original TeX code for subsection source"
  else
    s!"Original TeX code for prose in {currentSectionTitle ctxt}"

private def sourceLabel
    (st : TraverseState) (ctxt : TraverseContext) (data : TexReviewData) : String :=
  match data.label? with
  | none => unlabeledSourceLabel ctxt data
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

def texReviewJs : JS :=
r#"
(() => {
  const storageKey = 'flt-tex-review-hidden';
  const hiddenClass = 'flt-tex-review-hidden';
  const highlightClass = 'flt-tex-review-pair-active';
  const hoveringClass = 'flt-tex-review-hovering';
  const toggleClass = 'flt-tex-review-toggle';
  const boundarySelector = '.flt-tex-review';

  const readHidden = () => {
    try {
      return window.localStorage.getItem(storageKey) === 'true';
    } catch (_error) {
      return false;
    }
  };

  const writeHidden = (hidden) => {
    try {
      window.localStorage.setItem(storageKey, hidden ? 'true' : 'false');
    } catch (_error) {
    }
  };

  const isHidden = () => document.documentElement.classList.contains(hiddenClass);

  const pairedElements = (block) => {
    const elements = [];
    let cursor = block.previousElementSibling;
    while (cursor && !cursor.matches(boundarySelector)) {
      if (!cursor.matches('script, style')) {
        elements.push(cursor);
      }
      cursor = cursor.previousElementSibling;
    }
    return elements.reverse();
  };

  const clearHighlights = () => {
    for (const element of document.querySelectorAll(`.${highlightClass}, .${hoveringClass}`)) {
      element.classList.remove(highlightClass, hoveringClass);
    }
  };

  const setHighlight = (block, active) => {
    if (isHidden()) {
      active = false;
    }
    block.classList.toggle(hoveringClass, active);
    for (const element of pairedElements(block)) {
      element.classList.toggle(highlightClass, active);
    }
  };

  const setHidden = (hidden, button = null) => {
    document.documentElement.classList.toggle(hiddenClass, hidden);
    if (hidden) {
      clearHighlights();
    }
    writeHidden(hidden);
    if (button) {
      button.setAttribute('aria-pressed', hidden ? 'true' : 'false');
      button.textContent = hidden ? 'Show TeX review' : 'Hide TeX review';
      button.title = hidden
        ? 'Show original TeX review blocks'
        : 'Hide original TeX review blocks';
    }
  };

  const initToggle = () => {
    if (document.querySelector(`.${toggleClass}`)) {
      return;
    }
    const button = document.createElement('button');
    button.type = 'button';
    button.className = toggleClass;
    button.addEventListener('click', () => setHidden(!isHidden(), button));
    document.body.appendChild(button);
    setHidden(isHidden(), button);
  };

  const init = () => {
    initToggle();
    for (const block of document.querySelectorAll(boundarySelector)) {
      block.addEventListener('mouseenter', () => setHighlight(block, true));
      block.addEventListener('mouseleave', () => setHighlight(block, false));
      block.addEventListener('focusin', () => setHighlight(block, true));
      block.addEventListener('focusout', () => setHighlight(block, false));
    }
  };

  if (readHidden()) {
    document.documentElement.classList.add(hiddenClass);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', init, { once: true });
  } else {
    init();
  }
})();
"#

def texReviewCss : CSS :=
r#"
.flt-tex-review {
  margin: 0.75rem 0 1.2rem;
  border: 1px solid #d8d3c5;
  border-left: 3px solid var(--flt-tex-review-accent, #9a8556);
  border-radius: 6px;
  background: #fbfaf6;
  overflow: hidden;
}
.flt-tex-review[data-flt-tex-accuracy-status="ok"] {
  --flt-tex-review-accent: #4f7e66;
}
.flt-tex-review[data-flt-tex-accuracy-status="warn"] {
  --flt-tex-review-accent: #8f661f;
}
.flt-tex-review[data-flt-tex-accuracy-status="low"] {
  --flt-tex-review-accent: #a04655;
}
.flt-tex-review[data-flt-tex-accuracy-status="none"] {
  --flt-tex-review-accent: #68737d;
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
  box-shadow: inset 0 -1px 0 color-mix(in srgb, var(--flt-tex-review-accent) 14%, transparent);
}
.flt-tex-review summary::-webkit-details-marker {
  display: none;
}
.flt-tex-review-title {
  min-width: 0;
}
.flt-tex-review.flt-tex-review-hovering summary {
  background: color-mix(in srgb, var(--flt-tex-review-accent) 13%, #f1eddf);
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
  padding: 0.08rem 0.48rem;
  border: 1px solid color-mix(in srgb, var(--flt-tex-accuracy-color) 38%, transparent);
  border-radius: 999px;
  background: color-mix(in srgb, var(--flt-tex-accuracy-color) 9%, white);
  color: var(--flt-tex-accuracy-color);
  font-size: 0.72rem;
  font-weight: 700;
  line-height: 1.2;
}
.flt-tex-accuracy-main {
  display: inline-flex;
  align-items: baseline;
  gap: 0.28rem;
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
.flt-tex-accuracy-track {
  display: inline-flex;
  width: 3.4rem;
  height: 0.32rem;
  overflow: hidden;
  border-radius: 999px;
  background: color-mix(in srgb, var(--flt-tex-accuracy-color) 18%, white);
}
.flt-tex-accuracy-fill {
  display: block;
  min-width: 0.12rem;
  border-radius: inherit;
  background: var(--flt-tex-accuracy-color);
}
.flt-tex-review-pair-active {
  border-radius: 4px;
  background: color-mix(in srgb, #d99a28 15%, transparent);
  box-shadow: 0 0 0 0.25rem color-mix(in srgb, #d99a28 13%, transparent);
  transition: background 120ms ease, box-shadow 120ms ease;
}
.flt-tex-review-hidden .flt-tex-review {
  display: none !important;
}
.flt-tex-review-hidden .flt-tex-review-pair-active {
  background: transparent;
  box-shadow: none;
}
.flt-tex-review-toggle {
  position: fixed;
  top: calc(var(--verso-header-height) + 0.65rem);
  right: max(0.75rem, env(safe-area-inset-right));
  z-index: 120;
  display: inline-flex;
  align-items: center;
  justify-content: center;
  min-height: 2rem;
  padding: 0.22rem 0.55rem;
  border: 1px solid #c7d2de;
  border-radius: 4px;
  background: #f7f9fb;
  color: #2f3a45;
  box-shadow: 0 2px 8px color-mix(in srgb, #4b5968 18%, transparent);
  font-family: var(--verso-structure-font-family);
  font-size: 0.78rem;
  font-weight: 650;
  line-height: 1.2;
  cursor: pointer;
}
.flt-tex-review-toggle:hover {
  border-color: #9fb1c2;
  background: #eef3f7;
}
.flt-tex-review-toggle:focus-visible {
  outline: 2px solid #315d88;
  outline-offset: 2px;
}
@media screen and (max-width: 760px) {
  .flt-tex-review summary {
    align-items: flex-start;
    flex-direction: column;
  }
  .flt-tex-review-toggle {
    top: auto;
    right: max(0.75rem, env(safe-area-inset-right));
    bottom: max(0.75rem, env(safe-area-inset-bottom));
  }
}
"#

block_extension texReviewBlock (data : TexReviewData) where
  data := ToJson.toJson data
  traverse _ _ _ := pure none
  extraCss := [texReviewCss]
  extraJs := [texReviewJs]
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
      let status := (accuracyStatusClass data.accuracy data.warnBelow |>.drop "flt-tex-accuracy-".length).toString
      return {{
        <details class="flt-tex-review" data-flt-tex-accuracy-status={{status}}>
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
