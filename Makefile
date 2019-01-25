
# Makefile for njurepo

# Compiling method: latex/xelatex
METHOD = latexmk
LATEXMKOPTS = -xelatex -file-line-error -halt-on-error -interaction=nonstopmode

EXAMPLE= example
PACKAGE= njurepo
SOURCES= $(PACKAGE).ins $(PACKAGE).dtx
EXAMPLECONTENTS= $(EXAMPLE).tex examples/*.tex $(FIGURES)
FIGURES=$(wildcard figures/*.pdf)
BIBFILE=ref/*.bib
BSTFILE=*.bst
CLSFILES=dtx-style.sty $(PACKAGE).cls $(PACKAGE).cfg

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
	OPEN = start
else
	RM = rm -f
	OPEN = open
endif

.PHONY: all clean distclean example doc cls texdoc viewexample FORCE_MAKE

all: doc example 

cls: $(CLSFILES)

$(CLSFILES): $(SOURCES)
	xelatex $(PACKAGE).ins

texdoc: doc
	$(OPEN) $(PACKAGE).pdf

doc: $(PACKAGE).pdf

viewexample: example
	$(OPEN) $(EXAMPLE).pdf

example: $(EXAMPLE).pdf

ifeq ($(METHOD),latexmk)

$(PACKAGE).pdf: $(SOURCES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(PACKAGE).dtx

$(EXAMPLE).pdf: $(CLSFILES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(EAXMPLE)

else ifneq (,$(filter $(METHOD),xelatex pdflatex))

$(PACKAGE).pdf: $(CLSFILES) $(THESISMAIN).tex
	$(METHOD) $(PACKAGE).dtx
	makeindex -s gind.ist -o $(PACKAGE).ind $(PACKAGE).idx
	makeindex -s gglo.ist -o $(PACKAGE).gls $(PACKAGE).glo
	$(METHOD) $(PACKAGE).dtx
	$(METHOD) $(PACKAGE).dtx

$(THESISMAIN).pdf: $(CLSFILES) $(THESISCONTENTS) $(THESISMAIN).bbl
	$(METHOD) $(THESISMAIN)
	$(METHOD) $(THESISMAIN)

$(THESISMAIN).bbl: $(BIBFILE) $(BSTFILE)
	$(METHOD) $(THESISMAIN)
	-bibtex $(THESISMAIN)
	$(RM) $(THESISMAIN).pdf

$(SHUJIMAIN).pdf: $(CLSFILES) $(SHUJICONTENTS)
	$(METHOD) $(SHUJIMAIN)

else
$(error Unknown METHOD: $(METHOD))

endif

clean:
	latexmk -c $(PACKAGE).dtx $(THESISMAIN) $(SHUJIMAIN)
	-@$(RM) *~

cleanall: clean
	-@$(RM) $(PACKAGE).pdf $(THESISMAIN).pdf $(SHUJIMAIN).pdf

distclean: cleanall
	-@$(RM) $(CLSFILES)
	-@$(RM) -r dist