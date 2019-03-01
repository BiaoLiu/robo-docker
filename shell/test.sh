#!/bin/bash


a=5
b=5

c=$(($a+$b))
echo $c

if [ $a -eq $b ]
then
  echo "a==b"
elif [ $a -ge $b ]
  then
  echo "a>b"
else
    echo "a<b"
fi



c=robo2025
d=robo2025

if [ $c == $d ]
then
  echo "c==d"
else
  echo "c!=d"
fi

if [ "$c" == "$d" -a "$a" -gt 4 ]
then
 echo "true"
fi