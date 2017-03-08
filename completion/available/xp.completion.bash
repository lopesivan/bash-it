#!/usr/bin/env bash
#                      __ __       ___
#                     /\ \\ \    /'___`\
#                     \ \ \\ \  /\_\ /\ \
#                      \ \ \\ \_\/_/// /__
#                       \ \__ ,__\ // /_\ \
#                        \/_/\_\_//\______/
#                           \/_/  \/_____/
#                                         Algoritimos
#
#
#      Author: Ivan Lopes
#        Mail: ivan (at) 42algoritmos (dot) com (dot) br
#        Site: htredis_get://www.42algoritmos.com.br
#     License: gpl
#       Phone: +1 561 801 7985
#    Language: Shell Script
#        File: redis.get.bash
#        Date: Ter 28 Fev 2017 00:35:55 BRT
# Description:
#
# ----------------------------------------------------------------------------
#
# ----------------------------------------------------------------------------

##############################################################################
##############################################################################
##############################################################################

# ----------------------------------------------------------------------------
# Run!

_xp()
{
    COMPREPLY=()
    local word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=( $(compgen -W "$(xp commands)" -- "$word") )
    else
        local words=("${COMP_WORDS[@]}")

        case x${words[1]} in
            xe|xls|xrm|xcopy|xlink)
                unset words[0]
                unset words[$COMP_CWORD]
                local completions=$(xp keys "${words[@]}")
                COMPREPLY=( $(compgen -W "$completions" -- "$word") )
            ;;
            xcp|xln)
                unset words[0]
                unset words[$COMP_CWORD]
                local completions=$(xp x "${words[@]}")
                COMPREPLY=( $(compgen -W "$completions" -- "$word") )
            ;;
            xadd)
                unset words[0]
                unset words[$COMP_CWORD]
                local completions=$( find . -maxdepth 1 -type f -printf "%P\n" )
                COMPREPLY=( $(compgen -W "$completions" -- "$word") )
            ;;
        esac

    fi
}

complete -F _xp xp

