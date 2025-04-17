\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PrRJplan}[2025-04-17]

\DeclareOption{Publique}{}
\DeclareOption{Couleur}{}
\DeclareKeys
{
    datePlan.store = \datePlan,
    datePlan.usage = load
}
\ProcessOptions
\ProcessKeyOptions\relax

\LoadClass[10pt]{standalone}

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{tgheros}
\renewcommand*\familydefault{\sfdefault}
\RequirePackage{tikz}
\IfClassLoadedWithOptionsTF{PrRJplan}{Publique}{
    \tikzset{orientation/.style={rotate=180}}
}{
    \tikzset{orientation/.style={rotate=0}}
}

\NewDocumentCommand{\eleve}{ssmomom}{
    \IfClassLoadedWithOptionsTF{PrRJplan}{Publique}{
        \IfNoValueTF{#6}
        {
            \node at (#3) {\small #5};
        }
        {
            \node at (#3) {\small #6};
        }
    }{
        \IfClassLoadedWithOptionsTF{PrRJplan}{Couleur}{
            \IfNoValueTF{#4}{}
            {
                \fill[#4,fill opacity=.1] (#3)+(-1.5,1) rectangle ++(1.5,-1);
            }
        }{}
        \node[shift={(-.35,.4)}] at (#3) {\tiny Abs./Ret.};
        \node[shift={(.5,.4)}] at (#3) {\tiny TNF};
        \node[shift={(-.5,-.4)}] at (#3) {\tiny Cpt.};
        \node[shift={(.55,-.4)}] at (#3) {\tiny AO};
        \IfBooleanTF{#2}{
            \node[yshift=4,red] at (#3) {\tiny \uppercase{#7}};
            \node[yshift=-4,red] at (#3) {\footnotesize #5};
        }{
            \IfBooleanTF{#1}{
                \node[yshift=4,orange] at (#3) {\tiny \uppercase{#7}};
                \node[yshift=-4,orange] at (#3) {\footnotesize #5};
            }{
                \node[yshift=4] at (#3) {\tiny \uppercase{#7}};
                \node[yshift=-4] at (#3) {\footnotesize #5};
            }
        }
    }
}

\NewDocumentCommand{\plan}{}{
    \foreach \i in {0,1,2} {
        \foreach \j in {0,1,...,5} {
            \begin{scope}[xshift=6.5*\i cm,yshift=-2.5*\j cm]
                \draw (0,0) rectangle +(6,-2);
                \draw (3,0) -- (3,-2);
            \end{scope}
        }
    }
    \draw (13,-15) rectangle +(6,-2);
    \coordinate (A1) at (1.5,-13.5);
    \coordinate (B1) at (4.5,-13.5);
    \coordinate (C1) at (8,-13.5);
    \coordinate (D1) at (11,-13.5);
    \coordinate (E1) at (14.5,-13.5);
    \coordinate (F1) at (17.5,-13.5);
    \coordinate (A2) at (1.5,-11);
    \coordinate (B2) at (4.5,-11);
    \coordinate (C2) at (8,-11);
    \coordinate (D2) at (11,-11);
    \coordinate (E2) at (14.5,-11);
    \coordinate (F2) at (17.5,-11);
    \coordinate (A3) at (1.5,-8.5);
    \coordinate (B3) at (4.5,-8.5);
    \coordinate (C3) at (8,-8.5);
    \coordinate (D3) at (11,-8.5);
    \coordinate (E3) at (14.5,-8.5);
    \coordinate (F3) at (17.5,-8.5);
    \coordinate (A4) at (1.5,-6);
    \coordinate (B4) at (4.5,-6);
    \coordinate (C4) at (8,-6);
    \coordinate (D4) at (11,-6);
    \coordinate (E4) at (14.5,-6);
    \coordinate (F4) at (17.5,-6);
    \coordinate (A5) at (1.5,-3.5);
    \coordinate (B5) at (4.5,-3.5);
    \coordinate (C5) at (8,-3.5);
    \coordinate (D5) at (11,-3.5);
    \coordinate (E5) at (14.5,-3.5);
    \coordinate (F5) at (17.5,-3.5);
    \coordinate (A6) at (1.5,-1);
    \coordinate (B6) at (4.5,-1);
    \coordinate (C6) at (8,-1);
    \coordinate (D6) at (11,-1);
    \coordinate (E6) at (14.5,-1);
    \coordinate (F6) at (17.5,-1);
    \node at (16,-16) {\textbf{BUREAU}};
    \IfClassLoadedWithOptionsTF{PrRJplan}{Publique}{}{
        \node at (3,-16) {Séance du :};
        \draw (4.5,-16.5) -- (10,-16.5);
        \node[rotate=90] at (20,-15) {\tiny Plan à la date du \datePlan};
    }
}