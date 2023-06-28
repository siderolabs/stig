#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep '\--tls-cert-file' | cut -f2 -d'=')
if [ "$DATA" != "/system/secrets/kubernetes/kube-apiserver/apiserver.crt" ]; then
   echo "kube-apiserver does not have the correct tls-cert-file set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep '\--tls-private-key-file' | cut -f2 -d'=')
if [ "$DATA" != "/system/secrets/kubernetes/kube-apiserver/apiserver.key" ]; then
   echo "kube-apiserver does not have the correct tls-private-key-file set"
   exit 1
fi

exit 0

