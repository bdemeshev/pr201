# makefile: Rnw -> tex -> pdf
# v 2.0
# .Rnw extension is automatically added
file_name = 2011_prob_exam_collection

$(file_name).pdf: $(file_name).tex 
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -pdf $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

$(file_name).tex : $(file_name).Rnw chapters/*.Rnw
	Rscript -e "library(knitr); knit('$(file_name).Rnw')"


clean:
	latexmk -c $(file_name).tex
	-rm $(file_name).tex $(file_name).amc $(file_name).bbl $(file_name).log $(file_name).fdb_latexmk $(file_name).fls
