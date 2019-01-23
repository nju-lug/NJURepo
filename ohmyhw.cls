%%
%% This is file `ohmyhw.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% ohmyhw.dtx  (with options: `cls')
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
\ProvidesClass{ohmyhw}
    [2019/01/22 v1.0 Oh My Homework Template]
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
    family=hw,
    prefix=hw@,
    setkeys=\kvsetkeys
}
\DeclareStringOption[chinese]{language}[chinese]
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\newcommand\hw@validate@key[1]{%
  \@ifundefined{hw@\csname hw@#1\endcsname true}{%
    \ClassError{ohmyhw}{Invalid value '\csname hw#1\endcsname'}{}
    }{%
      \csname hw@\csname hw@#1\endcsname true\endcsname
    }
}
\newif\ifhw@chinese
\newif\ifhw@english
\hw@validate@key{language}
\LoadClass[a4paper,openany,UTF8,zihao=-4,scheme=plain]{ctexbook}
\newcommand{\maketitlepage}[1]{%
    Hello #1\relax
}
\endinput
%%
%% End of file `ohmyhw.cls'.
