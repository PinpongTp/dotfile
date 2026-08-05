#!/usr/bin/env bash
# Shared helpers for the Claude agent picker.
# Adapted from craftzdog/tmux-claude-session-manager (MIT).

# get_tmux_option <option-name> <default>
# Echoes the global tmux option value, or the default when unset/empty.
get_tmux_option() {
  local value
  value="$(tmux show-option -gqv "$1" 2>/dev/null)"
  if [ -n "$value" ]; then
    printf '%s' "$value"
  else
    printf '%s' "$2"
  fi
}

# file_mtime <path>
# Epoch seconds of a file's last modification. GNU stat (Linux) is tried first,
# then BSD (macOS); each rejects the other's flag, so the fallback is unambiguous.
file_mtime() {
  stat -c %Y "$1" 2>/dev/null || stat -f %m "$1" 2>/dev/null
}

# claude_transcript_mtime <session-id>
# Epoch seconds of the last write to that Claude session's transcript — i.e. when
# the agent last did anything. `claude agents --json` reports only `startedAt`,
# never a last-activity time, so the transcript's mtime stands in for it.
#
# Found by glob so we never have to reproduce Claude's cwd -> project-slug
# encoding. The path is an internal Claude Code detail and may move; an empty
# result just renders the age column as '-'.
claude_transcript_mtime() {
  local base f
  base="${CLAUDE_CONFIG_DIR:-$HOME/.claude}"
  for f in "$base"/projects/*/"$1".jsonl; do
    [ -f "$f" ] && {
      file_mtime "$f"
      return
    }
  done
}

# claude_agents_json
# `claude agents --json`, with the `claude-fast` shim's stderr chatter dropped.
claude_agents_json() {
  claude agents --json 2>/dev/null
}
