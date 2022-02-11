#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c audit-policy-file)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver audit-policy-file is not set"
   exit 1
fi

exit 0

