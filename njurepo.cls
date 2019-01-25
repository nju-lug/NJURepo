%%
%% This is file `njurepo.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% njurepo.dtx  (with options: `cls')
%% 
%% This is a generated file.
%% 
%% Copyright (C) 2019 by Zangwei Zheng <zhengzangw@gmail.com>
%% 
%% This file may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in:
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{njurepo}
[2019/01/25 1.0.0 Nanjing University Report Template]
\hyphenation{NJU-repo}
\def\thuthesis{\textsc{NJUrepo}}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=hw,
    prefix=hw@,
    setkeys=\kvsetkeys
}
\DeclareStringOption[chinese]{language}[chinese]
\DeclareStringOption[any]{open}[any]
\DeclareBoolOption{secret}
\DeclareBoolOption{draft}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}

\ProcessKeyvalOptions*
\newcommand\hw@validate@key[1]{%
  \@ifundefined{hw@\csname hw@#1\endcsname true}{%
    \ClassError{njurepo}{Invalid value '\csname hw#1\endcsname'}{}
    }{%
      \csname hw@\csname hw@#1\endcsname true\endcsname
    }
}
\newif\ifhw@chinese
\newif\ifhw@english
\hw@validate@key{language}
\newif\ifhw@any
\newif\ifhw@right
\hw@validate@key{open}
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\RequirePackage{etoolbox}
\RequirePackage{ifxetex}
\RequirePackage{xparse}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\RequirePackage{CJKfntef}
\RequirePackage[amsmath, thmmarks, hyperref]{ntheorem}
\RequirePackage{array}
\RequirePackage{longtable}
\RequirePackage[sort&compress]{natbib}
\RequirePackage{booktabs}
\RequirePackage{hyperref}
\ifxetex
  \hypersetup{%
    CJKbookmarks=true}
\else
  \hypersetup{%
    unicode=true,
    CJKbookmarks=false}
\fi
\hypersetup{%
  linktoc=all,
  bookmarksnumbered=true,
  bookmarksopen=true,
  bookmarksopenlevel=1,
  breaklinks=true,
  colorlinks=false,
  plainpages=false,
  pdfborder=0 0 0} 
\urlstyle{same}
\def\UrlBreaks{%
  \do\/%
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l%
     \do\m\do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L%
     \do\M\do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9\do=\do/\do.\do:%
  \do\*\do\-\do\~\do\'\do\"\do\-}
\Urlmuskip=0mu plus 0.1mu
\RequirePackage{fancyhdr}
\RequirePackage{notoccite} 
\RequirePackage{geometry}
\geometry{
    a4paper, %210*297mm
    hcentering,
    ignoreall,
    nomarginpar,
    left=30mm,
    headheight=5mm,
    headsep=5mm,
    textheight=237mm,
    bottom=29mm,
    footskip=6mm
}
\let\hw@cleardoublepage\cleardoublepage
\newcommand{\hw@clearemptydoublepage}{%
  \clearpage{\pagestyle{hw@empty}\hw@cleardoublepage}}
\let\cleardoublepage\hw@clearemptydoublepage
\renewcommand\frontmatter{%
    \ifhw@right\cleardoublepage\else\clearpage\fi
    \@mainmatterfalse
    \pagenumbering{Roman}
    \pagestyle{hw@empty}}
\renewcommand\mainmatter{%
    \ifhw@right\cleardoublepage\else\clearpage\fi
    \@mainmattertrue
    \pagenumbering{arabic}
    \pagestyle{hw@headings}}
\renewcommand\backmatter{%
    \ifhw@right\cleardoublepage\else\clearpage\fi
    \@mainmattertrue}
\newcommand\hw@fontset{\csname g__ctex_fontset_tl\endcsname}
\ifthenelse{\equal{\hw@fontset}{fandol}}{
  \setmainfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyretermes}
  \setsansfont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]{texgyreheros}
  \setmonofont[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Scale          = MatchLowercase,
  ]{texgyrecursor}
}{
  \setmainfont{Times New Roman}
  \setsansfont{Arial}
  \ifthenelse{\equal{\hw@fontset}{mac}}{
    \setmonofont[Scale=MatchLowercase]{Menlo}
  }{
    \setmonofont[Scale=MatchLowercase]{Courier New}
  }
}
\RequirePackage{unicode-math}
\unimathsetup{
  math-style = ISO,
  bold-style = ISO,
  nabla      = upright,
  partial    = upright,
}
\IfFontExistsTF{STIX2Math.otf}{
  \setmathfont[StylisticSet=8]{STIX2Math.otf}
  \setmathfont[range={scr,bfscr},StylisticSet=1]{STIX2Math.otf}
  \IfFontExistsTF{XITSMath-Regular.otf}{
    \setmathfont[range={\partial,\lbrace,\rbrace}]{XITSMath-Regular.otf}
  }{
    \setmathfont[range={\partial,\lbrace,\rbrace}]{xits-math.otf}
  }
}{
  \setmathfont[
    Extension    = .otf,
    BoldFont     = *bold,
    StylisticSet = 8,
  ]{xits-math}
  \setmathfont[range={cal,bfcal},StylisticSet=1]{xits-math.otf}
}
\ifhw@chinese
  \def\mathellipsis{\cdots}
