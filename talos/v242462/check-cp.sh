#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c audit-log-maxsize)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-log-maxsize is not set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep audit-log-maxsize | cut -f2 -d'=')
if [ $DATA -lt 100 ]; then
   echo "kube-apiserver audit-log-maxsize is below 100"
   exit 1
fi

exit 0

