#!/bin/bash
. inc.sh

DATA=$(talosctl ps | grep -c sshd)
if [ $DATA -ne 0 ]; then
   echo "sshd is running"
   exit 1
fi

