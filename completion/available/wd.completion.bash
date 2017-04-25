#!/usr/bin/env bash

_wdd() {
  local wdd="$HOME/.wdd"
  [[ -d "$wdd" ]] || mkdir "$wdd"

  echo "$wdd"
}

_warp_points() {
  ls "$(_wdd)/"| sed 's|@||'
}

_point_from_path() {
  echo "$1" | cut -d/ -f1
}

_path_without_point() {
  if [[ "$1" =~ "/" ]]; then
    echo "$1" | cut -d/ -f2-
  fi
}

_leading_folders_from_path() {
  if [[ "$1" =~ "/" ]]; then
    echo "$1" | rev | cut -d/ -f2- | rev | sed 's|$|/|'
  fi
}

_path_without_leading_folders() {
  echo "$1" | rev | cut -d/ -f1 | rev
}

_point_destination() {
  local wdd="$(_wdd)"
  local point="$1"

  echo "$(readlink $wdd/$point)"
}

_wd_autocomplete() {
  local current="${COMP_WORDS[COMP_CWORD]}"

  if [[ "$current" =~ "/" ]]; then
    local point="$(_point_from_path "$current")"
    local subpath="$(_path_without_point "$current")"
    local destination="$(_point_destination "$point")"
    local subfolders="$(_leading_folders_from_path "$subpath")"
    local completions="$(ls -F "$destination/$subfolders" | sed 's|@$||')"
    current="$(_path_without_leading_folders "$subpath")"

    COMPREPLY=($(compgen -W "$completions" -P "$point/$subfolders" -- $current))
  else
    COMPREPLY=($(compgen -W "$(_warp_points)" -- $current))
  fi
}

wd() {
  local wdd="$(_wdd)"

  local point_name="$2"
  local point_path="$wdd/$point_name"
  local point_destination="$(readlink $point_path)"
  local tmux_on=0
  local make_on=0

  [[ -z "$point_destination" ]] && point_destination="no point destination"

  case "x$1" in
    xt)
      shift
      tmux_on=1
    ;;
    xmk)
      shift
      cat $( redis-bash-cli get $1 )
      return $?
    ;;
    xadd)
      if ln -s "$PWD" "$point_path" &> /dev/null; then
        echo "Added warp point '$point_name' ($PWD)"
        return 0
      else
        echo "Error adding warp point '$point_name' ($PWD)"
        return 1
      fi
    ;;
    xrm)
      if rm -f "$point_path" &> /dev/null; then
        echo "Removed warp point '$point_name' ($point_destination)"
        return 0
      else
        echo "Error removing warp point '$point_name' ($point_destination)"
        return 1
      fi
    ;;
    xls)
      local point_list=$(ls -l "$wdd/" | grep -v '^total' | grep -Eo '\b\w+\b ->.*' | awk -F' -> ' '{printf "\033[95m%14s\033[0m \033[92m%s\033[0m\n", $1, $2}')
      echo "$point_list" | grep "$2"
      return 0
    ;;
    x-h | x--help)
      echo "Usage: wd [command] <point_name>"
      echo "Commands:"
      echo "  add <point_name>    Adds the current working directory to your warp points"
      echo "  rm <point_name>     Removes the named point from your warp points"
      echo "  t <point_name>      Open points with tmux"
      echo "  ls                  Prints all warp points"
      echo "  ls <point_name>     Prints all warp points matching the specified name"
      echo "  -                   warps to previous working directory"
      echo "  -h, --help          Prints this lovely message"
      return 0
    ;;
    x)
      cd /workspace
      return $?
    ;;
    x-)
      cd -
      return $?
    ;;
    x-*)
      echo "Unknown option: '$1'"
      return 1
    ;;
  esac

  # if we get here, we're warping
  local requested_point="$(_point_from_path "$1")"
  local subpath="$(_path_without_point "$1")"

  point_path="$wdd/$requested_point"

  if [[ ! -L "$point_path" ]]; then
    echo "Can't warp to point '$requested_point' because it doesn't exist."
    return 1
  fi

  local requested_destination="$(readlink $point_path)/$subpath"

  if [ $tmux_on -eq 1 ]; then
    tmux new-window -c "$requested_destination"
    return $?
  fi


  cd "$requested_destination"
  return $?
}

complete -o nospace -F _wd_autocomplete wd
