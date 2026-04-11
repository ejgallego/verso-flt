# Verso FLT Integration Notes

This repository is the integration layer for the FLT Verso blueprint.

## Layout

- The root directory is the blueprint and harness root.
- `FLT/` is the upstream FLT formalization checkout and should be treated as
  upstream-owned Lean code.
- `FLT/` is strictly read-only for normal blueprint/integration work in this
  repository. In particular, do not edit files under `FLT/`, including
  `FLT/blueprint/src/chapter/*.tex`, unless the user explicitly asks for FLT
  upstream-side work.
- Keep all Verso blueprint sources, scripts, CI wiring, and generated output
  management at the repository root, not inside `FLT/`.
- There is no separate harness package anymore: the repository root itself is
  the harness.
- Keep the root `verso-harness.toml` checked in and treat it as the source of
  truth for package layout, LT chapter scope, and the TeX source locator.
- This repository currently keeps `harness.non_port_chapters` empty; inactive
  or meta chapters should not live on the active blueprint surface.
- Use the `ejgallego/verso-blueprint` mirror as the Lake dependency source for
  `VersoBlueprint`; do not switch back to the private upstream URL in project
  config until the upstream repo is public.

## Source Of Truth

- The source of truth for the mathematics is the existing FLT formalization in
  `FLT/**/*.lean` together with `FLT/FermatsLastTheorem.lean`.
- The source of truth for the TeX prose structure is
  `FLT/blueprint/src/chapter/*.tex`.
- Treat those FLT-side sources as reference material, not as an editing target,
  unless the user explicitly authorizes FLT-side work.
- When a Verso blueprint node refers to existing formalized mathematics, prefer
  `(lean := "...")` links to the real declaration names in those FLT files.
- Do not duplicate existing FLT declarations into the blueprint just to make a
  page render.

## Scope For The Port

- The goal of this migration is to move the blueprint infrastructure from TeX /
  `leanblueprint` to Verso / `verso-blueprint`.
- Treat the TeX blueprint as the content source of truth for the prose
  structure: the port should be as close to word-for-word as practical, with
  the main intended change being the layout language translation from TeX to
  Verso rather than substantive rewriting.
- Because `FLT/` is read-only in normal work, when the TeX source and the
  Verso port diverge, fix the outer-repo Verso chapters and harness first; do
  not “repair the source” in `FLT/blueprint/src/chapter/*.tex` unless the user
  explicitly asks for that FLT-side change.
- Keep the existing FLT formalization files unchanged for blueprint-port work
  unless we are doing explicit FLT-side compatibility or upstream work.

## Literal Translation Standard

- The default deliverable for direct TeX-to-Verso chapter work is an LT pass.
  `LT` is the canonical repository term, but `LF` (`LaTeX Fidelity` /
  `Literal Fidelity`) and `TF` (`Translation Faithfulness`) are accepted
  aliases meaning the same workflow: translate the TeX source into Verso as
  faithfully as possible, without rewriting the source just because the prose
  could be made smoother or better.
- Do not trust earlier LT-pass labels by themselves. Under the current
  methodology, a chapter is not treated as LT-audited until each translated
  informal block is paired with a local raw-TeX witness block.
- Preserve paragraph boundaries, sentence order, section order,
  theorem/definition/lemma/corollary/proof order, and local claim order from
  the TeX source unless a concrete Verso constraint forces a change.
- Translate TeX layout into Verso layout with the smallest possible editorial
  footprint. Do not smooth prose, summarize arguments, or add bridge text just
  because it reads better in English.
- Do not improve the source text during LT work. If a sentence is awkward in
  the TeX source, keep the awkwardness unless a concrete translation or build
  constraint forces a visible editorial note.
- When the TeX source uses mathematical notation, keep it as mathematical
  notation in the Verso port where practical. Do not routinely demote variables,
  formulas, congruences, maps, or algebraic expressions from TeX math into code
  spans just because code formatting is easier to type. Reserve code spans for
  Lean identifiers, file names, API names, literal syntax, or other genuinely
  code-like material.
