#!/bin/bash
. inc.sh

DATA=$(talosctl ls -l /etc/kubernetes/kubelet.yaml | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
if [ "$DATA" != "-rw-------" ]; then
   echo "kubelet's kubelet.yaml config file is not 0600"
   echo "data: $DATA"
   exit 1
fi

exit 0

