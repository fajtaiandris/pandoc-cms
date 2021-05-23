#!/bin/sh
                       
mkdir out
mkdir tmp

# Retrieving metadata from each blog content file
# and saving it in temporary html files (called iterators).
mkdir tmp/blogiterator
contentfiles=`ls ./content/blog/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="tmp/blogiterator/${base}.html"
    href="blog/${base}.html"
    pandoc --template templates/blog-iterator.html -M href=$href $infile -o $outfile
done

# Merging the iterators into one html.
pandoc -s --template templates/blogs.html tmp/blogiterator/*.html -o out/blogs.html

# Creating a site for each blog post.
mkdir out/blog
contentfiles=`ls ./content/blog/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="out/blog/${base}.html"
    pandoc -s --template templates/blog-page.html -M back="../blogs.html" $infile -o $outfile
done
