cite 'about-alias'
about-alias 'developer aliases'

alias manview='groff -Tascii -man'
alias less='less -r'                                   # raw control characters
alias whence='type -a'                                 # where, of a sort
alias grep='grep --color'                              # show differences in colour
alias http-server='python -m SimpleHTTPServer 8000'
alias logout-gnome='gnome-session-quit --logout'
alias desliga='systemctl enable poweroff.target'

# Some shortcuts for different directory listings
alias ls='ls -hF --color=tty'                          # classify files in colour
alias dir='ls -d */'
alias vdir='ls --color=auto --format=long'
alias ll='ls -l'                                       # long list
alias la='ls -A'                                       # all but . and ..
alias l='ls -CF'                                       #

alias restart.unity='sudo service lightdm restart'
alias asciiflow="google-chrome file:///${HOME}/developer/asciiflow2/index.html"

alias ssh.xoom='sshpass -p admin ssh tablet.xoom'
alias ssh.milestone='sshpass -p admin ssh celular.milestone'
alias ssh.motorola='sshpass -p admin ssh celular.motorola'
alias ssh.push='sshpass -p admin git push'

# vi:set nu nowrap:
