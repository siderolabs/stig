#!/bin/bash
. inc.sh

DATA=$($TALOSCTL ps |grep local.bin.etcd |grep -c '\--peer-client-cert-auth=true')
if [ $DATA -ne 1 ]; then
   echo "etcd does not have peer-client-cert-auth enabled: $DATA"
   exit 1
fi

exit 0

