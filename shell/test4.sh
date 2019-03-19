#!/bin/bash



for param in "$@"
do
  echo $param
done



s=0
for ((i=0;i<10;i+=1))
do
  s=$(($s+$i))
  echo $i

done

echo $s