#!/usr/bin/env python3
from __future__ import annotations

from _helper_shim import export_public, load_helper_module

_module = load_helper_module("check_blueprint_heading_structure.py")
export_public(_module, globals())

if __name__ == "__main__":
    raise SystemExit(main())
