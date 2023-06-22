#!/bin/bash

_install_git_aliases () {
	sudo printf "##\n#------Git alias preferences------\n##\n" >> $HOME/.bash_profile

	cat <<EOF >> $HOME/.bash_profile
alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gcheck="git checkout"
alias gb="git branch"
alias gpull="git pull"
alias gpush="git push"
alias gl="git log --graph --pretty=format:'%C(blue)%ai %C(yellow)%H %C(green)%an %C(red)%s'"
alias gpusho="git push origin \$(git branch --show-current)"

##
#----------Git branch--------
##
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

EOF
}

_install_git_aliases

printf "\033[0;31mRun '. $HOME/.bash_profile'\033[0m\n"
