DOCROOT = Pi0Polarizability
TEX_FILES = Appendix_NCSwave.tex \
Authors.tex \
DataAnalysis.tex \
Introduction.tex \
JLAB_Acceptance.tex \
JLAB_Backgrounds.tex \
JLAB_Overview.tex \
JLAB_Pi0Normalization.tex \
JLAB_Sensitivity.tex \
Pi0Polarizability.tex \
TheoreticalPredictions.tex
#PDFLATEXFLAGS = -interaction=nonstopmode

all : $(DOCROOT).pdf

$(DOCROOT).pdf : $(TEX_FILES) $(DOCROOT).bbl
	pdflatex $(PDFLATEXFLAGS) $(DOCROOT)
	pdflatex $(PDFLATEXFLAGS) $(DOCROOT)

$(DOCROOT).bbl : $(DOCROOT).bib $(TEX_FILES)
	pdflatex $(PDFLATEXFLAGS) $(DOCROOT)
	bibtex $(DOCROOT)

$(DOCROOT).aux:
	pdflatex $(PDFLATEXFLAGS) $(DOCROOT)
