#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-scheduler -o yaml |grep -c bind-address)
if [ $DATA -eq 0 ]; then
   echo "kube-scheduler bind-address is not set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-scheduler -o yaml |grep bind-address | grep -c '127.0.0.1')
if [ "$DATA" -eq 0 ]; then
   echo "kube-scheduler bind-address is not set to 127.0.0.1"
   exit 1 
fi

exit 0

