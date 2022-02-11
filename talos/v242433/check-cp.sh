#!/bin/bash
. inc.sh

DATA=$($TALOSCTL ps |grep local.bin.etcd |grep -c '\--peer-key-file=/system/secrets/etcd/peer.key')
if [ $DATA -ne 1 ]; then
   echo "etcd does not have -peerkey-file set correctly"
   exit 1
fi

exit 0

