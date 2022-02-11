#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c read-only-port)
if [ $DATA -ne 0 ]; then
   echo "kubelet read-only-port is set"
   exit 1
fi

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml |grep -c readOnlyPort)
if [ "$DATA" -ne 0 ]; then
   echo "kubelet config readOnlyPort is set"
   exit 1 
fi

exit 0

