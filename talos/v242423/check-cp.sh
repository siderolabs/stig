#!/bin/bash
. inc.sh

DATA=$($TALOSCTL ps |grep local.bin.etcd |grep -c '\--client-cert-auth=true')
if [ $DATA -ne 1 ]; then
   echo "etcd does not have client-cert-auth enabled: $DATA"
   exit 1
fi

exit 0

