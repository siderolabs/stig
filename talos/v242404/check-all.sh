#!/bin/bash
. inc.sh

DATA=$(talosctl ps | grep kubelet | grep -c hostname-override)
if [ $DATA -ne 0 ]; then
   echo "kubelet (flag) hostname-override feature flag is set"
   exit 1
fi

