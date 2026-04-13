#!/usr/bin/env bash

set -euo pipefail

python3 scripts/check_active_chapter_alignment.py --project-root .
python3 scripts/check_blueprint_heading_structure.py --project-root .

lake build 2>&1 | python3 scripts/filter_docstring_warnings.py --project-root .
lake exe blueprint-gen --output _out/site 2>&1 | python3 scripts/filter_docstring_warnings.py --project-root .

test -f _out/site/html-multi/index.html
test -f _out/site/html-multi/-verso-data/blueprint-preview-manifest.json
