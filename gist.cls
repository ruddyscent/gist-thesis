% -*- coding: utf-8 -*-
%
% Original Title: kaist.cls
% Original Author: Unknown, KAIST
% Date: Unknown
%
% LaTeX class file for GIST thesis
%
% Modification Log:
% -----------------
% .01 Nov/21/96 S.H. Lee Set page dimensions
% .02 Dec/30/96 Y. Chung Redefine plain pagestyle
%                        Reformat and rearrage cover sheets
% .03 Jan/14/97 Y. Chung Added dedication page
% .04 Jan/17/97 S.H. Lee Correct the page mismatching
% .05 Nov/25/98 S.H. Lee Enable more referees up to 7
% .06 Dec/25/98 S.H. Lee Respell "&" to "and"
% .07 Jun/30/99 S.H. Lee Added Curriculum Vitae
% .08 Jul/01/99 S.H. Lee Support Hangul thesis
% .09 Jan/01/00 S.H. Lee Support doctoral dissertation
% .10 Dec/03/03 K. Chun  Fixed the region name
% .11 Jan/03/04 K. Chun  Added "publication'' tag
% .12 Nov/22/07 H. Kim   Fixed and added some comments
% .13 Nov/22/07 H. Kim   Respelled "ProvidesClass{kjist}" to "ProvidesClass{gist}"
% .14 Nov/22/07 H. Kim   Edited and respelled "[1996/12/30 Document class for K-JIST thesis]" to "[2007/11/23 Document class for GIST thesis]"
% .15 Nov/22/07 H. Kim   Respelled all "Kwangju" to "Gwangju"
% .16 Nov/23/07 H. Kim   Added a definition about "School of Information and Mechatronics"
% .17 Nov/23/07 H. Kim   Inserted "School of" to several places where it is necessary
% .18 Nov/24/07 H. Kim   Defined 'scode' for the code of school
% .19 Oct/31/12 K. Chun  Changed the character encoding to utf-8.
%                        Removed 'scode', and reflected the current department system.
%                        Support multiple awards.
%
% .20 Dec/13/12 K. Chun  Added a space in a korean degree title.
%                        Enabled the description of total page on the abstract.

% ToDos
%
% * 'Publications' should be classified depending on the type.
% * The long caption of floats exceeds the lower page boundary.
% * The long word exceeds the right page boundary.
% * Migration to LaTeX2e or LaTeX3
% * Remove a blank page with no page number after a 'acknowledgement'.
% * Make correct the wrong hyperlinks in the preambles.

% Identify gist class file.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{gist}[2012/10/31 Document class for GIST thesis]

% Load existing classes or packages.
\LoadClass[12pt,oneside,a4paper]{report}
\RequirePackage{kotex}
\RequirePackage{ifpdf}
\newcommand\myDRIVER{\ifpdf pdftex\else dvipdfm\fi}
\RequirePackage[\myDRIVER,unicode,bookmarks]{hyperref}
\RequirePackage{graphicx, subfigure}
\RequirePackage{amssymb, amsthm, amsmath}
\RequirePackage[sort&compress,square,numbers]{natbib}
\RequirePackage{makeidx}
\RequirePackage{lastpage}

% Redefine plain pagestyle.
\renewcommand\ps@plain{
  \def\@oddhead{}
  \def\@oddfoot{
    \rm\hfil-- \thepage\ -- \hfil}
  \def\@evenhead{}
  \let\@evenfoot\@oddfoot
}

