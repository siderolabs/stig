#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c audit-log-maxbackup)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-log-maxbackup is not set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep audit-log-maxbackup | cut -f2 -d'=')
if [ $DATA -lt 10 ]; then
   echo "kube-apiserver audit-log-maxbackup is below 10"
   exit 1
fi

exit 0

