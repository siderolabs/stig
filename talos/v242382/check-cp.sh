#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c authorization-mode)
if [ $DATA -eq 0 ]; then
   echo "authorization-mode is not set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep authorization-mode | grep -c 'Node,RBAC')
if [ "$DATA" -eq 0 ]; then
   echo "authorization-mode is not set to Node,RBAC"
   exit 1 
fi

exit 0

