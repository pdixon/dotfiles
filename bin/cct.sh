#!/bin/sh
#
# cct
#
# Script to get a proper vector eps file as well as a bitmap png file at
# fairly low resolution from a Circuit Macros (or any gpic) file, suitable
# for the Web. (Google burnallgifs :-)
#
# Alan Robert Clark a.clark@ee.wits.ac.za
#
# Created: 10 September 2003.
# Modified for version 5.82 7 December 2005
#
# 2007-02-13 Phillip Dixon phillip.dixon@gmail.com
#   Added a check that the m4 and pic pipeline has complete successfully.
#   This means the script will terminate early if there's an error in the
#   input file.
#
# Usage: cct fn OR cct fn.m4 OR cct *.m4 OR cct * :-)
#        Output is both a vector graphic .pdf file 


# If you **REALLY** have this filename, I guess you can change it :-)
TMPNAME=tempA1R2C3W4i5e6r6d7

function mkltx ()
{
cat > $TMPNAME.tex << EOF
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
\usepackage{amsmath}
\newbox\graph
\thispagestyle{empty}
\begin{document}
  {\vspace{2ex}\input{$TMPNAME.cct}
  \box\graph
  }
\end{document}
EOF
return
}

for i do
  filpath=`dirname $i`
  fn=$filpath/`basename $i .m4`
  if [ -e $fn.m4 ]
    then
      echo -e "\n\n\nProcessing $fn.m4\n"
      if ! m4 $fn.m4 | pic -t > $TMPNAME.cct
          then 
            echo -e "Error processing $fn.m4\n"
            break
      fi
      if [ ! -e $TMPNAME.tex ]
        then mkltx
      fi
      latex $TMPNAME.tex
      dvips -O 1in,1in -Pcmz -Pamz -o $TMPNAME.ps $TMPNAME
#      gs -sDEVICE=ppmraw -r200 -sOutputFile=- -sNOPAUSE -q $TMPNAME.ps \
#	  -c showpage -c quit | pnmcrop| pnmmargin -white 10 | pnmalias \
#	  | pnmtopng >$fn.png
#      gs -sDEVICE=bbox -sNOPAUSE -q $TMPNAME.ps -c showpage -c quit \
#         2> $TMPNAME.bbox
#      sed -e"1 r $TMPNAME.bbox" $TMPNAME.ps > $fn.eps
      ps2eps -l $TMPNAME.ps
      mv $TMPNAME.eps $fn.eps
      rm -f $TMPNAME.*
# Since I prefer to use PDFLaTeX this addition produces a pdf version of
# the diagram. It also removes the .eps file.
# Phillip Dixon 2006-02-17.
      epstopdf $fn.eps
      rm $fn.eps
    else 
      echo "$fn.m4 does not exist!"
  fi     
done