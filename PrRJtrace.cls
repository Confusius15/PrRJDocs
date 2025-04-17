\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PrRJtrace}[2025-04-17]

\DeclareOption{12pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{10pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{11pt}{\PassOptionsToClass{\CurrentOption}{article}}
\DeclareOption{14pt}{%
    \PassOptionsToClass{\CurrentOption}{extarticle}
    \AtBeginDocument{%
        \setlength{\headheight}{17.0pt}
        \addtolength{\topmargin}{-2.5pt}}}
\DeclareOption{17pt}{%
    \PassOptionsToClass{\CurrentOption}{extarticle}
    \AtBeginDocument{%
        \setlength{\headheight}{22.0pt}
        \addtolength{\topmargin}{-7.5pt}}}
\DeclareOption{20pt}{%
    \PassOptionsToClass{\CurrentOption}{extarticle}
    \AtBeginDocument{%
        \setlength{\headheight}{25.0pt}
        \addtolength{\topmargin}{-10.5pt}}}
\DeclareOption{Impression}{}
\ProcessOptions
\relax

\IfClassLoadedWithOptionsTF{PrRJtrace}{14pt}{%
    \LoadClass[french,a4paper,twoside]{extarticle}%
}{%
    \IfClassLoadedWithOptionsTF{PrRJtrace}{17pt}{%
        \LoadClass[french,a4paper,twoside]{extarticle}%
    }{%
        \IfClassLoadedWithOptionsTF{PrRJtrace}{20pt}{%
            \LoadClass[french,a4paper,twoside]{extarticle}%
        }{%
            \IfClassLoadedWithOptionsTF{PrRJtrace}{10pt}{%
                \LoadClass[french,a4paper,twoside]{article}%
            }{%
                \IfClassLoadedWithOptionsTF{PrRJtrace}{11pt}{%
                    \LoadClass[french,11pt,a4paper,twoside]{article}%
                }{%
                    \LoadClass[french,12pt,a4paper,twoside]{article}%
                }
            }
        }
    }
}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{tgheros}
\renewcommand*\familydefault{\sfdefault}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \RequirePackage[a4paper,vmargin=1.5cm,inner=1.5cm,outer=1.5cm,twoside]{geometry}
}{%
    \RequirePackage[a4paper,vmargin=1.5cm,inner=1cm,outer=2.5cm,twoside]{geometry}
}
\RequirePackage{graphicx}
\RequirePackage[group-minimum-digits=4, output-decimal-marker={,}]{siunitx}
\RequirePackage[dvipsnames]{xcolor}
\RequirePackage{pgf}
\RequirePackage{tikz}
\usetikzlibrary{decorations.markings,intersections}
\RequirePackage{tkz-tab}
\RequirePackage{tdsfrmath}
\RequirePackage{mathtools}
\RequirePackage{amssymb}
\RequirePackage{frenchmath}
\RequirePackage{mathrsfs}
\RequirePackage{esvect}
\RequirePackage{multicol}
\RequirePackage[normalem]{ulem}
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{fontawesome5}
\RequirePackage{textcase}
\RequirePackage{array}
\RequirePackage[mode=buildnew]{standalone}
\RequirePackage{qrcode}
\RequirePackage[french]{babel}
\RequirePackage[most,listingsutf8,minted]{tcolorbox}
\RequirePackage{csquotes}
\RequirePackage{ProfCollege}
\RequirePackage{ProfLycee}
\RequirePackage[right,official]{eurosym}
\RequirePackage[pdfusetitle,breaklinks]{hyperref}

\DeclareSIUnit\SIeuro{\text\officialeuro}

\author{\auteur{}}
\date{\anneeScolaire{}}

\pagestyle{fancy}
\fancyhf{}
\renewcommand\headrulewidth{0pt}

% \fancyfoot[C]{
%     \footnotesize\bfseries
%     \auteur{} -- \copyright{} \anneeScolaire{} -- \etablissement{}
% }

\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{}{
    \newlength\ChapterShift
    \newlength\PageShift
    \newlength\StripeWd
    
    % the vertical shift for the chapter title from the upper border of the page
    \setlength\ChapterShift{2cm}
    % the vertical shift for the page number from the lower border of the page
    \setlength\PageShift{2cm}
    % the width of the vertical stripe
    \setlength\StripeWd{2cm}
    
    % the font for chapter title in the stripe
    \def\ChapterFont{\color{white}\Large\sffamily}
    % the font for page number in the stripe
    \def\PageFont{\color{white}\LARGE\bfseries}

    \fancyhead[OR]{%
        \begin{tikzpicture}[remember picture,overlay]
            \shade[top color=orange!30,bottom color=red!50!orange!80!white]
            (current page.north east)
            rectangle
            ([xshift=-\StripeWd]current page.south east);
            \node[
            inner sep=0pt,
            anchor=north west,
            font=\ChapterFont,
            rotate=-90
            ]
            at ([xshift=-0.4\StripeWd,yshift=-\ChapterShift]current page.north east)
            {\nomChapitreU{}};
            \node[
            inner sep=0pt,
            anchor=north,
            font=\PageFont,
            ]
            at ([xshift=-0.5\StripeWd,yshift=\PageShift]current page.south east)
            {\small Chapitre};
            \node[
            inner sep=0pt,
            anchor=north,
            font=\PageFont,
            ]
            at ([xshift=-0.5\StripeWd,yshift=\PageShift-.7cm]current page.south east)
            {\numeroChapitre{}};
            \node[
            ]
            at ([xshift=-0.5\StripeWd,yshift=\PageShift+1.3cm]current page.south east)
            % {\includestandalone[width=.095\textwidth]{memoji}};
            {\includegraphics[width=.13\textwidth]{hmmm.png}};
        \end{tikzpicture}%
    }
    \fancyhead[EL]{%
        \begin{tikzpicture}[remember picture,overlay]
            \fill[top color=orange!30,bottom color=red!50!orange!80!white]
            (current page.north west)
            rectangle
            ([xshift=\StripeWd]current page.south west);
            \node[
            inner sep=0pt,
            anchor=south east,
            font=\ChapterFont,
            rotate=90
            ]
            at ([xshift=0.6\StripeWd,yshift=-\ChapterShift]current page.north west)
            {\nomChapitreU{}};
            \node[
            inner sep=0pt,
            anchor=north,
            font=\PageFont,
            ]
            at ([xshift=0.5\StripeWd,yshift=\PageShift]current page.south west)
            {\small Chapitre};
            \node[
            inner sep=0pt,
            anchor=north,
            font=\PageFont,
            ]
            at ([xshift=0.5\StripeWd,yshift=\PageShift-.7cm]current page.south west)
            {\numeroChapitre{}};
            \node[
            ]
            at ([xshift=0.5\StripeWd,yshift=\PageShift+1.3cm]current page.south west)
            {\includegraphics[width=.13\textwidth]{hmmm.png}};
        \end{tikzpicture}%
    }
}
\fancyfoot[C]{
    \footnotesize\color{orange!80!red}\bfseries
    \auteur{} -- \copyright{} \anneeScolaire{} -- \etablissement{}
}

\renewcommand{\headrulewidth}{0px}
\setlength{\headheight}{14.5pt}
\addtolength{\topmargin}{-2.5pt}

\definecolor{myblue}{RGB}{0, 128, 255}

\NewDocumentCommand{\important}{m}{\textcolor{red}{\textbf{\emph{#1}}}}

\NewDocumentCommand{\voirAussi}{m}{\hfill\faHandPointRight[regular]{} #1}

\NewDocumentCommand{\youtube}{mm}{\voirAussi{\href{#1}{\textcolor{red}{\faYoutube{}} #2}}}

\NewDocumentCommand{\geogebra}{mm}{\voirAussi{\href{#1}{
    \begin{tikzpicture}[scale=.5]
        \begin{scope}[rotate=25.82]
            \fill[fill=gray!60,even odd rule]
            (6.1990900750710492078pt,-18.897559466551328011pt) ellipse [x radius=12.511288869636635019pt, y radius=10.2937169796969630915pt]
            (6.1990900750710492078pt,-18.897559466551328011pt) ellipse [x radius=10.311288869636635019pt, y radius=8.0937169796969630915pt];
        \end{scope}
        \begin{scope}[yscale=-1]
            \foreach \x/\y in {13.2/4.9, 3.8/11.8, 7.2/22.9, 20.1/21.2, 24.4/10.1} {
                \fill[black] (\x pt,\y pt) circle[radius=3pt];
                \fill[blue!60] (\x pt,\y pt) circle[radius=2.15pt];
            }
        \end{scope}
    \end{tikzpicture} #2}}}

\NewDocumentCommand{\chapitre}{mm}{
    \NewDocumentCommand{\numeroChapitre}{}{#1}
    \NewDocumentCommand{\nomChapitre}{}{#2}
    \NewDocumentCommand{\nomChapitreU}{}{\MakeUppercase{#2}}
    \title{#2}
}

\tcbset{titreAttache/.style={%
    attach boxed title to top left={xshift=4mm,yshift=-2mm},
    fonttitle=\bfseries,
}}

\NewDocumentCommand{\titreChapitre}{}{
    \begin{tcolorbox}[
        colback=white,
        colframe=red,
        width=\textwidth,
        enhanced,
        title=Chapitre~\no\numeroChapitre{},
        coltitle=red,
        titreAttache,
        boxed title style={
            colback=white,
        },
        ]
        \centering
        {
            \bfseries
            \Large
            \color{red}
            \nomChapitre{}
        }
    \end{tcolorbox}
}
    
\renewcommand{\thesection}{\Roman{section}}

\titleformat{\section}{%
    \color{Green}
    \normalfont
    \Large
    \bfseries
}{
    \uline{\thesection)\hspace{4pt}}
}{0pt}{\hspace{-6pt}\Large\bfseries \uline{#1}}

\renewcommand{\thesubsection}{\Alph{subsection}}

\titleformat{\subsection}{%
    \color{blue}
    \normalfont
    \large
    \bfseries
}{
    \uline{\thesubsection)\hspace{4pt}}
}{0pt}{\hspace{-6pt}\large\bfseries \uline{#1}}

\renewcommand{\thesubsubsection}{\arabic{subsubsection}}

\titleformat{\subsubsection}{%
    \color{black}
    \normalfont
    \normalsize
    \bfseries
}{
    \uline{\thesubsubsection)\hspace{4pt}}
}{0pt}{\hspace{-6pt}\normalsize\bfseries \uline{#1}}

\color{myblue}

\tcbset{starred/.style={
    overlay={\begin{scope}[shift={([yshift=3mm]frame.north west)},scale=.15,rotate=90]
        \IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
            \draw[yellow!60!orange, very thick] (0:2) -- (36:1) -- (72:2) -- (108:1) -- (144:2) -- (180:1) -- (216:2) -- (252:1) -- (288:2) -- (326:1) -- cycle;
        }{%
            \filldraw[fill=yellow!70!orange,draw=yellow!60!orange, very thick] (0:2) -- (36:1) -- (72:2) -- (108:1) -- (144:2) -- (180:1) -- (216:2) -- (252:1) -- (288:2) -- (326:1) -- cycle;
            \draw[yellow!60!orange] (0:2) -- (180:1)
            (36:1) -- (216:2)
            (72:2) -- (252:1)
            (108:1) -- (288:2)
            (144:2) -- (326:1);
        }
    \end{scope}
}}}

\tcbset{starred2/.style={
    overlay={\begin{scope}[shift={([xshift=.3mm,yshift=-2.5mm]frame.north west)},scale=.15,rotate=90]
        \IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
            \draw[yellow!60!orange, very thick,fill=white] (0:2) -- (36:1) -- (72:2) -- (108:1) -- (144:2) -- (180:1) -- (216:2) -- (252:1) -- (288:2) -- (326:1) -- cycle;
        }{%
            \filldraw[fill=yellow!70!orange,draw=yellow!60!orange, very thick] (0:2) -- (36:1) -- (72:2) -- (108:1) -- (144:2) -- (180:1) -- (216:2) -- (252:1) -- (288:2) -- (326:1) -- cycle;
            \draw[yellow!60!orange] (0:2) -- (180:1)
            (36:1) -- (216:2)
            (72:2) -- (252:1)
            (108:1) -- (288:2)
            (144:2) -- (326:1);
        }
    \end{scope}
}}}

\tcbset{objectifsStyle/.style={%
    colback=white,
    colframe=orange,
    width=\textwidth,
    enhanced,
    title={À la fin du chapitre, je saurai\dots},
    fonttitle=\bfseries,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{objectifsStyle/.append style={%
        colbacktitle=white,
        coltitle=orange,
    }}
}{%
    \tcbset{objectifsStyle/.append style={%
        coltitle=white,
    }}
}

\NewTColorBox{objectifs}{}{
        objectifsStyle,
    }

\tcbset{definitionStyle/.style={%
    colframe=Purple,
    colupper=myblue,
    width=\textwidth,
    enhanced,
    titreAttache,
    breakable,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{definitionStyle/.append style={%
        colback=white,
        colbacktitle=white,
        coltitle=Purple,
    }}
}{%
    \tcbset{definitionStyle/.append style={%
        colback=Purple!5!white,
        colbacktitle=Purple,
        coltitle=white,
    }}
}

\NewTColorBox{definition}{sO{Définition}}{
        definitionStyle,
        title={#2},
        \IfBooleanT{#1}{starred}
    }

\tcbset{exempleStyle/.style={%
    colframe=Rhodamine,
    colupper=myblue,
    width=\textwidth,
    enhanced,
    titreAttache,
    breakable,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{exempleStyle/.append style={%
        colback=white,
        colbacktitle=white,
        coltitle=Rhodamine,
    }}
}{%
    \tcbset{exempleStyle/.append style={%
        colback=Rhodamine!5!white,
        colbacktitle=Rhodamine,
        coltitle=white,
    }}
}

\NewTColorBox{exemple}{sO{Exemple}}{
        exempleStyle,
        title={#2},
        \IfBooleanT{#1}{starred}
    }

\tcbset{remarqueStyle/.style={%
    colframe=RoyalBlue,
    colupper=myblue,
    width=\textwidth,
    enhanced,
    titreAttache,
    breakable,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{remarqueStyle/.append style={%
        colback=white,
        colbacktitle=white,
        coltitle=RoyalBlue,
    }}
}{%
    \tcbset{remarqueStyle/.append style={%
        colback=RoyalBlue!5!white,
        colbacktitle=RoyalBlue,
        coltitle=white,
    }}
}

\NewTColorBox{remarque}{sO{Remarque}}{
        remarqueStyle,
        title={#2},
        \IfBooleanT{#1}{starred}
    }

\tcbset{proprieteStyle/.style={%
    colframe=BurntOrange,
    colupper=myblue,
    width=\textwidth,
    enhanced,
    titreAttache,
    breakable,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{proprieteStyle/.append style={%
        colback=white,
        colbacktitle=white,
        coltitle=BurntOrange,
    }}
}{%
    \tcbset{proprieteStyle/.append style={%
        colback=BurntOrange!5!white,
        colbacktitle=BurntOrange,
        coltitle=white,
    }}
}

\NewTColorBox{propriete}{sO{Propriété}}{
        proprieteStyle,
        title={#2},
        \IfBooleanT{#1}{starred}
    }

\tcbset{theoremeStyle/.style={%
    colframe=OrangeRed,
    colupper=myblue,
    width=\textwidth,
    enhanced,
    titreAttache,
    breakable,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{theoremeStyle/.append style={%
        colback=white,
        colbacktitle=white,
        coltitle=OrangeRed,
    }}
}{%
    \tcbset{theoremeStyle/.append style={%
        colback=OrangeRed!5!white,
        colbacktitle=OrangeRed,
        coltitle=white,
    }}
}

\NewTColorBox{theoreme}{sO{Théorème}}{
        theoremeStyle,
        title={#2},
        \IfBooleanT{#1}{starred}
    }

\tcbset{demonstrationStyle/.style={%
    colframe=YellowGreen,
    colupper=myblue,
    width=\textwidth,
    enhanced,
    titreAttache,
    breakable,
}}
\IfClassLoadedWithOptionsTF{PrRJtrace}{Impression}{%
    \tcbset{demonstrationStyle/.append style={%
        colback=white,
        colbacktitle=white,
        coltitle=YellowGreen,
    }}
}{%
    \tcbset{demonstrationStyle/.append style={%
        colback=YellowGreen!5!white,
        colbacktitle=YellowGreen,
        coltitle=white,
    }}
}

\NewTColorBox{demonstration}{sO{Démonstration}}{
        demonstrationStyle,
        title={#2},
        \IfBooleanT{#1}{starred}
    }

\NewDocumentCommand{\CQFD}{}{\hfill$\square$}

\NewTColorBox{exercice}{sO{Exercice}}{
    colback=white,
    colframe=white,
    borderline west={2pt}{0pt}{myblue},
    colupper=myblue,
    fonttitle=\bfseries,
    coltitle=myblue,
    colbacktitle=white,
    enhanced,
    title={#2},
    \IfBooleanT{#1}{starred2}
}
        
\NewDocumentCommand{\grilleSeyes}{O{40}mmmm}{
    \draw[line width=0.3mm,xstep=8mm,ystep=2mm,Cyan!#1] (#2,#3) grid (#4,#5);
    \draw[line width=0.3mm,xstep=8mm,ystep=8mm,Plum!#1] (#2,#3) grid (#4,#5);
}

\NewDocumentEnvironment{grapheTikZ}{ommmmo+b}{
    \begin{center}
        \IfNoValueTF{#1}{
            \begin{tikzpicture}[domain=#2:#4]
                \clip (#2,#3) rectangle (#4,#5);
                \IfNoValueTF{#6}{
                    \draw (#2,#3) grid (#4,#5);
                }{
                    \draw[#6] (#2,#3) grid (#4,#5);
                }
                \draw[->,>=stealth,thick] (#2,0) -- (#4,0);
                \draw[->,>=stealth,thick] (0,#3) -- (0,#5);
                #7
            \end{tikzpicture}
        }{
            \begin{tikzpicture}[#1,domain=#2:#4]
                \clip (#2,#3) rectangle (#4,#5);
                \IfNoValueTF{#6}{
                    \draw (#2,#3) grid (#4,#5);
                }{
                    \draw[#6] (#2,#3) grid (#4,#5);
                }
                \draw[->,>=stealth,thick] (#2,0) -- (#4,0);
                \draw[->,>=stealth,thick] (0,#3) -- (0,#5);
                #7
            \end{tikzpicture}
        }
    \end{center}
}{}