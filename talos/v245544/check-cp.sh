#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep -c -i 'kubelet-client-certificate=/system/secrets/kubernetes/kube-apiserver/apiserver-kubelet-client.crt')
if [ $DATA -eq 0 ]; then
   echo "kubelet-client-certificate is not set to the expected value"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep -c -i 'kubelet-client-key=/system/secrets/kubernetes/kube-apiserver/apiserver-kubelet-client.key')
if [ $DATA -eq 0 ]; then
   echo "kubelet-client-key is not set to the expected value"
   exit 1
fi

exit 0

