#!/bin/sh

mkdir out

# Generating sites manually
# pandoc -s --template template.html content/index.md -o out/index.html
# pandoc -s --template template.html content/rolunk.md -o out/rolunk.html

# Generating sites automatically
contentfiles=`ls ./content/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="out/${base}.html"
    pandoc -s --template template.html $infile -o $outfile
done
