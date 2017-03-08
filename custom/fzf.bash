#!/usr/bin/env bash

gd() {
  local dir
  dir=$(redis-cli ZRANGE vimmru 0 -1 | awk '{print $1}'| sed -r 's=(.*)/.*=\1='| sort | uniq  |sed -e '1 i\..' -e '/\./d'|
        fzf-tmux -l 20% --multi --reverse --query="$1" --select-1 --exit-0) &&
    cd "$dir"
}
