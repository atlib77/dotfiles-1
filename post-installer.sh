#!/bin/bash

# Atli, 
# 2021-06-30: Start of my "fresh linux install" script. Will be improved once I actually start fresh

sudo apt install ack silversearcher-ag ripgrep bat fd-find fasd -y

# Tools related to ranger
sudo apt install ranger atool jq python3-pip w3m-img -y 
pip install Pygments # Source code highlighting using bat

# Even more code centric
sudo apt install meld

# VS Code,required special MS repo to be the latest version
# I think it's https://packages.microsoft.com/repos/ms-teams
# sudo apt install code

# Docker also requires a special repo
# sudo apt install docker.io

# TBD: 
# sudo apt install kitty 
# nfs-common 
# sshfs 
# python-dev-is-python3 

