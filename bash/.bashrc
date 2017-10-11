#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo="sudo "

alias ls='ls --color=auto -a'
PS1='[\u@\h \W]\$ '

alias emacs='emacs -nw'

alias v='vim'
export EDITOR='vim'