\DeclareOption{korean}{\gdef\@korean{}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions

\AtBeginDocument{\make@covertitle}

\newcommand{\gistename}{Gwangju Institute of Science and Technology}
\newcommand{\gistkname}{광주과학기술원}
\newcommand{\gistknamen}{광 주 과 학 기 술 원}

\setlength{\topmargin}{10mm}
\setlength{\oddsidemargin}{4mm}
\setlength{\evensidemargin}{\oddsidemargin}
\setlength{\textwidth}{155mm}
\setlength{\textheight}{224mm}
\setlength{\footskip}{14mm}
\setlength{\headheight}{0mm}
\setlength{\headsep}{=0mm}
\setlength{\topskip}{0mm}
\setlength{\overfullrule}{0pt}
\renewcommand{\baselinestretch}{2.0}
\renewcommand{\bibname}{References}
\def\code#1{\def\@code{#1}}
\def\emajor#1{\def\@emajor{#1}}
\def\kmajor#1{\def\@kmajor{#1}}
\def\etitle#1{\def\@etitle{#1}}
\def\ktitle#1{\def\@ktitle{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\coadvisor#1{\def\@coadvisor{#1}}
\def\kadvisor#1{\def\@kadvisor{#1}}
\def\kcoadvisor#1{\def\@kcoadvisor{#1}}
\def\ename#1{\def\@ename{#1}}
\def\kname#1{\def\@kname{#1}}
\def\studentid#1{\def\@studentid{#1}}
\def\coveryear#1{\def\@coveryear{#1}}
\def\advisorsigndate#1#2#3{\def\@advisorsigndate{#1 #2, #3}}

\ifx\@korean\@@@@undefined@@@@
\def\refereesigndate#1#2#3{\def\@refereesigndate{#1 #2, #3}}
\def\@reftitlea{Thesis Advisor}
\def\@reftitleb{Committee Member}
\def\birthday#1#2#3{\def\@birthday{#1 #2, #3}}
\else
\def\refereesigndate#1#2#3{\def\@refereesigndate{#1년 #2월 #3일}}
\def\@reftitlea{심사위원장}
\def\@reftitleb{심~사~위~원}
\def\birthday#1#2#3{\def\@birthday{#1년 #2월 #3일}}
\fi

\def\refereeA#1{\def\@refereeA{#1}}
\def\refereeB#1{\def\@refereeB{#1}}
\def\refereeC#1{\def\@refereeC{#1}}
\def\refereeD#1{\def\@refereeD{#1}}
\def\refereeE#1{\def\@refereeE{#1}}
\def\refereeF#1{\def\@refereeF{#1}}
\def\refereeG#1{\def\@refereeG{#1}}
\def\npages#1{\def{\@npages{#1}}}
\newcommand{\@npages}{\pageref{LastPage}}%{\pageref{paperlastpagelabel}}
\def\dedication#1{\def\@dedication{#1}}
\def\birthplace#1{\def\@birthplace{#1}}
\def\addr#1{\def\@addr{#1}}

\def\D@char{D/}
\def\split@code#1#2\eop{\def\@md{#1}\def\@dept{#2}}
\def\split@kname#1#2#3\eop{\def\@korname{#1 #2 #3}}
\def\SIC{SIC}
\def\SM{SM}
\def\MSE{MSE}
\def\SESE{SESE}
\def\SLS{SLS}
\def\DNME{DNME}
\def\PAP{PAP}
\def\SMSE{SMSE}

\pagestyle{plain}
\def\insert@hss#1#2{#1#2\hss}
\newcommand{\maketitlebreakwork}{\def\titlebreak{\\\ignorespaces}}
\newcommand{\maketitlebreaknotwork}{\def\titlebreak{\ }}
\maketitlebreaknotwork
\newcommand{\make@covertitle}{
  \ifx\@korean\@@@@undefined@@@@
  \def\contentsnamen{List of Contents}
  \else
  \def\contentsname{목~~~~~~~~차}
  \def\contentsnamen{목~~~~~~~~차}
  \def\listfigurename{그 림 목 차}
  \def\listtablename{표~~\,\,목~~\,차}
  \def\refname{참 고 문 헌}
  \def\bibname{참 고 문 헌}
  \def\indexname{찾 아 보 기}
  \def\figurename{그림}
  \def\tablename{표}
  \fi
  \expandafter\split@code\@code\eop
  \expandafter\split@kname\@kname\eop
  \ifx\@dept\SIC \def\@edept{School of Information and Mechatronics}
  \def\@kdept{정보기전공학부}
  \def\@kdeptn{정 보 기 전 공 학 부}
  \fi
  \ifx\@dept\SM \def\@edept{School of Information and Mechatronics}
  \def\@kdept{정보기전공학부}
  \def\@kdeptn{정 보 기 전 공 학 부}
  \fi
  \ifx\@dept\MSE \def\@edept{School of Materials Science and Engineering}
  \def\@kdept{신소재공학부}
  \def\@kdeptn{신 소 재 공 학 부}
  \fi
  \ifx\@dept\SESE \def\@edept{School of Environmental Science and Engineering}
  \def\@kdept{환경공학학부}
  \def\@kdeptn{환 경 공 학 부}
  \fi
  \ifx\@dept\SLS \def\@edept{School of Life Science}
  \def\@kdept{생명과학부}
  \def\@kdeptn{생 명 과 학 부}
  \fi
  \ifx\@dept\DNME \def\@edept{Department of Nanobio Materials and Electronics}
  \def\@kdept{나노바이오재료전자공학과}
  \def\@kdeptn{나 노 바 이 오 재 료 전 자 공 학 과}
  \fi
  \ifx\@dept\PAP \def\@edept{Graduate Program of Photonics and Applied Physics}
  \def\@kdept{광공학응용물리학과}
  \def\@kdeptn{광 공 학 응 용 물 리 학 과}
  \fi
  \ifx\@dept\SMSE \def\@edept{School of Medical System Engineering}
  \def\@kdept{의료시스템학과}
  \def\@kdeptn{의 료 시 스 템 학 과}
  \fi

  \ifx \D@char\@md \def\@kmd{박\hss 사}\def\@emd{Doctor of Philosophy}
  \else \def\@kmd{석\hss 사} \def\@emd{Master of Science} \fi
  
  \ifx\@korean\@@@@undefined@@@@
  
  %
  % cover sheet in English
  %

  \thispagestyle{empty}
  \vspace*{24mm}
  \maketitlebreakwork
  \leavevmode{
    \fontsize{14}{1pt}\selectfont
    \hspace{12mm}
    \ifx\D@char\@md
    Dissertation for Doctor of Philosophy
    \else
    Thesis\ for\ Master's\ Degree
    \fi } \\
  \vbox to 1mm {
    \vspace*{30mm}
    \begin{center}
      \fontsize{20.74}{14pt}\selectfont \@etitle \\
    \end{center}
  }
  \vspace*{79mm}
  \begin{center} 
    \fontsize{14}{1pt}\selectfont \@ename{ } \\
    \vspace*{10mm}
    \@edept \\
    \fontsize{17}{1pt}\selectfont
    \vspace*{15mm}
    \gistename\\
    \vspace*{20mm}
    \fontsize{14}{1pt}\selectfont
    \@coveryear
    \maketitlebreaknotwork
  \end{center}

  \fi

  %
  % cover sheet in Korean
  %
  \newpage
  \thispagestyle{empty}
  \vspace*{24mm}
  \maketitlebreakwork
  \leavevmode\hbox to50mm{
    \fontsize{14}{1pt}\selectfont
    \hspace{12mm}\\
%    \expandafter\insert@hss\@kmd\hss 학\hss 위\hss 논\hss 문} \\
    \expandafter\@kmd\hss 학\hss 위\hss 논\hss 문} \\
  \vbox to 1mm {
    \vspace*{30mm}
    \begin{center}
      \fontsize{20.74}{14pt}\selectfont \@ktitle \\
    \end{center}
  }
  \vspace*{79mm}
  \begin{center} 
    \fontsize{14}{1pt}\selectfont \@korname \\
    \vspace*{10mm}
    \@kdeptn{ }\\
    \fontsize{17}{1pt}\selectfont
    \vspace*{15mm}
    \gistknamen\\
    \vspace*{20mm}
    \fontsize{14}{1pt}\selectfont
    \@coveryear
    \maketitlebreaknotwork
  \end{center}

  %
  % Submission of thesis
  %

  \newpage\thispagestyle{empty}
  \vbox to\textheight{
    \begin{center}
      \fontsize{20.74}{12pt}\selectfont{\maketitlebreakwork
        \@etitle
        \maketitlebreaknotwork}\\
      \vspace{6mm}
      \fontsize{14}{14pt}\selectfont
      Advisor: \@advisor\\
      \ifx\@coadvisor\@@@@undefined@@@@ \else Co-Advisor: \@coadvisor\\ \fi
      \vspace{2mm} by\\\vspace{2mm}\@ename\\[2mm]
      \@edept\\
      \gistename
    \end{center}
    \vfill
    \begin{trivlist}
    \item[]\fontsize{14}{14pt}\selectfont
      \hskip 1em A thesis submitted to the faculty of the {\gistename} in partial fulfillment of the requirements for the degree of {\@emd} in the {\@edept}.
    \end{trivlist}
    \vfill
    \begin{flushright}
      \fontsize{14}{14pt}\selectfont
      \parbox{7cm}{
        \raggedright\noindent Gwangju, Republic of Korea\\\@advisorsigndate\\Approved by\\
        \vskip 10mm\hrule\vskip 8pt
        \noindent Professor \@advisor \\
        \noindent Thesis Advisor \\
      }
    \end{flushright}
  }

  %
  % Acceptance of thesis
  %

  \ifx\@korean\@@@@undefined@@@@

  \newpage\thispagestyle{empty}
  \vbox to\textheight{
    \vspace*{5mm}
    \begin{center}\fontsize{20.74}{14pt}\selectfont{\maketitlebreakwork
        \@etitle
        \maketitlebreaknotwork}\\[1cm]
      \fontsize{17}{20pt}\selectfont
      \@ename \\
      \vspace*{10mm}
      \fontsize{14}{16pt}\selectfont
      Accepted in partial fulfillment of the requirements for the\\
      degree of {\@emd}
    \end{center}
    \vspace*{10mm}
    \begin{flushright}\fontsize{14}{10pt}\selectfont
      \@refereesigndate\\[1cm]
      \begin{tabular}{rlc@{}}
        \@reftitlea & \hrulefill \\[1pt] & \@refereeA \\[25pt]
        \ifx\@refereeB\@@@@undefined@@@@\else
        \@reftitleb & \hrulefill \\[1pt] & \@refereeB \\[25pt]
        \fi
        \ifx\@refereeC\@@@@undefined@@@@\else
        \@reftitleb & \hrulefill \\[1pt] & \@refereeC \\[25pt]
        \fi
        \ifx\@refereeD\@@@@undefined@@@@\else
        \@reftitleb & \hrulefill \\[1pt] & \@refereeD \\[25pt]
        \fi
        \ifx\@refereeE\@@@@undefined@@@@\else
        \@reftitleb & \hrulefill \\[1pt] & \@refereeE \\[25pt]
        \fi
        \ifx\@refereeF\@@@@undefined@@@@\else
        \@reftitleb & \hrulefill \\[1pt] & \@refereeF \\[25pt]
        \fi
        \ifx\@refereeG\@@@@undefined@@@@\else
        \@reftitleb & \hrulefill \\[1pt] & \@refereeG \\[25pt]
        \fi
      \end{tabular}
    \end{flushright}
    \vskip-9pt}
  
  \else
  
  \newpage\thispagestyle{empty}
  \vbox to\textheight{
    \vspace*{5mm}
    \begin{center}\fontsize{20.74}{14pt}\selectfont{\maketitlebreakwork
        \@ktitle
        \maketitlebreaknotwork}\\[1cm]
      \fontsize{17}{20pt}\selectfont
      \@korname \\
      \vspace*{20mm}
      \fontsize{14}{16pt}\selectfont
      위 논문을 \gistkname
      {\@kmd}학위논문으로 인준함.
    \end{center}
    \vspace*{10mm}
    \begin{flushright}\fontsize{14}{10pt}\selectfont
      \@refereesigndate\\[1cm]
      \begin{tabular}{rlc@{}}
        \@reftitlea & \@refereeA & ~~(인) \\[25pt] 
        \ifx\@refereeB\@@@@undefined@@@@\else
        \@reftitleb & \@refereeB & ~~(인) \\[25pt]
        \fi
        \ifx\@refereeC\@@@@undefined@@@@\else
        \@reftitleb & \@refereeC & ~~(인) \\[25pt]
        \fi
        \ifx\@refereeD\@@@@undefined@@@@\else
        \@reftitleb & \@refereeD & ~~(인) \\[25pt]
        \fi
        \ifx\@refereeE\@@@@undefined@@@@\else
        \@reftitleb & \@refereeE & ~~(인) \\[25pt]
        \fi
        \ifx\@refereeF\@@@@undefined@@@@\else
        \@reftitleb & \@refereeF & ~~(인) \\[25pt]
        \fi
        \ifx\@refereeG\@@@@undefined@@@@\else
        \@reftitleb & \@refereeG & ~~(인) \\[25pt]
        \fi
      \end{tabular}
    \end{flushright}
    \vskip-9pt}
  
  \fi

  %
  % dedication
  %

  \newpage\thispagestyle{empty}
  \vbox to\textheight{
    \begin{center}
      \vfill \@dedication \vfill
    \end{center}
  }
  \newpage
}

