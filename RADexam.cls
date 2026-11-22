\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{RADexam}[2016/05/16 for RAD Physics examinations (Version 8.1)]
%==============================================================================%
%                          Do NOT change this file!                            %
%                          ------------------------                            %
% If you really want to change some of settings/commands defined in this file, %
% put the changes in your LaTeX source .tex file, or put them in another .sty  %
% file of your own, which you should load after loading this file.             %
%==============================================================================%
% RADexam.cls: LaTeX class file for RAD (Physics) papers.                      %
% -----------                                                                  %
% Usage:                                                                       %
%                                                                              %
%  \documentclass[<option>]{RADexam}          % <option> can be "cmmu",        %
%                                             % "euler" or "txfonts" to load   %
%                                             % additional fonts               %
%                                                                              %
%  <put any specific LaTeX definitions here, for example to change the         %
%  default settings that are made at the bottom of this file>                  %
%                                                                              %
%  \begin{document}                                                            %
%                                                                              %
%  \ID{<text>}                                % letter label for each page, or %
%  \noID                                      % for none                       %
%                                                                              %
%  \version{<text>}                           % for each footline, or          %
%  \noversion                                 % for none                       %
%                                                                              %
%  \tripos{NATURAL SCIENCES TRIPOS <tripos>}  % can be used twice              %
%  \date{<date> \qquad <time>}                                                 %
%  \paper{<paper>}                                                             %
%                                                                              %
%  \begin{rubric}                                                              %
%  <Rubric text. Force a new line with\\                                       %
%  when required>                                                              %
%  \end{rubric}                                                                %
%                                                                              %
%  \requirements{<stationery>}{<special>}    % use \\ for newlines             %
%                                                                              %
%  \warning                                                                    %
%                                                                              %
%  \sectionfalse                             % for numbered questions          %
%  \sectiontrue                              % for section/numbered questions  %
%                                                                              %
%  \section{A\\                                                                %
%  \em <Additional text if required>}                                          %
%                                                                              %
%  \begin{questions}                                                           %
%                                                                              %
%  \question <The LaTeX source for the question>                               %
%  \insertplot{<ps-file>{<x-offset>}{<y-offset>}{<y-space>}                    %
%                                                                              %
%  \question <The LaTeX source \marks{5}>              % to indicate in right  %
%                                                      % margin the number of  %
%                                                      % marks                 %
%                                                                              %
%  \newpage                                            % to force a new page   %
%  \question \either{One part...}\or{Another part...}                          %
%                                                                              %
%  \question <Text...>                                 % for list of parts of  %
%  \begin{parts}                                       % a question (use "\ "  %
%  \part <lettered (a), (b),... question parts>        % between \question and %
%  \part <text>                                        % \begin{parts} if      %
%  \part <text>                                        % is no text            %
%  \begin{subparts}                                                            %
%  \subpart <roman numbered (i), (ii),... question sub-part>                   %
%  \subpart <text>                                                             %
%  \subpart <text>                                                             %
%  \end{subparts}                                                              %
%  \end{parts}                                                                 %
%                                                                              %
%  \section{B}                                                                 %
%                                                                              %
%  \thispagestyle{continue}                       % use this if the following  %
%  \question <The LaTeX source for the question>  % question is split at the   %
%                                                 % bottom of an odd-numbered  %
%                                                 % page                       %
%  \end{questions}                                                             %
%                                                                              %
%  \endofpaper                                    % for "END OF PAPER"         %
%                                                                              %
%  \end{document}                                                              %
%                                                                              %
%==============================================================================%
% D. A. Green --- MRAO --- 2014 October 13th (Version V7.4)                    %
% A. C. Norman --- Radley --- 2016 May 16th (Version V8.1)                     %
%==============================================================================%
% Usually load the standard article class, but if big option has been
% set, instead load extarticle with larger fonts, and change base size
% from 14pt to 15pt...
%
% Store font options for processing later...
%
\newif\ifRADnone\RADnonetrue
\newif\ifRADcmmu\RADcmmufalse
\newif\ifRADeuler\RADeulerfalse
\newif\ifRADtx\RADtxfalse
\newif\ifRADtxfonts\RADtxfontsfalse
\newif\ifRADnewtx\RADnewtxfalse
\newif\ifRADbig\RADbigfalse
%
\DeclareOption{cmmu}{\RADcmmutrue\RADnonefalse}
\DeclareOption{euler}{\RADeulertrue\RADnonefalse}
\DeclareOption{txfonts}{\RADtxfontstrue\RADnonefalse\RADtxtrue}
\DeclareOption{newtx}{\RADnewtxtrue\RADnonefalse\RADtxtrue}
\DeclareOption{big}{\RADbigtrue}
\ProcessOptions\relax
%
% for big option, load extartcile for 14pt, and make normalsize
% a bit bigger still (15.5pt)
%
\ifRADbig
  \typeout{********* big option set **************}
  \LoadClass[a4paper,14pt,twoside]{extarticle}
  \renewcommand\normalsize{%
    \@setfontsize\normalsize {15.5}{17.5}%
    \abovedisplayskip 14\p@ \@plus3\p@ \@minus7\p@
    \abovedisplayshortskip \z@ \@plus4\p@
    \belowdisplayshortskip 7\p@ \@plus4\p@ \@minus3\p@
    \belowdisplayskip \abovedisplayskip
    \let\@listi\@listI}
\else
  \LoadClass[a4paper,12pt,twoside]{article}
\fi
%
% Load amsmath, graphicx, abd babel (for British english hyphenation)...
%
\usepackage{amsmath}
\usepackage{graphicx}
\usepackage[british]{babel}
%------------------------------------------------------------------------------%
\def\maketildeletter{\catcode`\~=11\relax}
\def\maketildeactive{\catcode`\~=13\relax}
\maketildeletter
\typeout{==============RAD examinations class: V7.4 (2014-Oct-13)==============}
\typeout{====== Dave Green --- MRAO --- e-mail: D.A.Green@mrao.cam.ac.uk ======}
\typeout{======================================================================}
\typeout{>>>>>>>>>>>> see: http://www.mrao.cam.ac.uk/~dag/RADexam/ <<<<<<<<<<<<}
\typeout{>>>>>>>>>>>>>>>>> for current version and documentation <<<<<<<<<<<<<<}
\typeout{======================================================================}
\maketildeactive
%
% Page dimensions:
%
\headheight      12 pt
\headsep         12 pt
\oddsidemargin    4 mm
\evensidemargin   4 mm
\textheight     220 mm
\textwidth      150 mm
\topmargin       -5 mm
\footskip        24 pt
\leftmargin      30 pt
\parindent=30 pt
%
% Adjusted if big option set:
%
\ifRADbig
  \headheight      12 pt
  \headsep          4 pt
  \oddsidemargin  -15 mm
  \evensidemargin -15 mm
  \textheight     270 mm
  \textwidth      180 mm
  \topmargin      -20 mm
  \footskip        17 pt
\fi
%
% For alternate Physics or HSP headers for the same paper...
%
\newif\ifETP
\def\return{\par } % pressing return
\def\ETPe{e }      % single character responses
\def\ETPE{E }      %   "       "         "
\def\ETPe{p }      %   "       "         "
\def\ETPE{P }      %   "       "         "
\def\ETPh{h }      %   "       "         "
\def\ETPH{H }      %   "       "         "
\def\askifETP{
  \typeout{------------------------------------------------------}
  \ifx\undefined\option
    \message{Physics (P) or Half Subject (H) [P]?: }
    \read-1 to\option
    \typeout{------------------------------------------------------}
  \fi
  \ifx\option\return \ETPtrue \fi
  \ifx\option\ETPe \ETPtrue \fi
  \ifx\option\ETPE \ETPtrue \fi
  \ifx\option\ETPp \ETPtrue \fi
  \ifx\option\ETPP \ETPtrue \fi
  \ifx\option\ETPh \ETPfalse \fi
  \ifx\option\ETPH \ETPfalse \fi
}
%
% headers...
%
\def\tripos#1{\hspace*{30 pt}#1\newline}
\def\date#1{
  \vspace{6 pt}\hbox to \hsize{\rule{150 mm}{0.25 mm}\hss}\newline
  \hspace*{30 pt}#1\newline
  \vspace{6 pt}\hbox to \hsize{\rule{150 mm}{0.25 mm}\hss}\newline
  \vspace{6 pt}\newline
}
\def\paper#1{\hspace*{30 pt}#1\newline}
%
% rubric (as verse environment)...
%
\newenvironment{rubric}{\begin{verse}\it}{\end{verse}}
%
% requirements...
%
\def\requirements#1#2{
   \bigskip
   \leftline{\hspace*{30 pt}\parbox[t]{0.43\hsize}{STATIONERY REQUIREMENTS}
                     \quad \parbox[t]{0.43\hsize}{SPECIAL REQUIREMENTS}}
   \vskip2pt
   \leftline{\hspace*{30 pt}\parbox[t]{0.43\hsize}{#1}
                     \quad \parbox[t]{0.43\hsize}{#2}}
   \vfill
}
%
% warning...
%
\def\warning{
  \vfill
  \begin{center}
   \setlength{\fboxrule}{2pt}\setlength{\fboxsep}{2mm}\fbox{%
   \setlength{\fboxrule}{1pt}\setlength{\fboxsep}{1mm}\fbox{%
   \parbox{0.65\linewidth}{%
   \begin{center}
     \large You may not start to read the questions\\
            printed on the subsequent pages of this\\
            question paper until instructed that you\\
            may do so by the Invigilator.
   \end{center}}
   }}
   \end{center}
   \vfill
}
%
% end of paper...
%
\def\endofpaper{\begin{center}
 END OF PAPER
\end{center}}
%
% section (as verse environment)...
%
\def\section#1{\ifdim\markscount>0pt\typeout{----- marks ---> \the\markscount}
\fi\markscount=0pt\vspace{12pt}\begin{verse}{\def\\{\@centercr\hskip 4pt}%
\hskip 4pt SECTION #1}\initial{#1}\typeout{}\typeout{* SECTION:
\sectioninitial}\end{verse}}
%
\newcount\lettercount
\def\initial#1{\lettercount=0\setinitial#1\end}
\def\setinitial#1{%
  \ifnum\lettercount=0\global\def\sectioninitial{#1}\fi
  \ifx#1\end
    \let\next=\relax
  \else
    \advance\lettercount by 1
    \let\next=\setinitial
  \fi
  \next}
%
\newif\ifsection
\sectionfalse
%
% question...
%
\newcounter{questioncount}
\def\resetquestioncount{\setcounter{questioncount}{0}}
\newenvironment{questions}{\begin{list}{\vspace{24pt}\hbox to 30pt{%
  \ifsection%
    \typeout{== question: \sectioninitial\arabic{questioncount}}%
    {\sectioninitial\arabic{questioncount}\hfill}%
  \else%
    \typeout{== question: \arabic{questioncount}}%
    {\arabic{questioncount}\hfill}%
  \fi}}{\labelsep=0pt\leftmargin=0pt\parsep=0pt\listparindent=30pt
  \topsep=18pt\itemsep=18pt\labelwidth=30pt
  \usecounter{questioncount}\itemindent\labelwidth}}{
  \ifdim\markscount>0pt\typeout{----- marks ---> \the\markscount}\fi
  \end{list}\thispagestyle{last}}
\def\question{\ifdim\markscount>0pt\typeout{----- marks ---> \the\markscount}\fi
\markscount=0pt\item}
%
% either/or questions...
%
\long\def\either#1\or#2{
\ \hbox to 72 pt{\hbox to 50 pt{\bf Either\hfil}(a)\hfil}#1\par
\vspace{12pt}
\ \hbox to 72 pt{\hbox to 50 pt{\bf Or\hfil}(b)\hfil}#2\par}
%
% parts and sub-parts...
%
\newcounter{partcount}
\newenvironment{parts}{
  \begin{list}{({\rm\alph{partcount}\/})\hfill}{
          \usecounter{partcount}\leftmargin=30pt\topsep=2pt
          \labelsep=0pt\labelwidth=20pt\itemindent=20pt
          \itemsep=2pt\listparindent=20pt}}{\end{list}}
\newcounter{subpartcount}
\newenvironment{subparts}{
  \begin{list}{(\roman{subpartcount})\hfill}{
          \usecounter{subpartcount}\leftmargin=30pt\topsep=2pt
          \labelsep=0pt\labelwidth=20pt\itemindent=20pt
          \itemsep=2pt\listparindent=20pt}}{\end{list}}
\let\part=\item
\let\subpart=\item
%
% for marks in right margin (cummulative count per question in pt in
% \markscount, a dimension, so deals with half marks)...
%
\newdimen\markscount
\markscount=-1pt
\def\markfont{\normalsize\rm}
%
\def\marks#1{\global\advance\markscount #1pt\strut\vadjust{%
\kern-\dp\strutbox{\vtop to \dp\strutbox{\baselineskip\dp\strutbox\vss\rlap{%
\hskip\hsize\quad\markfont{[\displaymarks{#1}]}}\null}}}}
%
% display half marks as a fraction...
%
\def\displaymarks#1{\def\savemarks{#1.:}\expandafter\halfmarks\savemarks\relax}
\def\halfmarks#1.#2:{\def\halfamark{5.}\def\halftest{#2}%
\ifx\halftest\halfamark#1{\half}\else#1\fi}
%
% (optional) answers...
%
\newif\ifshowanswers\showanswersfalse
\def\answerbegin{\centerline{\hrulefill}\small}
\def\answerend{\centerline{\hrulefill}}
\AtBeginDocument{\ifshowanswers
  \newenvironment{answer}{\bgroup\answerbegin}{\answerend\egroup}
\else
  \long\def\answer#1\endanswer{\relax}
\fi}
%
% for page identification...
%
\def\today{\number\day\space
  \ifcase\month\or January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December
  \fi\space\number\year}
\def\ID#1{\def\paperID{#1}}
\def\noID{\def\paperID{}}
\def\version#1{\def\paperV{#1}}
\def\noversion{\def\paperV{}}
\ID{A}
\version{(\today)}
%
% page styles: first     no page number, university logo top left
%              turnover  page numbers, TURN OVER on odd pages
%              continue  if a question is split at the bottom of an odd page
%                        (put \thispagestyle{continue} before the question)
%              explicit  if explicitly numbered continue is needed
%              empty     no page number or TURN OVER (for values page)
%              last      page numbers only (for last page)
%
\def\lowerleft{\vbox to 0pt{\vskip 60 pt
  {\hbox to 0pt {\hss {\small {\paperID}} \hskip 15 pt}}\vss}}
\def\logobox{\hbox to 0pt{\vbox to 0pt{\vss
  \hbox{\includegraphics[width=28mm]{CrossedKeysRadleyHiRes}}\vskip+0mm}\hss}}
\def\ps@first{\let\@mkboth\@gobbletwo
  \def\@oddhead{\ifRADbig\else\hbox{\logobox}\fi\hfill}
  \def\@oddfoot{\rm\lowerleft{\small\paperV}\hfill}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\rm\lowerleft{\small\paperV}\hfil}}
\def\ps@turnover{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\small\thepage}\hfil}
  \def\@oddfoot{\rm%\lowerleft{\small\paperV}
\hfil(TURN OVER}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\rm%\lowerleft{\small\paperV}
\hfil}}
\def\thepageone{1}
\def\ps@continue{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\if\thepage\thepageone\else{\small\thepage}\fi}\hfil}
  \def\@oddfoot{\rm%\lowerleft{\small\paperV}
\hfil
  \ifsection
   (TURN OVER for continuation of question \sectioninitial\arabic{questioncount}
  \else
   (TURN OVER for continuation of question \arabic{questioncount}
  \fi}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\rm%\lowerleft{\small\paperV}
\hfil}}
%
% explicit page number...
%
\def\explicitcontinue#1{\def\explicitcount{#1}\thispagestyle{explicit}}
\def\explicitcount{0}
%
\def\ps@explicit{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\if\thepage\thepageone\else{\small\thepage}\fi}\hfil}
  \def\@oddfoot{\rm%\lowerleft{\small\paperV}
\hfil
  \ifsection
   (TURN OVER for continuation of question \sectioninitial{\explicitcount}
  \else
   (TURN OVER for continuation of question {\explicitcount}
  \fi}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\rm%\lowerleft{\small\paperV}
\hfil}}
%\def\ps@empty{\let\@mkboth\@gobbletwo
%  \let\@oddhead\@empty
%  \def\@oddfoot{\rm\lowerleft{\small\paperV}\hfill}
%  \let\@evenhead\@empty
%  \def\@evenfoot{\rm\lowerleft{\small\paperV}\hfil}}
\def\ps@last{\let\@mkboth\@gobbletwo
  \def\@oddhead{\rm\hfil{\small\thepage}\hfil}
  \def\@oddfoot{\rm%\lowerleft{\small\paperV}
\hfil}
  \def\@evenhead{\rm\hfil{\small\thepage}\hfil}
  \def\@evenfoot{\rm%\lowerleft{\small\paperV}
\hfil}}
%-------------------------------------------------------------------------------
% Maths mode (re-)definitions:
%-------------------------------------------------------------------------------
\AtBeginDocument{
%
% for slanted lower case greek letters (changed from \mathord to \mathalpha,
% so will use bold type font when requested):
%
\DeclareMathSymbol{\alpha}{\mathalpha}{letters}{"0B}
\DeclareMathSymbol{\beta}{\mathalpha}{letters}{"0C}
\DeclareMathSymbol{\gamma}{\mathalpha}{letters}{"0D}
\DeclareMathSymbol{\delta}{\mathalpha}{letters}{"0E}
\DeclareMathSymbol{\epsilon}{\mathalpha}{letters}{"0F}
\DeclareMathSymbol{\zeta}{\mathalpha}{letters}{"10}
\DeclareMathSymbol{\eta}{\mathalpha}{letters}{"11}
\DeclareMathSymbol{\theta}{\mathalpha}{letters}{"12}
\DeclareMathSymbol{\iota}{\mathalpha}{letters}{"13}
\DeclareMathSymbol{\kappa}{\mathalpha}{letters}{"14}
\DeclareMathSymbol{\lambda}{\mathalpha}{letters}{"15}
\DeclareMathSymbol{\mu}{\mathalpha}{letters}{"16}
\DeclareMathSymbol{\nu}{\mathalpha}{letters}{"17}
\DeclareMathSymbol{\xi}{\mathalpha}{letters}{"18}
\DeclareMathSymbol{\pi}{\mathalpha}{letters}{"19}
\DeclareMathSymbol{\rho}{\mathalpha}{letters}{"1A}
\DeclareMathSymbol{\sigma}{\mathalpha}{letters}{"1B}
\DeclareMathSymbol{\tau}{\mathalpha}{letters}{"1C}
\DeclareMathSymbol{\upsilon}{\mathalpha}{letters}{"1D}
\DeclareMathSymbol{\phi}{\mathalpha}{letters}{"1E}
\DeclareMathSymbol{\chi}{\mathalpha}{letters}{"1F}
\DeclareMathSymbol{\psi}{\mathalpha}{letters}{"20}
\DeclareMathSymbol{\omega}{\mathalpha}{letters}{"21}
\DeclareMathSymbol{\varepsilon}{\mathalpha}{letters}{"22}
\DeclareMathSymbol{\vartheta}{\mathalpha}{letters}{"23}
\DeclareMathSymbol{\varpi}{\mathalpha}{letters}{"24}
\DeclareMathSymbol{\varrho}{\mathalpha}{letters}{"25}
\DeclareMathSymbol{\varsigma}{\mathalpha}{letters}{"26}
\DeclareMathSymbol{\varphi}{\mathalpha}{letters}{"27}
%
% for slanted uppercase greek letters (change from operators to letters,
% so uses slanted font, or bold if requested):
%
\DeclareMathSymbol{\Gamma}{\mathalpha}{letters}{"00}
\DeclareMathSymbol{\Delta}{\mathalpha}{letters}{"01}
\DeclareMathSymbol{\Theta}{\mathalpha}{letters}{"02}
\DeclareMathSymbol{\Lambda}{\mathalpha}{letters}{"03}
\DeclareMathSymbol{\Xi}{\mathalpha}{letters}{"04}
\DeclareMathSymbol{\Pi}{\mathalpha}{letters}{"05}
\DeclareMathSymbol{\Sigma}{\mathalpha}{letters}{"06}
\DeclareMathSymbol{\Upsilon}{\mathalpha}{letters}{"07}
\DeclareMathSymbol{\Phi}{\mathalpha}{letters}{"08}
\DeclareMathSymbol{\Psi}{\mathalpha}{letters}{"09}
\DeclareMathSymbol{\Omega}{\mathalpha}{letters}{"0A}
}
%
% need to use slanted bold letters for bold maths vectors:
%
\DeclareMathAlphabet{\mathbf}{OT1}{cmr}{bx}{it}
\DeclareMathAlphabet{\mathbf}{OML}{cmm}{b}{it}
%
% redefine \vec to use bold fonts
%
\renewcommand{\vec}[1]{{\bf #1}}
%
% for (upright) numbers i and e:
%
%\newcommand{\num}[1]{{\rm #1}}
%%%%ACN removed owing to clash with siunitx
%
% new \hbar, and define \dbar and \lambdabar (use LaTeXs \rule, and
% \mathchoice to get appropriate sizes for rules and back spacings)
% dimensions *are* OK for 12pt, cm or mathptm fonts
%
\def\barbar#1#2#3{\rule[#3 pt]{#1 pt}{#2 pt}}
\def\barbars{
   \mathchoice{\barbar6{0.6}6}{\barbar6{0.6}6}{\barbar4{0.4}4}{\barbar3{0.3}3}
}
\def\barback#1#2#3{\mathchoice{\kern-#1pt}{\kern-#1pt}{\kern-#2pt}{\kern-#3pt}}
\renewcommand{\hbar}{{\barbars\barback{6.0}{4.0}{3.3} h}}
\newcommand{\dbar}{{\barbars\barback{6.2}{4.2}{3.3}\rm d}}   % was 7 5 3.3
\newcommand{\lambdabar}{{\barbars\barback{6.0}{4.2}{3.3}\lambda}}
%
%                                         4
% this version prints things 5 times:   1 3 2
%                                         5
%
% For emboldening any character (\pmb: poor man's bold, cf. TeXbook, p.386)
%
\def\pmb#1{\setbox0=\hbox{#1}%
  \kern-0.02em\copy0\kern-\wd0
  \kern+0.04em\copy0\kern-\wd0
  \kern-0.02em\copy0\kern-\wd0
  \raise+0.02em\copy0\kern-\wd0
  \raise-0.02em\box0}
%
% for differentials...
%
\def\p#1by#2{\frac{\partial{#1}}{\partial{#2}}}
\def\pp#1by#2#3{\frac{\partial^2{#1}}{\partial{#2}\partial{#3}}}
\def\d#1by#2{\frac{{\rm d}{#1}}{{\rm d}{#2}}}
%\def\dd#1by#2#3{\frac{{\rm d}^2{#1}}{{\rm d}{#2}{\rm d}{#3}}}
\def\vecd#1{\hbox{\bf d}{\vec{#1}}}
%
% for clearer dot accents...
%
\def\bigdot#1{{\mathop{\kern0pt #1}\limits^{\mkern3mu\pmb{.}}}}
\def\bigddot#1{{\mathop{\kern0pt #1}\limits^{\mkern3mu\pmb{.}\mkern1mu\pmb{.}}}}
%
% For "hints" at the end of questions...
%
\def\shorthint#1{$\big[${\em #1}$\big]$}
%
\long\def\longhint#1{\vskip-20pt$$\left[\begin{minipage}{0.97\linewidth}
   $\strut$\vskip-12pt\em #1\vskip-12pt$\strut$
 \end{minipage}\:\right]$$}

%--------------------------------------------------------------------
%             Answer Lines (for short answer questions)

% Note: \ques@ref is also used in \item@points@pageinfo

\def\ques@ref{question}
\def\part@ref{part}
\def\subpart@ref{subpart}
\def\subsubpart@ref{subsubpart}

% Note: \answerclearance is also used by \fillin

\newlength\answerlinelength
\newlength\answerskip
\newlength\answerclearance
\setlength\answerlinelength{1in}
\setlength\answerskip{2ex}
\setlength\answerclearance{0.2ex}

\newcommand\answerline[1][{}]{%
  % One optional argument, the default value of which is empty.
  \ifx\@queslevel\ques@ref
    \let\ans@l=\questionlabel
  \else
    \ifx\@queslevel\part@ref
      \let\ans@l=\partlabel
    \else
      \ifx\@queslevel\subpart@ref
        \let\ans@l=\subpartlabel
      \else
        \ifx\@queslevel\subsubpart@ref
          \let\ans@l=\subsubpartlabel
        \else
          % Oops; no question level defined.
          % We must be outide of the questions environment.
          % Just leave out the label, I guess:
          \def\ans@l{}%
        \fi
      \fi
    \fi
  \fi
  \par \nobreak \vskip \answerskip
  \hfill 
  \ifshowanswers
    \ans@l~\hbox to 0pt{\hbox to \answerlinelength{\hrulefill}\hss}%
    \raise \answerclearance\hbox to \answerlinelength{%
      \CorrectChoice@Emphasis \hfil #1\hss}%
  \else
    \ans@l~\hbox to \answerlinelength{\hrulefill}%
  \fi
  \par
}% answerline

%--------------------------------------------------------------------
%               \fillin, for fill-in-the-blank questions

\newlength\fillinlinelength
\setlength\fillinlinelength{1in}

% \fillin can take two optional arguments.
%
% The first optional argument is the answer to be printed above the line
% when \printanswers is in effect; the default value is empty.  That
% line is printed a distance of \answerclearance below the baseline.
%
% The second optional argument is the length of the line that we print;
% the default value is \fillinlinelength.  The value of
% \fillinlinelength is set with the command
%
%   \setlength\fillinlinelength{1in}
%
% and can be changed by giving a new \setlength command.
%
% When answers are being printed, the optional argument is printed
% subject to the declarations in the argument of the last
% \CorrectChoiceEmphasis command.  It is centered on the line unless it
% is too long, in which case it extends to the right of the line.
%
% \fillin eats (and ignores) space characters appearing before the
% first optional argument.  It also eats (and ignores) space
% characters appearing after the first optional argument and before
% the second optional argument.  However, if exactly one optional
% argument appears, and if there are one or more space characters
% following that one optional argument, then those spaces are replaced
% by a single space character, but not eaten.

\newcommand\fillin[1][{}]{%
   \def\fillin@ans{#1}%
   \fillin@relay
}% fillin

\newcommand\fillin@relay{%
  % We use \exam@ifnextchar, a variation on \@ifnextchar.
  % If \exam@ifnextchar encounters one or more space characters
  % followed by a [, then those spaces are ignored (just as they would
  % be by \@ifnextchar).  However, if one or more space characters are
  % followed by a non-space character other than [, then
  % \exam@ifnextchar inserts a space following the
  % {\@fillin@relay[\fillinlinelength]} that is the third argument to
  % \exam@ifnextchar.
  \exam@ifnextchar[{\@fillin@relay}
                   {\@fillin@relay[\fillinlinelength]}%
}% fillin@relay

\def\@fillin@relay[#1]{%
  % The first argument is in \fillin@ans, the second is #1.
  \leavevmode
    \raise -\answerclearance \hbox to #1{\hrulefill}%
}% @fillin@relay

% \exam@ifnextchar is used by \fillin.
% \exam@ifnextchar is a variation of \@ifnextchar that does not always
% ignore space tokens.  If \exam@ifnextchar encounters one or more
% space tokens, it makes note of that (with the command
% \@tempswatrue).  If the first non-space character encountered
% matches argument #1, then any spaces that had been encountered are
% ignored.  However, if one or more spaces are encountered and the
% first non-space character found does not match argument #1, then
% \exam@ifnextchar produces argument #3 followed by a space character.
% (This differs from the behavior of \new@ifnextchar in amsgen.sty,
% which does lookahead for any character, including a space.)  This
% code (as well as the idea for it) is due to Dan Luecking and Ulrich
% Diez.
\long\def\exam@ifnextchar#1#2#3{%
  \let\reserved@d=#1%
  \def\reserved@a{#2}%
  \def\reserved@b{#3}%
  % The following says we haven't yet seen any spaces:
  \@tempswafalse
  \futurelet\@let@token\exam@ifnch
}% exam@ifnextchar

\def\exam@ifnch{%
  \ifx\@let@token\@sptoken
    % Signal that we've found a space:
    \@tempswatrue
    \let\reserved@c\exam@xifnch % this gobbles the space
  \else
    \ifx\@let@token\reserved@d
      \let\reserved@c\reserved@a
    \else
      \if@tempswa
        \def\reserved@c{\expandafter\reserved@b\space}%
      \else 
        \let\reserved@c\reserved@b
      \fi
    \fi
  \fi
  \reserved@c
}% exam@ifnch

% The following defines \exam@xifnch so that it will eat a space
% following it and then call \exam@ifnch:
{% keep redefinition of \: local
  \def\:{\exam@xifnch}
  \expandafter\gdef\: {\futurelet\@let@token\exam@ifnch}
}

%--------------------------------------------------------------------
%                            \fillwithlines


% \fillwithlines takes one argument, which is either a length or \fill
% or \stretch{number}, and it fills that much vertical space with
% horizontal lines that run the length of the current line.  That is,
% they extend from the current left margin (which depends on whether
% we're in a question, part, subpart, or subsubpart) to the right
% margin.
%
% The distance between the lines is \linefillheight, whose default value
% is set with the command
%
% \setlength\linefillheight{.25in}
%
% This value can be changed by giving a new \setlength command.
%
% The thickness of the lines is \linefillthickness, whose default value
% is set with the command
%
% \setlength\linefillthickness{.1pt}
%
% This value can be changed by giving a new \setlength command.


\newlength\linefillheight
\newlength\linefillthickness
\setlength\linefillheight{.25in}
\setlength\linefillthickness{0.1pt}

\newcommand\linefill{\leavevmode
    \leaders\hrule height \linefillthickness \hfill\kern\z@}


\def\fillwithlines#1{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak
  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
          \vrule height \linefillheight depth \z@ width \z@
          \linefill}%
  % We use \cleaders (rather than \leaders) so that a given
  % vertical space will always produce the same number of lines
  % no matter where on the page it happens to start:
  \cleaders \copy0 \vskip #1 \hbox{}%
  \endgroup
}

%--------------------------------------------------------------------
%                         \fillwithdottedlines


% \fillwithdottedlines is similar to \fillwithlines, except that it
% fills the space with dotted lines (created by \dotfill) rather than
% with solid lines.

% \fillwithdottedlines takes one argument, which is either a length or
% \fill or \stretch{number}, and it fills that much vertical space
% with dotted lines that run the length of the current line.  That is,
% they extend from the current left margin (which depends on whether
% we're in a question, part, subpart, or subsubpart) to the right
% margin.
%
% The distance between the lines is \dottedlinefillheight, whose
% default value is set with the command
%
% \setlength\dottedlinefillheight{.25in}
%
% This value can be changed by giving a new \setlength command.

\newlength\dottedlinefillheight
\setlength\dottedlinefillheight{.25in}

\def\fillwithdottedlines#1{%
  \begingroup
  \ifhmode
    \par
  \fi
  \hrule height \z@
  \nobreak
  \setbox0=\hbox to \hsize{\hskip \@totalleftmargin
          \vrule height \dottedlinefillheight depth \z@ width \z@
          \dotfill}%
  % We use \cleaders (rather than \leaders) so that a given
  % vertical space will always produce the same number of lines
  % no matter where on the page it happens to start:
  \cleaders \copy0 \vskip #1 \hbox{}%
  \endgroup
}% fillwithdottedlines

%------------------------------------------------------------------------------%
% Font options
%------------------------------------------------------------------------------%
%
% default, when no options...
%
\ifRADnone{\typeout{---- no font option}
  \gdef\quark#1{{\rm #1}}
  \gdef\particle#1{{\rm #1}}
  \gdef\uppi{\pi}
  \gdef\upmu{\mu}
  \gdef\upDelta{{\rm\Delta}}
  \gdef\updelta{\delta}
  \gdef\upOmega{{\rm\Omega}}
}\fi
% --------------
% euler fonts...
% --------------
\ifRADeuler{\typeout{---- 'euler' option, loading euler font}
  \AtEndOfClass{\DeclareMathAlphabet{\upright}{U}{eur}{m}{n}}
  \gdef\quark#1{\upright{#1}}
  \gdef\particle#1{\upright{#1}}
  \gdef\uppi{\upright{\pi}}
  \gdef\upmu{\upright{\mu}}
  \gdef\upDelta{\upright{\Delta}}
  \gdef\updelta{\upright{\delta}}
  \gdef\upOmega{\upright{\Omega}}
}\fi
% -------------
% cmmu fonts...
% -------------
% using a tweaked "upright" version of cmmi10 called cmmu10,
% which requires the following additional files:
%
%    omlcmmu.fd
%    cmmu10.mf
%    cmmu10.tfm
%
\ifRADcmmu{\typeout{---- 'cmmu' option, loading cmmu font}
  \AtEndOfClass{\DeclareMathAlphabet{\upright}{OML}{cmmu}{m}{r}}
  \gdef\quark#1{\upright{#1}}
  \gdef\particle#1{\upright{#1}}
  \gdef\uppi{\upright{\pi}}
  \gdef\upmu{\upright{\mu}}
  \gdef\upDelta{\upright{\Delta}}
  \gdef\updelta{\upright{\delta}}
  \gdef\upOmega{\upright{\Omega}}
}\fi
% -------------------------
% using txfonts or newtx...
% -------------------------
% (Note: TS1 font encoding defines \d, so redefine my \d differential)
%
\newif\ifRADgreek
\newbox\RADone
\newbox\RADtwo
\newbox\RADthree
\ifRADtx{
%
  \ifRADtxfonts{\IfFileExists{txfonts.sty}{
     \typeout{---- 'txfonts' option, loading txfonts package}}{
     \typeout{**********************ERROR************************}
     \typeout{ 'txfonts' option is given, but txfonts.sty is NOT }
     \typeout{ available in this LaTeX implemention, so you need }
     \typeout{ to install it, or choose a different font option. }
     \typeout{***************************************************}
     \typeout{Stopping now...}\stop}
%
    \AtEndOfClass{\usepackage{txfonts}
    \usepackage[TS1,T1]{fontenc}\selectfont
    \def\d#1by#2{\frac{{\rm d}{#1}}{{\rm d}{#2}}}
    \DeclareMathAlphabet{\mathbf}{OML}{txmi}{bx}{it}
    \DeclareSymbolFont{boldsymbols}{OMS}{txsy}{bx}{n}
    \DeclareMathSymbol{\del}{\mathord}{boldsymbols}{"72}}
  }\fi
%
  \ifRADnewtx{\IfFileExists{newtxtext.sty}{
     \typeout{---- 'newtx' option, loading newtx packages}}{
     \typeout{**********************ERROR************************}
     \typeout{ 'newtx' option is given, but newtxtext.sty is NOT }
     \typeout{ available in this LaTeX implemention, so you need }
     \typeout{ to install it (and newtxmath.sty), or choose a    }
     \typeout{ different font option.                            }
     \typeout{***************************************************}
     \typeout{Stopping now...}\stop}
%
    \AtEndOfClass{\usepackage{newtxtext}
    \usepackage[slantedGreek]{newtxmath}
    \usepackage[TS1,T1]{fontenc}\selectfont
    \def\d#1by#2{\frac{{\rm d}{#1}}{{\rm d}{#2}}}
    \DeclareMathAlphabet{\mathbf}{OML}{ntxmi}{bx}{it}
    \DeclareSymbolFont{boldsymbols}{OMS}{ntxsy}{bx}{n}
    \DeclareMathSymbol{\del}{\mathord}{boldsymbols}{"72}}
  }\fi
%
   \AtEndOfClass{
     \ifRADbig
       \def\barbars{\mathchoice{\barbar8{0.6}8}{\barbar8{0.6}8}%
          {\barbar{5.5}{0.4}{5.5}}{\barbar4{0.3}4}}
       \renewcommand{\hbar}{{\barbars\barback{8.0}{5.5}{4.0} h\kern0.7pt}}
       \renewcommand{\dbar}{{\barbars\barback{8.0}{5.5}{4.0}\rm d\kern0.7pt}}
       \renewcommand{\lambdabar}{{\barbars\barback{8.8}{6.1}{4.4}\lambda\kern0.7pt}}
     \else
%
% old: best for txfonts
%
%       \renewcommand{\hbar}{{\barbars\barback{6}{4}{3.1} h\kern0.5pt}}
%       \renewcommand{\dbar}{{\barbars\barback{6}{4}{3.1}\rm d\kern0.5pt}}
%       \renewcommand{\lambdabar}{{\barbars\barback{6.4}{4.3}{3.5}\lambda\kern0.5pt}}
%
% new: best for newtx
%
       \renewcommand{\hbar}{{\barbars\barback{6.6}{4.4}{3.4} h\kern0.5pt}}
       \renewcommand{\dbar}{{\barbars\barback{6}{4}{3.1}\rm d\kern0.5pt}}
       \renewcommand{\lambdabar}{{\barbars\barback{7.0}{4.6}{3.6}\lambda\kern0.5pt}}
     \fi}
%
  \gdef\upright#1{{\rm #1}}
%
% Compare hbox with #1 with uppercase and lowercase versions, if changes it is
% a normal letter (so use \upright{#1}), if not it is a greek letter (use
% \mathfrak{#1} which is the lettersA font with upright greek letters
%
  \newbox\RADone
  \newbox\RADtwo
  \newbox\RADthree
  \gdef\particle#1{\RADgreekfalse\setbox\RADone=\hbox{$#1$}
  \setbox\RADtwo=\hbox{$\uppercase{#1}$}\setbox\RADthree=\hbox{$\lowercase{#1}$}
  \ifdim\wd\RADone=\wd\RADtwo\relax\ifdim\wd\RADtwo=\wd\RADthree\relax
  \RADgreektrue\fi\fi\ifRADgreek\mathfrak{#1}\else\upright{#1}\fi}
%
  \gdef\quark#1{\upright{#1}}
  \gdef\uppi{\piup}
  \gdef\upmu{\muup}
  \gdef\upDelta{\upright{\Delta}}
  \gdef\updelta{\deltaup}
  \gdef\upOmega{\upright{\Omega}}
%
  \gdef\half{\mbox{\fontencoding{TS1}\selectfont \textonehalf}}
}\else{
%
% for faked bold \del and 1/2 fraction if not txfonts...
%
  \gdef\del{\mathchoice{\pmb{$\displaystyle\nabla$}}{\pmb{$\textstyle\nabla$}}%
     {\pmb{$\scriptstyle\nabla$}}{\pmb{$\scriptscriptstyle\nabla$}}}
  \gdef\half{$\frac{1}{2}$}
}\fi
%
%------------------------------------------------------------------------------%
% Initial settings...
%
\pagestyle{turnover}
\thispagestyle{first}
\pagenumbering{arabic}
\onecolumn
\raggedright                   % Old Schools' recommendations
\raggedbottom                  %  "     "          "
\parskip=0pt
%
\ifRADbig\vspace*{10mm}\leftline{\logobox}\fi
%
\AtBeginDocument{\normalfont}
%==============================================================================%
\endinput
