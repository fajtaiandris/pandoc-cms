#!/bin/sh

mkdir out   

pandoc -s --template template.html content/index.md -o out/index.html
pandoc -s --template template.html content/page1.md -o out/page1.html
pandoc -s --template template.html content/page2.md -o out/page2.html
