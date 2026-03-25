import FLTBlueprint.Citations
import Verso
import VersoManual
import VersoBlueprint

open Verso.Genre
open Verso.Genre.Manual
open Informal

#doc (Manual) "Stating The Modularity Lifting Theorems" =>

:::group "modularity_lifting_program"
This chapter corresponds to the TeX work-in-progress chapter devoted to stating
the minimal and non-minimal modularity lifting theorems precisely.
:::

The old TeX chapter opens with a practical claim: a nice and accessible
medium-term goal for the FLT project is simply to state the modularity lifting
theorems that the project wants to formalize. There are really two theorems in
play. One is the minimal case, proved by a Taylor--Wiles-style argument. The
other is deduced from it using later refinements and reduction steps.

That framing should remain visible in the Verso port. The point of the chapter
is not to prove the modularity lifting theorem, and not even yet to present a
finished final statement, but to isolate what has to be stated before one can
even begin to formalize the `R = T` story seriously.

```tex "chapter-opening"
\chapter{Stating the modularity lifting theorems}

I think that a nice and accessible goal (which will maybe take a month or two) would be to
\emph{state} the modularity lifting theorems which we'll be formalising. There are in fact two;
one (the "minimal case") is proved using an extension of the original Taylor--Wiles techniques, and
the other is deduced from it using various more modern tricks which were developed later. This
chapter (currently work in progress) will contain a detailed discussion of all the things
involved in the statement of the theorem.
```

# Automorphic forms and analysis

:::definition "automorphic_form_general_notion" (parent := "modularity_lifting_program")
Automorphic forms are introduced here in the general connected reductive setting
over a global field, with the quaternionic and $`\mathrm{GL}_n`$ cases treated
as specializations. The appendix placeholder for this background is
{uses "connected_reductive_group_placeholder"}[].
:::

:::proof "automorphic_form_general_notion"
The TeX chapter spends time explaining why automorphic forms sometimes look very
analytic and sometimes look almost purely combinatorial. Classical modular forms
for `GL₂/ℚ` involve holomorphic functions because the associated symmetric space
is the upper half-plane. By contrast, Dirichlet characters for `GL₁/ℚ` are just
finite-level algebraic data because the symmetric space is zero-dimensional.

The quaternionic setting relevant for FLT behaves like the second kind of
example. For totally definite quaternion algebras over totally real fields, the
associated symmetric space is again zero-dimensional, so the definition of an
automorphic form can be phrased without the usual analytic baggage. That is why
the later quaternionic chapters have such an algebraic flavor.

```tex "automorphic-forms-and-analysis"
\section{Automorphic forms and analysis}

Modular forms were historically the first nontrivial examples of automorphic forms, but by the
1950s or so it was realised that they were special cases of a very general notion of an automorphic
form, as were Dirichlet characters! Modular forms are holomorphic automorphic forms for the group
$\GL_2/\Q$, and Dirichlet characters are automorphic forms for the group $\GL_1/\Q$. It's possible
to make sense of the notion of an automorphic form for the group $G/k$. Here $k$ is
a ``global field'' -- that is, a field which is either a finite extension of $\Q$ (a number field)
or a finite extension of $(\Z/p\Z)(T)$ (a function field), and $G$ is a connected reductive
group variety over $k$.

The reason that the definition of a modular form involves some analysis (they are holomorphic
functions) is that if you quotient out the group $\GL_2(\R)$ by its centre and the maximal compact
subgroup $O_2(\R)$, you get something which can be naturally identified with the upper half plane, a
symmetric space with lots of interesting differential operators associated to it (for example a
Casimir operator). However if you do the same thing with $\GL_1(\R)$ then you get a one point set,
which is why a Dirichlet character is just a combinatorial object; it's a group homomorphism
$(\Z/N\Z)^\times\to\bbC^\times$ where $N$ is some positive integer. It turns out that there are many
other connected reductive groups where the associated symmetric space is 0-dimensional, and in these
cases the definition of an automorphic form is again combinatorial. An example would be the group
variety associated to the units of a totally definite quaternion algebra over a totally real field.
In this case, the analogue of $\GL_2(\R)$ would be the units $\bbH^\times$ in the Hamilton
quaternions, a maximal compact subgroup would be the quaternions of norm 1 (homeomorphic to the
3-sphere $S^3$) and quotienting out $\bbH^\times$ by its centre $\R^\times$ and $S^3$ again just
gives you 1 point.
```
:::

:::theorem "quaternionic_automorphic_forms_are_algebraic" (parent := "modularity_lifting_program")
For the totally definite quaternionic groups relevant to FLT, automorphic forms
behave like algebraic level structures rather than holomorphic functions on a
positive-dimensional symmetric space.
This is why the modularity-lifting chapter can point naturally toward
{uses "weight_two_quaternionic_forms"}[] instead of classical modular forms.
:::

