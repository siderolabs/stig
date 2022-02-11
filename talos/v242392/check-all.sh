#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - authorization.mode)
if [ "$DATA" != "Webhook" ]; then
   echo "kubelet authorization is not Webhook"
   exit 1
fi

