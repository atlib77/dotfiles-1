#!/bin/bash

# Atli, 
# 2021-06-30: Start of my "fresh linux install" script. Will be improved once I actually start fresh


sudo apt update

# vim-gtk installed to get proper clipboard support

sudo apt install vim-gtk ripgrep bat fd-find fasd -y

sudo ln -s `which fd-find` ~/bin/fd

# Tools related to ranger
sudo apt install ranger atool jq python3-pip w3m-img -y 
pip install Pygments # Source code highlighting using bat

# Even more code centric
sudo apt install git meld

# Install Oh-my-posh for command line prompt prettiness
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# Download the themes for OMP, in case I want to switch (I already have a customized one)
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.json
rm ~/.poshthemes/themes.zip



# VS Code,required special MS repo to be the latest version
# I think it's https://packages.microsoft.com/repos/ms-teams
# sudo apt install code

# Docker also requires a special repo
# sudo apt install docker.io

# TBD: 
# sudo apt install kitty powerline
# nfs-common 
# sshfs 
# python-dev-is-python3 