:::proof "quaternionic_automorphic_forms_are_algebraic"
The TeX chapter makes this contrast with classical modular forms explicit.
For `GL₂/ℚ`, quotienting `GL₂(ℝ)` by its center and maximal compact subgroup
produces the upper half-plane, so differential operators and holomorphicity are
built into the theory. For the quaternionic groups used in the FLT strategy,
the analogous real quotient is zero-dimensional. So the automorphic theory is
still deep, but its definitions are far more algebraic and much closer to the
finite-level structures built later in {uses "weight_two_quaternionic_forms_of_level"}[]
and {uses "quaternionic_modular_form_example"}[].
:::

# Central simple algebras

:::definition "central_simple_algebra_background" (parent := "modularity_lifting_program")
Central simple algebras supply the algebraic background for the quaternionic
groups used in the modularity lifting theorem, and feed directly into
{uses "totally_definite_quaternion_algebra_setup"}[].
:::

In the old TeX exposition, this section is meant as a warm-up before talking
about quaternion algebras. Fields are always commutative here, but algebras over
them are not assumed commutative.

The TeX chapter also records an equivalent characterization of simplicity that
is often better for formalization: every surjective ring homomorphism out of a
central simple algebra is either an isomorphism or the zero map.

```tex "central-simple-algebras"
\section{Central simple algebras}

Convention: in this section, fields are commutative, but algebras over a field may not be.

Recall that a \emph{central simple algebra} over a field $K$ is a
nonzero $K$-algebra $D$ such that $K$ is the
centre of $D$ and that $D$ has no nontrivial two-sided ideals.

Another way of saying that $D$ has no nontrivial two-sided ideals: every surjective ring
homomorphism $D\twoheadrightarrow A$ to any ring~$A$ is either an isomorphism, or the zero map
to the zero ring. Note that this latter condition
has nothing to do with~$K$.
```

:::definition "central_simple_algebra_definition" (parent := "modularity_lifting_program")
A central simple algebra over a field `K` is a nonzero `K`-algebra whose center
is exactly `K` and which has no nontrivial two-sided ideals.
:::

:::theorem "matrix_algebra_is_central_simple" (parent := "modularity_lifting_program")
Matrix algebras are the basic examples of central simple algebras, and their
base change behavior is the prototype for the quaternionic constructions used
later. The theorem instantiates {uses "central_simple_algebra_definition"}[].
:::

:::proof "matrix_algebra_is_central_simple"
The TeX chapter sketches the usual argument for the notion fixed in
{uses "central_simple_algebra_definition"}[]: scalar matrices show that `K` is in
the center, commutation with matrix units forces every central element to be
scalar, and any nonzero two-sided ideal contains a matrix unit and therefore the
identity. So the whole matrix algebra is central simple.

```tex "matrix-ring-is-central-simple-proof"
\begin{lemma}
    \label{MatrixRing.isCentralSimple}
    %\lean{MatrixRing.isCentralSimple}
    %\uses{IsCentralSimple}
    \discussion{47}
    \leanok
    If $n\geq1$ then the $n\times n$ matrices $M_n(K)$ are a central simple algebra over~$K$.
\end{lemma}
\begin{proof}\leanok
We prove more generally that matrices with coefficients in~$K$ and indexed by an arbitrary nonempty
finite type are a central simple algebra over~$K$.

They are clearly an algebra over $K$, with $K$ embedded via scalar matrices as usual
(the injectivity of the map from~$K$ comes from nonemptiness of the finite index type).
The centre clearly contains $K$; to show that it
equals~$K$, we argue as follows. Let $e(i,j)$ be the matrix with a 1 in the $i$th row and $j$th
column, and zeros everywhere else. An element $Z=(Z_{s,t})_{s,t}$ of the centre commutes with
all matrices $e(i,j)` for $i\not=j$ and these equations immediately imply that $Z_{i,j}=0$ if
$i\not=j$ and that $Z_{i,i}=Z_{j,j}$.

It suffices to prove that any nonzero two-sided ideal~$I$ is all of $M_n(K)$. So say $0\not=M\in I$
and let's fix $(i,j)$ such that $M_{i,j}\not=0$. One easily checks that
$M_{i,j} \mathrm{id} = \sum_{k}e(k,i)\times M\times e(j,k)\in I$ (where $\mathrm{id} \in M_n(K)$
is the identity matrix). Therefore, $\mathrm{id} \in I$, so $I = M_n(K)$.

