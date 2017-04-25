# plugin for nrustup

cite about-plugin
about-plugin 'rustup plugin for rust'

if [[ -e "${HOME}/.cargo/bin" ]] ; then

  # load rustup bin dir into path if it exists
  pathmunge "${HOME}/.cargo/bin"

fi

if [[ `which rustup` ]] ; then

  # init rustup
  eval "$(rustup completions bash)"

  # Load the auto-completion script if it exists.
  #[[ -e "${HOME}/.rustup/completions/rustup.bash" ]] && source "${HOME}/.rustup/completions/rustup.bash"

fi
