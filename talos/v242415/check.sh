#!/bin/bash
. inc.sh

DATA=$(kubectl get all -o jsonpath='{range .items[?(@..secretKeyRef)]} {.kind}/{.metadata.name} {"\n"}{end}' -A)
if [ "$DATA" != "" ]; then
   echo "Secrets are being stored as environment variables:"
   echo $DATA
   exit 1
fi

exit 0
