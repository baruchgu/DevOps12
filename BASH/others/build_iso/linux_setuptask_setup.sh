#!/usr/bin/env bash
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 25
# Date: Feb/2025
# Version: 0.1.0
################################################

set -o errexit
set -o pipefail

################################################

read -sp "[sudo] password for $USER: " pswrd

# Add BASH staff
[[ ! grep -wq EDITOR /etc/bash.bashrc ]] && echo $pswrd | sudo -S sh -c "echo export EDITOR=vim >> /etc/bash.bashrc"
echo $pswrd | sudo -S sh -c "echo 'alias -- -=less\nalias lt=\"ls -ltFa\"' >> /etc/bash.bashrc"

# Add VIM staff
cat << EOI > /etc/vim/vimrc.local
syntax on
set background=dark
set incsearch
set nowrap
set showmatch
set guifont=Courier\ 13
set clipboard=autoselect
set shell=/bin/sh
EOI
