%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}


%%%%%%%%%%
% Colors %
%%%%%%%%%%
% \RequirePackage[default]{sourcesanspro}
\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}
\definecolor{pblue}{HTML}{0395DE}%ADDITIONAL HERE

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}% {GRAY}
  \colorlet{header}{white}%{WHITE}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

% \RequirePackage[quiet]{fontspec}
% \RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
% 
% \newfontfamily\bodyfont[]{Helvetica Neue}
% \newfontfamily\thinfont[]{Helvetica Neue UltraLight}
% \newfontfamily\headingfont[]{Helvetica Neue Condensed Bold}
% 
% \defaultfontfeatures{Mapping=tex-text}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Helvetica Neue Light}
% 
% \setmathfont{XITS Math}

%%%%% MODIFY BY BIZOS
%\RequirePackage[quiet]{fontspec}
%%
%\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
%\RequirePackage{sourcesanspro}
%\newfontfamily\bodyfont[]{Source Sans Pro Regular}
%\newfontfamily\thinfont[]{Source Sans Pro ExtraLight}
%\newfontfamily\headingfont[]{Source Sans Pro Black}
%%
%\defaultfontfeatures{Mapping=tex-text}
%
%\setmainfont[Mapping=tex-text, Color=textcolor]{Source Sans Pro Light}
%
%\setmathfont{texgyreheros-regular.otf}
%%%%%%
%------------------------------------------------------------------

\RequirePackage[quiet]{fontspec}
\RequirePackage{sourcesanspro}
\RequirePackage[math-style=TeX,vargreek-shape=unicode]{unicode-math}
\newfontfamily\bodyfont
[BoldFont=SourceSans Pro Black,
ItalicFont=SourceSansPro-It,
BoldItalicFont=SourceSansPro-BoldIt]
{Source Sans Pro}
\newfontfamily\thinfont[]{Source Sans Pro Light}
% or for thiner version
%\newfontfamily\thinfont[]{Lato-Hairline.ttf}
%\newfontfamily\headingfont[]{texgyreheros-bold.otf}
\newfontfamily\headingfont[]{Source Sans Pro Black}
\defaultfontfeatures{Mapping=tex-text}
\setmainfont
[Mapping=tex-text, Color=textcolor,
BoldFont=Source Sans Pro Black,
ItalicFont=SourceSansPro-It,
BoldItalicFont=SourceSansPro-BoldIt
]
{Source Sans Pro}

\setmathfont{Source Sans Pro}


%--------------------------------------------------------------
%%%%%%%%%%
% Header % HERE YOU CAN CHANGE THE photo
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=3cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{30pt}{62pt}\color{header}%
      {\thinfont #1}{\bodyfont  #2}
    };
    \node [anchor=1] at (name.181.7) {%
      \fontsize{14pt}{24pt}\color{pblue}%
      \bodyfont #3%
    };
%    \node [anchor=north east] at (current page.north east)  {\includegraphics[scale=0.8]{img/Photo}};
\node [rectangle, anchor=north east, minimum width=5cm] (box) at (current page.north east) (node1) {};
    \node [rectangle, anchor=north, minimum width=2cm] (box) at (current page.north east) at (node1.north)  {\fcolorbox{pblue}{pblue}{\includegraphics[width=2cm]{img/Photo}}};
  \end{tikzpicture}
  \vspace{1.0cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

%\newcounter{colorCounter}
%\def\@sectioncolor#1#2#3{%
%  {%
%    \color{%
%      \ifcase\value{colorCounter}%
%        blue\or%
%        red\or%
%        orange\or%
%        green\or%
%        purple\else%
%        headercolor\fi%
%    } #1#2#3%
%  }%
%  \stepcounter{colorCounter}%
%}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        gray\or%
        gray\or%
        gray\or%
        gray\or%
        pblue\else%
        pblue\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
 %\par\vspace{\parskip}
  {%
    \LARGE\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{0.15\parskip}
}

\renewcommand{\subsection}[2]{
  \par\vspace{.5\parskip}%
  \Large\headingfont\color{headercolor} #2%
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{13.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=pblue} #3}\\%
    #4\vspace{0.13cm}%
  }\\}


%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{pblue} ##1}
  }
  \begin{textblock}{3.6}(0.6, 2.8)%BIZOS NOTE: here change the position
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}

%%%%%%%%%%%%%%%%
% Bibliography %
%%%%%%%%%%%%%%%%

\RequirePackage[style=verbose, maxnames=99, sorting=ydnt]{biblatex}

