#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /system/config/kubernetes/kube-apiserver/auditpolicy.yaml | yq .rules[0].level)
if [ "$DATA" != "RequestResponse" ]; then
   echo "kube-apiserver audit logging rule level is \"$DATA\" not \"RequestResponse\""
   exit 1
fi

exit 0

