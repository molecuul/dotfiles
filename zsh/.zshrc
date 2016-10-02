export ZSH=/home/molecuul/.oh-my-zsh

ZSH_THEME="example"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"

plugins=(git)

source $ZSH/oh-my-zsh.sh

export EDITOR=vim
alias ls='ls --color'
