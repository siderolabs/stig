#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c '\--client-ca-file')
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver does not have a client-ca-file set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep '\--client-ca-file' | cut -f2 -d'=')
if [ "$DATA" != "/system/secrets/kubernetes/kube-apiserver/ca.crt" ]; then
   echo "kube-apiserver does not have the correct client-ca-file set"
   exit 1
fi

exit 0

