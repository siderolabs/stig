#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c audit-log-maxage)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-log-maxage is not set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep audit-log-maxage | cut -f2 -d'=')
if [ $DATA -lt 30 ]; then
   echo "kube-apiserver audit-log-maxage is below 10"
   exit 1
fi

exit 0

