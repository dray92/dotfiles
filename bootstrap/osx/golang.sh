#!/bin/bash

# pretty janky execution atm
_update_bash_profile () {
	sudo printf "##\n#------Golang requirements------\n##\n" >> $HOME/.bash_profile

	# GOPATH
	if [[ -z "${GOPATH}" ]]; then
	  echo "export GOPATH=$HOME/gocode" >> $HOME/.bash_profile
	fi
	. $HOME/.bash_profile
	echo "export PATH=$PATH:$GOPATH/bin" >> $HOME/.bash_profile

	# GOROOT
	if [[ -z "${GOROOT}" ]]; then
	  echo "export GOROOT=/usr/local/opt/go/libexec" >> $HOME/.bash_profile
	fi
	. $HOME/.bash_profile
	printf "export PATH=$PATH:$GOROOT/bin\n\n" >> $HOME/.bash_profile
}

# get latest golang from brew
brew install golang

# gvm is useful when you want to switch about
if ! command -v gvm >/dev/null ; then
	bash < <(curl -sSL https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
fi
. $HOME/.gvm/scripts/gvm

# complete golang setup
_update_bash_profile

# source the bash profile so all the changes take immediate effect
. $HOME/.bash_profile

# setup workspace
mkdir -p $GOPATH $GOPATH/src $GOPATH/pkg $GOPATH/bin
