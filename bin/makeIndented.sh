#!/bin/bash
# makeIndented.sh

# This script calls indent to format C code.
# It uses findCTypedefs.py to produce get all the user types to
# pass to indent.

indent -orig -ts4 -bli0 -fca -npcs -bl -nsaf -nsai -nsaw `python findCTypedefs.py $*` $*
