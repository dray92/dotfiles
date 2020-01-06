#!/bin/bash

# this is to get the latest java, which is not necessarily the tradition.
# brew cask install java

brew tap caskroom/versions
brew cask install adoptopenjdk/openjdk/adoptopenjdk8

brew install maven gradle

# this is very manual right now
printf "\033[0;31mRun 'ls /Library/Java/JavaVirtualMachines/', pick latest jdk then run 'echo JAVA_HOME=/Library/Java/JavaVirtualMachines/{ENTER_JDK_NAME_HERE}/Contents/Home >> $HOME/.bash_profile' and source bash_profile.\033[0m\n"
