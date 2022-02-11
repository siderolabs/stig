#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - authentication.x509.clientCAFile)
if [ $DATA != "/etc/kubernetes/pki/ca.crt" ]; then
   echo "kubelet does not have the correct client-ca-file set"
   exit 1
fi

exit 0

