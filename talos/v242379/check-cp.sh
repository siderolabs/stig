#!/bin/bash
. inc.sh

TLSMIN=$($TALOSCTL ps |grep usr.local.bin.etcd | grep -c -i auto-tls)
if [ $TLSMIN -eq 0 ]; then
   echo "auto-tls is not set"
   exit 1
fi

TLSMIN=$($TALOSCTL ps |grep usr.local.bin.etcd | grep -i auto-tls |grep -c 'true' )
if [ "$TLSMIN" -eq 1 ]; then
   echo "auto-tls is true"
   exit 1 
fi

exit 0

