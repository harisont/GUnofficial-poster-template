% Poster class for gu with LaTeX.
%
% by Federico Zenith, federico.zenith@gu.no.

\ProvidesClass{guposter}[Unofficial GU poster template]

% Language options
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{tikzposter}}
\ProcessOptions\relax

% For printed posters, replace rgb with cmyk
\PassOptionsToPackage{rgb}{xcolor}

\LoadClass[25pt,a0paper,innermargin=5cm]{tikzposter}

% Load GU-specific graphic elements
\RequirePackage{gucolor} 

\definecolorpalette{gu} {
  \definecolor{bgcolor}{named}{gugray}
  \definecolor{txtcolor}{named}{black}
  \definecolor{titlescolor}{named}{gublue}
}


\definecolorstyle{gu} {}{
  % Background Colors
  \colorlet{backgroundcolor}{bgcolor}
  \colorlet{framecolor}{bgcolor}
  % Title Colors
  \colorlet{titlefgcolor}{titlescolor}
  \colorlet{titlebgcolor}{bgcolor}
  % Block Colors
  \colorlet{blocktitlebgcolor}{white}
  \colorlet{blocktitlefgcolor}{titlescolor}
  \colorlet{blockbodybgcolor}{white}
  \colorlet{blockbodyfgcolor}{black}
  % Innerblock Colors
  \colorlet{innerblocktitlebgcolor}{white}
  \colorlet{innerblocktitlefgcolor}{titlescolor}
  \colorlet{innerblockbodybgcolor}{white}
  \colorlet{innerblockbodyfgcolor}{black}
  % Note colors TODO check what makes sense here
  \colorlet{notefgcolor}{titlescolor}
  \colorlet{notebgcolor}{titlescolor}
  \colorlet{noteframecolor}{txtcolor}
}

\definebackgroundstyle{gu}{
  \draw[inner sep=0pt, line width=0pt, fill=backgroundcolor] 
  (bottomleft) rectangle (topright);
  \node[inner sep=0pt] (gu) at   
  (0.45\paperwidth-9cm,0.5\paperheight-7.5cm)
      {\includegraphics[width=12cm]{images/logo}};
}

\definetitlestyle{gu}{
width=0.85\paperwidth, roundedcorners=0, linewidth=1pt, innersep=0cm,
titletotopverticalspace=5cm, titletoblockverticalspace=2cm
}{}

\renewcommand\TP@maketitle{%
    \begin{minipage}{0.8\titlewidth}
        \color{titlefgcolor}
        {\Huge \textbf{\@title} \par}
        \vspace*{2em}
        {\textcolor{gublue}{\rule{4cm}{2mm}}\par}
        \vspace*{1.5em}
        {\huge \@author \par}
        \vspace*{1em}
        {\Large \@institute}
    \end{minipage}
}

\defineblockstyle{gu}{ 
  titlewidthscale=1, bodywidthscale=1, titleleft,
  titleoffsetx=0pt, titleoffsety=0pt, bodyoffsetx=0mm, bodyoffsety=15mm,
  bodyverticalshift=5mm, roundedcorners=0, linewidth=0pt,
  titleinnersep=1cm, bodyinnersep=1cm
}{
  \draw[color=framecolor, fill=blockbodybgcolor,
  rounded corners=\blockroundedcorners] (blockbody.south west)
  rectangle (blockbody.north east);
  \ifBlockHasTitle
    \draw[color=framecolor, fill=blocktitlebgcolor,
    rounded corners=\blockroundedcorners] (blocktitle.south west) -- 
    (blocktitle.north west) -- (blocktitle.north east) -- (blocktitle.south 
    east);
  \fi
}

\definelayouttheme{gu}{
  \usecolorstyle[colorPalette=gu]{gu}
  \usebackgroundstyle{gu}
  \usetitlestyle{gu}
  \useblockstyle{gu}
}
\usetheme{gu}

\tikzposterlatexaffectionproofoff

% Set font to Calibri, or Times clone for serif
\RequirePackage{carlito,tgtermes}
\renewcommand{\familydefault}{\sfdefault}
