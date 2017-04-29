cite 'about-alias'
about-alias 'xclip and xpaste shortcuts to linux'

case $OSTYPE in
  linux*)
    XCLIP=$(command -v xclip)
    if [[ $XCLIP ]]; then
      s=clipboard
      alias xcopy="$XCLIP -selection $s" &&
        alias xpaste="$XCLIP -selection $s -o"

      s=primary
      alias xcopy-p="$XCLIP -selection $s" &&
        alias xpaste-p="$XCLIP -selection $s -o"

      s=secondary
      alias xcopy-s="$XCLIP -selection $s" &&
        alias xpaste-s="$XCLIP -selection $s -o"

      alias  cd-x='cd $(xclip -selection secondary -o)'
      alias  pwd-x='pwd|xclip -selection secondary'
    fi
    ;;
esac

#alias xcopy='xclip -sel clip'
# to use it just install xclip on your distribution and it would work like:
# $ echo "hello" | pbcopy
# $ pbpaste
# hello

# very useful for things like:
# cat ~/.ssh/id_rsa.pub | pbcopy
# have fun!
