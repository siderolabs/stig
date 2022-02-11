#!/bin/bash
. inc.sh

DATA=$(talosctl ls -t f -l /etc/kubernetes/pki | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
for i in $DATA; do
   if [[ $i =~ -r.-.--.-- ]]; then
      exit 0
   else
      echo "not all files in /etc/kubernetes/pki are less permissive than 0644"
      echo "data: $i"
      exit 1
   fi
done

exit 0
