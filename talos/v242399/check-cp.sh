#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml |grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver DynamicKubeletConfig feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-controller-manager -o yaml |grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kube-controller-manager DynamicKubeletConfig feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL get staticpod kube-scheduler -o yaml |grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kube-scheduler DynamicKubeletConfig feature flag is set"
   exit 1
fi

exit 0

