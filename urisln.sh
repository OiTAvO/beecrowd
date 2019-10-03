#!/bin/bash

function toLower () {
    echo  $1 | tr '[:upper:]' '[:lower:]'
}

function langExt() {
   case $1 in
       cpp) echo cpp ;;

       d) echo d ;;

       python) echo py ;;

       haskell) echo hs ;;
    esac
}

function slnDoc() {
    src="./$1/$2/$3_$2.$3"
    username=`git config user.name`
    echo -e "    author: $usename\r\n" >> "$src"
    echo -e "    problem_name: \r\n" >> "$src"
    echo -e "    problem_number: $2\r\n" >> "$src"
    echo -e "    category: \r\n" >> "$src"
    echo -e "    difficulty_level: \r\n" >> "$src"
    echo -e "    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/$2\r\n" >> "$src"
}



function main() {
    while getopts "p:l:q:" opt
    do
        case "$opt" in
          p ) prob="$OPTARG" ;;

          l ) lang="$OPTARG" ;;

          q ) qtd="$OPTARG" ;;
        esac
    done

    if [ -z "$prob" ]; then
        echo "Digite o numero do problema: "
        read prob
    fi

    if [ -z "$lang" ]; then
        echo "Digite qual linguagem: "
        read lang
    fi

    if [ -z "$qtd" ]; then
        echo "Digite a quantidade de teste(ao menos 1): "
        read qtd
    fi


    # Cria diretorios
    #mkdir -p "./$lang/$prob/answer"
    #mkdir -p "./$lang/$prob/in"
    #mkdir -p "./$lang/$prob/out"

    ext=$(langExt $lang)
    #slnDoc $lang $prob $ext
}

main #entry point