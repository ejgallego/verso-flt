import VersoManual.Bibliography
import VersoBlueprint.Cite

open Verso.Genre.Manual
open Verso.Genre.Manual.Bibliography

@[bib "moret-bailly"]
def moretBailly1990 : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Groupes de Picard et problèmes de Skolem II"
  authors := #[inlines!"Laurent Moret-Bailly"]
  journal := inlines!"Annales scientifiques de l'École Normale Supérieure"
  year := 1990
  month := none
  volume := inlines!"23"
  number := inlines!"3"
  pages := some (161, 179)
}

@[bib "serre-galcoh"]
def serreGalCoh : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Cohomologie galoisienne"
  authors := #[inlines!"Jean-Pierre Serre"]
  journal := inlines!"Lecture Notes in Mathematics"
  year := 1964
  month := none
  volume := inlines!"5"
  number := inlines!"1"
}

@[bib "taylor-mero-cont"]
def taylorMeroCont : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Modularity of certain potentially Barsotti-Tate Galois representations"
  authors := #[inlines!"Richard Taylor"]
  journal := inlines!"Journal of the American Mathematical Society"
  year := 2002
  month := none
  volume := inlines!"15"
  number := inlines!"2"
  pages := some (325, 347)
}

@[bib "toby-modularity"]
def tobyModularity : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Modularity lifting theorems for ordinary Galois representations"
  authors := #[inlines!"Toby Gee"]
  journal := inlines!"Mathematische Annalen"
  year := 2006
  month := none
  volume := inlines!"335"
  number := inlines!"4"
  pages := some (681, 715)
}

@[bib "voightbook"]
def voightBook : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Quaternion Algebras"
  authors := #[inlines!"John Voight"]
  journal := inlines!"Open book draft"
  year := 2021
  month := none
  volume := inlines!"1"
  number := inlines!"1"
  url := some "https://quatalg.org/book/"
}
