#!/bin/bash
. inc.sh

DATA=$($TALOSCTL ls -t f -l /var/lib/etcd | grep -v ^NODE |tr -s ' ' | cut -f 3-4 -d' ')
for i in $DATA; do
   if [ $i -ne 60 ]; then
      echo "not all files in /var/lib/etcd are owned as etcd:etcd"
      exit 1
   fi
done

exit 0
