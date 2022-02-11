#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kubelet (config) DynamicAuditing feature flag is set"
   exit 1
fi

DATA=$(talosctl ps | grep kubelet | grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kubelet (flag) DynamicAuditing feature flag is set"
   exit 1
fi

