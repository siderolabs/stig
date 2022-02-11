#!/bin/bash
. inc.sh

RES=$(kubectl get pods --all-namespaces -l k8s-app=kubernetes-dashboard |wc -l)
if [ $RES -ne 0 ]; then
   echo "the Kubernetes dashboard is running"
   exit 1
fi

exit 0
