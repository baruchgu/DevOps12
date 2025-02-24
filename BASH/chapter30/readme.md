# Chapter 30 practice: User profiles
   
1. Make a list of all the profile files on your system.

> ls -lt /etc/{bash.bashrc,bash_completion,profile}   
>      -rw-r--r-- 1 root root 2012 Feb 17 17:04 /etc/bash.bashrc   
>      -rw-r--r-- 1 root root  769 Apr 10  2021 /etc/profile   
>      -rw-r--r-- 1 root root   45 Jan 25  2020 /etc/bash_completion   

2. Read the contents of each of these, often they source extra scripts.

>  gvim /etc/{bash.bashrc,bash_completion,profile}

3. Put a unique variable, alias and function in each of those files.

>  gvim ~/.bashrc

4. Try several different ways to obtain a shell (su, su -, ssh, tmux, gnome-terminal, Ctrlalt-F1, ...) and verify which of your custom variables, aliases and function are present in
your environment.

> su   $USER  
> su - $USER

5. Do you also know the order in which they are executed?
6.
> Q: When an application depends on a setting in $HOME/.profile, does it matter whether $HOME/.bash_profile exists or not?   
> A: If the application is a bash script, it source $HOME/.bash_profile in the begining


