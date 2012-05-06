#! /bin/sh

for source in $1; do
    pygmentize -g $source
done
