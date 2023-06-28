#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c audit-policy-file)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-policy-file is not set"
   exit 1
fi

exit 0

