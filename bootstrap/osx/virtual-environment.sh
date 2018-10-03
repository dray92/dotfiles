#!/bin/bash

_install_virtual_environments () {
  local pkgs=(docker virtualbox vagrant vagrant-manager)
  for pkg in "${pkgs[@]}" ; do
    brew cask install "${pkg}" || brew cask upgrade "${pkg}"
  done
}

_install_virtual_environments
printf "\033[0;31mLaunching docker for the first time will cause it to create a symlink.\nRun '/Applications/Docker.app' or launch docker using spotlight.\033[0m\n"
