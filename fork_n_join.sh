#!/bin/bash
set -m
psIdsArray=() # empty array declaration. This will hold all process id of sub processes
rootProcessId=$$ #current process id of shell script
for i in `seq 10`;
do
    sh fork_n_join_prc.sh $i & #Fork the job in background
    psIdsArray+=($!) # get the process id and save into array
done

echo "Waiting for all process to complete"
wait # Join, Wait for all background process to complete
echo "all process completed!"
echo "ps# ${#psIdsArray[@]}"
echo "ps ${psIdsArray[@]}"

kill -9 $rootProcessId #Killing root process, subsequent child process will be terminated