- Do not promote free prose into new `:::theorem`, `:::definition`, or
  `:::proof` nodes unless the TeX source already has a corresponding formal
  environment or labeled proof step that should stay graph-visible.
- Do not add placeholder theorem interfaces, roadmap nodes, or semantic
  scaffolding that goes beyond the TeX source. If the TeX chapter stops at a
  forward pointer or sketch, the Verso port should stop there too.
- Treat placeholder `(lean := "...")` attachments as a priority-1 LT
  violation when the TeX/source block does not already carry the corresponding
  `\lean{...}` target. In particular, do not import helper modules such as
  `FutureAssumptions` into direct-port chapters just to give frontier source
  nodes an explicit interface.
- If a source-grounded node has no TeX-side `\lean{...}` target in the active
  source, leave the local Verso node unattached. Do not add a local-only
  `(lean := "...")` just because some real declaration exists, and do not edit
  the local TeX witness block to simulate a source attachment that is not
  present upstream.
- Missing source `\lean{...}` targets are source-side debt, not permission to
  legalize the node locally by metadata cleanup alone.
- Preserve TeX `\uses{...}` edges when they exist, but do not invent new
  dependency edges merely to make the blueprint graph look nicer.
- Treat TeX/source labels and Lean declaration names as distinct namespaces.
  Node ids and `{uses "..."}[]` belong to the source-label namespace; `(lean := "...")`
  belongs to the Lean declaration namespace. The two may coincide, but do not
  assume that they do.
- If the TeX source has a label for a theorem/definition/lemma/corollary/proof
  environment or other graph-visible source block, use that TeX/source label as
  the Verso node id. Do not replace it with an English wrapper name.
- Preserve theorem-like environment kind as well as label grounding. In
  practice, use `:::lemma_` for TeX `\begin{lemma}`, `:::corollary` for TeX
  `\begin{corollary}`, `:::definition` for TeX `\begin{definition}`, and
  reserve `:::theorem` for TeX `\begin{theorem}`. Do not use `:::theorem` as a
  generic wrapper for all theorem-like source environments.
- If the TeX source does not have a label for a block, do not invent a
  graph-visible node id merely to improve the blueprint graph. Keep the material
  as prose or as an unlabeled/local witness unless a separate explicit request
  says otherwise.
- Metadata fidelity is about preserving the source's intended blueprint
  semantics, not about copying TeX syntax mechanically. If the TeX source splits
  one dependency awkwardly across `\uses{...}` and prose `\ref{...}` because of
  old blueprint limitations, it is acceptable to consolidate that into a single
  source-grounded Verso `{uses "..."}[]` in the relevant node or proof, so long
  as this does not invent a new mathematical dependency.
- Treat metadata cleanup as a second phase of LT rather than as a substitute for
  LT. In particular, do not do metadata-only cleanup on a block that is not yet
  source-localized with an adjacent witness. First make the text LT/source-
  paired, then tighten `(lean := "...")`, `{uses "..."}[]`, and related
  metadata on that localized block.
- Conversely, do not promote every prose `\ref{...}` into a `{uses "..."}[]`.
  Only do so when the reference is clearly carrying dependency meaning rather
  than merely helping the prose read naturally.
- When non-literal material is genuinely unavoidable, keep it visibly separate
  and label it as an editorial or harness note rather than blending it into the
  translation.
- Each translated informal block should sit immediately next to a labeled
  `tex` block carrying the corresponding TeX source. Prefer a one-block / one-
  witness pairing; do not amortize one TeX block over several translated
  blocks when finer pairing is possible.
- When a Verso `:::definition`, `:::theorem`, `:::lemma`, `:::corollary`, or
  `:::proof` node is translating a real TeX formal environment, prefer using
  the corresponding TeX environment itself as the adjacent witness rather than
  a short statement-only `lt_...` snippet. Statement-only snippets are for
  literal prose paragraphs, not for standing in for a full source environment
  when theorem/proof metadata or proof shape is part of what the node is
  translating.
