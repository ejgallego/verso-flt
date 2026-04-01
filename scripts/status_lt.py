#!/usr/bin/env python3
from __future__ import annotations

import argparse
from pathlib import Path
import statistics
import sys


SCRIPT_DIR = Path(__file__).resolve().parent
if str(SCRIPT_DIR) not in sys.path:
    sys.path.insert(0, str(SCRIPT_DIR))

from check_lt_similarity import paired_blocks, score_pair  # noqa: E402
from check_lt_source_pairs import default_chapter_paths  # noqa: E402


def summarize(path: Path, warn_below: float) -> str:
    pairs, errors = paired_blocks(path)
    if errors:
        return f"{path.name}: source-pair-errors={len(errors)}"

    scores = [score_pair(block, tex) for block, tex in pairs]
    if not scores:
        return f"{path.name}: no-pairs"

    primary_values = [score.primary_ratio for score in scores]
    low = sum(score.primary_ratio < warn_below for score in scores)
    metadata = sum(score.metadata_diff_count > 0 for score in scores)
    pure_metadata = sum(score.pure_metadata_diff_count > 0 for score in scores)
    reground = sum(bool(score.label_regrounding_candidates) for score in scores)
    witness = sum(bool(score.witness_mismatch_hints) for score in scores)
    strong_refs = sum(len(score.strong_ref_candidates) for score in scores)
    env_refs = sum(len(score.env_ref_hints) for score in scores)
    return (
        f"{path.name}: pairs={len(scores)} "
        f"avg={statistics.mean(primary_values):.3f} "
        f"median={statistics.median(primary_values):.3f} "
        f"low={low} metadata={metadata} "
        f"pure_metadata={pure_metadata} reground={reground} witness={witness} "
        f"strong_refs={strong_refs} env_ref_hints={env_refs}"
    )


def main() -> int:
    parser = argparse.ArgumentParser(
        description="Compact LT status dashboard for one or more chapter files."
    )
    parser.add_argument(
        "paths",
        nargs="*",
        type=Path,
        help="Specific Lean chapter files. Defaults to the direct-port chapter list.",
    )
    parser.add_argument(
        "--warn-below",
        type=float,
        default=0.70,
        help="Similarity warning threshold.",
    )
    parser.add_argument(
        "--root",
        type=Path,
        default=Path(__file__).resolve().parents[1],
        help="Repository root. Used when no explicit paths are given.",
    )
    args = parser.parse_args()

    root = args.root.resolve()
    paths = [path.resolve() for path in args.paths] if args.paths else default_chapter_paths(root)

    for path in paths:
        print(summarize(path, args.warn_below))

    return 0


if __name__ == "__main__":
    raise SystemExit(main())
