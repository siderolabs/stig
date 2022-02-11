#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /system/secrets/kubernetes/kube-apiserver/auditpolicy.yaml |yq r - rules[0].level)
if [ "$DATA" != "RequestResponse" ]; then
   echo "kube-apiserver audit logging rule level is not RequestResponse"
   exit 1
fi

exit 0

