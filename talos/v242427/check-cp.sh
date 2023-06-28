#!/bin/bash
. inc.sh

DATA=$($TALOSCTL ps | grep local.bin.etcd | grep -c '\--key-file=/system/secrets/etcd/server.key')
if [ $DATA -ne 1 ]; then
   echo "etcd does not have key-file set correctly"
   exit 1
fi

exit 0

