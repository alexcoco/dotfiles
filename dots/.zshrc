# History
HISTFILE=~/.zsh_history
HISTSIZE=20000
SAVEHIST=20000

setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS

# Convenience for skipping words
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word
bindkey '^[[3~' delete-char

# Prompt
setopt promptsubst

git_branch() {
  git rev-parse --abbrev-ref HEAD 1>/dev/null 2>/dev/null; [ $? -eq 0 ] && echo " ($(git rev-parse --abbrev-ref HEAD))"
}

git_dirty() {
  git diff --quiet --ignore-submodules HEAD 2>/dev/null; [ $? -eq 1 ] && echo ' ¤'
}

PROMPT='%(?.%F{green}.%F{red})⌘%f %F{blue}%~%f%F{yellow}$(git_branch)$(git_dirty)%f '

# Completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' # Matches case insensitive for lowercase
zstyle ':completion:*' insert-tab pending           # Pasting with tabs doesn't perform completion

# Do not autocomplete remote Git branches
export GIT_COMPLETION_CHECKOUT_NO_GUESS=1

# Aliases
setopt COMPLETE_ALIASES

alias be="bundle exec"

# Environment
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true
export FWD="alex"

if [ -f ~/.zshrc.local ]; then
  source ~/.zshrc.local
fi

if [ -f ~/.zshrc.spin ]; then
  source ~/.zshrc.spin
fi
