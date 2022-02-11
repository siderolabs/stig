#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - protectKernelDefaults)
if [ "$DATA" != "true" ]; then
   echo "kubelet does not have protectKernelDefaults set"
   exit 1
fi

exit 0

