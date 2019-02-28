#!/bin/bash

###########################################
# 生成Kubernetes已部署的Deployment 统计文件
# 文件内容为deployment name与image
###########################################

# cd /opt/compose

sudo touch deploy_temp.txt deploy.txt

kubectl get deploy -n test | cut -d " " -f 1 | sed -n '{s/^[ \t]*//;2,$p}' > deploy_temp.txt

cat ./deploy_temp.txt | while read deploy_name
do
   image_name=$(kubectl describe deploy ${deploy_name} -n test | sed -n 's/Image:\s*\(.*\)/\1/p' | sed -n 's/^[ \t]*//p')
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
awk -F ' ' '{printf("%-40s %s\n",$1,$2)}' deploy_temp.txt  > deploy.txt

sudo rm -f deploy_temp.txt

echo "============================================================================"











