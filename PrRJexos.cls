\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PrRJexos}[2025-04-17]

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
\DeclareOption{Correction}{}
\DeclareOption{Paysage}{}
\DeclareOption{PortraitDouble}{}
\DeclareOption{PaysageDouble}{}
\ProcessOptions
\relax

\IfClassLoadedWithOptionsTF{PrRJexos}{14pt}{%
    \LoadClass[french,a4paper,twoside]{extarticle}%
}{%
    \IfClassLoadedWithOptionsTF{PrRJexos}{17pt}{%
        \LoadClass[french,a4paper,twoside]{extarticle}%
    }{%
        \IfClassLoadedWithOptionsTF{PrRJexos}{20pt}{%
            \LoadClass[french,a4paper,twoside]{extarticle}%
        }{%
            \IfClassLoadedWithOptionsTF{PrRJexos}{10pt}{%
                \LoadClass[french,a4paper,twoside]{article}%
            }{%
                \IfClassLoadedWithOptionsTF{PrRJexos}{11pt}{%
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
\IfClassLoadedWithOptionsTF{PrRJexos}{Paysage}{
    \RequirePackage[a4paper,margin={.6in,.7in},twocolumn,landscape]{geometry}
}{
    \RequirePackage[a4paper,margin={.8in,.8in}]{geometry}
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

\fancyfoot[C]{
    \footnotesize\bfseries
    \auteur{} -- \copyright{} \anneeScolaire{} -- \etablissement{}
}

\title{Fiche d'exercice}
\newcounter{myExercice}
\setcounter{myExercice}{0}

\NewDocumentEnvironment{exercice}{sod<>}{%
    \stepcounter{myExercice}
    \noindent
    \textbf{Exercice \themyExercice{}\IfBooleanTF{#1}{ (type)}{}}
    \IfNoValueTF{#2}{}{
        \ifx1#2{
            \hspace{-5px}\etoile{}\hspace{-5px}
        }\else{
            \ifx2#2{
                \hspace{-9px}\etoile{}\etoile{}\hspace{-9px}
            }\else{
                \ifx3#2{
                    \hspace{-13px}\etoile{}\etoile{}\etoile{}\hspace{-13px}
                }\else{
                    \ifx4#2{
                        \hspace{-17px}\etoile{}\etoile{}\etoile{}\etoile{}\hspace{-17px}
                    }\else{
                        \ifx5#2{
                            \hspace{-21px}\etoile{}\etoile{}\etoile{}\etoile{}\etoile{}\hspace{-21px}
                        }\else{}
                        \fi
                    }
                    \fi
                }
                \fi
            }
            \fi
        }
        \fi
    }
    \dotfill
    \IfNoValueTF{#3}{}{
        [Obj. #3]
    }

}{\bigskip}

\NewDocumentCommand{\etoile}{}{
    \begin{tikzpicture}[scale=.1]
        \draw[very thick,rotate=15] (0:2) -- (36:1) -- (72:2) -- (108:1) -- (144:2) -- (180:1) -- (216:2) -- (252:1) -- (288:2) -- (326:1) -- cycle;
    \end{tikzpicture}
}

\NewDocumentEnvironment{Correction}{+b}{%
    \IfClassLoadedWithOptionsTF{PrRJexos}{Correction}{
        \medskip

        \noindent\color{red}
        \textbf{Correction}

        #1
    }{}
}{}

\NewDocumentCommand{\afficheDansLeCorrige}{m}{%
    \ifx\printanswers\undefined{}%
    \else{%
        \textcolor{red}{#1}%
    }%
    \fi
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