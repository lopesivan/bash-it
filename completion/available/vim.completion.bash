#!/usr/bin/env bash

export DEVELOPER_VIM_DIR=${HOME}/developer/vim/vim
export NVIM_LISTEN_ADDRESS=/tmp/nvim.sock

# Function for always using one (and only one) vim server, even when not
# using gvim.
# If you really want a new vim session, simply do not pass any
# argument to this function.
function er {
  vim_orig=$(which 2>/dev/null vim)
  if [ -z $vim_orig ]; then
    echo "$SHELL: vim: command not found"
    return 127;
  fi
  $vim_orig --serverlist | grep -q VIM
  # If there is already a vimserver, use it
  # unless no args were given
  if [ $? -eq 0 ]; then
    if [ $# -eq 0 ]; then
      $vim_orig
    else
      $vim_orig --remote "$@"
    fi
  else
    $vim_orig --servername vim "$@"
  fi
}

_nvim_complete()
{
    local cur_word prev_word type_list

    # COMP_WORDS is an array of words in the current command line.
    # COMP_CWORD is the index of the current word (the one the cursor is
    # in). So COMP_WORDS[COMP_CWORD] is the current word; we also record
    # the previous word here, although this specific script doesn't
    # use it yet.
    cur_word="${COMP_WORDS[COMP_CWORD]}"
    prev_word="${COMP_WORDS[COMP_CWORD-1]}"

    # Ask nvim to generate a list of types it supports
    type_list="`sed -n 's/.*-register\s\(.*\)\scall.*/\1/p' ~/.vim/settings/workspace.local| sed -e :a -e 'N;s/\n/ /; ta'`"
    # Only perform completion if the current word starts with a dash ('-'),
    # meaning that the user is trying to complete an option.
    if [[ ${cur_word} == * ]] ; then
        # COMPREPLY is the array of possible completions, generated with
        # the compgen builtin.
        COMPREPLY=( $(compgen -W "${type_list}" -- ${cur_word}) )
    else
        COMPREPLY=()
    fi
    return 0
}

# Register _nvim_complete to provide completion for the following commands
complete -F _nvim_complete nvim vim
