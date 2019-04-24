# Makefile for njurepo

# Compiling method: xelatex
METHOD = latexmk
LATEXMKOPTS = -xelatex -file-line-error -halt-on-error -interaction=nonstopmode

PROJECT?=examples
PACKAGE=njurepo
NAME?=main
TYPE?=single

SOURCES= $(PACKAGE).ins $(PACKAGE).dtx
CONTENTS= $(NAME).tex parts/$(PROJECT)/*.tex
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

.PHONY: all generate create main texdoc cls FORCE_MAKE clean distclean cleanred single

all: cls main clean

single: generate all

cls: $(CLSFILES)

texdoc: $(PACKAGE).pdf
	$(OPEN) $(PACKAGE).pdf
	latexmk -c $(PACKAGE).dtx

main: $(NAME).pdf

create:
	python util.py -c $(PROJECT)

ifeq ($(TYPE),single)
generate:
	python util.py -g single -n $(PROJECT) -s $(NAME)
else ifeq ($(TYPE),essay)
generate:
	python util.py -g essay -n $(PROJECT)
else
$(error Unknown TYPE: $(TYPE))
endif

$(CLSFILES): $(SOURCES)
	xelatex $(PACKAGE).ins

ifeq ($(METHOD),latexmk)
$(PACKAGE).pdf: $(SOURCES) $(CLSFILES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(PACKAGE).dtx
$(NAME).pdf: $(CONTENTS) $(CLSFILES) FORCE_MAKE
	$(METHOD) $(LATEXMKOPTS) $(NAME)
else
$(error Unknown METHOD: $(METHOD))
endif

cleanred:
	-@$(RM) *~
	-@$(RM) .DS_Store
	-@$(RM) parts/*/.DS_Store
	-@$(RM) *.aux *.fdb_latexmk *.fls *.log *.out

clean: cleanred
	latexmk -c $(PACKAGE).dtx $(NAME) 
	-@$(RM) parts/*.aux
	-@$(RM) parts/$(PROJECT)/*.aux

distclean: cleanred
	-@$(RM) *.pdf *.tex
	-@$(RM) $(CLSFILES)
	-@$(RM) -r dist
