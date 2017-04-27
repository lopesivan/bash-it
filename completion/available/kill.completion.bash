#!/usr/bin/env bash
# Bash completion support kill-program.

_kill-program-complete() {
    local CURRENT_PROMPT="${COMP_WORDS[COMP_CWORD]}"

    COMPREPLY=($(compgen -W "$(ps -e| awk '{print $4}'| sort| uniq)" -- ${CURRENT_PROMPT}) )

    return 0
}

complete -o default -o nospace -F _kill-program-complete kill-program