- If a theorem/proof pair in Verso is backed by one TeX theorem plus one TeX
  proof, keep the witness granularity aligned with that source structure. Do
  not pair a theorem node to a full theorem+proof witness or a proof node to a
  one-line theorem statement when finer source-local pairing is available.
- Keep paragraph boundaries aligned in ordinary prose as well: if a source
  transition takes two paragraphs, do not leave the first translated paragraph
  separated from its witness by attaching the witness only after the second.
- If a source block cannot yet be translated cleanly, keep the source locally
  in a labeled `tex` block instead of paraphrasing it into placeholder prose.
- Treat semantic cleanup as a second phase (`Blueprint pass`) after the LT
  pass. First port the TeX literally, then decide whether any extra blueprint
  structure is warranted.
- Treat low LT similarity scores as a triage signal, not as a license to
  rewrite freely. In practice, classify a bad score before editing:
  oversized/misaligned witness, metadata drift on an otherwise faithful block,
  or genuinely bad translation.
- If the main problem is an oversized or amortized witness block, first shrink
  or split the local `tex` witness to the exact source span that the adjacent
  Verso block is translating. Do this before rewriting good prose just to
  satisfy the metric.
- If the main problem is that a theorem/definition/proof shell is paired
  against a truncated statement-only witness while the source has a fuller
  formal environment, treat this as witness mismatch first. Replace the short
  witness with the real source environment, or split the Verso node so that the
  statement and proof each match their own local TeX source.
- If the main problem is metadata drift on a source-localized block, keep the
  text and tighten `(lean := "...")`, `{uses "..."}[]`, and related links
  rather than replacing the prose.
- Use the following taxonomy when triaging graph-visible Verso nodes:
  1. source-grounded node: a Verso `:::definition`, `:::theorem`, `:::lemma`,
     `:::corollary`, or `:::proof` that corresponds directly to a real TeX
     formal environment or labeled source block;
  2. mis-ported source-grounded node: a node that does have a real TeX source
     counterpart, but is paired to the wrong witness, merged with neighboring
     source material, given the wrong label grounding, or otherwise translated
     non-literally;
  3. invented node: a graph-visible Verso node with no direct TeX-side formal
     environment or labeled source block behind it.
- Treat invented nodes as the canonical meaning of "invented interface node" or
  "invented summary theorem" in this repository. In practice, an English
  wrapper theorem, interface node, or extra proof shell that never existed on
  the TeX side counts as invented even if it summarizes true source material.
- Do not treat mis-ported source-grounded nodes as invented. If a node does
  correspond to a real TeX theorem/definition/proof, prefer regrounding,
  re-witnessing, splitting, or relabeling it rather than deleting it.
- Do not "improve" the TeX source during LT work unless explicitly asked or
  unless a concrete parser/build/harness constraint forces it. In particular,
  preserve source wording, source naming, source labels, source proof shape,
  and even source awkwardness by default.
- If a source passage, node title, theorem statement, proof sketch, dependency
  edge, or label looks awkward or suboptimal, that is not by itself a reason to
  rewrite it, rename it, relabel it, or smooth it out. Faithfulness to the TeX
  source takes priority over stylistic cleanup.
- If a translated block merges several source items, introduces convenience
  summary scaffolding, or otherwise obscures the source structure, prefer
  deleting or demoting that summary block and restoring the real source-grounded
  intermediate nodes.
- If a low-scoring block is an invented interface node or summary theorem that
  has no direct TeX formal environment behind it, prefer deleting or demoting
  that node before spending time polishing its prose.
- If a translated block is materially misleading, structurally non-literal, or
  cannot be paired cleanly to a local source witness, replace it with a local
  `tex` witness and retranslate later rather than preserving a bad paraphrase.
- After each porting batch, explicitly record the deviations from literal
  translation in the work summary: additions, omissions, reordered material,
  invented nodes, and editorial notes.

## Build Harness

- Start maintenance with
  `python3 tools/verso-harness/scripts/status_harness.py --project-root .`
  so helper, upstream, and `VersoBlueprint` drift are visible before editing.
- Follow that with
  `python3 tools/verso-harness/scripts/check_harness.py --project-root .`
  to audit the local harness contract.
