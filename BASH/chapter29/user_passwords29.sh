#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 29 - passwords for local users
# Date: Feb/2025
# Version: 0.1.0
################################################

if [[ $EUID -ne 0 ]]; then
    eval sudo su -c $0
    exit $?
fi

################################################

# task 1
usermod -p $(openssl passwd hunter2) serena

# task 2
usermod -p $(openssl passwd hunter2) venus

grep -w venus /etc/shadow
usermod -L venus
grep -w venus /etc/shadow

# task 3
grep -w venus /etc/serena
passwd -d serena
grep -w venus /etc/serena

# task 4
echo "A root user is able to login to user's account after usermode -L
(locking).\nWhen 'password -d' is done - the login is a passless"

# task 5
echo "it works"

# task 6
chage -M 10 serena

# task 7
mv /etc/login.defs /etc/login.defs.orig
awk '/PASS_MAX_DAYS/ {print $1, "10"}' /etc/login.defs.orig > /etc/login.defs

# task 8
cp -p /etc/shadow  /etc/shadow.back
echo "After change the password of serena, the login with 'hunter2' password fails"

# task 10
cat /etc/shells 

# task 11
echo "useradd -d is used to name the user home dir"

# task 12
if grep -q '^serena:!' /etc/shadow; then
    echo "User serena account is LOCK"
fi

account_status=(`passwd -S serena`)
if [[ "${account_status[1]}" == "L" ]]; then
    echo "User serena account is LOCK"
fi

