#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep '\--authorization-mode' | cut -f2 -d'=')
if [ "$DATA" != "Node,RBAC" ]; then
   echo "kube-apiserver does not have the correct authorization-mode set"
   exit 1
fi

exit 0

