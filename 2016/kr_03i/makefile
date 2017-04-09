# makefile: tex -> pdf via xelatex
# v 2.0
# .tex extension is automatically added
file_name = kr_03i

$(file_name).pdf: $(file_name).tex
	# protection against biber error
	# http://tex.stackexchange.com/questions/140814/
	rm -rf `biber --cache`

	# create pdf
	# will automatically run pdflatex/biber if necessary
	latexmk -xelatex $(file_name).tex

	# clean auxillary files
	latexmk -c $(file_name).tex

# $(file_name).tex : $(file_name).Rnw
#	Rscript -e "library(knitr); knit('$(file_name).Rnw')"

clean:
	-rm $(file_name).aux $(file_name).log $(file_name).fls $(file_name).fdb_latexmk
