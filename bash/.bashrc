#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'

# Para arreglar los colores de Tmux
export TERM=screen-256color

# Agrego mi carpeta de scripts al path
export PATH=$PATH:~/scripts

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
(cat ~/.cache/wal/sequences &)

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh

# Git branch in bash prompt
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
# Prompts
#PS1='[\u@\h \W]\$ '
#export PS1="\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\[\e[00m\]$"
export PS1="\e[0;32m\u@\h\e[m \e[0;33m\w\e[m \e[0;35m\$(parse_git_branch)\e[00m\n$ "
