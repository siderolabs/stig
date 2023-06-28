#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c '\--etcd-cafile=/system/secrets/kubernetes/kube-apiserver/etcd-client-ca.crt')
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver does not have etcd-cafile set correctly"
   exit 1
fi

exit 0

