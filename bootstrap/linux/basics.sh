#!/bin/bash

_install_basics () {
	cat <<EOF >> $HOME/.bashrc

##
#-----------External IP--------
##
alias curr_ip="curl -s http://checkip.dyndns.org/ | sed 's/[a-zA-Z<>/ :]//g'"


EOF
	sudo apt-get install -y fontconfig || sudo apt-get update && sudo apt-get install -y fontconfig
        curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh
        bash -i -c 'fancygit --suggested-global-git-config-apply'
        bash -i -c 'fancygit --theme-human'
        bash -i -c 'fancygit --enable-host-name'
}

_install_basics

printf "\033[0;31mRun '. $HOME/.bashrc'\033[0m\n"
