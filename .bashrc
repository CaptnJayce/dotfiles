#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

export EDITOR="nvim"
export HYPRSHOT_DIR="/home/captnjayce/Pictures/screenshots"

export PATH=$PATH:/home/captnjayce/.local/bin

fastfetch
eval "$(oh-my-posh init bash)"

. "$HOME/.cargo/env"
