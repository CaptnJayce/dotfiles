# miko.zsh-theme — CaptnJayce
#
# Line 1: HH:MM:SS (venv) user@host          repo ±|branch ✗|
# Line 2: ❯
#
# Colours from the miko palette:
#   color4  = amethyst #9966cc  (navy/blue)
#   color5  = sakura   #ffb7c5  (purple/pink)
#   color6  = muted    #9090a8  (teal)
#   color9  = petal    #efa0a7  (red)
#   color13 = soft     #ffd0dd  (bright pink)

function _miko_git_info() {
    local branch
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null) || return 1

    local repo_name
    repo_name=$(basename "$(git rev-parse --show-toplevel 2>/dev/null)" 2>/dev/null)

    local dirty=""
    [[ -n "$(git status --porcelain 2>/dev/null)" ]] && dirty=" ✗"

    MIKO_GIT_PLAIN=""
    MIKO_GIT_COLORED=""

    [[ -n "$repo_name" ]] && {
        MIKO_GIT_PLAIN+="${repo_name} "
        MIKO_GIT_COLORED+="\033[1;35m${repo_name}\033[0m "
    }
    MIKO_GIT_PLAIN+="±|${branch}${dirty}|"
    MIKO_GIT_COLORED+="\033[34m±\033[0m|\033[35m${branch}\033[0m"
    [[ -n "$dirty" ]] && MIKO_GIT_COLORED+="\033[91m${dirty}\033[0m"
    MIKO_GIT_COLORED+="|"
    return 0
}

function _miko_precmd() {
    local clock
    clock=$(date +%H:%M:%S)
    local short_host=${HOST%%.*}

    local venv=""
    [[ -n "$VIRTUAL_ENV" ]] && venv="\033[34m($(basename "$VIRTUAL_ENV"))\033[0m "

    if _miko_git_info; then
        local rlen=${#MIKO_GIT_PLAIN}
        # Move to end of line, step back by git info length, print right side,
        # carriage-return to col 1, then print left side
        printf "\033[${COLUMNS}G\033[${rlen}D%s\033[0m\r\033[36m%s\033[0m %s\033[1;35m%s\033[36m@\033[35m%s\033[0m\n" \
            "$MIKO_GIT_COLORED" "$clock" "$venv" "$USER" "$short_host"
    else
        printf "\033[36m%s\033[0m %s\033[1;35m%s\033[36m@\033[35m%s\033[0m\n" \
            "$clock" "$venv" "$USER" "$short_host"
    fi
}

(( ! ${precmd_functions[(Ie)_miko_precmd]} )) && precmd_functions+=(_miko_precmd)

# Arrow goes red on non-zero exit
PROMPT='%(?.%B%F{5}.%B%F{9})❯%b%f '
RPROMPT=''
