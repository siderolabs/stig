#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c read-only-port)
if [ $DATA -ne 0 ]; then
   echo "kubelet read-only-port is set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/kubelet.yaml |grep -c readOnlyPort)
if [ "$DATA" -ne 0 ]; then
   echo "kubelet config readOnlyPort is set"
   exit 1 
fi

exit 0

