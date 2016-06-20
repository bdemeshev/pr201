# makefile: Rnw -> tex -> pdf
# v 2.0
# .Rnw extension is automatically added
file_name = pr201_kr4_june_16
file_name_b = pr201_kr4_june_16_v2

all: $(file_name).pdf $(file_name_b).pdf

$(file_name).pdf: $(file_name).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -pdf $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

$(file_name).tex : $(file_name).Rnw
	Rscript -e "library(knitr); knit('$(file_name).Rnw')"



$(file_name_b).pdf: $(file_name_b).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex -pdf $(file_name_b).tex

	# clean auxillary files
	latexmk -c $(file_name_b).tex

$(file_name_b).tex : $(file_name_b).Rnw
	Rscript -e "library(knitr); knit('$(file_name_b).Rnw')"
