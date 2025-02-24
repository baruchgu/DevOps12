#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 28 - user management
# Date: Feb/2025
# Version: 0.1.0
################################################

if [[ $EUID -ne 0 ]]; then
    eval sudo su -c $0
    exit $?
fi

################################################

# Clean users
$(dirname $0)/clean_user.sh

# task 1
useradd -m -d /home/serena -c "Serena Williams" serena

# task 2
useradd -m -d /home/venus -c "Venus Williams" -s /bin/bash venus

# task 3
if [[ $( cat /etc/passwd /etc/shadow /etc/group | grep -wc serena ) -ne 3 ]]; then
    echo "ERROR: User serena was not created properly"
fi

if [[ $( cat /etc/passwd /etc/shadow /etc/group | grep -wc venus ) -ne 3 ]]; then
    echo "ERROR: User venus was not created properly"
fi

# task 4
if ! [[ -d /home/serena ]]; then
    echo "ERROR: User serena home dir is not found"
fi

if ! [[ -d /home/venus ]]; then
    echo "ERROR: User venus home dir is not found"
fi

# task 5
useradd -m -d /home/einstime -c "echo time" -s /bin/date einstime

# task 7
su einstime

# task 8
cat << EOI > /etc/skel/wellcome.txt
##########################################
###
### Dera \$USER,
### Welcome to \$HOME 
###
##########################################
EOI

# task 9
userdel -r einstime
useradd -m -d /home/einstime -c "echo time" -s /bin/bash einstime
if ! [[ -r /home/einstime/welcome.txt ]]; then
    echo "ERROR: welcome.txt is not found in a new user HOME"
fi

# task 10
echo "before-change: Default login of serena user is" $( awk -F: '/^serena/ {print $NF}' /etc/passwd )
usermod -s /bin/bash serena
echo "after-change: Default login of serena user is" $( awk -F: '/^serena/ {print $NF}' /etc/passwd )


