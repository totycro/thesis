TEXFILE="presentation-seminar.tex"
PDFFILE="presentation-seminar.pdf"

fst: pdf

all:
	make pdf1now
	make pdf1now


everything:
	make pdfnow
	make bib
	make pdfnow
	make pdfnow

bib:
	bibtex presentation-seminar


pdf:
	make pdf1now >/dev/null &

pdf1now:
	pdflatex -file-line-error -jobname tmp ${TEXFILE} | tee /tmp/pdflatexer 
	if [ -e "tmp.pdf" ] ; then mv tmp.pdf ${PDFFILE}; else tail -n30 /tmp/pdflatexer > /tmp/pdflatexer-error; zenity --text-info --filename=/tmp/pdflatexer-error --width=700 --height=800  ; fi



#pdf: dvi ps ps2pdf

dvi:
	latex ${TEXFILE}

ps: dvi
	dvips presentation-seminar.dvi

ps2pdf:ps
	ps2pdf presentation-seminar.ps

dvi2pdf2:
	dvipdf presentation-seminar.dvi

oldall:
	latex cli-shells.presentation.tex
	dvipdf cli-shells.presentation.dvi

e: edit

edit:
	vim ${TEXFILE}

v: view

view:
	okular ${PDFFILE} 2>/dev/null 1>&2 &

#view:
#	okular presentation-seminar.ps 2>/dev/null 1>&2 &

2: all
