#!/bin/bash
# Simple setup.sh for configuring Ubuntu 12.04 LTS EC2 instance
# for headless setup.

# Install and configure git
sudo apt-get install -y git-core
git config --global user.name = "Alex Forsythe"
git config --global user.email = "awforsythe@gmail.com"
git config --global core.editor "vim"
git config --color.ui auto

# Install and authenticate heroku
wget -qO- https://toolbelt.heroku.com/install-ubuntu.sh | sh
mkdir ~/.ssh
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N ''
heroku login
heroku keys:add

# Install nvm: node-version manager
# https://github.com/creationix/nvm
curl https://raw.github.com/creationix/nvm/master/install.sh | sh

# Load nvm and install latest production node
source $HOME/.nvm/nvm.sh
nvm install v0.10.12
nvm use v0.10.12

# Install jshint to allow checking of JS code within emacs
# http://jshint.com/
npm install -g jshint

# Install rlwrap to provide libreadline features with node
# See: http://nodejs.org/api/repl.html#repl_repl
sudo apt-get install -y rlwrap

# Install emacs24
# https://launchpad.net/~cassou/+archive/emacs
sudo apt-add-repository -y ppa:cassou/emacs
sudo apt-get update
sudo apt-get install -y emacs24 emacs24-el emacs24-common-non-dfsg

# git pull and install dotfiles as well
git clone https://github.com/awforsythe/aws-dotfiles.git
python aws-dotfiles/deploy.py

