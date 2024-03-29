#!/bin/bash
. inc.sh

TLSMIN=$($TALOSCTL get staticpod kube-controller-manager -o yaml | grep -c -i '\--use-service-account-credentials')
if [ $TLSMIN -eq 0 ]; then
   echo "use-service-account-credentials is not set"
   exit 1
fi

TLSMIN=$($TALOSCTL get staticpod kube-controller-manager -o yaml | grep -i '\--use-service-account-credentials' | grep -c 'false' )
if [ "$TLSMIN" -eq 1 ]; then
   echo "use-service-account-credentials is false"
   exit 1 
fi

exit 0

