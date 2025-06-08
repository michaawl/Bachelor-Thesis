[HOME](../README.md)


# Exposé / Proposal

A minimal template for a scientific exposé. WIP, suggestions welcome!

# How to compile your exposé

Compile the main LaTeX file ```expose.tex``` with the tool ```pdflatex```, run ```biber``` for creating the bibliograhy and run ```pdflatex``` again to integrate the bibliograhy into a brand new ```tmp/expos.pdf``` file:


### TL;DR

```bash
./0_run_all_typeset.sh 	
```

### Step by step

```bash
mkdir -p tmp/chapters
pdflatex --output-directory tmp expose
biber tmp/expose.bcf
pdflatex --output-directory tmp expose
echo "open tmp/expose.pdf"
```

### Structure

Note, the ```expose.tex``` is the main file which includes the chapters as single latex source files 
one file per chapter. The bibliograhy entries should be added to file ```expose.bib```.


# Example 

Preview the [expose.pdf](../example-pdf/expose.pdf).