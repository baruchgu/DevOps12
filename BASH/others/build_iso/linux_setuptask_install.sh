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



packages=("open-vm-tools-desktop" "vim-gtk3" "htop" "ssmtp" "figlet" "python3" "pip" "xorriso" "syslinux" "isolinux")

read -sp "[sudo] password for $USER: " pswrd

# Install packages by apt
for i in ${packages[@]}; do
    echo $pswrd | sudo -S apt install -y $i
done


# Install PyCharm as tar.gz
[[ -d "/etc/pycharm-2024.3.3" ]] && echo "Error: /etc/pycharm-2024.3.3 is already exist" || {
    wget https://download.jetbrains.com/python/pycharm-community-2024.3.3.tar.gz -O /tmp/pycharm-community-2024.3.3.tar.gz
    cd /etc
    echo $pswrd | sudo -S tar axvf /tmp/pycharm-community-2024.3.3.tar.gz
    echo $pswrd | sudo -S ln -sf /etc/pycharm-community-2024.3.3/bin/pycharm.sh /usr/bin/pycharm
}

echo $pswrd | sudo -S apt-get clean
rm -f /tmp/pycharm-community-2024.3.3.tar.gz



