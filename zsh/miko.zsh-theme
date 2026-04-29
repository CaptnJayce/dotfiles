# miko.zsh-theme — CaptnJayce

function _miko_precmd() {
    local clock=$(date +%H:%M:%S)
    local host=${HOST%%.*}

    local git_info=""
    if git rev-parse --abbrev-ref HEAD &>/dev/null; then
        local branch=$(git rev-parse --abbrev-ref HEAD)
        local repo=$(basename "$(git rev-parse --show-toplevel)")
        [[ -n "$(git status --porcelain 2>/dev/null)" ]] && local dirty=" ✗"
        git_info=$(printf " \e[1;35m%s\e[0m \e[34m±\e[35m|%s\e[91m%s\e[0m|" "$repo" "$branch" "$dirty")
    fi

    printf "\e[36m%s\e[0m \e[1;35m%s\e[37m@\e[1;35m%s\e[0m%s\n" \
        "$clock" "$USER" "$host" "$git_info"
}

(( ! ${precmd_functions[(Ie)_miko_precmd]} )) && precmd_functions+=(_miko_precmd)

PROMPT='%(?.%B%F{5}.%B%F{9})❯%b%f '