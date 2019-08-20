#!/bin/bash

while getopts "p:l:q:" opt
do
    case "$opt" in
      p ) prob="$OPTARG" ;;
      l ) lang="$OPTARG" ;;
      q ) qtd="$OPTARG" ;;
    esac
done

if [ -z "$prob" ]; then
    echo "Digite o numero do problema: "; read prob
fi

if [ -z "$lang" ]; then
    echo "Digite qual linguagem: "; read lang
fi

if [ -z "$qtd" ]; then
    echo "Digite a quantidade de teste(ao menos 1): "; read qtd
fi

lang=`echo "$lang" | tr '[:upper:]' '[:lower:]'`

