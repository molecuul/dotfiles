# terminal prompt
export PS1=$'\e[1;34m[\e[1;37m%~\e[1;34m]── ─\e[0;39m '

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

# color man
man() {
    LESS_TERMCAP_md=$'\e[1;32m' \
    LESS_TERMCAP_me=$'\e[0m' \
    LESS_TERMCAP_se=$'\e[0m' \
    LESS_TERMCAP_so=$'\e[1;32m' \
    LESS_TERMCAP_ue=$'\e[0m' \
    LESS_TERMCAP_us=$'\e[0;32m' \
    command man "$@"
}
