#!/bin/bash

echo "Producting sample PDFs for each of the study degree programmes"
echo " First in English: IMS -> IRM -> ITM -> SWD -> MSD"
echo " Then  in German:  MSD -> SWD -> ITM -> IRM"
cd ../thesis

echo "Backup of original thesis"
cp thesis.tex thesis.tex.tmp

echo "We set defaults (to IMS) in English"
sed -i.bak "s/study{ITM}/study{IMS}/g" thesis.tex
sed -i.bak "s/study{SWD}/study{IMS}/g" thesis.tex
sed -i.bak "s/study{MSD}/study{IMS}/g" thesis.tex
sed -i.bak "s/study{IRM}/study{IMS}/g" thesis.tex
sed -i.bak "s/study{IMS}/study{IMS}/g" thesis.tex
sed -i.bak "s/yourLanguage{german}/yourLanguage{english}/g" thesis.tex
sed -i.bak "s/title{<Title of Your Thesis>}/title{Solving a Real World Problem}/g" thesis.tex
sed -i.bak "s/subtitle{<The subtitle.>}/subtitle{Improving conditions to foster innovation targeting human beings.}/g" thesis.tex
# demo student with demo thesis
sed -i.bak "s/yourName{<your name>}/yourName{Julia Feelgood}/g" thesis.tex
sed -i.bak "s/yourPlace{<place>}/yourPlace{Kapfenberg}/g" thesis.tex
sed -i.bak "s/submissionDate{<date>}/submissionDate{`date +'%B %Y'`}/g" thesis.tex
sed -i.bak "s/yourAdvisor{<firstname lastname>}/yourAdvisor{T. Truth}/g" thesis.tex

echo "Version for IMS in English" # Note: IMS is English ONLY
./0_run_all_typeset.sh
mv tmp/thesis.pdf ../example-pdf/thesis_ims.pdf


# IMS -> IRM

echo "Version for IRM in English"
sed -i.bak s/study{IMS}/study{IRM}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_irm_en.pdf


# IRM -> ITM

echo "Version for ITM in English"
sed -i.bak s/study{IRM}/study{ITM}/g thesis.tex
./0_run_all_typeset.sh
mv tmp/thesis.pdf ../example-pdf/thesis_itm_en.pdf


# ITM -> SWD

echo "Version for SWD in English"
sed -i.bak s/study{ITM}/study{SWD}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_swd_en.pdf

# SWD -> MSD

echo "Version for MSD in English"
sed -i.bak s/study{SWD}/study{MSD}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_msd_en.pdf

# english -> german

echo "Now we switch to german!"

# TODO switch title/subtitle to german
# restore the original file:
cp thesis.tex.tmp thesis.tex
echo "We set defaults to MSD in German"
sed -i.bak "s/study{ITM}/study{MSD}/g" thesis.tex
sed -i.bak "s/study{SWD}/study{MSD}/g" thesis.tex
sed -i.bak "s/study{MSD}/study{MSD}/g" thesis.tex
sed -i.bak "s/study{IRM}/study{MSD}/g" thesis.tex
sed -i.bak "s/study{IMS}/study{MSD}/g" thesis.tex
sed -i.bak "s/yourLanguage{english}/yourLanguage{german}/g" thesis.tex
sed -i.bak "s/title{<Title of Your Thesis>}/title{Paradoxe Ressourcenschonung}/g" thesis.tex
sed -i.bak "s/subtitle{<The subtitle.>}/subtitle{Durch innovative Algorithmen dem Klimawandel entgegenwirken.}/g" thesis.tex
# demo student with demo thesis
sed -i.bak "s/yourName{<your name>}/yourName{Markus Wunderlich}/g" thesis.tex
sed -i.bak "s/yourPlace{<place>}/yourPlace{Kapfenberg}/g" thesis.tex
sed -i.bak "s/submissionDate{<date>}/submissionDate{` LC_ALL='de_AT.UTF-8' date +'%B %Y'`}/g" thesis.tex
sed -i.bak "s/yourAdvisor{<firstname lastname>}/yourAdvisor{E. Klar}/g" thesis.tex


echo "Version for MSD in German"
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_msd_ge.pdf

# MSD -> SWD

echo "Version for SWD in German"
sed -i.bak s/study{MSD}/study{SWD}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_swd_ge.pdf

# SWD -> ITM

echo "Version for ITM in German"
sed -i.bak s/study{SWD}/study{ITM}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_itm_ge.pdf


# ITM -> IRM

echo "Version for IRM in German"
sed -i.bak s/study{ITM}/study{IRM}/g thesis.tex
./0_run_all_typeset.sh && mv tmp/thesis.pdf ../example-pdf/thesis_irm_ge.pdf


# IRM -> IMS
# not necessary, no GERMAN version for IMS

# restore the original file:
cp thesis.tex.tmp thesis.tex # && rm thesis.tex.bak

# back to thisdirectory
cd ../example-pdf

# compile a demo sample expose (ENGLISH only)
cd ../expose
echo "Backup of original expose"
cp expose.tex expose.tex.tmp

sed -i.bak "s/title{<Title of Your Exposé>}/title{Solving a Real World Problem}/g" expose.tex
sed -i.bak "s/subtitle{<The subtitle.>}/subtitle{Improving conditions to foster innovation targeting human beings.}/g" expose.tex
# demo student with demo expose
sed -i.bak "s/yourName{<your name>}/yourName{Julia Feelgood}/g" expose.tex
sed -i.bak "s/yourPlace{<place>}/yourPlace{Kapfenberg}/g" expose.tex
sed -i.bak "s/submissionDate{<date>}/submissionDate{`date +'%B %Y'`}/g" expose.tex
sed -i.bak "s/yourAdvisor{<firstname lastname>}/yourAdvisor{T. Truth}/g" expose.tex

echo "Compile the current (temp) version of the expose and copy pdf to example-pdf directory"
./0_run_all_typeset.sh && mv tmp/expose.pdf ../example-pdf/expose.pdf

# restore the original file:
cp expose.tex.tmp expose.tex


# back to thisdirectory
cd ../example-pdf

echo "Now create a png from one of the pdfs and update the *_preview.png"
sips -s format png thesis_ims.pdf --resampleWidth 300  --out thesis_ims_preview.png

echo "Done"
echo " "
