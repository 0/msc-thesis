IMAGES = $(wildcard *.asy)
PDFS = $(IMAGES:.asy=.pdf)

export ASYMPTOTE_DIR = ../


.PHONY: all clean

all: $(PDFS)

clean:
	rm -f $(PDFS)


%.pdf: %.asy $(wildcard ../*.asy)
	asy $<
