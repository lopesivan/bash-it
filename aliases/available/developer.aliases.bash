cite 'about-alias'
about-alias 'developer aliases'

alias manview='groff -Tascii -man'
alias less='less -r'                                   # raw control characters
alias whence='type -a'                                 # where, of a sort
alias grep='grep --color'                              # show differences in colour
#alias xcopy='xclip -sel clip'
alias xpaste='xclip -selection c -o'
alias xcopy='xclip -selection c'
alias http-server='python -m SimpleHTTPServer 8000'
alias logout-gnome='gnome-session-quit --logout'

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                          # classify files in colour
alias dir='ls -d */'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                                       # long list
alias la='ls -A'                                       # all but . and ..
alias l='ls -CF'                                       #
alias vim.plug.install='vim +PlugInstall +qall'
alias vim.rplug='vim +UpdateRemotePlugins +qall'
alias vc='vim -c:Cheetah'
alias vx='vim "$(xpaste)"'
alias restart.unity='sudo service lightdm restart'
alias vimmru.list='redis-cli ZRANGE vimmru 0 -1'
alias asciiflow="firefox file:///${HOME}/developer/asciiflow2/index.html"

_redis_list(){
	redis-cli ZRANGE $1 0 -1
}
_redis_zram(){
	db=$1
	shift
	redis-cli zadd $db 1 $1
}

alias redis.list='_redis_list'
alias redis.keys='redis-cli KEYS \*'
alias redis.get='redis-bash-cli get'
alias redis.set='redis-bash-cli set'
alias redis.del='redis-bash-cli del'
alias redis.zadd='_redis_zram'
alias vimmru.del='redis-cli DEL vimmru'
alias nyaovim='node ~/.ndenv/versions/v7.4.0/bin/nyaovim'
alias uff='EMAILBOX=uff mutt'
alias ufrj='EMAILBOX=ufrj mutt'
alias desliga='systemctl enable poweroff.target'

# vi:set nu nowrap:
