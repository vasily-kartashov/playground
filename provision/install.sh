#!/bin/sh

sudo apt-get update
sudo apt-get install python-software-properties -y

sudo add-apt-repository ppa:cassou/emacs -y
sudo apt-get update

sudo apt-get install ghc emacs24 git make texinfo cabal-install hlint llvm -y

sudo git clone https://github.com/haskell/haskell-mode.git /home/vagrant/haskell-mode
cd /home/vagrant/haskell-mode
sudo make all

sudo ln -s /usr/bin/opt /usr/bin/opt-3.0
sudo ln -s /usr/bin/llc /usr/bin/llc-3.0

sudo cp /vagrant/provision/.emacs /home/vagrant
