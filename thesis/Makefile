.PHONY: all clean images verbose

all: thesis.pdf

clean:
	latexmk -C
	$(MAKE) -C images clean

images:
	$(MAKE) -C images

verbose:
	$(MAKE) LMOPTS=-verbose all


thesis.pdf: *.tex references.bib images
	latexmk -silent -r latexmkrc -pdf $(LMOPTS) -synctex=1 thesis