%
% abstract definition - English
%

\def\eabstract{
  \ifx\@korean\@@@@undefined@@@@
  \pagenumbering{roman}
  \setcounter{page}{1}
  \fi
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont
    \ifx\@korean\@@@@undefined@@@@ Abstract (English) \else 영 문 요 약 \fi}
                  {\fontsize{12}{7pt}\selectfont
                    \hbox{\parbox[t]{2cm}{\strut\@code\\\@studentid}\advance\linewidth by-2cm
                      \hspace{1mm}
                      \parbox[t]{132mm}{\@ename. {\maketitlebreaknotwork \@etitle.}
                        \@edept.
                        \@coveryear. \@npages{p}. Advisor: Prof. \@advisor \ifx\@coadvisor\@@@@undefined@@@@
                        \else, \@coadvisor\fi.}}}
                  \vskip4cm
                  \begin{center}
                    {\fontsize{14}{1pt}\selectfont \bf{Abstract}}
                  \end{center}
                  \vskip0.5cm
                  \fontsize{12}{10pt}\selectfont
                  \hspace{8mm}
}

\def\endeabstract{
  \vfill
  \begin{center}
    \rm
    \ \copyright \@coveryear \\
    \@ename \\
    ALL RIGHTS RESERVED
  \end{center}
  \ifx\@korean\@@@@undefined@@@@
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
  \else
  \newpage
  \thispagestyle{empty}\pagestyle{empty}
  \vbox to\textheight{}
  \newpage 
  \thispagestyle{plain}\pagestyle{plain}
  \fi
}

