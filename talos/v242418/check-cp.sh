#!/bin/bash
. inc.sh

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep -c tls-cipher-suites)
if [ $DATA -ne 1 ]; then
   echo "kube-apiserver does not have tls-cipher-suites set"
   exit 1
fi

DATA=$($TALOSCTL read /etc/kubernetes/manifests/talos-kube-apiserver.yaml |grep tls-cipher-suites | cut -f2 -d'=')
if [ "$DATA" != "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256,TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384,TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" ]; then
   echo "kube-apiserver does not match the approved set of ciphers"
   exit 1
fi

exit 0

