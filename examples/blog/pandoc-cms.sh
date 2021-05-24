#!/bin/sh
  
# Starting fresh everytime   
rm -r out
rm -r tmp                  
mkdir out
mkdir tmp

# Retrieving metadata from each blog content file
# and saving it in temporary html files.
mkdir tmp/blogtitles
contentfiles=`ls ./content/blog/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="tmp/blogtitles/${base}.html"
    href="blog/${base}.html"
    pandoc --template templates/blog-title.html -M href=$href $infile -o $outfile
done

# Merging the temporary files into one html.
pandoc -s --template templates/post-list.html tmp/blogtitles/*.html -o out/all-posts.html

# Creating a page for each blog post.
mkdir out/blog
contentfiles=`ls ./content/blog/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="out/blog/${base}.html"
    pandoc -s --template templates/blog-post.html -M back="../all-posts.html" $infile -o $outfile
done

# Note that the blog posts will show up in alphabetical order.
# To create a custom order anyway, put a number at the beginning of the content
# file names, or even better, the date the post was written.

