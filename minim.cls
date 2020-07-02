\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{minim}[2020 Minimal thesis class based on tufte]

%%
\LoadClass[oneside,
           pagesize,
           12pt,
           DIV=10,
           BCOR=0mm,
           cleardoublepage=empty,
           numbers=noenddot,
           pagenumber=left,
           titlepage,
           toc=bibliography,
           toc=listof,
           toc=index]{scrartcl}

%%
% There can only be one main language
% Secondary languages can be added to setotherlanguages
\RequirePackage{polyglossia}
\setdefaultlanguage{spanish}
\setotherlanguages{english}

\RequirePackage{csquotes}% Better quotations

\RequirePackage{optparams}% Macros with optional parameters

%%
% Definitions of margins and geometry
\RequirePackage{geometry}
\geometry{
    a4paper,
    left=24.8mm,
    top=27.4mm,
    headsep=2\baselineskip,     % Gap between body and header
    textwidth=107mm,
    marginparsep=8.2mm,         % Gap between body and margin notes
    marginparwidth=49.4mm,      % Width of the margin notes
    textheight=42\baselineskip, % Height of the body
    headheight=\baselineskip,    % Height of the header
}

\usepackage[automark]{scrlayer-scrpage}% Sets pagestyle scrheadings automatically
\clearpairofpagestyles% Remove the default page header and footer

% Remove page numbers on TOC, LOF and LOT
\AfterTOCHead{\thispagestyle{empty}}
\lofoot*{\pagemark}% Page number on the left part

\RequirePackage{ifpdf}
\RequirePackage{ifxetex}
\RequirePackage{ifluatex}

\newif\ifxetexorluatex
\ifxetex
  \xetexorluatextrue
\else
  \ifluatex
    \xetexorluatextrue
  \else
    \xetexorluatexfalse
  \fi
\fi

\ifxetexorluatex
  \RequirePackage{fontspec}
\else
  \RequirePackage[utf8]{inputenc}
\fi


%%
% Custom colors
\RequirePackage[usenames,dvipsnames]{xcolor}
\colorlet{accent}{Maroon}
\colorlet{highlight}{RedOrange}
\definecolor{bleu}{RGB}{12,127,172}


% Remove indentation
\setlength{\parindent}{0pt}

\RequirePackage[strict]{changepage}  % Temporalely change page margins

\RequirePackage{sidenotes} % Notes and figures in the margin

%%
% Table related
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{multirow}

%%
% List related
% \RequirePackage{enumitem}

%%
\RequirePackage{graphicx}
\graphicspath{%
    {Figures/}
    {Images/}
    {./}
}

%%
% Glossaries, Acronyms and Index
\RequirePackage[%
  acronym,
  automake,
  nogroupskip,
  nopostdot,
  toc,
  ]{glossaries}

  \renewcommand{\glsnamefont}[1]{\normalfont{\color{accent}#1}} %Change acronym name font


\RequirePackage{makeidx}% Create index

%%
\RequirePackage{ragged2e}% For text justification
\RequirePackage{setspace}% 1.5 line spacing
\onehalfspacing

\RequirePackage{placeins}% For \FloatBarrier
\renewcommand{\raggedpart}{\flushleft}

%%
% For Headers and footers
% TODO: Edit header and footer with KOMA

%%
% Mathematical notation
\RequirePackage[binary-units=true]{siunitx}
\sisetup{%
  detect-all           = true,
  detect-family        = true,
  detect-mode          = true,
  detect-shape         = true,
  detect-weight        = true,
  detect-inline-weight = math,
}

%%
% Hyperlinks
\usepackage[
colorlinks=true,
linkcolor=highlight,
urlcolor=highlight,
citecolor=bleu,
pdfusetitle]{hyperref}


%%
% Custom lengths
\newlength{\marginhang}
\newlength{\fullwidthtext}

% Set the length to their default value
\AtBeginDocument{
    \setlength{\marginhang}{\marginparwidth}
    \addtolength{\marginhang}{\marginparsep}

    \setlength{\fullwidthtext}{\textwidth}
    \addtolength{\fullwidthtext}{\marginparsep}
    \addtolength{\fullwidthtext}{\marginparwidth}

    \renewcommand*{\listtablename}{Índice de tablas}
    \renewcommand*{\acronymname}{Lista de acrónimos}
}

\RequirePackage{etoolbox}
\BeforeBeginEnvironment{figure*}{%
    \FloatBarrier%
}

%%
% Full width text area
\newenvironment{fullwidth}{%
    \FloatBarrier% Make sure all floats are placed in the document
    \begin{adjustwidth}{}{-\marginhang}
    }
    {\end{adjustwidth}}

%%
% Bibliography
\usepackage[backend=biber,
natbib=true,
style=ieee,
defernumbers=false,
sortcites]{biblatex}
\usepackage{xargs}


%%
% Custom formatting
\renewcommand\sectionformat{
    \fontsize{40}{40}\selectfont\color{accent}\thesection\enskip
}

\renewcommand\subsectionformat{
    \fontsize{20}{10}\selectfont\color{accent}\thesubsection\enskip
}

\renewcommand\subsubsectionformat{
    \normalfont\color{accent}\thesubsubsection\enskip
}

\setkomafont{section}{\LARGE\normalfont\MakeUppercase}
\setkomafont{subsection}{\large\normalfont\MakeUppercase}
\setkomafont{subsubsection}{\normalfont\MakeUppercase}
\setkomafont{paragraph}{\color{accent}\normalfont\MakeUppercase}

\newcommand{\myparagraph}[1]{\paragraph{#1}\mbox{}\\}

\setkomafont{caption}{\small}
\setkomafont{captionlabel}{\normalfont\color{bleu}}
\setkomafont{sectionentry}{\large\normalfont\color{accent}}


\usepackage{caption}
\captionsetup[table]{name=Tabla}
\DeclareCaptionStyle{marginfigure}{labelfont={color=accent},font=footnotesize}
\DeclareCaptionStyle{margintable}{labelfont={color=accent},font=footnotesize}

\DeclareCaptionStyle{widefigure}{
    labelfont={color=accent},
    margin={0cm,\marginhang},
    oneside
}

\DeclareCaptionStyle{sidecaption}{
    labelfont={color=accent}
}

\DeclareCaptionStyle{sidefigure}{
    font=large
}
