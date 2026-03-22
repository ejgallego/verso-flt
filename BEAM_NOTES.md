# Beam Notes

## Parallel `lean-beam sync` issue

Observed repeatedly in this repository:

- Running multiple `lean-beam sync "Some/Module.lean"` requests in parallel for
  the same project root can cause Beam to fail with a worker/LSP transport
  error.
- The characteristic failure shape is:

```text
workerExited: Cannot read LSP message: offset ...: unexpected end of input
```

or, equivalently, a `syncBarrierIncomplete` after the worker exits.

### Practical workaround

- Use `lean-beam sync` one module at a time.
- If Beam gets into a stale state, check:

```bash
lean-beam doctor
```

- Then retry a single-module sync, or escalate to a normal `lake build` if the
  imported dependency chain itself is broken.

### Why this note exists

This is a repository-local observation meant to be followed up upstream with the
Lean Beam project. The issue seems tied to concurrent sync traffic against the
same project root rather than to any specific FLT module.
