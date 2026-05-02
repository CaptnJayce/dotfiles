# CachyOS defaults (present on CachyOS installs)
if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

# Suppress fastfetch greeting from CachyOS config
function fish_greeting
end

# PATH
fish_add_path ~/.local/bin
fish_add_path ~/.bun/bin
fish_add_path ~/.opencode/bin
fish_add_path ~/projects/img-gen-test

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
if command -v direnv &>/dev/null
    direnv hook fish | source
end
