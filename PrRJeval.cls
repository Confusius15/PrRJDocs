\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{PrRJeval}[2025-04-17]

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
\DeclareOption{Ramasse}{}
\DeclareOption{Paysage}{}
\DeclareOption{PortraitDouble}{}
\DeclareOption{PaysageDouble}{}
\ProcessOptions
\relax

\IfClassLoadedWithOptionsTF{PrRJeval}{14pt}{%
    \LoadClass[french,a4paper,twoside]{extarticle}%
}{%
    \IfClassLoadedWithOptionsTF{PrRJeval}{17pt}{%
        \LoadClass[french,a4paper,twoside]{extarticle}%
    }{%
        \IfClassLoadedWithOptionsTF{PrRJeval}{20pt}{%
            \LoadClass[french,a4paper,twoside]{extarticle}%
        }{%
            \IfClassLoadedWithOptionsTF{PrRJeval}{10pt}{%
                \LoadClass[french,a4paper,twoside]{article}%
            }{%
                \IfClassLoadedWithOptionsTF{PrRJeval}{11pt}{%
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
\RequirePackage[a4paper,margin={1in,.8in}]{geometry}
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

\title{Évaluation \chapitre{}}
\setlength{\headheight}{14.5pt}
\addtolength{\topmargin}{-2.5pt}

\IfClassLoadedWithOptionsTF{PrRJeval}{Ramasse}{
    \fancyhead{%
        \ifodd\thepage{%
            \centering
            \noindent
            \begin{minipage}{0.3\linewidth}
                Prénom : \dotfill\medskip
                
                Nom : \dotfill
            \end{minipage}
            \begin{minipage}{0.38\linewidth}
                \centering
                {\bfseries\large Évaluation\\\chapitre{}}\afficheDansLeCorrige{\\Correction}
            \end{minipage}
            \begin{minipage}{0.3\linewidth}
                Date : \dotfill/\dotfill/\dotfill\medskip
                
                Classe : \dotfill\medskip
                
                \if\thepage1{Note :\hfill/\noteMaximale{}}\fi
            \end{minipage}
        
        \vspace{5pt}
        \noindent
        \rule{\linewidth}{1px}
        }%
        \fi
    }
    \addtolength{\headheight}{67pt}
    \addtolength{\headsep}{-67pt}
    \addtolength{\headsep}{30pt}
    \addtolength{\textheight}{-30pt}
}{
    \fancyhead{%
        \ifodd\thepage{%
            \centering
            {\bfseries\large Évaluation \chapitre{} \afficheDansLeCorrige{ Correction}}
        \vspace{5pt}
        \noindent
        \rule{\linewidth}{1px}
        }%
        \fi
    }
    \fancyhead[LR]{}
    \addtolength{\headheight}{51.7pt}
    \addtolength{\headsep}{-51.7pt}
    \addtolength{\headsep}{14.7pt}
    \addtolength{\textheight}{-14.7pt}
}

\NewDocumentCommand{\correction}{m}{%
    \IfClassLoadedWithOptionsTF{PrRJeval}{Correction}{
        #1
    }{
        \underline{\hphantom{\LARGE #1}}%
    }
}

\NewDocumentEnvironment{Correction}{+b}{%
    \IfClassLoadedWithOptionsTF{PrRJeval}{Correction}{
        \medskip

        \noindent\color{red}
        \textbf{Correction}

        #1
    }{}
}

\NewDocumentCommand{\afficheDansLeCorrige}{m}{%
    \IfClassLoadedWithOptionsTF{PrRJeval}{Correction}{
        \textcolor{red}{#1}%
    }{
    
    }
}

\newcounter{myExercice}
\setcounter{myExercice}{0}

\NewDocumentEnvironment{exercice}{so}{%
    \stepcounter{myExercice}
    \noindent
    \textbf{Exercice \themyExercice{}\IfBooleanTF{#1}{ (bonus)}{}} \dotfill \IfNoValueTF{#2}{}{\qquad/#2}

}{\bigskip}

\NewDocumentEnvironment{cours}{so}{%
    \noindent
    \textbf{Question de cours\IfBooleanTF{#1}{ (bonus)}{}} \dotfill \IfNoValueTF{#2}{}{\qquad/#2}
    
}{\bigskip}
            
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