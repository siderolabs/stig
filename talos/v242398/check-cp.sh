#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver DynamicAuditing feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml |grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kube-controller-manager DynamicAuditing feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-scheduler.yaml |grep -c DynamicAuditing)
if [ $DATA -ne 0 ]; then
   echo "kube-scheduler DynamicAuditing feature flag is set"
   exit 1
fi

exit 0

