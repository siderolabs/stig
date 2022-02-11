#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c insecure-bind-address)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver insecure-bind-address is set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c insecure-bind-port)
if [ "$DATA" -ne 0 ]; then
   echo "kube-apiserver insecure-bind-port is set"
   exit 1 
fi

exit 0

