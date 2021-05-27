#!/bin/sh

mkdir out   

pandoc -s --template template.html content/index.md -o out/index.html
pandoc -s --template template.html content/page1.md -o out/page1.html
pandoc -s --template template.html content/page2.md -o out/page2.html

# You could do this in a loop, like this:
# contentfiles=`ls ./content/*.md`
#    for infile in $contentfiles
#    do
#        base=`basename -s .md ${infile}`
#        outfile="out/${base}.html"
#        pandoc -s --template template.html $infile -o $outfile
#    done

# This is a very basic example.
# To create a new page on this site, you have to edit both this file and
# template.html.
