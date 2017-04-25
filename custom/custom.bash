#!/usr/bin/env bash
#
# This is an example file. Don't use this for your custom scripts. Instead, create another file within the
# custom directory.
export EDITOR=$(which vi)
export TDL_DATABASE=~/developer/tdldb
export MANPAGER="sh -c \"col -bx | vim -c'colorscheme base16-cupcake' -c 'set ft=man nolist' -R -\""
export PAGER=more

#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#    vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#    -c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#    -c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""
