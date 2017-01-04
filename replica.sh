#!/bin/bash
CWD="/usr/bin/hadoop"
REPLICA=2
for hfile in $($CWD fsck / | grep 'Under replicated' | awk -F':' '{print $1}')
do
 echo "Changing replication in $hfile :" ;
 ${CWD} fs -setrep ${REPLICA} $hfile;
done

