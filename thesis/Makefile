BASENAME="thesis"
TEXFILE="${BASENAME}.tex"
PDFFILE="${BASENAME}.pdf"

PDFVIEWER="okular"
#LANG="en" # of tex file

# pdf

#first: pdf
#first: proofs

first:
	#make semantic >/dev/null &
	#make content >/dev/null &
	make pdf1now >/dev/null &

all: everything

everything:
	make pdf1now
	make bib
	make pdf1now
	make pdf1now

ref:
	make pdf1now
	make pdf1now

bib:
	#bibtex ${BASENAME}
	bibtex tmp

pdf:
	make pdf1now >/dev/null &

pdf1now:
	pdflatex -file-line-error -jobname tmp ${TEXFILE} $@ | tee /tmp/pdflatexer 
	if [ -e "tmp.pdf" ] ; then mv tmp.pdf ${PDFFILE}; else tail -n30 /tmp/pdflatexer > /tmp/pdflatexer-error; zenity --text-info --filename=/tmp/pdflatexer-error --width=700 --height=800  ; fi

#spell:
	 #aspell -l ${LANG} -t -c ${TEXFILE}

proofs:
	make TEXFILE="\\\\def\\\\secproofsonly{}\\\\input{${TEXFILE}}" pdf1now

content:
	make TEXFILE="\\\\def\\\\contentonly{}\\\\input{${TEXFILE}}" pdf1now

semantic:
	make TEXFILE="\\\\def\\\\semanticonly{}\\\\input{${TEXFILE}}" pdf1now



e: edit
edit:
	${EDITOR} ${TEXFILE}

v: view
view:
	${PDFVIEWER} ${PDFFILE} 2>/dev/null 1>&2 &



# other formats

dvi:
	latex ${TEXFILE}

ps: dvi
	dvips "${BASENAME}.dvi"

ps2pdf:ps
	ps2pdf "${BASENAME}.ps"

dvi2pdf2:
	dvipdf "${BASENAME}.dvi"

clean:
	makefile_clean.sh *.aux *.bbl *.blg *.out *.log


spell:
	./spell.sh

count_words:
	find . -type f -iname "*.tex" -exec cat "{}" \; |  tr  ".:,\t" "    "  | tr "[:upper:]" "[:lower:]" | tr '{}' '\n\n' | tr ' ' '\n' | sort | uniq -c | sort -nr | tac 

