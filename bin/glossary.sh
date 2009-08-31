#!/bin/bash
#
# glossary.sh
#
# This script will invoke glosstex and makeindex to build a glossary for a
# latex document.
# 
# Usage: glossary.sh DOCUMENT GLOSSARY
#
# Phillip Dixon
# 2005-02-16

# Glosstex allows you to reference multiple glossaries in one document. This
# script currently only allows you to reference one. If I find this to be a
# limitation I'll fix this. 
DOC_NAME=$1
GLOSSARIES=$2

# Run glosstex with the input files.
glosstex $DOC_NAME $GLOSSARIES

# Run the output from glosstex through makeindex.
makeindex $DOC_NAME.gxs -o $DOC_NAME.glx -s glosstex.ist

exit 0