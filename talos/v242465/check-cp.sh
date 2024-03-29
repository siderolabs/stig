#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c audit-log-path)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-log-maxage is not set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep audit-log-path | cut -f2 -d'=')
DATA=$($TALOSCTL ls $DATA | grep -v ^NODE | wc -l)
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver audit-log-path file does not exist"
   exit 1
fi

exit 0