- Prefer the focused target `nice lake build blueprint-gen`.
- The site-generation smoke test is `bash ./scripts/ci-pages.sh`.
- `bash ./scripts/ci-pages.sh` now includes
  `python3 scripts/check_active_chapter_alignment.py --project-root .`, which
  enforces that the active TeX TOC in `FLT/blueprint/src/content.tex`, the
  root manual chapter order, and `lt.default_chapters` agree exactly.
- When port metadata is unclear, consult the original blueprint harness inputs
  in `FLT/blueprint/src/web.tex`, `FLT/blueprint/src/plastex.cfg`,
  `FLT/blueprint/notes_on_how_blueprint_works.txt`, and the old TeX chapter
  source. If needed, treat regeneration or inspection of the old blueprint
  dependency graph / metadata artifacts as a harness follow-up task rather than
  guessing missing labels, status, or dependency edges from memory.
- Fetch the mathlib cache before long verification runs.
- For Lean-facing checks on edited blueprint modules, prefer `lean-beam`
  (`ensure`, `sync`, `hover`, `run-at`) over full rebuild loops whenever that is
  enough to validate the change.
- For LT-facing checks on edited direct-port chapters, run
  `python3 tools/verso-harness/scripts/check_lt_source_pairs.py --project-root . <chapter.lean>` after the edit and
  treat any reported block as unaudited until the adjacent `tex` witness is in
  place.
- After the source-pair check, run
  `python3 scripts/check_blueprint_node_kinds.py <chapter.lean>` on touched
  direct-port chapters to ensure theorem/lemma/corollary/definition nodes match
  the adjacent TeX source environment kind.
- After the source-pair check is green, use
  `python3 tools/verso-harness/scripts/check_lt_similarity.py --project-root . <chapter.lean>` to get the first
  draft of the block-level mechanical drift report suggested by David. This now
  includes metadata-drift hints for `(lean := "...")`, `{uses "..."}[]`, and
  TeX `\ref{...}` / `\uses{...}` mismatches. The default output is human-
  oriented summary; use `--verbose` when an agent needs the full per-block dump.
- Run `python3 scripts/check_verso_math_delimiters.py <chapter.lean>` on
  touched chapters to catch malformed Verso math delimiters such as the bad
  TeX-to-Verso translation pattern `$`...`$`.
- When changing the LT similarity tooling itself, run
  `python3 tools/verso-harness/scripts/test_check_lt_similarity.py` before relying on the updated
  scores for porting decisions.
- Avoid issuing multiple `lean-beam sync` requests in parallel for the same
  project root. In this repository that sometimes trips a Beam/LSP worker exit
  with messages like `Cannot read LSP message: offset ... unexpected end of
  input`. Use one-module-at-a-time Beam sync as the stable path for now.

## Sub-Agent Coordination

- Prefer sub-agent coordination by default when the task cleanly splits into
  disjoint lanes. In practice this repository benefits from one worker per
  file or per chapter, with disjoint write sets.
- Good default parallel lanes are chapter-local LT cleanup, source-pair /
  similarity auditing, and metadata-focused `(lean := "...")` / `{uses "..."}[]`
  audits on files that another worker is not editing.
- Keep each delegated lane narrow and checkpointable. A worker should usually
  own exactly one chapter file, carry that file to a green local validation
  point, and then stop.
- Do not use sub-agents to create overlapping edits in the same chapter unless
  the split is extremely clear and one side is read-only.
- Parallelize editing work freely across disjoint chapters, but serialize
  repository-level validation whenever the checks are known to be fragile.
- In particular, do not run multiple `lean-beam sync` requests in parallel for
  the same repo root. If several workers edit Lean files, merge the edits and
  then do one-module-at-a-time Beam validation.
- When a lane is metadata-oriented rather than prose-oriented, prefer using it
  to improve graph connectedness: restore missing labeled intermediate nodes,
  attach resolvable Lean declarations, and move important source-grounded
  dependencies into the relevant theorem / definition / proof nodes.

## Math Porting

