#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-controller-manager -o yaml |grep -c profiling=false)
if [ $DATA -ne 1 ]; then
   echo "kube-controller-manager does not have profiling disabled"
   exit 1
fi

exit 0

