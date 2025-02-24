#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 30 - user profiles
# Date: Feb/2025
# Version: 0.1.0
################################################

if [[ $EUID -ne 0 ]]; then
    eval sudo su -c $0
    exit $?
fi

################################################

ls -lt /etc/{bash.bashrc,bash_completion,profile}


# /etc/profile is sourced by su, ssh
# ~/.bashrc is sourced by each login and new shell