- Verso Blueprint math syntax is easy to get wrong: inline math is opened with
  `$`` and closed with a backtick, not with a trailing dollar sign. For display
  math, use `$$`` ... ``.
- In particular, do not translate TeX `$a$` as Verso `$`a`$`. The closing
  delimiter for inline math is the backtick alone, so the correct Verso form is
  `$`a``.
- Keep Verso directive headers syntactically conservative. In practice, put the
  full `:::definition` / `:::theorem` / `:::proof` header, including
  `(parent := ...)` and `(lean := ...)`, on one physical line rather than
  splitting the attachment options onto following lines.
- Do not place raw TeX commands such as `\ref`, `\emph`, `\begin{...}`,
  `\end{...}`, or TeX quote syntax directly in ordinary Verso prose blocks.
  Keep them inside adjacent `tex` witness fences, or translate them into
  parser-safe Verso/math/prose form first.
- When a local edit looks harmless but introduces parser errors such as
  `expected '![', '$$', '$', '[' or '[^'`, first suspect malformed directive
  headers, raw TeX in prose, or brittle multiline inline-math spans.
- Keep shared TeX macros in a dedicated Lean module so the project has one
  canonical `tex_prelude` definition rather than ad hoc per-file macros.
- The shared prelude currently lives in
  `FLTBlueprint/TeXPrelude.lean`; extend that module rather than scattering
  `tex_prelude` declarations across chapter files.
- Reuse the old TeX blueprint macro vocabulary where practical, but keep the
  prelude small and intentional.
- The KaTeX linter is available through `verso-blueprint`, and it is a major
  aid when porting math-heavy text. Use it aggressively to catch bad syntax and
  missing macros early.
- Even so, most required macro definitions should usually be inferable from the
  original blueprint prelude in `FLT/blueprint/src/macro/common.tex`. Check the
  old prelude first, then encode the needed subset intentionally in
  `FLTBlueprint/TeXPrelude.lean`.
- When porting math-heavy text, prefer simple incremental edits and validate the
  edited module with Beam immediately after saving.
- In practice, after a real Lean edit, save the file and run `lean-beam sync`
  on the edited module before escalating to a larger `lake build`.

## If Something Does Not Line Up

- If a declaration needs to be referenced, add or fix the `(lean := "...")`
  target in the Verso document rather than copying the Lean code.
- If the current FLT declarations do not compile on the chosen toolchain, treat
  that as a separate FLT-side compatibility issue to fix deliberately in
  `FLT/` or upstream FLT, rather than by distorting the outer blueprint port.

## Porting Workflow

- Port TeX blueprint content into the root Verso chapters in this repository,
  not into `FLT/`.
- Do not edit `FLT/blueprint/src/chapter/*.tex` during normal porting work in
  this repository. Use those files as read-only source material and make the
  corresponding faithful updates in the root Verso chapters instead.
- Start with an LT pass: preserve paragraph boundaries, sentence order, section
  order, theorem order, and mathematical claims unless there is a clear build,
  tooling, or project-structure reason not to.
- Pair each translated informal block with an adjacent labeled `tex` block from
  the source. This is now part of the LT pass itself, not an optional cleanup
  step after the fact.
- Do not add new blueprint structure unless the TeX source already justifies
  it. In particular, do not turn plain prose into extra theorem or proof nodes
  just to expose a dependency story.
- Preserve TeX `\uses{...}` dependency edges as Verso `{uses "..."}[]`
  references whenever the target exists in the blueprint graph. Put these
  references inside the corresponding translated nodes or proofs, not in
  unrelated free prose, so they are actually captured by the rendered
  dependency graph.
- When the source still needs to be shown verbatim, attach the raw TeX locally
  in a labeled `tex` block. The refreshed VersoBlueprint 4.28 branch supports
  this directly, so use it for source-backed notes instead of rewriting the
  passage into placeholder prose.
- Treat the active TeX TOC in `FLT/blueprint/src/content.tex` as authoritative
  for chapter order and active chapter membership. Do not keep deprecated or
  commented-out TeX chapters in the main manual or in `lt.default_chapters`.
