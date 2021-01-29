#!/bin/bash

if [ ! -f log/armazenamento.log ]
then 
    echo $(df -h | head -n1) Data >>  log/armazenamento.log
fi

ssd=(/dev/sda2 /dev/loop0 /dev/loop10 /dev/loop2)

for i in ${ssd[@]}
do
    a=$(df -h | grep ${i})
    echo ${a} $(date +%F%t%T) >> log/armazenamento.log
    b=$(df -h --output=source,used | grep ${i} | awk -F' ' '{ print $2 }' | grep -o -E '[0-9]{2,3}')
    if [ $b -gt 90 ];
    then
        echo CHEIO: ${i}
    else
        echo Tranquilo: ${i}
    fi
done
