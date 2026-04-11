#!/usr/bin/env python3
from __future__ import annotations

from pathlib import Path
import tempfile
import textwrap

from check_active_chapter_alignment import audit_project


def write_file(path: Path, body: str) -> None:
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(textwrap.dedent(body).lstrip(), encoding="utf-8")


def test_alignment_passes_for_matching_project() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        root = Path(tmpdir)
        write_file(
            root / "verso-harness.toml",
            """
            package_name = "DemoBlueprint"
            blueprint_main = "DemoBlueprintMain"
            formalization_path = "FLT"
            chapter_root = "DemoBlueprint/Chapters"
            tex_source_glob = "FLT/blueprint/src/chapter/*.tex"

            [lt]
            default_chapters = [
              "DemoBlueprint/Chapters/Introduction.lean",
              "DemoBlueprint/Chapters/HardlyRamified.lean",
            ]
            """,
        )
        write_file(
            root / "FLT" / "blueprint" / "src" / "content.tex",
            """
            \\input{chapter/ch01introduction}
            \\input{chapter/ch03freyreduction}
            """,
        )
        write_file(
            root / "DemoBlueprint.lean",
            """
            import DemoBlueprint.Chapters.Introduction
            import DemoBlueprint.Chapters.HardlyRamified

            #doc (Manual) "Demo" =>

            {include 0 DemoBlueprint.Chapters.Introduction}
            {include 0 DemoBlueprint.Chapters.HardlyRamified}
            """,
        )
        assert audit_project(root) == []


def test_alignment_reports_extra_manual_chapter() -> None:
    with tempfile.TemporaryDirectory() as tmpdir:
        root = Path(tmpdir)
        write_file(
            root / "verso-harness.toml",
            """
            package_name = "DemoBlueprint"
            blueprint_main = "DemoBlueprintMain"
            formalization_path = "FLT"
            chapter_root = "DemoBlueprint/Chapters"
            tex_source_glob = "FLT/blueprint/src/chapter/*.tex"

            [lt]
            default_chapters = [
              "DemoBlueprint/Chapters/Introduction.lean",
              "DemoBlueprint/Chapters/HardlyRamified.lean",
              "DemoBlueprint/Chapters/ExtraChapter.lean",
            ]

            [harness]
            non_port_chapters = ["DemoBlueprint/Chapters/LegacyStatus.lean"]
            """,
        )
        write_file(
            root / "FLT" / "blueprint" / "src" / "content.tex",
            """
            \\input{chapter/ch01introduction}
            \\input{chapter/ch03freyreduction}
            """,
        )
        write_file(
            root / "DemoBlueprint.lean",
            """
            import DemoBlueprint.Chapters.Introduction
            import DemoBlueprint.Chapters.HardlyRamified
            import DemoBlueprint.Chapters.ExtraChapter

            #doc (Manual) "Demo" =>

            {include 0 DemoBlueprint.Chapters.Introduction}
            {include 0 DemoBlueprint.Chapters.HardlyRamified}
            {include 0 DemoBlueprint.Chapters.ExtraChapter}
            """,
        )
        errors = audit_project(root)
        assert any("harness.non_port_chapters must be empty" in error for error in errors)
        assert any("chapter imports do not match active TeX TOC" in error for error in errors)
        assert any("chapter includes do not match active TeX TOC" in error for error in errors)
        assert any("lt.default_chapters does not match active TeX TOC" in error for error in errors)


if __name__ == "__main__":
    test_alignment_passes_for_matching_project()
    test_alignment_reports_extra_manual_chapter()
    print("check_active_chapter_alignment tests passed")
