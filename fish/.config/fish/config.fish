if test -f /usr/share/cachyos-fish-config/cachyos-config.fish
    source /usr/share/cachyos-fish-config/cachyos-config.fish
end

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

set -x EDITOR nvim
set -x VISUAL nvim

fish_add_path ~/.local/bin ~/.bun/bin ~/.cache/.bun/bin

alias ls='ls --color=auto'
alias kys='shutdown now'
alias grep='grep --color=auto'
alias cc='claude'
alias ccd='claude --channels plugin:discord@claude-plugins-official'
alias oc='opencode'
alias lg='lazygit'
alias nv='nvim'

if command -v direnv &>/dev/null
    direnv hook fish | source
end
