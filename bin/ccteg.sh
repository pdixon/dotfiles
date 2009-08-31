#!/bin/sh
#
# ccteg
#
# (Circuit Example)
# This command allows a fast turn-around time when first putting together a
# cct or any other gpic drawing via the Circuit_Macros/gpic language. Run
# `ccteg', open an `xdvi ccteg&' in another window, and fiddle until you
# are satisfied, then `cp ccteg.m4 RealName.m4', followed by `cct RealName'
# to get the includable `.eps' file suitable for my `ArcMacro' LaTeX
# package, as well as a `.png' file for the web version.
# 
# Alan Robert Clark a.clark@ee.wits.ac.za
#
# Created: 10 September 2003.
#

function mkltx ()
{
cat > ccteg.tex << EOF
\documentclass[a4paper]{article}
% Get max paper size (empty except for one figure!)
% Clear all textual allowances other than the main canvas
\setlength{\oddsidemargin}{0pt}
\setlength{\topmargin}{0pt}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\marginparsep}{0pt}
\setlength{\marginparwidth}{0pt}
\setlength{\footskip}{0pt}
% Top Left is 5mm,5mm Not 1inch,1inch
\addtolength{\oddsidemargin}{-20mm}
\addtolength{\topmargin}{-20mm}
% A4 is 210 x 297 mm. Make bottom right 5,5 remaining!
\setlength{\textwidth}{205mm}
\setlength{\textheight}{292mm}

\usepackage{rotating} % For rotated text in figs.
\newbox\graph
\thispagestyle{empty}
\begin{document}
  {\vspace{2ex}\input{ccteg.cct}
  \box\graph
  }
\end{document}
EOF
return
}

if [ -e ccteg.m4 ]
  then 
    m4 ccteg.m4 | pic -t > ccteg.cct
    if  [ ! -e ccteg.tex ] 
      then 
        mkltx 
    fi
    latex ccteg.tex
fi