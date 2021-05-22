#!/bin/sh
                       
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
#
# Create a template html file and use this in your pandoc command:
#   -s --template template.html
# Type $body$ in your template where you want the content file to be inserted.
#
# For dynamic site titles you can pass site metadata into the template.
#

# =============================================================================
#                            PROVIDING SITE METADATA
# =============================================================================
#
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

# =============================================================================
#                                GENERATING SITES
# =============================================================================
#
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
#                             EXAMPLE SITE GENERATOR
# =============================================================================

mkdir out

contentfiles=`ls ./content/*.md`
for infile in $contentfiles
do
    base=`basename -s .md ${infile}`
    outfile="out/${base}.html"
    pandoc -s --template template.html $infile -o $outfile
done
