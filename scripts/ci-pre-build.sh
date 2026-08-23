#!/usr/bin/env bash

set -euo pipefail

python3 scripts/check_active_chapter_alignment.py --project-root .
python3 scripts/check_lake_dependency_urls.py
python3 scripts/check_tex_prelude_imports.py
python3 tools/verso-harness/scripts/check_lt_source_pairs.py --project-root .
python3 tools/verso-harness/scripts/check_blueprint_node_kinds.py --project-root .
python3 tools/verso-harness/scripts/check_source_authorized_metadata.py --project-root .
python3 tools/verso-harness/scripts/check_source_label_grounding.py --project-root .
python3 tools/verso-harness/scripts/check_verso_math_delimiters.py --project-root .
python3 tools/verso-harness/scripts/check_blueprint_heading_structure.py --project-root .
