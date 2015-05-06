# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# prompt
function vcs_status()
{
    local vcs_name=$1
    local vcs_info=$2
    local vcs_extra_info=$3

    local reset="\033[0m"
    local bg1="\e[38;5;208m"
    local bg2="\e[38;5;237m"

    #prompt_rectangle 47

    echo -n "${bg1}⎇ $vcs_name $bg2 $vcs_info ${reset}"
}

function git_status()
{
    local git_branch=$(git branch --no-color 2> /dev/null | tr '\n' ' ' | sed 's/  //' || echo "")

    if [ -n "$git_branch" ]; then
        vcs_status "git" "$git_branch"
    fi
}

function svn_status()
{
    local svn_info=$(svn info 2> /dev/null || echo "")

    if [ -n "$svn_info" ]; then
        local svn_url=`echo "$svn_info" | grep URL | sed 's/URL: //'`
        local svn_revision=r`echo "$svn_info" | grep Revision: | sed 's/Revision: //'`

        vcs_status "svn" "$svn_url $svn_revision"
    fi
}

function prompt_host()
{
    if [ -n "$SSH_CLIENT" ]; then
        echo "\h"
    fi
}

function prompt_tasks()
{
    echo -n "\e[38;5;238m"

    if [ `jobs -p | wc -l` -gt 0 ]; then
        jobs | awk '
                {
                    printf "%-5s ", $1
                    for (i=3;i<=NF;i++)
                        printf "%s ", $i
                }
                '
    fi

    echo -n -e "\033[0m"
}

function prompt_rectangle()
{
    local bg="\033[$1;1m"
    local reset="\033[0m"

    echo -n -e "$bg▶$reset"
}

function prompt_block()
{
    local text=$1
    local bg1_color=$2
    local bg2_color=$3

    if [ -n "$text" ]; then
        local reset="\033[0m"
        local bg1="\033[$bg1_color;1m"
        local bg1_to_bg2="\033[$bg2_color;$(($bg1_color-10))m"

        echo -n -e "$bg1 $text ${reset}${bg1_to_bg2}◤${reset}"
    fi
}

function prompt_command()
{
    PS1="\n"
    PS1+="`prompt_tasks`\n"

    PS1+="\e[38;5;36m\u\033[0m "
    #if [ -n "$SSH_CLIENT" ]; then
        PS1+="\e[38;5;37m@\033[0m"
        PS1+="\e[38;5;31m\h\033[0m "
    #fi
    PS1+="\e[38;5;39m\w\033[0m "
    #PS1+="\e[1;34;40m\w\033[0m "

    PS1+=$(git_status)
    PS1+=$(svn_status)

    PS1+="\n\$ "
}

PROMPT_COMMAND=prompt_command

#▶▶▶◣
# ⎇ ⌥

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

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

PATH=$PATH:~/bin:~/.bin

