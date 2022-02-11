#!/bin/bash
. inc.sh

echo "MANUALLY review these policies:"
kubectl get podsecuritypolicies

exit 1
