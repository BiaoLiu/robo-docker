#!/bin/bash

###########################################
# 生成Kubernetes已部署的Deployment 统计文件
# 文件内容为deployment name与image
###########################################


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

sudo touch deploy_temp.txt deploy_$env.txt

kubectl get deploy -n $env | cut -d " " -f 1 | sed -n '{s/^[ \t]*//;2,$p}' > deploy_temp.txt

cat ./deploy_temp.txt | while read deploy_name
do
   image_name=$(kubectl describe deploy ${deploy_name} -n $env | sed -n 's/Image:\s*\(.*\)/\1/p' | sed -n 's/^[ \t]*//p')
   # space=$((15-${#deploy_name}))

   echo "============================================================================"
   echo "            deploy name: $deploy_name                                       "
   echo "            image: $image_name                                              "

   # 转义 /
   image_name=$(echo $image_name | sed 's#\/#\\\/#g')
   # deploy.txt文件每行末尾追加写入image name
   sed -i "/^${deploy_name}$/s/$/               ${image_name}/" ./deploy_temp.txt

done

# deploy.txt列对齐
awk -F ' ' '{printf("%-40s %s\n",$1,$2)}' deploy_temp.txt  > deploy_$env.txt

sudo rm -f deploy_temp.txt

echo "============================================================================"











