#!/bin/bash

_install_basics () {
	cat <<EOF >> $HOME/.bash_profile

##
#-----------External IP--------
##
alias curr_ip="curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"


EOF
}

_install_basics

printf "\033[0;31mRun '. $HOME/.bash_profile'\033[0m\n"
