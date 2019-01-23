\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ohmyresume}[2019/1/21 Standard LaTeX class]
\LoadClass[letterpaper]{article}

\RequirePackage{devtools}

% Define Variable
\setvar{\myname}{\name}
\newcommand\myaddress{}
\newcommand{\address}[1]{\renewcommand{\myaddress}{#1}}
\newcommand\myemail{}
\newcommand{\email}[1]{\renewcommand{\myemail}{#1}}
\newcommand\myphone{}
\newcommand{\phone}[1]{\renewcommand{\myphone}{#1}}

% Import Package

\RequirePackage{geometry}
\geometry{
  body={6.5in, 9.5in},
  left=1.0in,
  top=1.0in
}

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1]{labelindent=\parindent,label={},leftmargin=*}
\setlist[2]{label=$\circ$,before=\vspace{-4pt}}

% Set Font & Length
\setlength\parindent{0em}
\setlength{\parsep}{0pt}
\setlength{\parskip}{0pt}

\RequirePackage{titlesec}
\titlespacing*{\section} {0pt}{-8pt}{3pt}
\titleformat{\section}[display]
{\scshape\rmfamily\Large\mdseries}{}{20pt}{}[\vspace{-3pt}\titlerule]

\titlespacing*{\subsection} {0pt}{9pt}{0pt}
\titleformat*{\subsection}{\rmfamily\mdseries\itshape\large}

\pagestyle{myheadings}
\markright{\myname}
\thispagestyle{empty}

\AtBeginDocument{
  \centerline{\huge \bf \myname}
  \vspace{-0.1in}
  \begin{itemize}
    \centering
    \ifemptyelse{\myaddress}{}{\item[$\bullet$] \myaddress}
    \ifemptyelse{\myemail}{}{\item[$\bullet$] \myemail}
    \ifemptyelse{\myphone}{}{$\bullet$ \myphone}
  \end{itemize}
}

% Footer
\AtEndDocument{
  \begin{center}
    \begin{footnotesize}
      Last updated: \today \\
    \end{footnotesize}
  \end{center}
}

\newcommand{\info}[3]{
  \item {\bfseries #1} \hfill #3
  \ifemptyelse{#2}{}{\item {\it #2}}
}
\newcommand{\infooneline}[3]{
  \item {\bfseries #1:}  
  \ifemptyelse{#2}{}{{\it #2}}
  \hfill #3
}

