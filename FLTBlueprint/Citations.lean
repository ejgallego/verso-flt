import VersoManual.Bibliography
import VersoBlueprint.Cite

open Verso.Genre.Manual
open Verso.Genre.Manual.Bibliography

@[bib "moret-bailly"]
def moretBailly1990 : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Groupes de Picard et problèmes de Skolem. I, II"
  authors := #[inlines!"Laurent Moret-Bailly"]
  journal := inlines!"Annales scientifiques de l'École Normale Supérieure"
  year := 1989
  month := none
  volume := inlines!"22"
  number := inlines!"2"
  pages := some (161, 179)
  url := some "http://www.numdam.org/item?id=ASENS_1989_4_22_2_161_0"
}

@[bib "serreconj"]
def serreModularityConjecture : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Sur les représentations modulaires de degré 2 de GQ"
  authors := #[inlines!"Jean-Pierre Serre"]
  journal := inlines!"Duke Mathematical Journal"
  year := 1987
  month := none
  volume := inlines!"54"
  number := inlines!"1"
  pages := some (179, 230)
  url := some "https://doi.org/10.1215/S0012-7094-87-05413-5"
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

@[bib "kwII"]
def khareWintenbergerII : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Serre's modularity conjecture. II"
  authors := #[inlines!"Chandrashekhar Khare", inlines!"Jean-Pierre Wintenberger"]
  journal := inlines!"Inventiones Mathematicae"
  year := 2009
  month := none
  volume := inlines!"178"
  number := inlines!"3"
  pages := some (505, 586)
  url := some "https://doi.org/10.1007/s00222-009-0206-6"
}

@[bib "silverman1"]
def silvermanArithmeticEllipticCurves : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"The arithmetic of elliptic curves"
  authors := #[inlines!"Joseph H. Silverman"]
  journal := inlines!"Graduate Texts in Mathematics"
  year := 2009
  month := none
  volume := inlines!"106"
  number := inlines!"2"
  url := some "https://doi.org/10.1007/978-0-387-09494-6"
}

@[bib "taylor-mero-cont"]
def taylorMeroCont : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"On the meromorphic continuation of degree two L-functions"
  authors := #[inlines!"Richard Taylor"]
  journal := inlines!"Documenta Mathematica"
  year := 2006
  month := none
  volume := inlines!"11"
  number := inlines!"1"
  pages := some (729, 779)
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

@[bib "blggt"]
def blggtPotentialAutomorphy : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Potential automorphy and change of weight"
  authors := #[inlines!"Thomas Barnet-Lamb", inlines!"Toby Gee", inlines!"David Geraghty", inlines!"Richard Taylor"]
  journal := inlines!"Annals of Mathematics"
  year := 2014
  month := none
  volume := inlines!"179"
  number := inlines!"2"
  pages := some (501, 609)
  url := some "https://doi.org/10.4007/annals.2014.179.2.3"
}

@[bib "poitou_odlyzko_bounds"]
def poitouOdlyzkoBounds : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Sur les petits discriminants"
  authors := #[inlines!"Georges Poitou"]
  journal := inlines!"Séminaire Delange-Pisot-Poitou"
  year := 1977
  month := none
  volume := inlines!"18"
  number := inlines!"1"
}

@[bib "mazur-torsion"]
def mazurTorsion : Verso.Genre.Manual.Bibliography.Citable := .article {
  title := inlines!"Modular curves and the Eisenstein ideal"
  authors := #[inlines!"Barry Mazur"]
  journal := inlines!"Publications Mathématiques de l'IHÉS"
  year := 1977
  month := none
  volume := inlines!"47"
  number := inlines!"1"
  pages := some (33, 186)
  url := some "http://www.numdam.org/item?id=PMIHES_1977__47__33_0"
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
