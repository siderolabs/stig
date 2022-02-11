#!/bin/bash
. inc.sh

RES=$(kubectl -n default get all |wc -l)
if [ $RES -ne 0 ]; then
   echo "there are resources in the default namespace"
   exit 1
fi

RES=$(kubectl -n kube-public get all |wc -l)
if [ $RES -ne 0 ]; then
   echo "there are resources in the kube-public namespace"
   exit 1
fi

RES=$(kubectl -n kube-node-lease get all |wc -l)
if [ $RES -ne 0 ]; then
   echo "there are resources in the kube-node-lease namespace"
   exit 1
fi

exit 0
