#!/usr/bin/env python3
from __future__ import annotations

import importlib.util
from pathlib import Path
import sys


ROOT = Path(__file__).resolve().parents[1]
HELPER_SCRIPT_DIR = ROOT / "tools" / "verso-harness" / "scripts"


def load_helper_module(script_name: str):
    path = HELPER_SCRIPT_DIR / script_name
    if not path.exists():
        raise SystemExit(
            f"missing helper script {path}; initialize tools/verso-harness first"
        )

    module_name = f"verso_harness_{script_name.replace('.', '_')}"
    spec = importlib.util.spec_from_file_location(module_name, path)
    if spec is None or spec.loader is None:
        raise SystemExit(f"could not load helper script {path}")

    module = importlib.util.module_from_spec(spec)
    sys.modules[module_name] = module
    spec.loader.exec_module(module)
    return module


def export_public(module, namespace: dict[str, object]) -> None:
    for name in dir(module):
        if name.startswith("_"):
            continue
        namespace[name] = getattr(module, name)
