export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
CASE_SENSITIVE="true"
ENABLE_CORRECTION="true"

plugins=(git)

source "$ZSH/oh-my-zsh.sh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# -------
# Aliases
# -------
alias l="ls" # List files in current directory
alias ll="ls -lah" # List all files in current directory in long list format

if command -v open >/dev/null 2>&1; then
  alias o='open .'
fi

# -------
# Git Aliases
# -------
alias gaa='git add .'
alias gcm='git commit -m'
alias gpsh='git push'
alias gss='git status -s'
alias gs="git status"
