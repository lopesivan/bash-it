#!/usr/bin/env bash
#
# This is an example file. Don't use this for your custom scripts. Instead, create another file within the
# custom directory.

export SHELLSCRIPT_TEMPLATE_PKG=/home/ivan/developer/shell-script-tool-kit/template
export SHELLSCRIPT_CTEMPLATE=/home/ivan/developer/shell-script-tool-kit/ctemplate
export SHELLSCRIPT_PKG=/home/ivan/developer/shell-script-tool-kit/bin-shellscript-pakages
export PATH=/home/ivan/developer/shell-script-tool-kit/bin-shellscript-pakages:$PATH
export SHELLSCRIPT_PAKAGES=/home/ivan/developer/shell-script-tool-kit/archive-shellscript-pakages

mvToTemplate ()
{
  cp $* $SHELLSCRIPT_TEMPLATE_PKG
}
goTemplate ()
{
  cd  $SHELLSCRIPT_TEMPLATE_PKG
}
mvToArchive ()
{
  cp $* $SHELLSCRIPT_PKG/../archive-shellscript-pakages
}
goArchive ()
{
  cd $SHELLSCRIPT_PKG/../archive-shellscript-pakages
}

_tp()
{
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  # n=$(( $(tp list --| wc -l) -1 ))
  opts=`tp list --| awk '{print }'| sed -e '' | sed -e :a -e 'N; # s/\n/ /; ta'`

  if [[ ${cur} == --* ]] ; then
    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
  fi
}
complete -F _tp tp
