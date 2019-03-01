#!/bin/bash


read -p "Please input deploy environment parameters [test/proc]:" env

echo $env

case $env in
test)
  echo "test deploy";;
proc)
  echo "proc deploy";;
*)
  echo "error choice";;
esac



#read -n1 -p "Do you want to continue [Y/N]?" answer
#case $answer in
#Y | y)
#      echo "fine ,continue";;
#N | n)
#      echo "ok,good bye";;
#*)
#     echo "error choice";;
#esac
#
#read -p "Input a word:" -n 5 Word1 Word2
#echo $Word1 $Word2