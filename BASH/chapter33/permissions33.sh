#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 33 - advanced file permissions
# Date: Feb/2025
# Version: 0.1.0
################################################

# task 1a
mkdir my_tmp_dir
chgrp sports my_tmp_dir

# task 1b
chmod 755 $HOME
chmod 575 my_tmp_dir

# task 1c
chmod 2575 my_tmp_dir

# task 1d
chmod +t my_tmp_dir
