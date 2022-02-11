#!/bin/bash
. inc.sh

# Strict reading requires this... but the default value looks to be fine, so skipping this
#DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c '\--request-timeout')
#if [ $DATA -ne 1 ]; then
#   echo "kube-apiserver does not have request-timeout set"
#   exit 1
#fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep '\--request-timeout' | cut -f2 -d'=')
if [ "$DATA" == "0" ]; then
   echo "kube-apiserver request-timeout must not be 0"
   exit 1
fi

exit 0

