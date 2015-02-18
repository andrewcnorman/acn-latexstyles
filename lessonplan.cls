\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lessonplan} [2014/09/20 v2 Lesson planning
specialist LaTeX document class]
%%To be based on article class
\LoadClass[12pt,a4paper,twoside]{article}

%%Page format
\RequirePackage[left=2cm,top=2cm,right=2cm,bottom=2cm,a4paper]{geometry}
\setlength{\parindent}{0pt}
\setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}

%%Maths stuff
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{siunitx}

%%Images
\RequirePackage{graphicx}

%%Clean UK-style date (in place of version number)
\usepackage[UKenglish]{isodate}
\cleanlookdateon% Remove ordinal day reference

%%Make each section (lesson) start on a new page
\newcommand{\lesson}[1]{\clearpage\section{#1}}
\RequirePackage{titlesec}
\titleformat{\section}
  {\normalfont\Large\bfseries}
  {Lesson \thesection:}{1em}{} % only snag is appendices are changed too!

%%Not deleting \@title so it will work in fancyhdr:
  \if@titlepage
  \renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\renewcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{\parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\fi

%%Header / Footer
\RequirePackage{fancyhdr}
\renewcommand{\sectionmark}[1]{\markleft{#1}{}}
%don't do anything on front page
\fancypagestyle{firstpage}{%
\fancyhf{} % clear all six fields
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
}
%how about the rest of the pages?
\fancypagestyle{followingpage}{%
\fancyhf{} % clear all six fields
\fancyhead[LE,RO]{\bfseries\thepage}
\fancyhead[LO]{\bfseries\nouppercase{\leftmark}}
\fancyhead[RE]{\bfseries\@title}
\renewcommand{\headrulewidth}{0.5pt}
\renewcommand{\footrulewidth}{0pt}
\addtolength{\headheight}{0.5pt}
}
\pagestyle{followingpage}
\AtBeginDocument{\thispagestyle{firstpage}}

%%Links to websites / other PDF documents
\RequirePackage{hyperref}

%%Requirements for the lab technicians
\RequirePackage{multicol}
%
\newsavebox{\mybox}
\newenvironment{props}{
\begin{lrbox}{\mybox}
\begin{minipage}{\textwidth}
\subsection*{Props}
\begin{multicols}{2}
\begin{itemize}
}
{
\end{itemize}
\end{multicols}
\vspace*{0.2em}
\end{minipage}
\end{lrbox}\fbox{\usebox{\mybox}}
}

%%Suggested homework activities
\newcommand\homework[1]{%
  \fbox{\begin{minipage}{\textwidth}
\subsection*{Suggested homework}
#1
\end{minipage}}}

%%Teacher / pupil dialogue
\RequirePackage{color}
\RequirePackage{xifthen}
\RequirePackage{tikz}
\usetikzlibrary{shapes,fit,backgrounds}

\newcommand{\bubble}[6]% name, content, color, align, inner sep, width
{   \ifthenelse{\equal{r}{#4}\OR\equal{c}{#4}}{\hfill}{}
    \begin{tikzpicture}
        \node[text width=\the\textwidth*#6, below right](#1){#2};
        \begin{pgfonlayer}{background}
            \node[fit=(#1),inner sep=#5,rectangle callout,rounded corners=3pt,draw,fill=#3,overlay] {};
        \end{pgfonlayer}
    \end{tikzpicture}
    \ifthenelse{\equal{l}{#4}\OR\equal{c}{#4}}{\hfill\phantom{}\\[5mm]}{\\[5mm]}
}

\definecolor{teacher}{rgb}{0.639,0.757,0.678}
\definecolor{peer}{rgb}{1.0,1.0,0.5}
\definecolor{pupil}{rgb}{0.6,0.8,1.0}
\definecolor{wrong}{rgb}{0.839,0.051,0.071}%214,13,18
\definecolor{wrong-pale}{rgb}{0.949,0.906,0.906}%242, 231, 231
\definecolor{right}{rgb}{0.267,0.635,0.063}%68, 162, 16
\definecolor{right-pale}{rgb}{0.913,0.964,0.901}%233, 246, 230

\newcommand{\teacher}[1]{\bubble{teacher}{{\bf Teacher:} #1}{teacher}{l}{3mm}{0.8}}
\newcommand{\pupil}[2]{\hfill\bubble{pupil}{{\bf #1 :} #2}{pupil}{l}{3mm}{0.8}} % name, comment
\newcommand{\wrong}[1]{\bubble{wrong}{{\bf\textcolor{wrong}{Wrong track:}}\\ #1}{wrong-pale}{l}{3mm}{0.6}}
\newcommand{\rightlines}[1]{\hfill\bubble{right}{{\bf\textcolor{right}{Right Lines:}}\\ #1}{right-pale}{l}{3mm}{0.6}} % name, comment
