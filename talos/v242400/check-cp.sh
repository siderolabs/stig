#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c AllAlpha)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver AllAlpha feature flag is set"
   exit 1
fi

exit 0

