#!/bin/bash
. inc.sh

DATA=$(talosctl ls -t f -l /var/lib/etcd | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
for i in $DATA; do
   if [[ $i =~ -r.-.--.-- ]]; then
      exit 0
   else
      echo "not all files in /var/lib/etcd are less permissive than 0644"
      echo "data: $i"
      exit 1
   fi
done

exit 0
