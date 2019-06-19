SOURCES=slides install readfile graphs numsum inference rmarkdown tidying case1 catreg datetime miscellanea vecmat
RNWR=$(SOURCES:=-R.Rnw)
RNWSAS=$(SOURCES:=-sas.Rnw)
all: slides-sas.pdf 
	evince slides-sas.pdf&
outline.tex: intro.Rnw outline.Rnw
	Rscript -e "knitr::knit(\"outline.Rnw\")"
outline.pdf: outline.tex
	lualatex outline
	lualatex outline
	lualatex outline
slides-R.tex: $(RNWR)
	Rscript -e "knitr::knit('slides-R.Rnw')"
slides-R.pdf: slides-R.tex
	lualatex --interaction=nonstopmode slides-R
	lualatex --interaction=nonstopmode slides-R
slides-sas.tex: $(RNWSAS)
	Rscript -e "knitr::knit('slides-sas.Rnw')"
slides-sas.pdf: slides-sas.tex
	pdflatex slides-sas
	sas slides-sas_SR.sas
	pdflatex --interaction=nonstopmode slides-sas
	pdflatex --interaction=nonstopmode slides-sas
slides.pdf: slides.Rnw intro.Rnw history.Rnw
	Rscript -e "knitr:: knit('slides.Rnw')"
	lualatex --interaction nonstopmode slides
	lualatex --interaction nonstopmode slides
ghtest.tex: ghtest.Rnw
	Rscript -e "knitr::knit('ghtest.Rnw')"
ghtest.pdf: ghtest.tex
	pdflatex ghtest
	sas ghtest_SR.sas
	pdflatex --interaction nonstopmode ghtest
	pdflatex --interaction nonstopmode ghtest