%
% abstract definition - Korean
%

\def\kabstract{
  \ifx\@korean\@@@@undefined@@@@\else
  \pagenumbering{roman}
  \setcounter{page}{1}
  \fi
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont
    \ifx\@korean\@@@@undefined@@@@ Abstract (Korean) \else 국 문 요 약 \fi}
                  {\fontsize{12}{7pt}\selectfont
                    \hbox{\parbox[t]{2cm}{\strut\@code\\\@studentid}\advance\linewidth by-2cm
                      \hspace{1mm}
                      \parbox[t]{132mm}{\@kname. {\maketitlebreaknotwork \@ktitle.}
                        \@kdept.
                        \@coveryear. \@npages{쪽}. 지도교수: \@kadvisor \ifx\@kcoadvisor\@@@@undefined@@@@
                        \else, \@kcoadvisor\fi.}}}
                  \vskip4cm
                  \begin{center}
                    {\fontsize{14}{1pt}\selectfont \bf{국 문 요 약}}
                  \end{center}
                  \vskip0.5cm
                  \fontsize{12}{10pt}\selectfont
                  \hspace{8mm}
}
\def\endkabstract{
  \vfill
  \begin{center}
    \rm
    \copyright \@coveryear \\
    \@korname\\
    ALL RIGHTS RESERVED
  \end{center}
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
}

