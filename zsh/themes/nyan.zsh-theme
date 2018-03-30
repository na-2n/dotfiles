# vim:ft=zsh

PRIMARY_COLOR="203"
SECONDARY_COLOR="209"

OK_COLOR="83" #"34"
WARN_COLOR="227"

git_prompt () {
    autoload -Uz vcs_info
    zstyle ":vcs_info:git*" formats "%b"
    vcs_info

    if [[ $vcs_info_msg_0_ ]] then
        local color="$OK_COLOR"

        if test -n "$(git status --porcelain --ignore-submodules 2> /dev/null)"; then
            color="$WARN_COLOR"
        fi

        echo -n "%F{1}%K{$color}%B $vcs_info_msg_0_ %b%k%f"
    else
        echo -n ""
    fi
}

os_name () {
    local icon

    case "$(uname -o)" in
        "GNU/Linux")
            icon="\uf17c"
            ;;
        "Android")
            icon="\uf17b"
            ;;
    esac

    echo -n "%K{$PRIMARY_COLOR}%B $icon $USERNAME@$(hostname) %b%k"
}

date_time () {
    echo -n "%K{$PRIMARY_COLOR} %B%t %b%k"
}

dir_path () {
    echo -n "%K{$SECONDARY_COLOR}%B %~ %b%k"
}

build_prompt () {
    date_time
    dir_path
}

build_rprompt () {
    git_prompt
    os_name
}

function precmd() {
    PROMPT="$(build_prompt) "
    RPROMPT="$(build_rprompt)"
}
