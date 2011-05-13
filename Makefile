OUTNAME = monotone-brevier

SOURCES = 00-vorspann.txt \
          10-grundlagen.txt \
	  15-installation.txt \
          20-in-gang-kommen.txt \
          30-networking.txt \
          40-zusammenarbeit.txt \
          50-datensicherung.txt \
          60-lua.txt \
          A0-begriffe.txt \
          A1-workflow.txt \
	  A2-referenzen.txt \
	  A3-tools.txt \
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
