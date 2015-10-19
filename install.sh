#!/bin/sh

curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
export PATH="~/.cask/bin:$PATH"
cd ~/.emacs.d/
cask upgrade
cask install
