
########################################
# UI 设置
########################################
# 颜色设置
UCL_RESET=1
UCL_NORMAL="\033[0;0m]"
UCL_BLACK="\033[1;30m"
UCL_RED="\033[0;31m"
UCL_GREEN="\033[0;32m"
UCL_YELLOW="\033[0;33m"
UCL_BLUE="\033[0;34m"
UCL_PURPLE="\033[0;35m"
UCL_CYAN="\033[0;36m"
UCL_WHITE="\033[0;37m"

export PS1="
[${UCL_BLUE}\u${UCL_WHITE}@${UCL_RED}\h ${UCL_YELLOW}\A ${UCL_CYAN}#\j${UCL_NORMAL}-[${UCL_GREEN}\w${UCL_NORMAL}
\$ "
PS1="\n[\e[0;34m\u\e[0;37m@\e[0;31m\h \e[0;33m\A \e[0;36m#\j\e[0;0m]-[\e[0;32m\w\e[0;0m]\n\$ "

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
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

alias ll='ls -lh'
alias ldu='du -d 1 -h'

alias gs='git status'
alias gd='git diff'
alias gitlog='git log --oneline --decorate --graph --pretty="%Cgreen%cd%Creset %Cred%h%Creset %Cblue%cn%Creset %s" --date=short'




########################################
# 其他设置
########################################
export EDITOR=$(which vim)

########################################
# 载入用户的自定义设置
# 例如 export 相关设置
########################################
if [ -f ~/.bashrc.more ]; then
    source ~/.bashrc.more
fi

#####################################
# 功能函数
#####################################

# 根据文件类型解压文件
function extract () {
if [ -f $1 ] ; then
    case $1 in
        *.tar.bz2)  tar xjf $1                  ;;
        *.tar.gz)   tar xzf $1                  ;;
        *.bz2)      bunzip2 $1                  ;;
        *.rar)      rar x $1                    ;;
        *.gz)       gunzip $1                   ;;
        *.tar)      tar xf $1                   ;;
        *.tbz2)     tar xjf $1                  ;;
        *.tgz)      tar xzf $1                  ;;
        *.zip)      unzip $1                    ;;
        *.Z)        uncompress $1               ;;
        *)          echo "'$1' cannot be extracted via extract()"   ;;
    esac
else
    echo "'$1' is not a valid file"
fi
}
export -f extract


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/hechuan/.sdkman"
[[ -s "/home/hechuan/.sdkman/bin/sdkman-init.sh" ]] && source "/home/hechuan/.sdkman/bin/sdkman-init.sh"
