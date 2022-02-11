#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - staticPodPath)
if [ "$DATA" != "" ]; then
   echo "kubelet staticPodPath is set"
   exit 1
fi

