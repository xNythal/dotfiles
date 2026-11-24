# Created by newuser for 5.9

# Configure auto complete
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
compinit -D

# Change prompt style
_prompt_newline() { [[ -n "$_prompt_started" && "$_last_command" != clear ]] && print; _prompt_started=1; }
_prompt_track_command() { _last_command=${1%% *}; }
precmd_functions+=(_prompt_newline)
preexec_functions+=(_prompt_track_command)

PROMPT='%K{#FF7F2A}%F{white}%D{%d %b %H:%M} %~%k%F{#FF7F2A}%f '

# Configure persistent history
HISTFILE=~/.zsh_history
SAVEHIST=10000
setopt SHARE_HISTORY

# Configure keybindings
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey '^H' backward-kill-word
clear-and-redraw() {
  clear
  zle redisplay
}
zle -N clear-and-redraw
bindkey '^L' clear-and-redraw


# Source plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Setup environment variables
export EDITOR=vi
