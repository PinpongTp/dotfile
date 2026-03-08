# Alias
source ~/.config/.alias

# Editor
export EDITOR="vim"

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"

NVM_BREW_PREFIX="$(brew --prefix)/opt/nvm"

[ -s "$NVM_BREW_PREFIX/nvm.sh" ] && . "$NVM_BREW_PREFIX/nvm.sh"
[ -s "$NVM_BREW_PREFIX/etc/bash_completion.d/nvm" ] && . "$NVM_BREW_PREFIX/etc/bash_completion.d/nvm"


# vi keybinding
bindkey -v
KEYTIMEOUT=1

function zle-keymap-select {
  case $KEYMAP in
    vicmd)
      printf '\e[1 q'   # block cursor in normal mode
      ;;
    viins|main)
      printf '\e[5 q'   # bar cursor in insert mode
      ;;
  esac
}

function zle-line-init {
  printf '\e[5 q'       # start in insert mode with bar cursor
}

zle -N zle-keymap-select
zle -N zle-line-init

# backspace/delete for vi insert mode
bindkey '^?' backward-delete-char
bindkey '^H' backward-delete-char
bindkey '^[[3~' delete-char

bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char
bindkey -M viins '^[[3~' delete-char
# Tools
eval "$(zoxide init zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Prompt
eval "$(starship init zsh)"
