########################################
# UI 设置
########################################
UCL_RESET="\033[0;0m"
UCL_BLACK="\033[1;30m"
UCL_RED="\033[0;31m"
UCL_GREEN="\033[0;32m"
UCL_YELLOW="\033[0;33m"
UCL_BLUE="\033[0;34m"
UCL_PURPLE="\033[0;35m"
UCL_CYAN="\033[0;36m"
UCL_WHITE="\033[0;37m"

PS1="\n[\e[0;34m\u\e[0;37m@\e[0;31m\h \e[0;33m\A \e[0;36m#\j\e[0;0m]-[\e[0;32m\w\e[0;0m]\n\$ "

########################################
# 别名设置
########################################
alias ..='cd ..'
alias ...='cd ../..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'
alias ..6='cd ../../../../../..'

alias ll='ls -lhG'
alias ldu='du -d 1 -h'

alias gs='git status'
alias gd='git diff'
alias gitlog='git log --oneline --decorate --graph --pretty="%Cgreen%cd%Creset %Cred%h%Creset %Cblue%cn%Creset %s" --date=short'

# git 命令自动补全
if [ -f /opt/homebrew/etc/bash_completion.d/git-completion.bash ]; then
    . /opt/homebrew/etc/bash_completion.d/git-completion.bash
fi

########################################
# 其他设置
########################################
export EDITOR=vim

########################################
# 功能函数
########################################
# 根据文件类型解压文件
function extract () {
if [ -f "$1" ] ; then
    case $1 in
        *.tar.bz2)  tar xjf "$1"                  ;;
        *.tar.gz)   tar xzf "$1"                  ;;
        *.bz2)      bunzip2 "$1"                  ;;
        *.rar)      unrar x "$1"                  ;;
        *.gz)       gunzip "$1"                   ;;
        *.tar)      tar xf "$1"                   ;;
        *.tbz2)     tar xjf "$1"                  ;;
        *.tgz)      tar xzf "$1"                  ;;
        *.zip)      unzip "$1"                    ;;
        *.Z)        uncompress "$1"               ;;
        *)          echo "'$1' cannot be extracted via extract()"   ;;
    esac
else
    echo "'$1' is not a valid file"
fi
}
export -f extract

# QODER_DISPATCHER_PATH v1
_qoder_dispatcher_entry="$HOME/.qoder/entry"
_qoder_dispatcher_rest=${PATH-}
_qoder_dispatcher_tail=
while :; do
  case $_qoder_dispatcher_rest in
    *:*) _qoder_dispatcher_part=${_qoder_dispatcher_rest%%:*}; _qoder_dispatcher_rest=${_qoder_dispatcher_rest#*:}; _qoder_dispatcher_more=1 ;;
    *) _qoder_dispatcher_part=$_qoder_dispatcher_rest; _qoder_dispatcher_more= ;;
  esac
  if [ "$_qoder_dispatcher_part" != "$_qoder_dispatcher_entry" ]; then
    _qoder_dispatcher_tail="${_qoder_dispatcher_tail}:${_qoder_dispatcher_part}"
  fi
  [ -n "$_qoder_dispatcher_more" ] || break
done
PATH="${_qoder_dispatcher_entry}${_qoder_dispatcher_tail}"
export PATH
unset _qoder_dispatcher_entry _qoder_dispatcher_rest _qoder_dispatcher_tail _qoder_dispatcher_part _qoder_dispatcher_more
# END QODER_DISPATCHER_PATH v1

########################################
# Claude Code: DeepSeek 模式 (tokenrhythm 网关)
########################################
# API key 存放在 ~/.config/deepseek/api_key，不写进 dotfiles
claude-ds() {
    local key_file="$HOME/.config/deepseek/api_key"
    if [ ! -s "$key_file" ]; then
        echo "未找到 API key: 请执行 printf '%s' '<your-key>' > $key_file" >&2
        return 1
    fi
    ANTHROPIC_BASE_URL=https://tokenrhythm.studio \
    ANTHROPIC_AUTH_TOKEN="$(<"$key_file")" \
    ANTHROPIC_MODEL=deepseek-v4.1-flash-1017 \
    ANTHROPIC_DEFAULT_OPUS_MODEL=deepseek-v4.1-flash-1017 \
    ANTHROPIC_DEFAULT_SONNET_MODEL=deepseek-v4.1-flash-1017 \
    ANTHROPIC_DEFAULT_HAIKU_MODEL=deepseek-v4.1-flash-1017 \
    CLAUDE_CODE_SUBAGENT_MODEL=deepseek-v4.1-flash-1017 \
    command claude "$@"
}
