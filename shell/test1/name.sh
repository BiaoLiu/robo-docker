#!/bin/bash

#cat ./sso.yaml



# 目录下所有子目录名称
# ls -l /usr/ |awk '/^d/ {print $NF}'

path=`pwd`
echo "path: $path"


test="t"

if [[ -n "$test" ]]; then
  echo "success"
fi



#sed -n 's/-\s*name:\s*\(.*\)/\1/p' sso.yaml  | sed 's/^[ \t]*//'