\fi
\protected\def\le{\leqslant}
\protected\def\ge{\geqslant}
\AtBeginDocument{%
  \renewcommand\leq{\leqslant}%
  \renewcommand\geq{\geqslant}%
}
\removenolimits{%
  \int\iint\iiint\iiiint\oint\oiint\oiiint
  \intclockwise\varointclockwise\ointctrclockwise\sumint
  \intbar\intBar\fint\cirfnint\awint\rppolint
  \scpolint\npolint\pointint\sqint\intlarhk\intx
  \intcap\intcup\upint\lowint
}
\AtBeginDocument{%
  \renewcommand{\Re}{\operatorname{Re}}%
  \renewcommand{\Im}{\operatorname{Im}}%
  \renewcommand\nabla{\mbfnabla}%
}
\newcommand\bm{\symbf}
\renewcommand\boldsymbol{\symbf}
\newcommand\square{\mdlgwhtsquare}
\allowdisplaybreaks[4]
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter-\fi\@arabic\c@equation}
\def\make@df@tag{\@ifstar\hw@make@df@tag@@\make@df@tag@@@}
\def\hw@make@df@tag@@#1{\gdef\df@tag{\hw@maketag{#1}\def\@currentlabel{#1}}}
\def\hw@maketag#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)}}
\def\tagform@#1{\maketag@@@{(\ignorespaces #1\unskip\@@italiccorr)\equcaption{#1}}}
\renewcommand{\eqref}[1]{\textup{(\ref{#1})}}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12bp}{20bp}%
  \abovedisplayskip=12bp \@plus 2bp \@minus 2bp
  \abovedisplayshortskip=12bp \@plus 2bp \@minus 2bp
  \belowdisplayskip=\abovedisplayskip
  \belowdisplayshortskip=\abovedisplayshortskip}
\def\hw@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\hw@def@fontsize{chuhao}{42bp}
\hw@def@fontsize{xiaochu}{36bp}
\hw@def@fontsize{yihao}{26bp}
\hw@def@fontsize{xiaoyi}{24bp}
\hw@def@fontsize{erhao}{22bp}
\hw@def@fontsize{xiaoer}{18bp}
\hw@def@fontsize{sanhao}{16bp}
\hw@def@fontsize{xiaosan}{15bp}
\hw@def@fontsize{sihao}{14bp}
\hw@def@fontsize{banxiaosi}{13bp}
\hw@def@fontsize{xiaosi}{12bp}
\hw@def@fontsize{dawu}{11bp}
\hw@def@fontsize{wuhao}{10.5bp}
\hw@def@fontsize{xiaowu}{9bp}
\hw@def@fontsize{liuhao}{7.5bp}
\hw@def@fontsize{xiaoliu}{6.5bp}
\hw@def@fontsize{qihao}{5.5bp}
\hw@def@fontsize{bahao}{5bp}
\newcommand\hw@setchinese{%
  \xeCJKResetPunctClass
}
\newcommand\hw@setenglish{%
  \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
  \xeCJKDeclareCharClass{HalfRight}{
    "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
  }%
}
\newcommand\hw@setdefaultlanguage{%
  \ifhw@chinese
    \hw@setchinese
  \else
    \hw@setenglish
  \fi
}
\fancypagestyle{hw@empty}{%
  \fancyhf{}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{hw@plain}{%
  \fancyhead{}
  \fancyfoot[C]{\xiaowu\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}}
\fancypagestyle{hw@headings}{%
  \fancyhead{}
  \fancyhead[C]{\wuhao\normalfont\leftmark}
  \fancyfoot{}
  \fancyfoot[C]{\wuhao\thepage}
  \renewcommand{\headrulewidth}{0.4pt}
  \renewcommand{\footrulewidth}{0pt}}
\ctexset{%
  punct=quanjiao,
  space=auto,
  autoindent=true}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\setlist{nosep}
\ifthenelse{\equal{\hw@fontset}{mac}}{
  \newfontfamily\hw@circlefont{Songti SC Light}
}{
  \ifthenelse{\equal{\hw@fontset}{windows}}{
    \newfontfamily\hw@circlefont{SimSun}
  }{
    \IfFontExistsTF{XITS-Regular.otf}{
      \newfontfamily\hw@circlefont{XITS-Regular.otf}
    }{
      \newfontfamily\hw@circlefont{xits-regular.otf}
    }
  }
}
\def\hw@textcircled#1{%
  \ifnum\value{#1} >9%
    \ClassError{hwthesis}%
      {Too many footnotes in this page.}{Keep footnote less than 10.}%
  \fi
  {\hw@circlefont\symbol{\numexpr\value{#1}+"245F\relax}}%
}
\renewcommand{\thefootnote}{\hw@textcircled{footnote}}
\renewcommand{\thempfootnote}{\hw@textcircled{mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\let\hw@footnotesize\footnotesize
\renewcommand\footnotesize{\hw@footnotesize\xiaowu[1.5]}
\let\hw@makefnmark\@makefnmark
\def\hw@@makefnmark{\hbox{{\normalfont\@thefnmark}}}
\pretocmd{\@makefntext}{\let\@makefnmark\hw@@makefnmark}{}{}
\apptocmd{\@makefntext}{\let\@makefnmark\hw@makefnmark}{}{}
\setlength{\floatsep}{20bp \@plus4pt \@minus1pt}
\setlength{\intextsep}{20bp \@plus4pt \@minus2pt}
\setlength{\textfloatsep}{20bp \@plus4pt \@minus2pt}
\setlength{\@fptop}{0bp \@plus1.0fil}
\setlength{\@fpsep}{12bp \@plus2.0fil}
\setlength{\@fpbot}{0bp \@plus1.0fil}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\let\old@tabular\@tabular
\def\hw@tabular{\dawu[1.5]\old@tabular}
\DeclareCaptionLabelFormat{hw}{{\dawu[1.5]\normalfont #1~#2}}
\DeclareCaptionLabelSeparator{hw}{\hspace{1em}}
\DeclareCaptionFont{hw}{\dawu[1.5]}
\captionsetup{labelformat=hw,labelsep=hw,font=hw,skip=6bp}
\captionsetup[table]{position=top}
\captionsetup[figure]{position=bottom}
\captionsetup[sub]{font=hw}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\let\hw@LT@array\LT@array
\def\LT@array{\dawu[1.5]\hw@LT@array} % set default font size
\def\hlinewd#1{%
  \noalign{\ifnum0=`}\fi\hrule \@height #1 \futurelet
    \reserved@a\@xhline}
\AtBeginDocument{%
  \pagestyle{hw@empty}
  \renewcommand{\chaptermark}[1]{\@mkboth{\CTEXthechapter\hskip\ccwd#1}{}}}
\newcommand\hw@chapter@titleformat[1]{%
    \ifthenelse%
      {\equal{#1}{\eabstractname}}%
      {\bfseries #1}%
      {#1}%
  }
\ctexset{%
  chapter={
    afterindent=true,
    pagestyle={hw@headings},
    beforeskip={9bp},
    aftername=\hskip\ccwd,
    afterskip={24bp},
    format={\centering\sffamily\sanhao[1]},
    nameformat=\relax,
    numberformat=\relax,
    titleformat=\hw@chapter@titleformat,
    lofskip=0pt,
    lotskip=0pt,
  },
  section={
    afterindent=true,
    beforeskip={24bp\@plus 1ex \@minus .2ex},
    afterskip={6bp\@plus .2ex},
    format={\sffamily\sihao[1.429]},
  },
  subsection={
    afterindent=true,
    beforeskip={16bp\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\sffamily\banxiaosi[1.538]},
    numberformat={\sffamily\banxiaosi[1.538]},
  },
  subsubsection={
    afterindent=true,
    beforeskip={16bp\@plus 1ex \@minus .2ex},
    afterskip={6bp \@plus .2ex},
    format={\sffamily\xiaosi[1.667]},
  },
  paragraph/afterindent=true,
  subparagraph/afterindent=true}
\newcounter{hw@bookmark}
\NewDocumentCommand\hw@chapter{s o m o}{
  \IfBooleanF{#1}{%
    \ClassError{hwthesis}{You have to use the star form: \string\hw@chapter*}{}
  }%
  \if@openright\cleardoublepage\else\clearpage\fi\phantomsection%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \addtocounter{hw@bookmark}\@ne
      \pdfbookmark[0]{#3}{hwchapter.\thehw@bookmark}
    }{%
      \addcontentsline{toc}{chapter}{#3}
    }
  }{%
    \addcontentsline{toc}{chapter}{#3}
  }%
  \ctexset{chapter/beforeskip=25bp}
  \chapter*{#3}%
  \ctexset{chapter/beforeskip=15bp}
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}
    {\@mkboth{}{}}
    {\@mkboth{#4}{#4}}
  }{%
    \@mkboth{#3}{#3}
  }
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \hw@chapter*[]{\contentsname}
  \xiaosi[1.65]\@starttoc{toc}\normalsize}
\def\@pnumwidth{2em}
\def\@tocrmarg{\@pnumwidth}
\def\@dotsep{1}
\renewcommand*\l@chapter[2]{%
  \ifnum \c@tocdepth >\m@ne
    \addpenalty{-\@highpenalty}%
    4bp \@plus\p@
    \setlength\@tempdima{4em}%
    \begingroup
      \parindent \z@ \rightskip \@pnumwidth
      \parfillskip -\@pnumwidth
      \leavevmode
      \advance\leftskip\@tempdima
      \hskip -\leftskip
      {#1}%
      \leaders\hbox{$\m@th\mkern \@dotsep mu\hbox{.}\mkern \@dotsep mu$}\hfill%
      \nobreak{#2}\par
      \penalty\@highpenalty
    \endgroup
  \fi}

\patchcmd{\@dottedtocline}{\hb@xt@\@pnumwidth}{\hbox}{}{}
\renewcommand*\l@section{%
  \@dottedtocline{1}{\ccwd}{2.1em}}
\renewcommand*\l@subsection{%
  \@dottedtocline{2}{2\ccwd}{3em}}
\renewcommand*\l@subsubsection{%
  \@dottedtocline{3}{3.5em}{3.8em}}
\def\thu@starttoc#1{% #1: float type, prepend type name in \listof*** entry.
  \let\oldnumberline\numberline
  \def\numberline##1{\oldnumberline{\csname #1name\endcsname\hskip.4em ##1}}
  \@starttoc{\csname ext@#1\endcsname}
  \let\numberline\oldnumberline}
\def\thu@listof#1{% #1: float type
  \@ifstar
    {\thu@chapter*[]{\csname list#1name\endcsname}\thu@starttoc{#1}}
    {\thu@chapter*{\csname list#1name\endcsname}\thu@starttoc{#1}}}
\renewcommand\listoffigures{\thu@listof{figure}}
\renewcommand*\l@figure{\ifthu@bachelor\relax\else\addvspace{6bp}\fi\@dottedtocline{1}{0em}{4em}}
\renewcommand\listoftables{\thu@listof{table}}
\let\l@table\l@figure
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\thu@listof{equation}}
\let\l@equation\l@figure
\newcommand\bibstyle@inline{\bibpunct{[}{]}{,}{n}{,}{,}}
\DeclareRobustCommand\inlinecite{\@inlinecite}
\def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
\let\onlinecite\inlinecite
\renewcommand\bibsection{\thu@chapter*{\bibname}}
\renewcommand\bibfont{\ifthu@bachelor\wuhao[1.619]\else\wuhao[1.5]\fi}
\setlength\bibhang{2\ccwd}
\addtolength{\bibsep}{-0.7em}
\setlength{\labelsep}{0.4em}
\def\@biblabel#1{[#1]\hfill}
\expandafter\newcommand\csname bibstyle@thuthesis-numeric\endcsname{%
  \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
\expandafter\newcommand\csname bibstyle@thuthesis-author-year\endcsname{%
  \bibpunct{(}{)}{;}{a}{,}{,}}
\patchcmd\NAT@citexnum{%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\NAT@cmt#2\fi
  }{}%
  \NAT@mbox{\NAT@@close}%
}{%
  \NAT@mbox{\NAT@@close}%
  \@ifnum{\NAT@ctype=\z@}{%
    \if*#2*\else\textsuperscript{#2}\fi
  }{}%
}{}{}
\renewcommand\NAT@citesuper[3]{\ifNAT@swa
  \if*#2*\else#2\NAT@spacechar\fi
\unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close\if*#3*\else#3\fi}%
   \else #1\fi\endgroup}
\patchcmd{\NAT@citex}{%
  \if*#2*\else\NAT@cmt#2\fi
  \if\relax\NAT@date\relax\else\NAT@@close\fi
}{%
  \if\relax\NAT@date\relax\else\NAT@@close\fi
  \if*#2*\else\textsuperscript{#2}\fi
}{}{}
\renewcommand\NAT@cite%
    [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
        #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
\patchcmd{\NAT@citexnum}{%
  \ifx\NAT@last@yr\relax
    \def@NAT@last@yr{\@citea}%
  \else
    \def@NAT@last@yr{--\NAT@penalty}%
  \fi
}{%
  \def@NAT@last@yr{-\NAT@penalty}%
}{}{}
\AtEndOfClass{\input{njurepo.cfg}}
\AtEndOfClass{\sloppy}
\endinput
%%
%% End of file `njurepo.cls'.
