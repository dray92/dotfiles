#!/bin/bash

_install_python_packages () {
  local pkgs=(python2 python3)
  for pkg in "${pkgs[@]}" ; do
    brew install "${pkg}" || brew upgrade "${pkg}"
  done
}

_install_python_packages