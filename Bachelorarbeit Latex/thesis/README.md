[HOME](../README.md)

# How to compile your thesis

Compile the main LaTeX file ```thesis.tex``` with the tool ```pdflatex```, run ```biber``` for creating the bibliograhy and run ```pdflatex``` again to integrate the bibliograhy into a brand new ```tmp/thesis.pdf``` file:


### TL;DR

```bash
./0_run_all_typeset.sh 	
```

### Step by step

```bash
mkdir -p tmp/chapters
pdflatex --output-directory tmp thesis
biber tmp/thesis.bcf
pdflatex --output-directory tmp thesis
```

### Structure

Note, the ```thesis.tex``` is the main file which includes the chapters as single latex source files 
one file per chapter. The bibliograhy entries should be added to file ```thesis.bib```.



# Credits

The original template was created by Diethard Ohrt.