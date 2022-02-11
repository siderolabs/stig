#!/bin/bash
. inc.sh

DATA=$(talosctl ps |grep local.bin.kubelet |grep -c '\--cert-dir=/var/lib/kubelet/pki')
if [ $DATA -ne 1 ]; then
   echo "etcd does not have cert-dir set properly"
   exit 1
fi

DATA=$(talosctl ls /var/lib/kubelet/pki/kubelet.crt |grep -v ^NODE | wc -l)
if [ $DATA -ne 1 ]; then
   echo "kubelet certificate file does not exist"
   exit 1
fi

exit 0

