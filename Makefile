all: chun_doctoral_thesis.pdf

chun_doctoral_thesis.bib: My\ Library.bib
	python bibfix.py My\ Library.bib $@

chun_doctoral_thesis.pdf: chun_doctoral_thesis.tex content/kabst.tex content/eabst.tex content/ack.tex content/intro.tex content/oop_fdtd.tex content/dcp.tex content/example.tex content/summary.tex content/get_gmes.tex chun_doctoral_thesis.bib
	latex chun_doctoral_thesis
	bibtex chun_doctoral_thesis
	komkindex -s kotex chun_doctoral_thesis
	latex chun_doctoral_thesis
	latex chun_doctoral_thesis
	dvipdfmx chun_doctoral_thesis

clean: 
	rm -rf *.aux *.bbl *.blg *.spl *.log *.lof *.lot *.toc *.out *.idx *.ilg *.ind *.dvi *.pdf *~ *.bak 
