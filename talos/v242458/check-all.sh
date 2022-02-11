#!/bin/bash
. inc.sh

DATA=$(talosctl ls -t f -l /etc/kubernetes/manifests | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
for i in $DATA; do
   if [ "$i" != "-rw-------" ]; then
      echo "not all files in /etc/kubernetes/manifests are 0600"
      echo "data: $i"
      exit 1
   fi
done

exit 0
