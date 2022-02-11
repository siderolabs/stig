#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c '\--etcd-certfile=/system/secrets/kubernetes/kube-apiserver/etcd-client.crt')
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver does not have etcd-certfile set correctly"
   exit 1
fi

exit 0

