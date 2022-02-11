#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - streamingConnectionIdleTimeout)
if [ $DATA != "5m" ]; then
   echo "kubelet does not have the correct streamingConnectionIdleTimeout set"
   exit 1
fi

exit 0

