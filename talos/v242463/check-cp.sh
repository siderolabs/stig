#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c audit-log-maxbackup)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-log-maxbackup is not set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep audit-log-maxbackup | cut -f2 -d'=')
if [ $DATA -lt 10 ]; then
   echo "kube-apiserver audit-log-maxbackup is below 10"
   exit 1
fi

exit 0

