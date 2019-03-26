# initialize zimfw
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# terminal prompt
export PS1=$'\e[0;36m[\e[0;39m%~\e[0;36m]── ─\e[0;39m '

# aliases
alias vim='nvim'

# gpg tty
export GPG_TTY=$(tty)
