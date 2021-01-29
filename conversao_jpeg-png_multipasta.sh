#!/bin/bash

converte_imagem(){
    local caminho_imagem=$1
    local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{ print $1 }')
    convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png
    }

varredura(){
    cd $1
    for arquivo in *
    do
        local caminho_arquivo=$(find ~/Projetos/Vidal/Alura/Bash/imagens-novos-livros -name $arquivo)
        if [ -d $caminho_arquivo ]
        then
            varredura $caminho_arquivo
        else
            converte_imagem $caminho_arquivo
        fi
    done
}

varredura /home/vidal/Projetos/Vidal/Alura/Bash/imagens-novos-livros
if [ $? -eq 0 ]
then
    echo "Conversao realizada"
else
    echo "Fudeu!"
fi