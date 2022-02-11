#!/bin/bash
. inc.sh

DATA=$(talosctl ls -t f -l /system/secrets/kubernetes | grep -v ^NODE |tr -s ' ' | cut -d' ' -f 2)
for i in $DATA; do
   if [[ $i =~ -r.------- ]]; then
      exit 0
   else
      echo "not all files in /system/secrets/kubernetes are less permissive than 0600"
      echo "data: $i"
      exit 1
   fi
done

exit 0
