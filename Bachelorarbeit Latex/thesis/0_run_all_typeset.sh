#!/bin/sh
mkdir -p tmp/chapters
./1_run_pdflatex.sh && ./2_run_biber.sh && ./1_run_pdflatex.sh
ln -sf tmp/thesis.pdf .
# append for MacOS X: && open tmp/thesis.pdf
echo ""
echo "Done. Now open tmp/thesis.pdf"
