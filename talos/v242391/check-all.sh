#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - authentication.anonymous.enabled)
if [ "$DATA" != "false" ]; then
   echo "kubelet anonymous authentication is enabled"
   exit 1
fi

