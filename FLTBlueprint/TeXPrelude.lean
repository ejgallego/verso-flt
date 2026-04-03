import Verso
import VersoManual
import VersoBlueprint

open Informal

/-
The old blueprint prelude is the source vocabulary, but the Verso/KaTeX harness
cannot ingest it literally.

Two KaTeX divergence classes matter here:

1. `\DeclareMathOperator` is not part of KaTeX's supported command set, so the
   old operator declarations have to be re-expressed with ordinary macros that
   expand to `\operatorname{...}`.
2. KaTeX already ships a few short blackboard-bold names such as `\N`, `\Z`,
   `\R`, and `\Reals`. Replaying the old `\newcommand` declarations would fail
   on those built-ins even though neighboring names such as `\Q` still need to
   be supplied locally.

`\providecommand` is the stable compromise: it preserves the TeX-side names,
fills the names KaTeX leaves undefined, and avoids clobbering KaTeX's own
built-in macros.
-/
tex_prelude
  r#"\providecommand{\Z}{\mathbb{Z}}
\providecommand{\N}{\mathbb{N}}
\providecommand{\A}{\mathbb{A}}
\providecommand{\Q}{\mathbb{Q}}
\providecommand{\R}{\mathbb{R}}
\providecommand{\F}{\mathbb{F}}
\providecommand{\Qp}{\mathbb{Q}_p}
\providecommand{\Ql}{\mathbb{Q}_\ell}
\providecommand{\Qbar}{\overline{\Q}}
\providecommand{\Qpbar}{\overline{\Q}_p}
\providecommand{\Qlbar}{\overline{\Q}_\ell}
\providecommand{\bbC}{\mathbb{C}}
\providecommand{\GQ}{\Gal(\Qbar/\Q)}
\providecommand{\GQp}{\Gal(\Qpbar/\Qp)}
\providecommand{\GQl}{\Gal(\Qlbar/\Ql)}
\providecommand{\m}{\mathfrak{m}}
\providecommand{\GK}{\Gal(K^{\sep}/K)}
\providecommand{\GN}{\Gal(\overline{N}/N)}
\providecommand{\Kbar}{\overline{K}}
\providecommand{\Qhat}{\widehat{\Q}}
\providecommand{\calO}{\mathcal{O}}
\providecommand{\calOhat}{\widehat{\calO}}
\providecommand{\bbH}{\mathbb{H}}
\providecommand{\p}{\mathfrak{p}}
\providecommand{\rhobar}{\overline{\rho}}
\providecommand{\Zhat}{\widehat{\Z}}
% KaTeX does not implement \DeclareMathOperator, so define the concrete
% operator names in terms of \operatorname instead.
\providecommand{\Gal}{\operatorname{Gal}}
\providecommand{\avoid}{\operatorname{avoid}}
\providecommand{\Aut}{\operatorname{Aut}}
\providecommand{\GL}{\operatorname{GL}}
\providecommand{\PGL}{\operatorname{PGL}}
\providecommand{\PSL}{\operatorname{PSL}}
\providecommand{\SL}{\operatorname{SL}}
\providecommand{\Spec}{\operatorname{Spec}}
\providecommand{\sep}{\operatorname{sep}}
\providecommand{\ab}{\operatorname{ab}}
\providecommand{\tr}{\operatorname{tr}}
\providecommand{\Hom}{\operatorname{Hom}}
\providecommand{\Frob}{\operatorname{Frob}}"#
