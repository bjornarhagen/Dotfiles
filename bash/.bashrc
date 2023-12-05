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

alias ls='ls -a --color=auto'
alias ll='ls -lha --color=auto'

alias v='nvim'
export EDITOR='nvim'

alias egrep='egrep --color=always'

# Apply custom colorscheme
#(wal -r &)
#(cat ~/.cache/wal/sequences &)

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