- Treat metadata-only upgrades as blocked until the surrounding block is LT-
  complete and source-local. The hard precondition for `(lean := "...")` /
  `{uses "..."}[]` cleanup is that the corresponding text already has its local
  witness pairing in place.
- For direct-port chapters, only add `(lean := "...")` when the active TeX
  source already carries the corresponding `\lean{...}` target.
- Before adding a Lean reference, check that the needed FLT module chain can be
  imported from the root harness without breaking the current toolchain or
  build surface.
- Small, contained Lean-side fixes that directly unblock the port are fine.
  Broader or cascading FLT-side repair work should be postponed and tracked
  explicitly instead of being expanded opportunistically during the port.
- Keep FLT-side compatibility fixes in `FLT/` or upstream FLT and keep
  blueprint/integration changes in the outer `verso-flt` repository.
- After FLT-side changes land, update the `FLT/` submodule pointer in the outer
  repository.

## Autonomous Porting Checklist

- Work from the TeX source chapter-by-chapter. Treat section order, theorem
  order, paragraph boundaries, sentence order, and dependency structure as
  intentional.
- Prefer sub-agent coordination by default when a batch naturally splits into
  disjoint chapter or file lanes. Keep one worker per file as the normal rule.
- Treat a block as LT-complete only once its local Verso translation sits next
  to a labeled `tex` witness block with the matching source excerpt.
- Do not treat metadata cleanup by itself as LT completion. Metadata upgrades
  belong on blocks that are already source-paired and textually localized.
- Prefer translating existing TeX material into Verso over inventing new
  exposition. If explanatory glue is absolutely needed, keep it minimal,
  visibly editorial, and in service of the source structure.
- When the TeX source has a labeled theorem, definition, lemma, corollary, or
  proof step that still matters to the dependency story, prefer creating a
  corresponding Verso node rather than burying it in prose.
- When the TeX source has only prose, keep it as prose. Do not promote that
  prose into new theorem, definition, or proof nodes just because the resulting
  graph would be cleaner.
- When the TeX source has `\uses{...}`, preserve those dependencies as
  `{uses "..."}[]` inside the relevant theorem/definition/proof nodes so the
  graph remains faithful. Do not leave important `\uses` edges only in free
  prose, and do not invent new ones without a source basis.
- If a TeX chapter is only partially ported, continue with the next coherent
  section block rather than scattering small edits across unrelated chapters.
- Keep Lean references conservative. Add `(lean := "...")` only when the import
  chain is already root-harness-clean on the current toolchain.
- After each real Lean edit, validate the edited file with one-module-at-a-time
  `lean-beam sync`. Do not run multiple syncs in parallel for this repo root.
- If the source block is still open, prefer a local `tex` block carrying the
  raw TeX excerpt over a rewritten placeholder. That keeps the board and the
  chapter close to the TeX source of truth.
- After a chapter edit batch, run `python3 tools/verso-harness/scripts/check_lt_source_pairs.py --project-root .`
  on the touched chapter files before treating the batch as LT-audited.
- When the source-pair checker passes, run
  `python3 tools/verso-harness/scripts/check_lt_similarity.py --project-root .` on the touched chapters and record
  any obviously low-similarity blocks as follow-up LT audit work rather than
  silently accepting them.
- When triaging an obviously low-similarity block, prefer this order:
  1. shrink/split the witness,
  2. replace truncated statement-only witnesses with the real source
     theorem/proof environments when applicable,
  3. remove invented summary structure,
  4. restore missing source-grounded nodes,
  5. only then rewrite the translated prose,
  6. if none of that yields a trustworthy LT block, fall back to raw `tex`.
- In the work summary for each batch, include a short deviation report listing
  any non-literal changes that were introduced deliberately.
- After a coherent batch, run `bash ./scripts/ci-pages.sh`.
- Keep the root build green. If a faithful Lean link would pull in imports that
  are not clean on the current toolchain, leave the chapter informal and note
  the dependency in prose instead of breaking the build.
- Commit and push coherent validated batches in the outer repo. Only touch the
  `FLT/` submodule when the task is explicitly FLT-side or upstream work.
