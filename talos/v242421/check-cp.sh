#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-controller-manager -o yaml | grep -c '\--root-ca-file')
if [ $DATA -ne 1 ]; then
   echo "kube-controller-manager does not have a root-ca-file set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-controller-manager -o yaml | grep '\--root-ca-file' | cut -f2 -d'=')
if [ "$DATA" != "/system/secrets/kubernetes/kube-controller-manager/ca.crt" ]; then
   echo "kube-controller-manager does not have the correct root-ca-file set"
   exit 1
fi

exit 0

