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

_redis_get()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`redis.keys | grep -v vimmru| sed.joinlines`

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}

complete -F _redis_get redis.get redis.del redis.list

