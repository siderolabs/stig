#!/bin/bash
. inc.sh

DATA=$(talosctl ls -l /etc/kubernetes/kubelet.yaml | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
if [ "$DATA" != "-rw-------" ]; then
   echo "kubelet config is not 0640"
   echo "data: $DATA"
   exit 1
fi

exit 0
