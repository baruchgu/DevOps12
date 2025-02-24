#!/usr/bin/env bash 
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 32 - file permissions
# Date: Feb/2025
# Version: 0.1.0
################################################


# 1 As normal user, create a directory ~/permissions. Create a file owned by yourself in there.
mkdir -p ~/permissions
touch ~/permissions/my_file.txt

# 2. Copy a file owned by root from /etc/ to your permissions dir, who owns this file now ?
cp /etc/shells ~/permissions
ls -l ~/permissions/shells

# 3. As root, create a file in the users ~/permissions directory.
sudo touch ~/permissions/root_file.txt

# 4. As normal user, look at who owns this file created by root.
ls -l ~/permissions/root_file.txt

# 5. Change the ownership of all files in ~/permissions to yourself.
sudo chown $USER ~/permissions/root_file.txt 

# 6. Make sure you have all rights to these files, and others can only read.
chmod 744 ~/permissions/root_file.txt

# 7. With chmod, is 770 the same as rwxrwx--- ?
chmod 770 ~/permissions/root_file.txt
echo "YES: 770 is rwxrwx---"

# 8. With chmod, is 664 the same as r-xr-xr-- ?
chmod 644 ~/permissions/root_file.txt
echo "NO: 644 is not r-xr-xr--"

# 9. With chmod, is 400 the same as r-------- ?
chmod 400 ~/permissions/root_file.txt
echo "YES: 400 is r--------"

# 10. With chmod, is 734 the same as rwxr-xr-- ?
chmod 734 ~/permissions/root_file.txt
echo "NO: 734 is not rwxr-xr--"

# 11a. Display the umask in octal and in symbolic form.
umask ; umask -S

# 11b. Set the umask to 077, but use the symbolic format to set it. Verify that this works.
umask u=rwx,g=,o=

# 12. Create a file as root, give only read to others. Can a normal user read this file? Test  writing to this file with vi.
sudo touch ~/permissions/root_file2.txt
sudo chmod 004 ~/permissions/root_file2.txt
echo "A file is not writable - ~/permissions/root_file2.txt"

# 13a. Create a file as normal user, give only read to others. Can another normal user read this file ? Test writing to this file with vi.
touch ~/permissions/my_file2.txt
chmod 004 ~/permissions/my_file2.txt
echo "A file is readable but is not writable - ~/permissions/my_file2.txt"

# 13b. Can root read this file ? Can root write to this file with vi ?
echo "A file is readable and writable by root - ~/permissions/my_file2.txt"

# 14. Create a directory that belongs to a group, where every member of that group can read and write to files, and create files. Make sure that people can only delete their own files.
chmod 755 $HOME
mkdir ~/permissions2
chgrp users ~/permissions2
chmod u=rwx,g=rwx,o=rx ~/permissions2
sudo su serena -c "touch $HOME/permissions2/my_file.serena.txt"
sudo su serena -c "rm    $HOME/permissions2/my_file.serena.txt"

 
