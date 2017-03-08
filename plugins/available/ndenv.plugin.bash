# plugin for nndenv

cite about-plugin
about-plugin 'ndenv plugin for node'

if [[ -e "${HOME}/.ndenv/bin" ]] ; then

  # load ndenv bin dir into path if it exists
  pathmunge "${HOME}/.ndenv/bin"

fi

if [[ `which ndenv` ]] ; then

  # init ndenv
  eval "$(ndenv init -)"

  # Load the auto-completion script if it exists.
  #[[ -e "${HOME}/.ndenv/completions/ndenv.bash" ]] && source "${HOME}/.ndenv/completions/ndenv.bash"

fi
