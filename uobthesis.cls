% uobthesis.cls
%
% Copyright 2022 Alexander Lyttle.
%
% This work may be distributed and/or modified under the conditions of the
% LaTeX Project Public License (LPPL) version 1.3 or later.
%
% The latest version of this license is in
% https://www.latex-project.org/lppl.txt and version 1.3 or later is part of
% all distributions of LaTeX version 2005/12/01 or later.
%
%
%% DEFINITION AND OPTIONS
%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uobthesis}[2022/10/12 v1.0 UoB thesis class]

% Package for processing options
\RequirePackage{xkeyval}

% Load base class and pass options to it
\def\baseclass{book}

\DeclareOptionX*{%
    \PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptionsX

\LoadClass{\baseclass}


%% GEOMETRY
%
% Margins follow University guidelines
% https://intranet.birmingham.ac.uk/as/libraryservices/library/research/thesis/Presenting-your-thesis.aspx
\PassOptionsToPackage{%
  top=3cm,
  bottom=3cm,
  inner=3cm,
  outer=2cm,
  head=15pt
  }{geometry}
\RequirePackage{geometry}


%% TITLE PAGE
%
\RequirePackage{graphicx}

\newcommand*{\logo}[1]{\def\@logo{#1}}
\newcommand*{\group}[1]{\def\@group{#1}}
\newcommand*{\school}[1]{\def\@school{#1}}
\newcommand*{\college}[1]{\def\@college{#1}}
\newcommand*{\submitted}[2]{\def\@month{#1}\def\@year{#2}}

\newcommand{\license}[1]{\def\@license{#1}}
\license{All Rights Reserved.}  % Default licesnse is "All Rights Reserved."

\renewcommand*{\maketitle}{%
  % Title page
  \begin{titlepage}
    % \noindent
    \begin{center}
      \ifdefined\@logo%
        % Logo size in line with university guidelines
        \includegraphics[width=90mm]{\@logo}
      \else%
        \hspace{0pt}
      \fi

      \vfill\LARGE%
      \MakeUppercase{\@title}%

      \vspace{0.5cm}\normalsize%
      by\LARGE% FIX: Immediately switch back to large before new line 

      \vspace{0.5cm}%
      \MakeUppercase{\@author}%

      \vfill\normalsize%
      A thesis submitted to the University of Birmingham for the degree of\\
      \MakeUppercase{Doctor of Philosophy}
    \end{center}

    \vspace{1.0cm}

    \begin{flushright}
      \@group\\
      School of \@school\\
      College of \@college\\
      University of Birmingham\\
      \@month~\@year
    \end{flushright}
  \end{titlepage}
  
  % Copyright information
  \thispagestyle{empty}{%
  \setlength{\parindent}{0pt}  % No paragraph indentation
  \singlespacing
  \hspace{0pt}
  \vfill
  \copyright~Copyright by \MakeUppercase{\@author},~\@year

  \@license}
}


%% FRONTMATTER
%
\newcommand{\abstract}[1]{\def\@abstract{#1}}
\newcommand{\dedication}[1]{\def\@dedication{#1}}
\newcommand{\acknowledgements}[1]{\def\@acknowledgements{#1}}

\newcommand*{\abstractname}{Abstract}
\newcommand*{\thanksname}{Acknowledgements}

\newcommand*{\makefrontmatter}{%
  % Abstract
  \chapter*{\abstractname}
  \addcontentsline{toc}{chapter}{\abstractname}
  \@abstract
  \cleardoublepage

  % Dedication
  \ifdefined\@dedication
    \thispagestyle{empty}
    \hspace{0pt}\vfill%
    \@dedication
    \vfill\hspace{0pt}
    \cleardoublepage
  \fi

  % Acknowledgements
  \chapter*{\thanksname}
  \addcontentsline{toc}{chapter}{\thanksname}
  \@acknowledgements
}
