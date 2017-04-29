cite 'about-alias'
about-alias 'vim abbreviations'


case $OSTYPE in
  linux*)
     VIM=$(command -v vim)
    NVIM=$(command -v nvim)
    GVIM=$(command -v gvim)
    NODE=$(command -v node)
    XCLIP=$(command -v xclip)

    [[ $NVIM ]] && {
      alias vim-install-plug="$NVIM +PlugInstall +qall";
      alias vim-install-rplug="$NVIM +UpdateRemotePlugins +qall";
      alias vim-cheetah="$NVIM -c:Cheetah";
      alias vc="$NVIM -c:Cheetah";
    }
    [[ $XCLIP ]] && {
      alias vim-xclip='vim "$(xclip -selection clipboard -o)"';
      alias vim-xclip-p='vim "$(xclip -selection primary -o)"';
      alias vim-xclip-s='vim "$(xclip -selection secundary -o)"';
    }

    [[ -n $GVIM ]] &&
      function gvimt { command gvim --remote-tab-silent "$@" || command gvim "$@"; }

    ;;
esac

