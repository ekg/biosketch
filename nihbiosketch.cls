%% nihbiosketch.cls
%% Copyright 2015 Paul M. Magwene
%% Adapted by Pjotr Prins (2020)
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 008/05/04 or later.
%
% This work has the LPPL maintenance status `maintained'.
%
% The Current Maintainer of this work is Paul M. Magwene
%
% This work consists of the files nihbiosketch.cls


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nihbiosketch}[2020/06/14 NIH Biosketch Class]

%------------------------------------------------------------------------------

\ProcessOptions\relax
\LoadClass[11pt,letterpaper]{article}

%------------------------------------------------------------------------------
% Packages

\RequirePackage{etoolbox}
\RequirePackage[letterpaper]{geometry}
% \RequirePackage{ifxetex, ifluatex}   % requires fontspec, so either XeTeX or LuaTeX
% \RequirePackage{fontspec}
% \setmainfont[Ligatures=TeX]{Arial}

\RequirePackage{microtype}

\RequirePackage{tabu}
\RequirePackage{ifthen}
\RequirePackage[normalem]{ulem}

\RequirePackage{soul}
\RequirePackage{tabularx}
\RequirePackage{enumitem}
\setlist[enumerate,2]{label=\alph*.,itemsep=0pt,parsep=1pt,partopsep=1pt}
% \setlist[enumerate,2]{label=\arabic*.,itemsep=0pt,parsep=1pt,partopsep=1pt}

\RequirePackage{titlesec}
\renewcommand{\thesection}{\Alph{section}.}
\titleformat{\section}[hang]{\normalfont\bfseries}{\thesection}{0.5em}{}  % section style
\titleformat{\subsection}[hang]{\normalfont\bfseries}{\thesubsection}{1em}{}  % subsection style
\titleformat{\subsubsection}[hang]{\itshape}{\thesubsubsection}{0.5em}{}  % subsubsection style

\titlespacing{\section}{0pt}{2ex}{1ex}
\titlespacing{\subsection}{0pt}{1.25ex}{0.5ex}
\titlespacing{\subsubsection}{0pt}{1.25ex}{0.5ex}

\PassOptionsToPackage{urlcolor=blue,colorlinks=true,breaklinks=true}{hyperref}
\RequirePackage{hyperref}
\urlstyle{same}

%------------------------------------------------------------------------------
% New commands and environments

\newcommand{\@name}{}
\newcommand{\@eracommons}{}
\newcommand{\@position}{}

\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\eracommons}[1]{\renewcommand{\@eracommons}{#1}}
\newcommand{\position}[1]{\renewcommand{\@position}{#1}}

\renewcommand{\baselinestretch}{0.90}

\newcommand{\pgline}{\noindent\makebox[\linewidth]{\rule{\textwidth}{0.25pt}}\newline}
\newcommand{\pglinespace}{\newline}

\newcommand{\piinfo}{
  {\hfill \scriptsize OMB No. 0925-0001 and 0925-0002 (Rev. 10/2021 Approved Through 09/30/2024)} \\
\pgline
{\centering
\textbf{BIOGRAPHICAL SKETCH}\\
{\footnotesize
Provide the following information for the Senior/key personnel and other significant contributors.\\
Follow this format for each person.  \textbf{DO NOT EXCEED FIVE PAGES}.\\}}
\pgline
NAME: \@name\\
\pgline
% \pglinespace
eRA COMMONS USER NAME (credential, e.g., agency login): \@eracommons\\
\pgline
% \pglinespace
POSITION TITLE: \@position\\
\pgline
% \pglinespace
EDUCATION/TRAINING (\textit{Begin with baccalaureate or other initial professional education, such as nursing, include postdoctoral training and residency training if applicable. Add/delete rows as necessary.})}

\newenvironment{myindent}
               {\setlength\parindent{24pt}
               \hangindent=24pt}
               {\setlength\parindent{0pt}}



\newcommand{\grantinfo}[6]
% {\begin{tabular}{@{}lll@{}}
  {
    \begin{minipage}{\textwidth}
      \setlength{\parindent}{21pt}
      \hangindent=26pt
      \begin{tabularx}{\textwidth}{p{7cm}XX}
        {\textbf{#1}} & {#2 (#3)} & {#4} \\
      \end{tabularx}
      \begin{minipage}{0.9\textwidth}
        \noindent
        \underline{\emph{#5}}

        \vspace{2pt}
        \noindent {#6}

      \end{minipage}
    \end{minipage}
    \vspace{0.2in}
  }


% \newcommand{\grantinfoxx}[6]
% {\begin{tabular}{\textwidth}{XXX}
% {\bf{#1}} & {#2} & {#3} \\
% \end{tabular}
% \newline{\hspace*{5pt}\emph{#4}}\newline{\hspace*{5pt}{#5}}\newline{\hspace*{5pt}Role: #6}\newline}



\newenvironment{education}
{%
\bgroup\centering
\tabulinesep=1.5mm
\begin{tabu} to \textwidth {X[3.73,l,m]|X[1,c,m]|X[1,c,m]|X[1.8,l,m]}
\hline
\rowfont[c]{}               % for the header only we want all the text centered
INSTITUTION AND LOCATION &
% DEGREE \newline (\textit{if applicable}) &
DEGREE &
% Completion Date MM/YYYY &
Completion Date
&
FIELD OF STUDY\\
\hline}
{\hline\end{tabu}\egroup}

\newenvironment{datetbl}
{\tabulinesep=0mm
\begin{tabu} to 7.5in{X[1,l]X[6.5,l,p]}}
{\end{tabu}}

\newenvironment{datetbl3}
{\tabulinesep=0mm
\begin{tabu} to 7.5in{X[1,l]X[1.7,l]X[4.8,l,p]}}
{\end{tabu}}

\newenvironment{statement}
               {\setlength\parindent{0pt}
                 \setlength{\parskip}{0.5em}
               }
               {\setlength\parindent{0pt}}


%------------------------------------------------------------------------------
% setup document geometry

% turn off page numbering
\pagenumbering{gobble}

% no paragraph indentation
\setlength\parindent{0pt}

\geometry{left=0.5in,right=0.5in,top=0.5in,bottom=0.5in} % this should be the last call

%------------------------------------------------------------------------------

\AfterEndPreamble{\piinfo}
