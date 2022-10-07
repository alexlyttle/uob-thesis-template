\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{uobthesis}[2022/10/05 UoB Thesis Class]

% Package for processing options
\RequirePackage{xkeyval}

% Load base class and pass options to it
\def\baseclass{book}

\DeclareOptionX*{%
    \PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptionsX

\LoadClass{\baseclass}

% === GEOMETRY ===

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

% === TITLE PAGE ===

\RequirePackage{graphicx}

\newcommand*{\group}[1]{\def\@group{#1}}
\newcommand*{\school}[1]{\def\@school{#1}}
\newcommand*{\college}[1]{\def\@college{#1}}
\newcommand*{\submitted}[2]{\def\@month{#1}\def\@year{#2}}

\renewcommand*{\maketitle}{%
  % Title page
  \begin{titlepage}
    \noindent

    \begin{center}
      \includegraphics[width=90mm]{uob-logo.eps}      
      
      \vfill

      \Large\MakeUppercase{\@title}

      \vspace{0.5cm}
      \normalsize
      by

      \vspace{0.5cm}
      \Large\MakeUppercase{\@author}

      \vfill
      
      \normalsize
      A thesis submitted to the University of Birmingham for the degree of

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
  \thispagestyle{empty}
  \hspace{0pt}
  \vfill
  \begin{center}
    \copyright~Copyright by \MakeUppercase{\@author},~\@year\\
    All Rights Reserved
  \end{center}
}

% === FRONTMATTER ===

\newcommand*{\abstractname}{Abstract}
\newcommand*{\thanksname}{Acknowledgements}

% === ENVIRONMENTS ===

% Dedication

\newenvironment{dedication}{%
  \thispagestyle{empty}
  \hspace{0pt}
  \vfill
}{%
  \vfill
  \hspace{0pt}
}
