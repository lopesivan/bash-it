# make sure that tmux is launched in 256 color mode

cite about-plugin
about-plugin 'make sure that tmux is launched in 256 color mode'

#alias tmux="TERM=screen-256color tmux"
#alias send-keys-all-windows="_tmux_send_keys_all_windows"

_tmux_clean() {
  tmux kill-session -a
}

_tmux_send_keys_all_panes () {
  for _pane in $(tmux list-panes -F '#P'); do
    tmux send-keys -t ${_pane} "$*" Enter
  done
}

_tmux_send_keys_all_windows () {
  for _window in $(tmux list-windows -F "#S:#I"); do
    tmux send-keys -t ${_window} "$*" Enter
  done
}

alias send-keys-all-panes="_tmux_send_keys_all_panes"
alias send-keys-all-windows="_tmux_send_keys_all_windows"
alias tmux-clean="_tmux_clean"