The definition also requires that the ring be non-zero, but this follows from the index type being
nonempty.
\end{proof}
```
:::

:::theorem "central_simple_algebra_base_change" (parent := "modularity_lifting_program")
If `D` is central simple over `K` and `L/K` is a field extension, then
`L ⊗_K D` is central simple over `L`. This is the stability statement for
{uses "central_simple_algebra_definition"}[] under scalar extension.
:::

:::proof "central_simple_algebra_base_change"
The TeX chapter cites standard algebra references for this fact and then uses
it to motivate why quaternion algebras remain quaternion algebras after
extension of scalars, all in the setting fixed by
{uses "central_simple_algebra_definition"}[].

```tex "central-simple-algebra-base-change-proof"
\begin{lemma}
    \label{IsCentralSimple.baseChange} % no Lean yet because Lean didn't seem to know L \otimes_K D was a ring
    %\uses{IsCentralSimple}
    If $D$ is a central simple algebra over~$K$ and $L/K$ is a field extension, then $L\otimes_KD$
    is a central simple algebra over~$L$.
\end{lemma}
\begin{proof}
    This is not too hard: it's lemma b of section 12.4 in Peirce's "Associative algebras".
\end{proof}
```
:::

# The Theorem-Statement Goal

The TeX chapter stops here in a deliberately unfinished state. After the
automorphic discussion and the central-simple-algebra warm-up, it records that
the next basic items to define are trace and norm before one can continue
toward the actual theorem statement.

The current Verso port goes one step further by making the intended theorem
interfaces explicit, but these nodes should still be read as chapter-goal
markers for a work in progress rather than as fully stabilized final theorem
statements.

:::theorem "minimal_modularity_lifting_statement" (parent := "modularity_lifting_program")
One target of the full port is a clean Lean statement of the minimal
modularity-lifting theorem, built on {uses "automorphic_form_general_notion"}[]
and {uses "central_simple_algebra_background"}[].
:::

:::proof "minimal_modularity_lifting_statement"
The old TeX chapter is explicit that “stating the theorem” is already a serious
goal. The minimal theorem is not a one-line modularity slogan: it depends on a
precise automorphic notion, a definite quaternionic setting, and a deformation
problem with controlled local conditions like the `S`-good package recorded in
{uses "s_good_lift_condition"}[] and {uses "s_good_deformation_problem"}[].

The strategy chapter already explains why this theorem matters. Potential
modularity uses an auxiliary modular object to land inside the hypotheses of a
lifting theorem, and the minimal case is the place where the Taylor--Wiles
patching argument is expected to live.
:::

:::theorem "reduction_to_minimal_case" (parent := "modularity_lifting_program")
The non-minimal modularity-lifting theorem should be reduced to the minimal
case by Skinner--Wiles-style arguments together with cyclic base change and
control of the local level structure.
:::

:::proof "reduction_to_minimal_case"
The TeX proof sketch says exactly this. One first peels away the excess local
level until the deformation problem is minimal, and only then runs the
Taylor--Wiles/Kisin machine. In the quaternionic setting, that reduction phase
is not purely local: it also needs global input such as cyclic base change and
the characterization of which automorphic representations arise by base change.

So this node records a real logical interface, not just a storytelling choice:
the non-minimal theorem is expected to factor through the minimal one rather
than being proved independently from scratch.
:::

:::theorem "nonminimal_modularity_lifting_statement" (parent := "modularity_lifting_program")
The non-minimal theorem is expected to be derived from the minimal case by the
additional modern arguments highlighted in the old blueprint.
The reduction interface is recorded in {uses "reduction_to_minimal_case"}[].
The overview chapter points back to this node through {uses "modularity_lifting_theorem"}[].
:::

:::proof "nonminimal_modularity_lifting_statement"
The TeX chapter identifies the literature only approximately, but it does point
to near-references for the kind of theorem the project wants:
{Informal.citep taylorMeroCont}[] and {Informal.citep tobyModularity}[].
The exact FLT statement is not copied verbatim from either source; rather, it
is the theorem that should emerge after combining the minimal statement with the
reduction mechanism recorded in {uses "reduction_to_minimal_case"}[].

That is why this chapter stays focused on interfaces. The proof architecture is
already visible, even before every surrounding automorphic and local-theory
definition has been pushed all the way down into Lean.

The TeX draft also mentions a more informal modern reference for this proof
architecture, namely Richard Taylor's 2018 Stanford course notes. The point of
that remark is not bibliographic completeness, but that the theorem was already
regarded as standard among experts even if the exact statement used here was
not copied from a single published source.
:::

The TeX draft ends with a forward pointer rather than a finished theorem
interface: next come trace and norm. So even after this fidelity pass, this
chapter should still be regarded as a frontier chapter whose role is to keep
the statement-level scaffolding visible while the surrounding infrastructure is
filled in.

```tex "chapter-forward-pointer"
Next: define trace and norm.
```
