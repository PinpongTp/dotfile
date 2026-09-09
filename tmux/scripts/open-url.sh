#!/usr/bin/env bash
# Pick a URL from a pane and open it.
# tmux ends every rendered row with a hard newline, so the terminal cannot see
# that a long URL was wrapped. capture-pane -J rejoins those rows first.
set -euo pipefail

pane="${1:-}"
lines="${2:-5000}"

urls=$(tmux capture-pane -p -J -S "-${lines}" ${pane:+-t "$pane"} \
  | grep -oE '(https?|ftp|file)://[^][:space:]"'"'"'<>)}]+' \
  | sed -E 's/[.,:;!?]+$//' \
  | awk 'length > 8 && !seen[$0]++' \
  | tail -r)

if [ -z "$urls" ]; then
  tmux display-message "No URL found in pane"
  exit 0
fi

selected=$(printf '%s\n' "$urls" | fzf --prompt='url> ' --height=100% --reverse) || exit 0
[ -n "$selected" ] && open "$selected"
