DOCS = pag
ALLTEXFILES = $(wildcard *.tex)
TEXFILES = $(patsubst %,%.tex,$(DOCS))
PDFFILES = $(patsubst %,%.pdf,$(DOCS))
TEXCODE = 
#$(patsubst code/%.c, code/%.tex, $(wildcard code/*.c))

#all: $(TEXCODE) $(DVIFILES) $(PSFILES) $(PDFFILES)
all: $(PDFFILES)

%.pdf: $(ALLTEXFILES) beamerinnerthememodFeather.sty beamerouterthememodFeather.sty beamercolorthememodFeather.sty beamerthememodFeather.sty
	pdflatex $*
	pdflatex $*
# 	pdftops $@ tmp.ps
# 	ps2pdf14 -dPDFSETTINGS=/prepress tmp.ps $@
# 	rm tmp.ps

#%.ps: %.dvi
#	dvips  -X 1200 -Y 1200 $< -o $@

#%.pdf: %.ps
#	lpr -P APDF $<
#	sleep 5
#	mv $(HOME)/PDF/$@ .
#	ps2pdf -dMaxSubsetPct=100 -dCompatibilityLevel=1.2
# -dSubsetFonts=true -dEmbedAllFonts=true $<

wc: $(TEXFILES)
	@for tex in $(TEXFILES); do \
	  wc $$tex; \
	done;

spellcheck: $(TEXFILES)
	@for tex in $(TEXFILES); do \
	  ispell -t -d american $$tex; \
	done;	

clean:
	@rm -f $(PDFFILES) *.out *.bbl *.blg *.dvi *~ *.ps *.aux *.log *.bak *.maf *.lot *.lof *.toc *.mtc*
