#!/bin/bash

_install_git_aliases () {
	sudo printf "##\n#------Git alias preferences------\n##\n" >> $HOME/.bashrc

	cat <<EOF >> $HOME/.bashrc
##
#----------Git branch--------
##
parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

alias gst="git status"
alias ga="git add"
alias gc="git commit"
alias gcheck="git checkout"
alias gb="git branch"
alias gpull="git pull"
alias gpush="git push"
alias gl="git log --graph --pretty=format:'%C(blue)%ai %C(yellow)%H %C(green)%an %C(red)%s'"
alias gpusho="git push origin \$(parse_git_branch)"

alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"

export EDITOR=vi

function jump(){
    aws ssm start-session --target $(aws ec2 describe-instances --filters 'Name=instance-state-name,Values=running' 'Name=tag:Name,Values=production-v2-jumphost'  --output text --query 'Reservations[*].Instances[*].InstanceId' --region us-west-2) --region us-west-2
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)\[\033[00m\] $ "

EOF
}

sudo apt-get install -y fontconfig || sudo apt-get update && sudo apt-get install -y fontconfig
curl -sS https://raw.githubusercontent.com/diogocavilha/fancy-git/master/install.sh | sh
bash -i -c 'fancygit --suggested-global-git-config-apply'
bash -i -c 'fancygit --theme-human' && source $HOME/.bashrc
bash -i -c 'fancygit --enable-host-name'

_install_git_aliases

printf "\033[0;31mRun '. $HOME/.bashrc'\033[0m\n"
