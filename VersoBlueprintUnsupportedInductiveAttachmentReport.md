# VersoBlueprint Report: Unsupported Inductive Attachment

## Summary

`VersoBlueprint` currently rejects external Lean references attached to
inductive/structure declarations through blueprint markup, even when the
blueprint node is otherwise definition-like.

In this repository, the concrete trigger was the Hurwitz-quaternion definition
node in
[FLTBlueprint/Chapters/AutomorphicFormExample.lean](/home/egallego/lean/verso-flt/FLTBlueprint/Chapters/AutomorphicFormExample.lean#L599),
where the natural TeX-backed label is `Hurwitz` and the underlying Lean object
is the structure `Hurwitz`.

## Minimal Repro

Minimal shape:

```lean
:::definition "Hurwitz" (lean := "Hurwitz")
The Hurwitz quaternions are ...
:::
```

Build command:

```bash
nice lake build FLTBlueprint.Chapters.AutomorphicFormExample
```

Observed error:

```text
error: FLTBlueprint/Chapters/AutomorphicFormExample.lean:598:0:
Unsupported external Lean reference 'Hurwitz' (canonical 'Hurwitz')
with kind 'inductive'. Only definitions, theorems, and axiom-like placeholders
are currently supported.
```

## Upstream Rejection Site

The rejection comes from
[ExternalRefSnapshot.lean](/home/egallego/lean/verso-flt/.lake/packages/VersoBlueprint/src/VersoBlueprint/ExternalRefSnapshot.lean#L111),
inside `externalRefSnapshot`:

```lean
match cinfo with
| .defnInfo _ => pure Data.NodeKind.definition
| .thmInfo _ => pure Data.NodeKind.theorem
| .axiomInfo _ | .opaqueInfo _ => pure ref.kind
| _ =>
  throwError m!"Unsupported external Lean reference ..."
```

So anything that elaborates to `.inductInfo` or related non-definition
`ConstantInfo` variants is rejected.

## Why This Is A Problem

This blocks natural blueprint attachments for many mathematical objects that are
best represented in Lean as:

- structures
- inductives
- possibly abbreviations or other definition-adjacent declaration forms that do
  not land in `.defnInfo`

For blueprint work, these objects are often exactly the things one wants to
attach to a `definition` node.

In this repository, `Hurwitz` is the source-backed TeX label and the correct
Lean-side object. The current restriction forced us to drop the
`(lean := "Hurwitz")` attachment even though the blueprint node is definition
content and the Lean declaration exists.

## Expected Behavior

At minimum, blueprint external refs should accept structure/inductive
declarations as definition-like targets.

Concretely, one reasonable behavior would be:

- `.defnInfo _` -> `NodeKind.definition`
- `.inductInfo _` -> `NodeKind.definition`
- `.ctorInfo _` -> probably either reject or map explicitly depending on policy
- `.thmInfo _` -> `NodeKind.theorem`
- `.axiomInfo _ | .opaqueInfo _` -> preserve current behavior

The key point is that inductive/structure heads should not be rejected
outright.

## Suggested Fix Surface

Primary fix surface:

- [ExternalRefSnapshot.lean](/home/egallego/lean/verso-flt/.lake/packages/VersoBlueprint/src/VersoBlueprint/ExternalRefSnapshot.lean#L111)

Likely follow-up surfaces:

- any tests that currently assume only `.defnInfo` is definition-like
- rendering/summary code if it displays kind text differently for inductives

## Suggested Test

Add a small test case in the `VersoBlueprint` test suite that attaches a
blueprint `definition` node to a structure or inductive declaration and checks
that:

- the external ref is accepted
- it is recorded as present
- its node kind is treated as `definition`

## Local Workaround Used Here

For now, we removed the unsupported attachment:

```lean
:::definition "Hurwitz" ...
```

instead of

```lean
:::definition "Hurwitz" (lean := "Hurwitz") ...
```

This keeps the chapter buildable, but it is only a workaround. The underlying
Lean declaration exists and should be attachable once `VersoBlueprint` accepts
inductive/structure references.

Follow-up to record locally: restore `(lean := "Hurwitz")` in
`FLTBlueprint/Chapters/AutomorphicFormExample.lean` once that upstream support
lands.
