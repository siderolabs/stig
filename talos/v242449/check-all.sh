#!/bin/bash
. inc.sh

DATA=$(talosctl read /etc/kubernetes/kubelet.yaml | yq r - authentication.x509.clientCAFile)
if [ $DATA != "/etc/kubernetes/pki/ca.crt" ]; then
   echo "kubelet does not have the correct client-ca-file set"
   exit 1
fi

DATA=$(talosctl ls -l /etc/kubernetes/pki/ca.crt | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
if [ "$DATA" != "-r--------" ]; then
   echo "kubelet's ca.crt file is not 0400"
   echo "data: $DATA"
   exit 1
fi

exit 0

