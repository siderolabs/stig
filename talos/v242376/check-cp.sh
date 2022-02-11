#!/bin/bash
. inc.sh

TLSMIN=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml | grep -c -i tls-min-version)
if [ $TLSMIN -eq 0 ]; then
   echo "tls-min-version is not set"
   exit 1
fi

TLSMIN=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml | grep -i tls-min-version |grep -c 'VersionTLS1[0|1]' )
if [ "$TLSMIN" -eq 1 ]; then
   echo "tls-min-version is too low"
   exit 1 
fi

exit 0

