#
# Makefile to latex document, uncompress .ps files etc...
# original version : Mark Ito
# modified:
#
#     use for hadron05 paper - Elton Smith 9/30/03
#     html output de-activated for now
#     halld_safety - Elton Smith 10/16/06
#     cc_geometry - Elton Smith 10/16/06
#     bcal_specs - Elton Smith 04/02/07
#     halld_specs - Elton Smith 08/27/07
#     feldman_cousins - Elton Smith 09/17/07
#     feldman_cousins systematics  - Elton Smith 08/05/08
#     cdc_segments  - Elton Smith 09/31/08
#     sipm_cooling  - Elton Smith 09/31/08
#     b1pi_studies  - Elton Smith 02/24/10
#     b1_pi studies  - Elton Smith 03/18/10
#     gen_eta studies  - Elton Smith 04/26/10
#     short_currents - Elton Smith 06/22/10
#     short_response - Elton Smith 09/24/10
#     short_cover - Elton Smith 09/24/10   -- use pdflatex
#     solenoid_replacement - Elton Smith 10/15/10   -- use pdflatex
#     bcal_prod_guides  - Elton Smith 06/08/11   -- use pdflatex
#     bcal_voltage_settings  - Elton Smith 26/09/14  -- use pdflatex
#     photon_rates  - Elton Smith 10/21/14  -- use pdflatex
#     double_slit  - Elton Smith 11/12/14  -- use pdflatex
#     bcal_constants  - Elton Smith 12/02/14  -- use pdflatex
#     SiPM_saturation  - Elton Smith 7/13/18  -- use pdflatex
#     SiPM_test_saturation  - Elton Smith 7/23/19  -- use pdflatex
#     NonLinCheck  - Elton Smith 2/3/2020  -- use pdflatex
#     Pi0Polarizability  Proposal - Elton Smith 2/6/2020  -- use pdflatex
#
#
TEX_FILES_0 = Pi0Polarizability JLAB_Backgrounds Appendix_NCSwave Introduction  \
              JLAB_Overview JLAB_Pi0Normalization JLAB_Sensitivity TheoreticalPredictions  \
              DataAnalysis Authors JLAB_Acceptance

TEX_FILES = $(addsuffix .tex,$(TEX_FILES_0)) # add .tex suffix

PS_FILES_0 = 
PS_FILES = $(addsuffix .ps,$(PS_FILES_0)) # add .ps suffix

EPS_FILES_0 = 
EPS_FILES = $(addsuffix .eps,$(EPS_FILES_0)) # add .eps suffix

PDF_FILES_0 =
PDF_FILES = $(addsuffix .pdf,$(PDF_FILES_0)) # add .pdf suffix

PNG_FILES_0 =
PNG_FILES = $(addsuffix .png,$(PNG_FILES_0)) # add .png suffix

C_FILES_0 =
C_FILES = $(addsuffix .C,$(C_FILES_0)) # add .C suffix

all : Pi0Polarizability.pdf

Pi0Polarizability.pdf : $(TEX_FILES) Makefile Pi0Polarizability.bbl $(PS_FILES) $(EPS_FILES)  # make the pdf file
	pdflatex Pi0Polarizability.tex
	pdflatex Pi0Polarizability.tex

Pi0Polarizability.bbl : Pi0Polarizability.bib $(TEX_FILES) $(PS_FILES) $(EPS_FILES)
	pdflatex Pi0Polarizability
	bibtex Pi0Polarizability

tar : $(TEX_FILES) $(PS_FILES) $(EPS_FILES) # tar files; will remove old tar files
	rm -f Pi0Polarizability.tar
	rm -f Pi0Polarizability.tar.gz
	rm -rf Pi0Polarizability
	mkdir Pi0Polarizability
#	cp Pi0Polarizability.ps Pi0Polarizability
	cp Pi0Polarizability.bib Pi0Polarizability
	cp $(TEX_FILES) Pi0Polarizability
#	cp $(EPS_FILES) Pi0Polarizability
#	cp $(PS_FILES) Pi0Polarizability
#	cp $(PDF_FILES) Pi0Polarizability
#	cp $(PNG_FILES) Pi0Polarizability
#	cp $(C_FILES) Pi0Polarizability
	cp Pi0Polarizability.pdf Pi0Polarizability
	cp Makefile Pi0Polarizability
	tar cvf Pi0Polarizability.tar Pi0Polarizability
	gzip Pi0Polarizability.tar
#	rm -rf Pi0Polarizability

%.pdf : %.tex
	pdflatex $*
	pdflatex $*

%.ps : %.ps.gz
	gunzip -l $*.ps.gz
	rm -f $*.ps
	gunzip -c $*.ps.gz > $*.ps

%.eps : %.eps.gz
	gunzip -l $*.eps.gz
	rm -f $*.eps
	gunzip -c $*.eps.gz > $*.eps

#

clean:
	rm -f Pi0Polarizability.dvi Pi0Polarizability.ps


