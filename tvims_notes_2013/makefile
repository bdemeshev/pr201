# makefile: Rnw -> tex -> pdf
# .Rnw extension is automatically added
file_name = tvims_notes_2013

$(file_name).pdf: $(file_name).tex
	latexmk -pdf $(file_name).tex # create pdf
	latexmk -c $(file_name).tex  # clean auxillary files

$(file_name).tex : $(file_name).Rnw 
	Rscript -e "library(knitr); knit('$(file_name).Rnw')"

