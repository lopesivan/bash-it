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

_template()
{
    COMPREPLY=()
    local word="${COMP_WORDS[COMP_CWORD]}"

    if [ "$COMP_CWORD" -eq 1 ]; then
        COMPREPLY=( $(compgen -W "$(template commands)" -- "$word") )
    else
        local words=("${COMP_WORDS[@]}")

        if [ "$COMP_CWORD" -eq 2 ]; then
            case x${words[1]} in
                xgof)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$(template lsgof "${words[@]}")
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                    return 0
                ;;
            esac
        fi

        if [ "$COMP_CWORD" -eq 3 ]; then
            case x${words[2]} in
                xcomportamentais)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$(template lscomportamentais "${words[@]}")
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                    return 0
                ;;
                xcriacionais)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$(template lscriacionais "${words[@]}")
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                    return 0
                ;;
                xestruturais)
                    unset words[0]
                    unset words[$COMP_CWORD]
                    local completions=$(template lsestruturais "${words[@]}")
                    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
                    return 0
                ;;
            esac
        fi


        COMPREPLY=( $(compgen -W "$(template completions)" -- "$word") )
    fi
}

complete -F _template template

