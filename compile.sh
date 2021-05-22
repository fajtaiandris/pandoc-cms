#!/bin/sh

mkdir out
pandoc -s --template template.html content/index.md -o out/index.html
pandoc -s --template template.html content/rolunk.md -o out/rolunk.html
