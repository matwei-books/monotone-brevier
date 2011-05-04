OUTNAME = monotone-brevier

SOURCES = 00-vorspann.txt \
          10-grundlagen.txt \
	  15-installation.txt \
 2-in-gang-kommen.txt \
 4-zusammenarbeit.txt \
 3-datensicherung.txt \
 A1-workflow.txt \
#
IMAGES = img/version-tags.png \
 img/wo-sind-die-daten.png

#R2LFLAGS = -iutf8 -lde --documentoptions=10pt,a5paper,english
R2LFLAGS = \
 --documentclass=scrbook \
 --documentoptions=9pt,a5paper,english --use-latex-toc \
 --hyperlink-color=black

all: $(OUTNAME).pdf

$(OUTNAME).tex: $(SOURCES) $(IMAGES)
	cat $(SOURCES) | rst2latex $(R2LFLAGS) > $@

$(OUTNAME).pdf: $(OUTNAME).tex $(OUTNAME).out
	pdflatex $(OUTNAME).tex

$(OUTNAME).out: $(OUTNAME).tex
	pdflatex $<

clean:
	rm *.aux *.log *.out *.tex
