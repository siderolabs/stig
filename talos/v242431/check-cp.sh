#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep -c '\--etcd-keyfile=/system/secrets/kubernetes/kube-apiserver/etcd-client.key')
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver does not have etcd-keyfile set correctly"
   exit 1
fi

exit 0

