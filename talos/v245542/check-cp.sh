#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep -c -i base-auth-file)
if [ $DATA -ne 0 ]; then
   echo "base-auth-file is set"
   exit 1
fi

exit 0

