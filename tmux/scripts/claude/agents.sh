#!/usr/bin/env bash
# Emit one picker row per running Claude that lives in a tmux pane.
# Adapted from craftzdog/tmux-claude-session-manager (MIT), with the state from
# our own hooks layered on top of what Claude self-reports.
#
# Two sources, in this order:
#   1. @claude_state — set per window by ~/.claude/hooks/tmux-claude-state.sh the
#      moment a hook fires. Finer-grained: it separates `perm` from `idle`, which
#      `claude agents --json` lumps together as `waiting`.
#   2. `claude agents --json` — fills in agents that have not fired a hook yet
#      (still working, or started before the hooks were installed).
#
# Identity is the Claude process, not the tmux session: joining pid -> tty -> pane
# is what lets several Claudes in one project each get a row of their own.
#
#   Row: rank \t pane_id \t pid \t window_id \t icon \t age \t loc \t path
#   rank/pane_id/pid/window_id are hidden from the display via fzf's --with-nth.
set -uo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=helpers.sh
. "$DIR/helpers.sh"

agents="$(claude_agents_json)" || exit 0
rows="$(printf '%s' "$agents" |
  jq -r '.[] | select(.kind == "interactive") | [.pid, .status, .sessionId, .cwd] | @tsv' 2>/dev/null)"
[ -n "$rows" ] || exit 0

# Resolved out here because only `stat`, outside awk, can read an mtime.
mtimes="$(printf '%s\n' "$rows" | cut -f3 | while IFS= read -r sid; do
  printf 'M\t%s\t%s\n' "$sid" "$(claude_transcript_mtime "$sid")"
done)"

# Three tagged streams into one awk: pid->tty, tty->pane (carrying our hook
# state), session->last-activity. Total cost is 3 subprocesses regardless of how
# many sessions or panes exist.
{
  ps -Ao pid=,tty= 2>/dev/null | awk '{ print "P\t" $1 "\t" $2 }'
  tmux list-panes -a -F $'T\t#{pane_tty}\t#{pane_id}\t#{session_name}:#{window_index}.#{pane_index}\t#{window_id}\t#{@claude_state}' 2>/dev/null
  printf '%s\n' "$mtimes"
  printf '%s\n' "$rows" | sed $'s/^/A\t/'
} | awk -F'\t' -v now="$(date +%s)" -v home="$HOME" '
  $1 == "P" { tty_of[$2] = $3; next }
  $1 == "T" {
    sub(/^\/dev\//, "", $2)
    pane[$2] = $3; loc[$2] = $4; win[$2] = $5; state[$2] = $6
    next
  }
  $1 == "M" { seen_at[$2] = $3; next }
  $1 == "A" {
    tty = tty_of[$2]
    if (tty == "" || !(tty in pane)) next   # this Claude is not running inside tmux

    # Our hooks are more specific than what `claude agents --json` reports, so
    # they win whenever a state is set on the window.
    if      (state[tty] == "perm") { icon = "\033[31m●\033[0m perm   "; rank = 0 }  # red    - blocked on approval
    else if (state[tty] == "idle") { icon = "\033[33m●\033[0m idle   "; rank = 1 }  # yellow - asked you something
    else if (state[tty] == "done") { icon = "\033[32m●\033[0m done   "; rank = 2 }  # green  - finished a turn
    else if (state[tty] == "busy") { icon = "\033[90m●\033[0m working"; rank = 4 }  # grey   - mid-turn, leave it
    else if ($3 == "waiting")      { icon = "\033[33m●\033[0m waiting"; rank = 1 }  # yellow - needs input
    else if ($3 == "idle")         { icon = "\033[32m●\033[0m idle   "; rank = 2 }  # green  - done, your turn
    else if ($3 == "busy")         { icon = "\033[90m●\033[0m working"; rank = 4 }  # grey   - busy, leave it
    else                           { icon = "\033[90m●\033[0m   ?    "; rank = 3 }  # grey   - unrecognised status

    age = (seen_at[$4] != "") ? int((now - seen_at[$4]) / 60) "m" : "-"

    path = $5
    if (index(path, home) == 1) path = "~" substr(path, length(home) + 1)

    printf "%s\t%s\t%s\t%s\t%s\t%5s\t%s\t%s\n",
      rank, pane[tty], $2, win[tty], icon, age, loc[tty], path
  }
' | sort -t$'\t' -k1,1n -k6,6n
# rank asc (what needs you floats up), then age asc so whatever just went idle
# sits at the top of its group. -k6,6n reads the leading number of the age field
# ("5m" -> 5; "-" -> 0).
