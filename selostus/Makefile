texname = tyoselostus

tyoselostus: $(texname).tex $(texname).bib
	rubber --pdf $(texname).tex

clean: $(texname).tex
	rubber --clean $(texname).tex
