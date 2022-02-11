#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kube-apiserver DynamicKubeletConfig feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-controller-manager.yaml |grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kube-controller-manager DynamicKubeletConfig feature flag is set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-scheduler.yaml |grep -c DynamicKubeletConfig)
if [ $DATA -ne 0 ]; then
   echo "kube-scheduler DynamicKubeletConfig feature flag is set"
   exit 1
fi

exit 0

