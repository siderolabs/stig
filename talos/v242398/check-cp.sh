#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver DynamicAuditing feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-controller-manager -o yaml |grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kube-controller-manager DynamicAuditing feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-scheduler -o yaml |grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kube-scheduler DynamicAuditing feature flag is set"
   exit 1
fi

exit 0

