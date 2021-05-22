#!/bin/sh

mkdir out
pandoc -s --template template.html -M title="Kezdőlap" content/index.md -o out/index.html
pandoc -s --template template.html -M title="Rólunk" content/rolunk.md -o out/rolunk.html
