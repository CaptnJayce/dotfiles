export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="miko"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.bun/bin:$PATH"
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/projects/img-gen-test:$PATH"

# Aliases
alias ls='ls --color=auto'
alias kys='shutdown now'
alias grep='grep --color=auto'
alias cc='claude'
alias ccd='claude --channels plugin:discord@claude-plugins-official'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

# Direnv
eval "$(direnv hook zsh)"
