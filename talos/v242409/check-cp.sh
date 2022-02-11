#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml |grep -c profiling=false)
if [ $DATA -ne 1 ]; then
   echo "kube-controller-manager does not have profiling disabled"
   exit 1
fi

exit 0

