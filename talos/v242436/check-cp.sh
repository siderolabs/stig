#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep '\--enable-admission-plugins' | grep -c ValidatingAdmissionWebhook)
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver does not have the ValidatingAdmissionWebhook admission plugin enabled"
   exit 1
fi

exit 0

