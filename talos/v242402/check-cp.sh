#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c audit-log-path)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-log-path is not set"
   exit 1
fi

exit 0

