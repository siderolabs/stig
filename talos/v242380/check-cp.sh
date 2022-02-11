#!/bin/bash
. inc.sh

TLSMIN=$($TALOSCTL ps |grep usr.local.bin.etcd | grep -c -i '\--peer-auto-tls')
if [ $TLSMIN -eq 0 ]; then
   echo "peer-auto-tls is not set"
   exit 1
fi

TLSMIN=$($TALOSCTL ps |grep usr.local.bin.etcd | grep -i '\--peer-auto-tls' | grep -c 'true' )
if [ "$TLSMIN" -eq 1 ]; then
   echo "peer-auto-tls is true"
   exit 1 
fi

exit 0

