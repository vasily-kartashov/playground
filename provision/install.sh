#!/bin/sh

sudo apt-get update
sudo apt-get install python-software-properties -y

sudo add-apt-repository ppa:cassou/emacs -y
sudo apt-get update

sudo apt-get install ghc emacs24 git make texinfo -y

git clone https://github.com/haskell/haskell-mode.git ~
cd ~/haskell-mode
make

cp /vagrang/provision/.emacs ~
