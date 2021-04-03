#!/bin/sh

mkdir out
pandoc -s --template template.html -M title="Kezdőlap" content/index.html -o out/index.html
pandoc -s --template template.html -M title="Rólunk" content/rolunk.html -o out/rolunk.html
