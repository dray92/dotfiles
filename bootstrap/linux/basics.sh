#!/bin/bash

_install_basics () {
	cat <<EOF >> $HOME/.bashrc

##
#-----------External IP--------
##
alias curr_ip="curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"


EOF
}

_install_basics

printf "\033[0;31mRun '. $HOME/.bashrc'\033[0m\n"
