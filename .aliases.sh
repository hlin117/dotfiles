function swap() {
    if [ ! -f "$1" ] ; then
        echo "$1 does not exist"
        return 1
    fi

    if [ ! -f "$2" ] ; then
        echo "$2 does not exist"
        return 1
    fi

	local TMPFILE=tmp.$$
	mv "$1" $TMPFILE
	mv "$2" "$1"
	mv $TMPFILE "$2"
}

alias vi='vim'
alias tree='tree -C'

export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

################################################################################
# EVERYTHING THAT BELONGS ON THE MAC
################################################################################
if [ "$USER" = "hlin117" ] ; then

    alias jp='jump'

    # BEGIN VIEW DEFINITION
    viewer() {
        open -a preview "$1"
    }
    alias view=viewer

    _view() {
        local cur
        reply=( `ls ${cur}*.pdf` )
        return 0
    }
    compctl -K _view -S '' viewer
    # END VIEW DEFINITION

    # BEGIN LATEX DEFINITION
    latex() {
        pdflatex -interaction=batchmode "$1"
    }
    alias qpdflatex=latex
    
    _latex() {
        local cur
        reply=( `ls ${cur}*.tex` )
        return 0
    }
    compctl -K _latex -S '' latex
    # END VIEW DEFINITION

    # BEGIN DICT DEFINITION
    alias define=dict

    function dict() {
        sdcv $1 | less
    }
    # END DICT DEFINITION

fi

################################################################################
# EVERYTHING THAT BELONGS TO THE LINUX LABS
################################################################################
if [ "$USER" = "halin2" ] ; then
    alias ls='ls --color=auto'
fi
