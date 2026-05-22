if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

function fish_greeting
    fastfetch
end

fish_add_path ~/.local/bin ~/.bun/bin ~/.opencode/bin

alias ls='ls --color=auto'
alias kys='shutdown now'
alias grep='grep --color=auto'
alias cc='claude'
alias ccd='claude --channels plugin:discord@claude-plugins-official'
alias ga='git add .'
alias gc='git commit -m'
alias gp='git push'

if command -v direnv &>/dev/null
    direnv hook fish | source
end

# opencode
fish_add_path ~/.opencode/bin
