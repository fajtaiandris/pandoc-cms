#!/bin/sh
                       
mkdir out
mkdir tmp

# Retrieving title from each page content file
# and saving it in temporary html files.
mkdir tmp/navbar-items
contentfiles=`ls ./content/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="tmp/navbar-items/${base}.html"
    href="${base}.html"
    pandoc --template templates/navbar-item.html -M href=$href $infile -o $outfile
done

# Merging the temp files into one html.
pandoc -s --template templates/navbar.html tmp/navbar-items/*.html -o tmp/navbar.html

# Converting sites from md to html.
# A template is used to carry the title of the md files.
mkdir tmp/sites
contentfiles=`ls ./content/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="tmp/sites/${base}.html"
    pandoc -s --template templates/title.html $infile -o $outfile
done

# Finally creating each page with the navbar.
contentfiles=`ls ./tmp/sites/*.html`
for infile in $contentfiles
do
    base=`basename ${infile}`
    outfile="out/${base}"
    pandoc -s --template templates/site.html tmp/navbar.html $infile -o $outfile
done

# To create a new page on this site, you simply have to make a new content file
# and the navigation bar will be dynamically generated.
