# terminal prompt
export PS1=$'\e[0;36m[\e[0;39m%~\e[0;36m]── ─\e[0;39m '

# aliases
alias vim='nvim'

# gpg tty
export GPG_TTY=$(tty)

# colorful ls
alias ls='ls --color'

# colorful, sensible grep
alias grep='grep --color=auto --exclude-dir=.git'

# auto cd
set -J
