OUTNAME = monotone-brevier

SOURCES = 0-vorspann.txt \
 1-grundlagen.txt \
 2-in-gang-kommen.txt \
 3-datensicherung.txt \
 4-zusammenarbeit.txt
#
IMAGES = img/version-tags.png \
 img/wo-sind-die-daten.png

all: $(OUTNAME).pdf

$(OUTNAME).tex: $(SOURCES) $(IMAGES)
	cat $(SOURCES) | rst2latex > $@

$(OUTNAME).pdf: $(OUTNAME).tex
	pdflatex $<
