#!/bin/bash


# cd /opt/compose

# kubectl get deploy -n test | cut -d " " -f 1 | sed -n '2,$p'>> deploy.txt


for item in a b c; do
  echo $item
done

cat ./deploy.txt | while read deploy_name
do
   echo ${deploy_name}
   image_name=$(kubectl describe deploy ${deploy_name} -n test | sed -n 's/Image:\s*\(.*\)/\1/p' | sed -n 's/^[ \t]*//p')
   echo $image_name
#   space=$((15-${#deploy_name}))
#   echo $space

   image_name=$(echo $image_name | sed 's#\/#\\\/#g')

   sed -i "/^${deploy_name}$/s/$/               ${image_name}/" ./deploy.txt
done

t1='test $'
t2="test $t1"

echo $t1 $t2


# kubectl get deploy -n test | cut -d " " -f 1 | sed -n '{s/^[ \t]*//;2,$p}' > deploy.txt



