#!/bin/sh

mkdir out
pandoc -s --template template.html content/index.html -o out/index.html
pandoc -s --template template.html content/rolunk.html -o out/rolunk.html
