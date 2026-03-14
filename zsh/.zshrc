# ------------------------------------------------------------
# ZSH Configuration (Minimal Dev Setup)
#
# Environment:
#   - Terminal : Ghostty
#   - Shell    : zsh
#
# Features:
#   - Vim-style command line editing (bindkey -v)
#   - Cursor mode indicator:
#       * NORMAL mode = block cursor
#       * INSERT mode = bar cursor
#   - Backspace/Delete fix for vi insert mode
#   - Command history-based autosuggestions
#   - Smart directory jumping with zoxide
#   - Fuzzy finder integration with fzf
#   - Node version management with nvm
#   - Modern prompt with Starship
#
# Structure:
#   1. Alias
#   2. Editor
#   3. History
#   4. NVM
#   5. Vim keybinding
#   6. Cursor behavior
#   7. Backspace/Delete fixes
#   8. Tools
#   9. Autosuggestions
#  10. Prompt
#
# Notes:
#   - Keep this config minimal and fast.
#   - Avoid auto-install logic inside .zshrc.
#   - Works well with tmux + neovim workflow.
# ------------------------------------------------------------

# ------------------------------------------------------------
# Alias
# ------------------------------------------------------------
source ~/.config/.alias

# ------------------------------------------------------------
# Editor
# ------------------------------------------------------------
export EDITOR="vim"

# ------------------------------------------------------------
# History
# ------------------------------------------------------------
HISTSIZE=10000
SAVEHIST=10000
HISTFILE="$HOME/.zsh_history"

setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS

# ------------------------------------------------------------
# NVM (Node Version Manager)
# ------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
NVM_BREW_PREFIX="$(brew --prefix)/opt/nvm"

[ -s "$NVM_BREW_PREFIX/nvm.sh" ] && . "$NVM_BREW_PREFIX/nvm.sh"
[ -s "$NVM_BREW_PREFIX/etc/bash_completion.d/nvm" ] && . "$NVM_BREW_PREFIX/etc/bash_completion.d/nvm"

# ------------------------------------------------------------
# Vim keybinding
# ------------------------------------------------------------
bindkey -v
KEYTIMEOUT=1

# ------------------------------------------------------------
# Cursor behavior for vi mode
#   - NORMAL mode : block cursor
#   - INSERT mode : bar cursor
# ------------------------------------------------------------
function zle-keymap-select {
  case $KEYMAP in
    vicmd)
      printf '\e[1 q'
      ;;
    viins|main)
      printf '\e[5 q'
      ;;
  esac
}

function zle-line-init {
  printf '\e[5 q'
}

zle -N zle-keymap-select
zle -N zle-line-init

# ------------------------------------------------------------
# Backspace/Delete fixes for vi mode
# ------------------------------------------------------------
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^[[3~' delete-char

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^[[3~' delete-char

# ------------------------------------------------------------
# Tools
# ------------------------------------------------------------
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# ------------------------------------------------------------
# Autosuggestions
#   - Uses command history as suggestion source
# ------------------------------------------------------------
source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
ZSH_AUTOSUGGEST_STRATEGY=(history)

# ------------------------------------------------------------
# Prompt
# ------------------------------------------------------------
eval "$(starship init zsh)"
