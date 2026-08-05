#!/usr/bin/env bash
# Interactive picker for running Claude agents.
# Adapted from craftzdog/tmux-claude-session-manager (MIT).
#
#   picker.sh           fzf picker; on enter, jumps to the chosen agent.
#   picker.sh --list    print the rows only (used by fzf's ctrl-x reload).
#
# Opening the picker is also when stale @claude_state flags get reconciled: a
# Claude killed with SIGKILL never fires SessionEnd, so its window would keep a
# marker forever. That sweep is why there is no background daemon.
set -uo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=helpers.sh
. "$DIR/helpers.sh"

[ "${1:-}" = '--list' ] && exec "$DIR/agents.sh"

for tool in fzf jq claude; do
  command -v "$tool" >/dev/null 2>&1 || {
    tmux display-message "claude picker: $tool is required"
    exit 0
  }
done

# sweep <rows>
# Unset @claude_state on any window that no live agent occupies. Windows hosting
# a nested tmux client are left alone: their marker is a mirror set by the hook
# climbing out of the inner server, and the agent's own tty lives in there, so it
# never shows up in this server's rows.
sweep() {
  local live flagged nested w
  live="$(printf '%s' "$1" | cut -f4 | sort -u)"
  nested="$(tmux list-panes -a -F '#{window_id} #{pane_current_command}' 2>/dev/null |
    awk '$2 == "tmux" { print $1 }' | sort -u)"
  flagged="$(tmux list-windows -a -F '#{?@claude_state,#{window_id},}' 2>/dev/null | grep -v '^$')"
  [ -n "$flagged" ] || return

  for w in $flagged; do
    printf '%s\n' "$live" | grep -qx "$w" && continue
    printf '%s\n' "$nested" | grep -qx "$w" && continue
    tmux set-option -uw -t "$w" @claude_state 2>/dev/null
  done
  tmux refresh-client -S 2>/dev/null
}

rows="$("$DIR/agents.sh")"
sweep "$rows"

[ -n "$rows" ] || {
  tmux display-message "claude picker: no agents running in tmux panes"
  exit 0
}

self="$DIR/picker.sh"
export FZF_DEFAULT_OPTS=''
export CLAUDE_PICKER="$self"

# Arbitrary user fzf options (e.g. custom --bind or --preview-window)
extra_opts=()
fzf_options="$(get_tmux_option @claude_fzf_options '')"
[ -n "$fzf_options" ] && eval "extra_opts=($fzf_options)"

# ctrl-x kills the Claude process itself; the pane keeps the shell that hosted it.
# The reload waits a beat so the supervisor has dropped the agent from
# `claude agents --json`.
legend=$(printf '\033[31m●\033[0m perm: approve · \033[33m●\033[0m idle: answer · \033[32m●\033[0m done: finished · \033[90m●\033[0m working: mid-turn')

sel=$(printf '%s\n' "$rows" | fzf --ansi --delimiter='\t' --with-nth=5,6,7,8 \
  --reverse --cycle --header='Claude agents · enter: jump · ctrl-x: kill' \
  --footer="$legend" \
  --preview='tmux capture-pane -ept {2}' --preview-window='up,70%,follow' \
  --bind="ctrl-x:execute-silent(kill {3})+reload(sleep 0.3; $self --list)" \
  ${extra_opts[@]+"${extra_opts[@]}"})

[ -z "$sel" ] && exit 0
pane=$(printf '%s' "$sel" | cut -f2)
session=$(tmux display-message -p -t "$pane" '#{session_name}' 2>/dev/null)
[ -n "$session" ] || exit 0

# Switch the client that opened the popup, not this closing overlay.
host="$(tmux show-options -gqv @claude_picker_client 2>/dev/null)"
if [ -n "$host" ]; then
  tmux switch-client -c "$host" -t "$session" 2>/dev/null
else
  tmux switch-client -t "$session" 2>/dev/null
fi
tmux select-window -t "$pane" 2>/dev/null
tmux select-pane -t "$pane" 2>/dev/null
