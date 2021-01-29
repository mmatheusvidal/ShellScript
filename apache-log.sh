#!/bin/bash

cd /home/vidal/Projetos/Vidal/Alura/Bash/apache-log/

regex="\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"

if [[ $1 =~ $regex ]]
then
    cat apache.log | grep $1
    if [ $? -ne 0 ]
        then
        echo "IP não encontrado"
        fi
else
    echo "IP ERROR"
fi
