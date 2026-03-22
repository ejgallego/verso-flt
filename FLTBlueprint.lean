import Verso
import VersoManual
import VersoBlueprint
import VersoBlueprint.Commands.Graph
import VersoBlueprint.Commands.Summary
import FLTBlueprint.Chapters.Introduction
import FLTBlueprint.Chapters.Reductions
import FLTBlueprint.Chapters.HardlyRamified
import FLTBlueprint.Chapters.HistoricalInputs
import FLTBlueprint.Chapters.MiniProjects

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Fermat's Last Theorem Blueprint" =>

This repository is the Verso blueprint integration layer for the FLT project.
It keeps the blueprint code at the repository root while treating `FLT/` as the
upstream formalization checkout.

{include 0 FLTBlueprint.Chapters.Introduction}
{include 0 FLTBlueprint.Chapters.Reductions}
{include 0 FLTBlueprint.Chapters.HardlyRamified}
{include 0 FLTBlueprint.Chapters.HistoricalInputs}
{include 0 FLTBlueprint.Chapters.MiniProjects}

{blueprint_graph}
{blueprint_summary}
