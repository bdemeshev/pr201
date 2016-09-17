# makefile: Rmd -> tex -> pdf
# v 2.0
# .Rnw extension is automatically added
file_name = cheat_sheet_pr

$(file_name).pdf: $(file_name).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -pdf $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex


$(file_name).tex: $(file_name).md
	pandoc $(file_name).md -o $(file_name).tex --standalone


$(file_name).md: $(file_name).Rmd
	Rscript -e "library(knitr); knit('$(file_name).Rmd')"
