#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kubelet (config) DynamicKubeletConfig feature flag is set"
   exit 1
fi

DATA=$(talosctl ps | grep kubelet | grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kubelet (flag) DynamicKubeletConfig feature flag is set"
   exit 1
fi