%
% Figure and Table definition
%

\def\listtables{
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \listtablename} % List of Tables}
                  {\let\thispagestyle\@gobble \listoftables }
                  \thispagestyle{plain}\pagestyle{plain}
                  \newpage
}

\def\listfigures{
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \listfigurename} % List of Figures}
                  {\let\thispagestyle\@gobble \listoffigures }
                  \thispagestyle{plain}\pagestyle{plain}
                  \newpage
}

%
% contents definition
%

\def\makecontents{
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont \contentsnamen} % List of Contents}
                  {\let\thispagestyle\@gobble 
                    \fontsize{12}{10}\selectfont
                    \tableofcontents
                  }
                  \thispagestyle{plain}\pagestyle{plain}
                  \newpage
}

%
% chapter definition
%

\def\@makechapterhead#1{
  {\parindent=0pt
    \ifnum \c@secnumdepth >\m@ne
    \LARGE\bf
    \ifx\@korean\@@@@undefined@@@@
    \@chapapp{} \thechapter
    \else
    제 \thechapter 장
    \fi
    \vskip0pt
    \fi
    \LARGE\bf #1 \vskip50pt
    \nobreak
  }
}

\def\@makeschapterhead#1{
  {\parindent=0pt\begin{center}
    \Large\bf #1\par
    \nobreak\vskip10pt \end{center}
  }
}

