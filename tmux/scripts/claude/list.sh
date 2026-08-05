#!/usr/bin/env bash
# Open the agent picker in a popup.
#
# A key binding cannot both format-expand #{client_name} and open an interactive
# popup, so the binding runs this through run-shell (which expands formats) and
# this opens the popup. The client name is stashed for picker.sh, which needs it
# to switch the *outer* client rather than the popup overlay.
set -uo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# shellcheck source=helpers.sh
. "$DIR/helpers.sh"

w="$(get_tmux_option @claude_popup_width '80%')"
h="$(get_tmux_option @claude_popup_height '80%')"

me="${1:-}"
if [ -n "$me" ]; then
  tmux set-option -g @claude_picker_client "$me"
  tmux display-popup -c "$me" -w "$w" -h "$h" -E "$DIR/picker.sh"
else
  tmux set-option -gu @claude_picker_client 2>/dev/null
  tmux display-popup -w "$w" -h "$h" -E "$DIR/picker.sh"
fi
