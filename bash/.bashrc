#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

# Allows you to run aliases with sudo before them
alias sudo="sudo "

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

alias ls='ls --color=auto -a'

alias emacs='emacs -nw'

alias v='nvim'
export EDITOR='nvim'

alias egrep='egrep --color=always'

# Apply custom colorscheme
(wal -r &)
