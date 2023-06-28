#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep -c insecure-port)
if [ $DATA -eq 0 ]; then
   echo "kube-apiserver insecure-port is not set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep insecure-port | cut -d'=' -f2 | grep -c '^0$')
if [ "$DATA" -eq 0 ]; then
   echo "kube-apiserver insecure-port is not set to 0"
   exit 1 
fi

exit 0

