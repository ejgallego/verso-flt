#!/usr/bin/env python3

from __future__ import annotations

import io
import json
import sys
import tempfile
import unittest
from contextlib import redirect_stdout
from pathlib import Path

from check_lake_dependency_urls import main


MATHLIB_REV = "09178ce7676d92ddcfc6dafe90fdfa758e97002e"


def write(path: Path, text: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(text, encoding="utf-8")


def write_manifest(path: Path, url: str) -> None:
    write(
        path,
        json.dumps(
            {
                "version": "1.2.0",
                "packagesDir": ".lake/packages",
                "packages": [
                    {
                        "url": url,
                        "type": "git",
                        "subDir": None,
                        "scope": "",
                        "rev": MATHLIB_REV,
                        "name": "mathlib",
                        "manifestFile": "lake-manifest.json",
                        "inputRev": MATHLIB_REV,
                        "inherited": False,
                        "configFile": "lakefile.lean",
                    }
                ],
                "name": "Example",
                "lakeDir": ".lake",
            },
            indent=1,
        )
        + "\n",
    )


class LakeDependencyURLTests(unittest.TestCase):
    def run_check(self, root: Path) -> tuple[int, str]:
        old_argv = sys.argv
        sys.argv = [
            "check_lake_dependency_urls.py",
            "--project-root",
            str(root),
        ]
        try:
            stdout = io.StringIO()
            with redirect_stdout(stdout):
                code = main()
            return code, stdout.getvalue()
        finally:
            sys.argv = old_argv

    def create_project(self, root: Path, root_url: str, child_url: str) -> None:
        write(
            root / "lakefile.lean",
            f"""import Lake
open Lake DSL

require FLT from "./FLT"
require mathlib from git "{root_url}" @ "{MATHLIB_REV}"

package Example where
""",
        )
        write_manifest(root / "lake-manifest.json", root_url)
        write(
            root / "FLT" / "lakefile.toml",
            f"""name = "FLT"

[[require]]
name = "mathlib"
git = "{child_url}"
rev = "{MATHLIB_REV}"
""",
        )
        write_manifest(root / "FLT" / "lake-manifest.json", child_url)

    def test_rejects_git_suffix_mismatch_between_root_and_path_dependency(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            self.create_project(
                root,
                "https://github.com/leanprover-community/mathlib4",
                "https://github.com/leanprover-community/mathlib4.git",
            )
            code, output = self.run_check(root)
        self.assertEqual(code, 1)
        self.assertIn("mathlib", output)
        self.assertIn("declared inconsistently", output)

    def test_accepts_matching_root_and_path_dependency_urls(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            url = "https://github.com/leanprover-community/mathlib4.git"
            self.create_project(root, url, url)
            code, output = self.run_check(root)
        self.assertEqual(code, 0)
        self.assertEqual(output, "")

    def test_rejects_manifest_mismatch(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            child_url = "https://github.com/leanprover-community/mathlib4.git"
            self.create_project(root, child_url, child_url)
            write_manifest(
                root / "lake-manifest.json",
                "https://github.com/leanprover-community/mathlib4",
            )
            code, output = self.run_check(root)
        self.assertEqual(code, 1)
        self.assertIn("Lake manifest does not match", output)

    def test_accepts_manifest_resolved_rev_when_config_omits_rev(self) -> None:
        with tempfile.TemporaryDirectory() as tmp:
            root = Path(tmp)
            url = "https://github.com/PatrickMassot/checkdecls.git"
            write(
                root / "lakefile.lean",
                f"""import Lake
open Lake DSL

require checkdecls from git "{url}"

package Example where
""",
            )
            write_manifest(root / "lake-manifest.json", url)
            code, output = self.run_check(root)
        self.assertEqual(code, 0)
        self.assertEqual(output, "")


if __name__ == "__main__":
    unittest.main()
