#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 31 - groups
# Date: Feb/2025
# Version: 0.1.0
################################################

if [[ $EUID -ne 0 ]]; then
    eval sudo su -c $0
    exit $?
fi

################################################

# task 1
for gr_name in tennis football sports; do
    if ! groupadd $gr_name ; then
        echo "ERROR: groupadd $gr_name failed"
    fi
done

# task 2
if ! usermod -a -G tennis,sports venus; then
    echo "ERROR: usermod -a -G tennis,sports venus failed"
fi

# task 3
if ! groupmod -n foot football; then
    echo "ERROR: groupmod -n foot football failed"
fi

# task 4
echo "vigr"

# task 5
[[ $(id -G -n serena | grep -wc tennis) -eq 0 ]] && echo "Note: serena use is not in tenis group"

# task 6
for gr_name in foot sports; do
    if ! gpasswd -A venus $gr_name ; then
        echo "ERROR: gpasswd -A venus $gr_name failed"
    fi
done