%
% numbering definition
%

\def\@chapapp{Chapter}
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter.\arabic{section}}
\renewcommand{\thesubsection}{\thesection.\arabic{subsection}}
\renewcommand{\thesubsubsection}{\thesubsection.\arabic{subsubsection}}

%
% section definition
%

\def\section{
  \@startsection {section}{1}{\z@}
                 {3.5ex plus 1ex minus .2ex}
                 {1.7ex plus.2ex}
                 {\bf}
}

%
% subsection definition
%

\def\subsection{
  \@startsection{subsection}{2}{\z@}
                {3.25ex plus 1ex minus .2ex}
                {1.7ex plus.2ex}
                % {-1em}
                {\bf}
}

%
% appendix definition
%

\def\appendix{\par\setcounter{chapter}{0}\setcounter{section}{0}
  \def\@chapapp{Appendix}
  \def\thechapter{\Alph{chapter}}
}

%
% summary definition
%
%
%\def\summary{\chapter*{Summary}
% \addcontentsline{toc}{chapter}{Summary (in Korean)}
% \thispagestyle{empty}\pagestyle{empty}
% \begin{center}\fontsize{14}{20pt}\selectfont{\maketitlebreakwork\@ktitle
% \maketitlebreaknotwork}
% \end{center}\vspace{1.5cm}
%}

%
% bibliography definition
%

