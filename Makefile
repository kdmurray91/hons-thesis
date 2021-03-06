COMPILER=lualatex -shell-escape -synctex=1
BIB_COMPILER=biber
LATEX_SRC=thesis.latex
BIB_SRC=thesis.bib
PIE=perl -pi -e

all: latex clean

latex:
ifneq ($(wildcard $(patsubst %.latex,%.pdf,$(LATEX_SRC))),)
	rm -v $(patsubst %.latex,%.pdf,$(LATEX_SRC))
endif
	$(COMPILER) $(LATEX_SRC)
	$(BIB_COMPILER) $(patsubst %.latex,%,$(LATEX_SRC))
	$(COMPILER) $(LATEX_SRC)
	$(COMPILER) $(LATEX_SRC)
	ls -lh $(patsubst %.latex,%.pdf,$(LATEX_SRC))
	cp -v thesis.pdf ~/docs/www/kdmurray.id.au/

clean:
ifneq ($(wildcard *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc *.pyg *.tdo), )
	rm $(wildcard *.bcf *.aux *.bbl *.dvi *.blg *.log *.bak *.idx *.run.xml *-blx.bib *.nav *.out *.snm *.toc *.pyg *.tdo)

endif
