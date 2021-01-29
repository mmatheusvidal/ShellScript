#!/bin/bash

if [ ! -d log ]
then
    mkdir log
fi

processos_memoria(){

processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

for pid in $processos
do
    nome_processo=$(ps -p $pid -o comm=)
    echo -n $(date +%F,%H:%M:%S,) >> log/$nome_processo.log
    size_processo=$(ps -p $pid -o size | grep [0-9])
    echo "$(bc <<< "scale=2;$size_processo/1024") MB" >> log/$nome_processo.log
done
}

processos_memoria

if [ $? -eq 0 ]
then
    echo "Arquivos Salvos com sucesso"
else
    echo "Fudeu!"
fi
