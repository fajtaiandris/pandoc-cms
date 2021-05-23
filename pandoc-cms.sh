#!/bin/sh

mkdir out                     
# Write your page generator here.
# Don't delete the docs below, so that you can keep copying from it.


#                , _                              __  ,_ _       
#               /|/ \ _,         _|   _   _      / ()/| | |   () 
#                |__// |  /|/|  / |  / \_/      |     | | |   /\ 
#                |   \/|_/ | |_/\/|_/\_/ \__/    \___/| | |_//(_)
#
#
# The purpose of this very long comment is to show you how to use Pandoc as a
# CMS through code examples, that you can copy and paste to build websites with
# ease.
#
# =============================================================================
#                             USING A SITE TEMPLATE
# =============================================================================
# Create a template html file and use this in your pandoc command:
#   -s --template template.html
# Type $body$ in your template where you want the content file to be inserted.
#
# For dynamic site titles you can pass site metadata into the template.
#
#
# =============================================================================
#                            PROVIDING SITE METADATA
# =============================================================================
# If you passed a metadata called mydata into the template, type $mydata$ in 
# your template to obtain its value. 
#
# -----------------------------------------------------------------------------
#                            Providing when compiled
# -----------------------------------------------------------------------------
# Use this in your pandoc command:
#   -M mydata="this is a metadata"
#
# -----------------------------------------------------------------------------
#                           Providing in content files
# -----------------------------------------------------------------------------
# Add this to the top of your markdown file:
#   ---
#   mydata: this is a metadata
#   ---
#
#
# =============================================================================
#                                GENERATING SITES
# =============================================================================
# The examples doesn't use a template just for the sake of readability.
#
# -----------------------------------------------------------------------------
#                                  One by one
# -----------------------------------------------------------------------------
#   pandoc content/index.md -o out/index.html
#   pandoc content/rolunk.md -o out/rolunk.html
#
# -----------------------------------------------------------------------------
#                               By filtering folders
# -----------------------------------------------------------------------------
#   contentfiles=`ls ./content/*.md`
#   for infile in $contentfiles
#   do
#       base=`basename -s .md ${infile}`
#       outfile="out/${base}.html"
#       pandoc $infile -o $outfile
#   done
#
#
# =============================================================================
#                 LISTING METADATAS FROM MULTIPLE FILES ON ONE PAGE
# =============================================================================
# If you're creating a blog, you probably want to list all the blog post titles
# on one page as a navigation. You can do that, and many other things with
# iterators.
#
#    # Retrieving metadata from each blog content file
#    # and saving it in temporary html files (called iterators).
#    mkdir tmp/blogiterator
#    contentfiles=`ls ./content/blog/*.md`
#    for infile in $contentfiles
#    do
#        base=`basename -s .md ${infile}`
#        outfile="tmp/blogiterator/${base}.html"
#        pandoc --template iterator.html $infile -o $outfile
#    done
#
#    # Merging the iterators into one html.
#    pandoc -s --template blogs.html tmp/blogiterator/*.html -o out/blogs.html
#
# The template for the temporary files called 'iterator.html' would not
# include the '$body$' tag, only tags for metadata, like title and author.
#
