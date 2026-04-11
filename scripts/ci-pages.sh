#!/usr/bin/env bash

set -euo pipefail

python3 scripts/check_active_chapter_alignment.py --project-root .

lake build
lake exe blueprint-gen --output _out/site

test -f _out/site/html-multi/index.html
test -f _out/site/html-multi/-verso-data/blueprint-preview-manifest.json
