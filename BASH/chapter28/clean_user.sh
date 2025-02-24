#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 28 - clean user created # in chapter 28 practice
# Date: Feb/2025
# Version: 0.1.0
################################################

if [[ $EUID -ne 0 ]]; then
    eval sudo su -c $0
    exit $?
fi


for u in serena venus einstime ; do
   userdel -r $u
done



