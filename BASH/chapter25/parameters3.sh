#!/usr/bin/env bash
################################################
# Developed by: Baruch Gudesblat
# Purpose: DevOps12 course home-works: BASH, chapter 25
# Date: Feb/2025
# Version: 0.1.0
################################################
set -e
set -o pipefail
################################################

basename=$(basename $0)
configfile="$HOME/.$basename.rc"

# Source configuration file, if exists
[[ -r $configfile ]] && source $configfile

################################################

function main(){
    echo "=== 25.7.3 ==="
    echo -n "Enter file name : "
    read -r filename

    [[ ! -r $filename ]] && echo "File not found $filename" && return 1
    [[ ! -O $filename ]] && echo "You are now an owner of $filename" && return 1
    [[ ! -w $filename ]] && chmod +w $filename 
    return 0
}

if [[ $- == *x* ]] ; then
    # log file name comes from configuration file else /tmp/parameters3.sh.log
    echo "See $basename log /tmp/${mylog:-$basename.log}"
    { main "$@" ; } |&  tee /tmp/${mylog:-$basename.log}
else
    main "$@"
fi

