#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 27
#      commands reporting the users on system
# Date: Feb/2025
# Version: 0.1.0
################################################


task=1
################################################

clear # try to use more "printf" command
printf "\n\tTASK $(( task++ )): Run a command that displays only your currently logged on user name.\n"
whoami

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Display a list of all logged on users."
who

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Display a list of all logged on users including the command they are running at this very moment.\n"
w

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Display your user name and your unique user identification (userid).\n"
id

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Use su to switch to another user account (unless you are root, you will need the password
of the other account). And get back to the previous account.\n"
# we are able do those greps and head inside awk code too
#any_real_user=$(awk -F: '/^root/ || /^'$USER/' {next} /bash$/ {print $1;exit}' /etc/passwd)
any_real_user=$(grep -w bash /etc/passwd | grep -wv $USER | grep -wv root | head -1 | awk -F: '{print $1}')
sudo su $any_real_user -c 'id && pwd && exit'

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Now use su - to switch to another user and notice the difference.\n"
sudo su - $any_real_user -c 'id && pwd && exit'

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Try to create a new user account (when using your normal user account). this should fail.\n"
adduser  tolik

read -p "hin any key" tmp
clear
printf "\n\tTASK $(( task++ )): Try to create a new user account (when using your normal user account). this should fail.\n"
sudo adduser  tolik

echo "Note: remove the TMP 'tolik' user by - sudo userdel -r tolik"
