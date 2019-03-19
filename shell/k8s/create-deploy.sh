#!/bin/bash

read -p "deploy environment [test/proc]:" env

case $env in
test)
    echo "test deploy";;
proc)
    echo "proc deploy";;
*)
    exit;;
esac


cd /opt/compose/$env


for dir in $(ls -l | awk '/^d/{print $NF}')
do
  echo "==============================="
  echo "       dir name: $dir          "
  kubectl apply -f $dir
 # kubectl delete -f $dir
  echo "==============================="

done

echo "finsh"