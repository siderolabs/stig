#!/bin/bash
. inc.sh

DATA=$(talosctl ls -t f -l /etc/kubernetes/kubelet.yaml | grep -v ^NODE |tr -s ' ' | cut -f 3-4 -d' ')
for i in $DATA; do
   if [ $i -ne 0 ]; then
      echo "/etc/kubernetes/kubelet.yaml is not owned root:root"
      exit 1
   fi
done

exit 0
