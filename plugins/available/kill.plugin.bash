cite about-plugin
about-plugin 'kill program'

_kill_program()
{
	kill -SIGTERM $(pidof $1)
}

alias kill-program='_kill_program'
