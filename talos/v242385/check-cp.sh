#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml |grep -c bind-address)
if [ $DATA -eq 0 ]; then
   echo "kube-controller-manager bind-address is not set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml |grep bind-address | grep -c '127.0.0.1')
if [ "$DATA" -eq 0 ]; then
   echo "kube-controller-manager bind-address is not set to 127.0.0.1"
   exit 1 
fi

exit 0

