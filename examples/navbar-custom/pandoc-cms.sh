#!/bin/sh

mkdir out   

# Generating all content files with navbar
contentfiles=`ls ./content/*.md`
   for infile in $contentfiles
   do
       base=`basename -s .md ${infile}`
       outfile="out/${base}.html"
       pandoc -s --template template.html $infile -o $outfile\
           --metadata-file navbar.yaml
   done
   
# This is almost like the basic navbar example, but you edit the navigation bar
# through navbar.yaml instead of template.html.
