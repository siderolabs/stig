#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c secure-port)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver secure-port is not set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep secure-port |cut -f2 -d'=' | grep -c '^0$')
if [ "$DATA" -ne 0 ]; then
   echo "kube-apiserver secure-port is set to 0"
   exit 1 
fi

exit 0

