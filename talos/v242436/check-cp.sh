#!/bin/bash
. inc.sh

DATA=$($TALOSCTL get staticpod kube-apiserver -o yaml | grep '\--disable-admission-plugins' | grep -c ValidatingAdmissionWebhook)
if [ $DATA -eq 1 ]; then
   echo "kube-apiserver has the ValidatingAdmissionWebhook admission plugin disabled"
   exit 1
fi

exit 0

