#!/bin/bash
. inc.sh

DATA=$(talosctl ls -l /etc/kubernetes/manifests | grep -v ^NODE |tr -s ' ' | cut -f 3-4 -d' ')
for i in $DATA; do
   if [ $i -ne 0 ]; then
      echo "not all files in /etc/kubernetes/manifests are owned as root:root"
      exit 1
   fi
done

exit 0
