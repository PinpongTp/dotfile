#!/usr/bin/env bash
# Copy a self-describing tmux pane reference to the macOS clipboard, to hand to Claude.
# Output shape:  tmux pane %32 (work:1.2, node, ~/Developer/remote/customer360-service)
# Usage: copy-pane-id.sh [target]   (default: the pane that invoked it)
set -euo pipefail

fmt='#{pane_id}|#{session_name}:#{window_index}.#{pane_index}|#{pane_current_command}|#{pane_current_path}'
target="${1:-}"
if [ -n "$target" ]; then
  raw=$(tmux display-message -p -t "$target" "$fmt")
else
  raw=$(tmux display-message -p "$fmt")
fi

IFS='|' read -r id loc cmd path <<<"$raw"
path="${path/#$HOME/~}"
ref="tmux pane $id ($loc, $cmd, $path)"

printf '%s' "$ref" | pbcopy
tmux display-message "copied: $ref"
