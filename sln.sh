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
       clojure) echo clj ;;
    esac
}

function slnDoc() {
    src="./$lang/$prob/$1_$prob.$1"
    if [ -f "$src" ]; then
	rm "$src"
    fi
    
    username=`git config user.name`
    echo -e "$(iniDoc $1)" >> "$src"
    echo -e "    author: $(git config user.name)" >> "$src"
    echo -e "    problem_name: " >> "$src"
    echo -e "    problem_number: $prob" >> "$src"
    echo -e "    category: " >> "$src"
    echo -e "    difficulty_level: " >> "$src"
    echo -e "    link: https://judge.beecrowd.com/pt/problems/view/$prob" >> "$src"
    echo -e "$(endDoc $1)\n" >> "$src"
}

function iniDoc() {
    case $1 in
	py ) echo '"""' ;;
	cpp ) echo '/*' ;;
	d ) echo '/*' ;;
	hs ) echo '{--' ;;
	clj ) echo '"' ;;
    esac
}

function endDoc() {
    case $1 in
	py ) echo '"""' ;;
	cpp ) echo '*/' ;;
	d ) echo '*/' ;;
	hs ) echo '--}' ;;
	clj ) echo '"'
    esac
}

function command() {
    case $1 in
	py ) echo '' ;;
	cpp ) echo 'g++ -std=c++11 -O2 ./'$ext'_'$prob.$ext -o ./$ext'_'$prob ;;
	d ) echo '' ;;
	hs ) echo 'ghc -O -no-keep-hi-files -no-keep-o-files '$ext'_'$prob ;;
	clj ) echo '' ;;
    esac    
}

function exeorscript() {
    case $1 in
	py ) echo 'python3 ./'$ext'_'$prob.$ext ;;
	cpp ) echo './'$ext'_'$prob ;;
	d ) echo 'rdmd ./'$ext'_'$prob.$ext ;;
	hs ) echo './'$ext'_'$prob ;;
	clj ) echo 'clj -M ./'$ext'_'$prob.$ext ;;
    esac        
}

function runsln() {
    src="./$lang/$prob/runsln.sh"
    if [ -f "$src" ]; then
	rm "$src"
    fi
    
    if [ -n "$(command $1)" ]; then
	echo -e "$(command $1)" >> "$src"
    fi
    echo -e "for f in ./in/*; do" >> "$src"
    echo -e "    $(exeorscript $1) < ./in/\${f##*/} > ./out/\${f##*/}" >> "$src"
    echo -e "    diff ./out/\${f##*/} ./answer/\${f##*/}" >> "$src"
    echo -e "    echo 'Próximo...'" >> "$src"
    echo -e "    read pause" >> "$src"
    echo -e "done" >> "$src"
    echo -e "echo 'FIM DOS TESTES'" >> "$src"
    echo -e "read pause" >> "$src"
    chmod 777 $src
}

function main() {
    if [ -z "$prob" ]; then
        echo "Digite o numero do problema: "; read prob
    fi

    if [ -z "$lang" ]; then
        echo "Digite qual linguagem: "; read lang
    fi

    if [ -z "$qtd" ]; then
        echo "Digite a quantidade de teste(ao menos 1): "; read qtd
    fi

    lang=$(toLower $lang)
    
    # Cria diretorios
    mkdir -p "./$lang/$prob/answer"
    mkdir -p "./$lang/$prob/in"
    mkdir -p "./$lang/$prob/out"

    for q in $(seq 1 $qtd); do
	ans_file="./$lang/$prob/answer/$prob_$q"
	if [ -f "$ans_file" ]; then
	    rm "$ans_file"
	else
	    touch "$ans_file"
	fi
	
	in_file="./$lang/$prob/in/$prob_$q"
	if [ -f "$in_file" ]; then
	    rm "$in_file"
	else
	    touch "$in_file"
	fi
    done
    
    ext=$(langExt $lang)
    $(slnDoc $ext)
    $(runsln $ext)
}

while getopts "p:l:q:" opt
do
    case "$opt" in
        p ) prob="$OPTARG" ;;
        l ) lang="$OPTARG" ;;
        q ) qtd="$OPTARG" ;;
    esac
done

main #entry point
