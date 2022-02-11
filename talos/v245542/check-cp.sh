#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml | grep -c -i base-auth-file)
if [ $DATA -ne 0 ]; then
   echo "base-auth-file is set"
   exit 1
fi

exit 0

