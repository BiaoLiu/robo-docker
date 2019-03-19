#!/bin/bash

####################################################################################
# 1. 执行此脚本之前，先执行init.sh脚本，生成Kurbernetes Deployment统计文件deploy.txt
# 2. 执行此脚本，将deploy.txt中的deployment image更新到yaml文件中
####################################################################################

read -p "Please input deploy environment parameters [test/proc]:" env

case $env in
test)
  echo "test deploy";;
proc)
  echo "proc deploy";;
*)
  echo "error choice"
  exit 1;;
esac

cd /opt/compose/$env


for dir in $(ls -l  |awk '/^d/ {print $NF}');do
  echo "================================================================="
  echo "            deploy dir: $dir                                     "
  echo "================================================================="

  for file in $(ls -l $dir |awk '/^-/ {print $NF}');do
     deploy_file="$dir/$file"
     # 只取匹配到的第一行
     # deploy_name=$(sed -n 's/-\s*name:\s*\(.*\)/\1/p' "$dir/$file"  | sed 's/^[ \t]*//')
     deploy_name=$(awk -F ':' '$0~/^\s*name:/{print $2;exit;}' $deploy_file   | sed 's/[ \t]*//')

     old_image=$(sed -n 's/image:\s*\(.*\)/\1/p' $deploy_file | sed 's/[ \t]*//')

     if [ ! -n "$old_image" ]; then
         continue
     fi

     #new_image=$(awk -F ' ' '$1~/^'"${deploy_name}"'$/{print $2}' deploy.txt)
     new_image=$(sed -n "s/^${deploy_name}\s\+\(.*\)/\1/p"  deploy_$env.txt)

     echo "   deploy file: $file       "
     echo "   deploy name: $deploy_name"
     echo "   old image: $old_image    "
     echo "   new image: $new_image    "

     if [ -n "$new_image" ]; then
         sed -i "s?\(image:\s*\)\(.*\)?\1$new_image?" $deploy_file
     fi

     echo "-----------------------------------------------------------------"

  done
done

