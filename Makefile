
# Makefile for njurepo

# Compiling method: xelatex
METHOD = latexmk
LATEXMKOPTS = -xelatex -file-line-error -halt-on-error -interaction=nonstopmode

TARGET?=examples
PACKAGE=njurepo
MAIN?=main
TYPE?=single

SOURCES= $(PACKAGE).ins $(PACKAGE).dtx
CONTENTS= $(MAIN).tex parts/$(TARGET)/*.tex
BIBFILE=ref/*.bib
BSTFILE=*.bst
CLSFILES=dtx-style.sty $(PACKAGE).cls

# make deletion work on Windows
ifdef SystemRoot
	RM = del /Q
	OPEN = start
else
	RM = rm -f
	OPEN = open
endif

.PHONY: all clean distclean main texdoc cls texdoc single FORCE_MAKE

all: cls main clean

cls: $(CLSFILES)

texdoc: $(PACKAGE).pdf
	$(OPEN) $(PACKAGE).pdf
	latexmk -c $(PACKAGE).dtx

main: $(MAIN).pdf

$(CLSFILES): $(SOURCES)
	xelatex $(PACKAGE).ins

ifeq ($(METHOD),latexmk)

$(PACKAGE).pdf: $(SOURCES) $(CLSFILES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(PACKAGE).dtx

$(MAIN).pdf: $(CONTENTS) $(CLSFILES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(MAIN)

ifeq ($(TYPE),single)
$(MAIN).tex: FORCE_MAKE
	python util.py -g single -n $(TARGET) -s $(MAIN)
else ifeq ($(TYPE),essay)
$(MAIN).tex: FORCE_MAKE
	python util.py -g essay -n $(TARGET)
else
$(error Unknown TYPE: $(TYPE))
endif

else
$(error Unknown METHOD: $(METHOD))
endif

clean:
	latexmk -c $(PACKAGE).dtx $(MAIN) 
	-@$(RM) parts/*.aux
	-@$(RM) parts/$(TARGET)/*.aux
	-@$(RM) *~

distclean:
	-@$(RM) *.pdf *.tex
	-@$(RM) $(CLSFILES)
	-@$(RM) -r dist