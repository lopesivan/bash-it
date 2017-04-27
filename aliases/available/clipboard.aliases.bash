cite 'about-alias'
about-alias 'xclip and xpaste shortcuts to linux'

case $OSTYPE in
  linux*)
    XCLIP=$(command -v xclip)
    [[ $XCLIP ]] &&
      alias xcopy="$XCLIP -selection clipboard" &&
        alias xpaste="$XCLIP -selection clipboard -o"
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
