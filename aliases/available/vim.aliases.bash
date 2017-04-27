cite 'about-alias'
about-alias 'vim abbreviations'


case $OSTYPE in
  linux*)
     VIM=$(command -v vim)
    NVIM=$(command -v nvim)
    GVIM=$(command -v gvim)
    NODE=$(command -v node)
    XCLIP=$(command -v xclip)

    [[ $NVIM ]] &&
      alias vim-install-plug="$NVIM +PlugInstall +qall" &&
        alias vim-install-rplug="$NVIM +UpdateRemotePlugins +qall" &&
          alias vim-cheetah="$NVIM -c:Cheetah" &&
            [[ $XCLIP ]] &&
              alias vim-xpaste='vim "$(xpaste)"'

    [[ -n $GVIM ]] &&
      function gvimt { command gvim --remote-tab-silent "$@" || command gvim "$@"; }

    ;;
esac

