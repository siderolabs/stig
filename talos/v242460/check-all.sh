#!/bin/bash
. inc.sh

DATA=$(talosctl ls -t f -l /etc/kubernetes/ | grep '\.conf' | grep -v ^NODE |wc -l)
if [ $DATA -gt 0 ]; then
   echo "/etc/kubernetes/*.conf files exist";
   exit 1
fi

exit 0
