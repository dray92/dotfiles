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

EOF
}

_install_git_aliases

printf "\033[0;31mRun '. $HOME/.bash_profile'\033[0m\n"