for f in ./in/*; do
    clj -M ./clj_1478.clj < ./in/${f##*/} > ./out/${f##*/}
    diff ./out/${f##*/} ./answer/${f##*/}
    echo 'Próximo...'
    read pause
done
echo 'FIM DOS TESTES'
read pause
