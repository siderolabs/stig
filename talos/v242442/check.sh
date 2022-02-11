#!/bin/bash
. inc.sh

echo "Manually review this list for old pod versions:"
kubectl get pods --all-namespaces -o jsonpath="{..image}" | \
tr -s '[[:space:]]' '\n' | \
sort | \
uniq -c

exit 1
