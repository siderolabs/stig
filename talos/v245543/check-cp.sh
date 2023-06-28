#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep -c -i token-auth-file)
if [ $DATA -ne 0 ]; then
   echo "token-auth-file is set"
   exit 1
fi

exit 0

