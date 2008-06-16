OUTNAME = monotone-brevier

SOURCES = 0-vorspann.txt \
 1-grundlagen.txt \
 2-in-gang-kommen.txt \
#

all: $(OUTNAME).pdf

$(OUTNAME).tex: $(SOURCES)
	cat $(SOURCES) | rst2latex > $@

$(OUTNAME).pdf: $(OUTNAME).tex
	pdflatex $<