\DeclareFieldFormat[article]{title}{#1\par}
\DeclareFieldFormat[inproceedings]{title}{#1\par}
\DeclareFieldFormat[misc]{title}{#1\par}
\DeclareFieldFormat[report]{title}{#1\par}

\DeclareBibliographyDriver{article}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \usebibmacro{journal+issuetitle}%
    \setunit{\space}%
    \printfield{pages}%
    \newunit%
    \printlist{publisher}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{inproceedings}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}%
    \printfield{booktitle}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{misc}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{booktitle}%
    \setunit*{\addcomma\space}%
    \printfield{note}%
    \setunit*{\addcomma\space}%
    \printfield{year}%
    \setunit{\addcomma\space}%
    \printlist{location}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareBibliographyDriver{report}{%
  \printfield{title}%
  \newblock%
  \printnames{author}%
  \par%
  \newblock%
  {%
    \footnotesize\addfontfeature{Color=lightgray}\itshape%
    \printfield{type}%
    \setunit{\space}%
    \printfield{number}%
    \setunit{\addcomma\space}%
    \printfield{year}%
    \newunit%
  }
  \par\vspace{0.3\baselineskip}
}

\DeclareNameFormat{author}{%
  \small\addfontfeature{Color=lightgray}%
  \ifblank{#3}{}{#3\space}#1%
  \ifthenelse{\value{listcount}<\value{liststop}}
    {\addcomma\space}
    {}%
}

\newcommand{\printbibsection}[2]{
  \begin{refsection}
    \nocite{*}
    \printbibliography[sorting=chronological, type={#1}, title={#2}, heading=subbibliography]
  \end{refsection}
}

\DeclareSortingScheme{chronological}{
  \sort[direction=descending]{\field{year}}
  \sort[direction=descending]{\field{month}}
}



%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=4.8cm,top=2cm,right=1.1cm,bottom=0.001cm,nohead,nofoot]{geometry}
\RequirePackage{hyperref}

%%%%%%%%%%%%%%
% skype symbol%
%%%%%%%%%%%%%%%

\newcommand{\linkedin}{%
\begin{tikzpicture}[y=0.80pt, x=0.8pt,yscale=-1, inner sep=0pt, outer sep=0pt,opacity=0.4]
  \begin{scope}[cm={{0.59444,0.0,0.0,0.59444,(346.38938,123.06674)}}]
    \path[fill=black] (380.7408,201.6221) -- (434.0804,201.6221) .. controls
      (438.6572,201.6221) and (442.3417,205.3067) .. (442.3417,209.8835) --
      (442.3417,263.5823) .. controls (442.3417,268.1591) and (438.6572,271.8436) ..
      (434.0804,271.8436) -- (380.7408,271.8436) .. controls (376.1640,271.8436) and
      (372.4794,268.1591) .. (372.4794,263.5823) -- (372.4794,209.8835) .. controls
      (372.4794,205.3067) and (376.1640,201.6221) .. (380.7408,201.6221) -- cycle;
    \begin{scope}[xscale=0.981,yscale=1.019,fill=white]
      \path[fill=white] (402.5597,253.0812) -- (402.5597,223.9631) --
        (393.5086,223.9631) -- (393.5086,253.0812) -- cycle(398.0937,211.3394) ..
        controls (396.6162,211.3680) and (395.4476,211.8021) .. (394.5879,212.6419) ..
        controls (393.7282,213.4818) and (393.2891,214.5561) .. (393.2705,215.8649) ..
        controls (393.2879,217.1476) and (393.7146,218.2145) .. (394.5507,219.0655) ..
        controls (395.3868,219.9165) and (396.5281,220.3581) .. (397.9746,220.3904) ..
        controls (399.5067,220.3582) and (400.7001,219.9165) .. (401.5548,219.0655) ..
        controls (402.4095,218.2145) and (402.8437,217.1476) .. (402.8574,215.8649) ..
        controls (402.8152,214.5561) and (402.3785,213.4818) .. (401.5474,212.6419) ..
        controls (400.7162,211.8021) and (399.5650,211.3679) .. (398.0937,211.3394) --
        cycle;
      \path[fill=white] (409.7910,253.0812) -- (418.8420,253.0812) --
        (418.8420,236.2892) .. controls (418.8400,235.8674) and (418.8594,235.4605) ..
        (418.9015,235.0685) .. controls (418.9437,234.6765) and (419.0231,234.3291) ..
        (419.1397,234.0264) .. controls (419.4635,233.1556) and (420.0068,232.3815) ..
        (420.7698,231.7041) .. controls (421.5327,231.0268) and (422.5375,230.6695) ..
        (423.7843,230.6323) .. controls (425.4081,230.6609) and (426.5817,231.2439) ..
        (427.3049,232.3815) .. controls (428.0282,233.5190) and (428.3830,235.0400) ..
        (428.3693,236.9442) -- (428.3693,253.0812) -- (437.4203,253.0812) --
        (437.4203,235.8724) .. controls (437.3582,231.5975) and (436.3658,228.4316) ..
        (434.4430,226.3748) .. controls (432.5202,224.3180) and (430.0391,223.2958) ..
        (426.9998,223.3081) .. controls (424.5633,223.3851) and (422.6033,223.9309) ..
        (421.1196,224.9456) .. controls (419.6359,225.9604) and (418.5988,226.9826) ..
        (418.0083,228.0123) -- (417.8297,228.0123) -- (417.4129,223.9631) --
        (409.5528,223.9631) .. controls (409.6148,225.2695) and (409.6694,226.6911) ..
        (409.7165,228.2281) .. controls (409.7636,229.7652) and (409.7884,231.4399) ..
        (409.7909,233.2523) -- cycle;
    \end{scope}
  \end{scope}
\end{tikzpicture}
}

