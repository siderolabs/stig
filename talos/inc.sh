#!/bin/bash
#set -e

export TALOSCTL="talosctl"

if [ ! -e $TALOS_NODES ]; then
   export TALOSCTL="talosctl -n $TALOS_NODES"
fi