\def\thebibliography#1{\chapter*{\bibname\@mkboth
    {\uppercase{\bibname}}{\uppercase{\bibname}}}
  \addcontentsline{toc}{chapter}{\bibname}\list
                  {\arabic{enumi}.~}{\settowidth\labelwidth{[#1]}\leftmargin\labelwidth
                    \advance\leftmargin\labelsep
                    \usecounter{enumi}}
                  \def\newblock{\hskip .11em plus .33em minus .07em}
                  \sloppy\clubpenalty4000\widowpenalty4000
                  \sfcode`\.=1000\relax\thispagestyle{plain}\pagestyle{plain}\relax
}

\renewcommand{\endthebibliography}{\label{paperlastpagelabel}
  \def\@noitemerr{\@warning{Empty `thebibliography' environment}}
  \thispagestyle{plain}\pagestyle{plain}
  \endlist
}

%
% acknowledgements definition
%

\newcommand{\acknowledgements}{\chapter*{\ifx\@korean\@@@@undefined@@@@ Acknowledgements \else 감 사 의 글 \fi}
  \addcontentsline{toc}{chapter}{\fontsize{12}{1pt}\selectfont
    \ifx\@korean\@@@@undefined@@@@ Acknowledgements \else 감 사 의 글 \fi }
}
\def\endacknowledgements{
  \ifx\@korean\@@@@undefined@@@@
  \newpage
  \thispagestyle{empty}%\pagestyle{empty}
  \vbox to\textheight{}
  \newpage 
  \thispagestyle{plain}%\pagestyle{plain}
  \else
  \thispagestyle{plain}\pagestyle{plain}
  \newpage
  \fi
}

%
% Curriculum Vitae definition
%

\ifx\@korean\@@@@undefined@@@@

\def\vitae{\chapter*{Curriculum Vitae}
  \thispagestyle{empty}\pagestyle{empty}
  \begin{tabular}{@{}lll}
    \hbox to 35mm{Name\hss}&:& \@ename \\[-10pt]
    \hbox to 35mm{Birth Date\hss}&:& \@birthday \\[-10pt]
    \hbox to 35mm{Birth Place\hss}&:& \@birthplace \\[-10pt]
    \hbox to 35mm{Permanent Address\hss}&:& \@addr \\
\end{tabular}}
\newlength{\temp@len}

\else

\def\vitae{\chapter*{이 력 서}
  \thispagestyle{empty}\pagestyle{empty}
  \begin{tabular}{@{}ccl}
    \hbox to 20mm{성~~~~~~~~~명\hss}:& \@korname \\[-10pt]
    \hbox to 20mm{생 년 월 일\hss}:& \@birthday \\[-10pt]
    \hbox to 20mm{출~~~생~~~지\hss}:& \@birthplace \\[-10pt]
    \hbox to 20mm{본~~~~~~~~~적\hss}:& \@addr \\
\end{tabular}}
\newlength{\temp@len}
\fi

\def\education#1{\vspace{.5cm}
  \begin{center} \ifx\@korean\@@@@undefined@@@@ \textbf{\large Education} \else \textbf{\large 학~~~~~~~~력} \fi
  \end{center}\vspace{.5cm}\settowidth{\temp@len}{#1}
  \begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
      \advance\temp@len by.5cm\leftmargin=\temp@len
      \def\makelabel##1{##1\hss}} \fontsize{12}{5pt}\selectfont}
\def\endeducation{\end{list}}

\def\experience#1{\vspace{.5cm}
  \begin{center} \ifx\@korean\@@@@undefined@@@@ \textbf{\large Work Experience} \else \textbf{\large 경~~~~~~~~력} \fi
  \end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
  \begin{list}{}{\labelwidth=\temp@len\labelsep=.5cm
      \advance\temp@len by.5cm\leftmargin=\temp@len
      \def\makelabel##1{##1\hss}} \fontsize{12}{5pt}\selectfont}
\def\endexperience{\end{list}}

\def\publication#1{\vspace{.5cm}
  \begin{center} \ifx\@korean\@@@@undefined@@@@ \textbf{\large Publications} \else \textbf{\large 출~~~~~~~~판} \fi
  \end{center}\vspace{.1cm}\settowidth{\temp@len}{#1}
  \begin{enumerate}{}{\labelwidth=\temp@len\labelsep=.5cm
      \advance\temp@len by.5cm\leftmargin=\temp@len
      \def\makelabel##1{##1\hss}} \fontsize{12}{5pt}\selectfont}
\def\endpublication{\end{enumerate}}

\def\activity{%\vspace{.5cm}
  \begin{center} \ifx\@korean\@@@@undefined@@@@ \textbf{\large Professional Activities} \else \textbf{\large 학 회 활 동} \fi
  \end{center}\vspace{.5cm} \fontsize{12}{8pt}\selectfont}
\def\endactivity{}

\newcounter{numaward}
\newenvironment{award}{ % 수 상 경 력
  \vspace*{5mm} \noindent
  \ifx\@ccvlang\@korean
  \begin{center}
    \ifx\@korean\@@@@undefined@@@@ \textbf{\large Honors and Awards} \else \textbf{\large 수 상 경 력} \fi
    %% \makebox[2cm][s]{\textbf{\large 수 상 경 력}}
  \end{center}
  \fi
  \begin{list}{}{%
      \usecounter{numaward}
      \setlength{\labelwidth}{1.5em}
      \setlength{\leftmargin}{\labelwidth}
      \addtolength{\leftmargin}{\labelsep}
      \setlength{\parsep}{\z@}
      \renewcommand{\makelabel}{\textgt{\arabic{numaward}.\ }}}
}{\end{list}}

%
% end of gist.cls
%
