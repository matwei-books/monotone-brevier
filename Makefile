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
	  A1-referenzen.txt \
	  A2-tools.txt \
          A3-workflow.txt \
	  A4-cvsphrasebook.txt \
#
IMAGES = img/version-tags.png \
 img/wo-sind-die-daten.png

#R2LFLAGS = -iutf8 -lde --documentoptions=10pt,a5paper,english
R2LFLAGS = \
 --documentclass=scrbook \
 --documentoptions=9pt,a5paper,german,openany --use-latex-toc \
 --hyperlink-color=black \
 --stylesheet=lmodern,preamble.tex \
#
all: $(OUTNAME).pdf

$(OUTNAME).tex: $(SOURCES) $(IMAGES) revision.txt
	cat $(SOURCES) | rst2latex $(R2LFLAGS) > $@

$(OUTNAME).pdf: $(OUTNAME).tex $(OUTNAME).out
	pdflatex $(OUTNAME).tex

$(OUTNAME).out: $(OUTNAME).tex preamble.tex
	pdflatex $<

revision.txt: $(SOURCES) $(IMAGES) preamble.tex Makefile
	lua bin/revision.lua > revision.txt
clean:
	rm *.aux *.log *.out *.tex
