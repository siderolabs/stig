#!/bin/bash

ERRLOG=results.err.log
LOG=results.log

CONTROLPLANES=$(talosctl get members -o json | jq -r '. | select(.spec.machineType == "controlplane") | .spec.addresses[0]')
WORKERS=$(talosctl get members -o json | jq -r '. | select(.spec.machineType == "worker") | .spec.addresses[0]')

function report_failed() {
   CHECKNAME=$(echo $1 | cut -d'/' -f2)

   echo -e "\033[0;31m✗ ERROR:\033[0m  ${CHECKNAME}\t${2}"
}

function report_ok() {
   CHECKNAME=$(echo $1 | cut -d'/' -f2)

   echo -e "\033[0;32m✓ OK:\033[0m     ${CHECKNAME}"
}

function run_check() {
   CHECKNAME=$(echo $1 | cut -d'/' -f2)

   MSG=$($1 2>> $ERRLOG)
   if [ $? -ne 0 ]; then
      return 1
   fi

   return 0
}

# Run all cluster-once checks
CHECKS=$(find ./ -name check.sh)
for i in $CHECKS ; do
   run_check $i

   if [ $? -ne 0 ]; then
      report_failed "$i" "$MSG"
   else
      report_ok "$i"
   fi
done

# Run controlplane checks
CHECKS=$(find ./ -name check-cp.sh)
for i in $CHECKS ; do
   CHECK_FAILED=0

   for n in $CONTROLPLANES ; do
      export TALOS_NODES=$n
      run_check $i

      if [ $? -ne 0 ]; then
         CHECK_FAILED=1
         report_failed "$i" "$MSG"
         break
      fi
   done

   if [ $CHECK_FAILED -eq 0 ]; then
      report_ok "$i"
   fi
done
      
