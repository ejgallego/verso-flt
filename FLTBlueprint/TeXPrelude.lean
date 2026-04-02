import Verso
import VersoManual
import VersoBlueprint

open Informal

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
\DeclareMathOperator{\Gal}{Gal}
\DeclareMathOperator{\avoid}{avoid}
\DeclareMathOperator{\Aut}{Aut}
\DeclareMathOperator{\GL}{GL}
\DeclareMathOperator{\PGL}{PGL}
\DeclareMathOperator{\PSL}{PSL}
\DeclareMathOperator{\SL}{SL}
\DeclareMathOperator{\Spec}{Spec}
\DeclareMathOperator{\sep}{sep}
\DeclareMathOperator{\ab}{ab}
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\Hom}{Hom}
\DeclareMathOperator{\Frob}{Frob}"#
