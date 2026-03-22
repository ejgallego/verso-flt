import Verso
import VersoManual
import VersoBlueprint
import VersoBlueprint.Commands.Bibliography
import VersoBlueprint.Commands.Graph
import VersoBlueprint.Commands.Summary
import FLTBlueprint.Citations
import FLTBlueprint.TeXPrelude
import FLTBlueprint.Chapters.Introduction
import FLTBlueprint.Chapters.MiniProjects
import FLTBlueprint.Chapters.Reductions
import FLTBlueprint.Chapters.HardlyRamified
import FLTBlueprint.Chapters.Overview
import FLTBlueprint.Chapters.AutomorphicFormExample
import FLTBlueprint.Chapters.ModularityLifting
import FLTBlueprint.Chapters.LanglandsGLn
import FLTBlueprint.Chapters.FrobeniusProject
import FLTBlueprint.Chapters.AdeleProject
import FLTBlueprint.Chapters.HaarCharacters
import FLTBlueprint.Chapters.FujisakiProject
import FLTBlueprint.Chapters.QuaternionAlgebras
import FLTBlueprint.Chapters.HeckeOperators
import FLTBlueprint.Chapters.HistoricalInputs
import FLTBlueprint.Chapters.Bestiary

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Fermat's Last Theorem Blueprint" =>

This repository is the Verso blueprint integration layer for the FLT project.
It keeps the blueprint code at the repository root while treating `FLT/` as the
upstream formalization checkout.

{include 0 FLTBlueprint.Chapters.Introduction}
{include 0 FLTBlueprint.Chapters.MiniProjects}
{include 0 FLTBlueprint.Chapters.Reductions}
{include 0 FLTBlueprint.Chapters.HardlyRamified}
{include 0 FLTBlueprint.Chapters.Overview}
{include 0 FLTBlueprint.Chapters.AutomorphicFormExample}
{include 0 FLTBlueprint.Chapters.ModularityLifting}
{include 0 FLTBlueprint.Chapters.LanglandsGLn}
{include 0 FLTBlueprint.Chapters.FrobeniusProject}
{include 0 FLTBlueprint.Chapters.AdeleProject}
{include 0 FLTBlueprint.Chapters.HaarCharacters}
{include 0 FLTBlueprint.Chapters.FujisakiProject}
{include 0 FLTBlueprint.Chapters.QuaternionAlgebras}
{include 0 FLTBlueprint.Chapters.HeckeOperators}
{include 0 FLTBlueprint.Chapters.HistoricalInputs}
{include 0 FLTBlueprint.Chapters.Bestiary}

{blueprint_graph}
{blueprint_summary}
{blueprint_bibliography}
