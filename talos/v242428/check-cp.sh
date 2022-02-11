#!/bin/bash
. inc.sh

DATA=$($TALOSCTL ps |grep local.bin.etcd |grep -c '\--cert-file=/system/secrets/etcd/peer.crt')
if [ $DATA -ne 1 ]; then
   echo "etcd does not have cert-file set correctly"
   exit 1
fi

exit 0

