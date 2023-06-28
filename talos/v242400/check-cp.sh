#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c AllAlpha)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver AllAlpha feature flag is set"
   exit 1
fi

exit 0

