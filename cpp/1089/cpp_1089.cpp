// OAMP - tempo 0.004s
#include <cstdio>  // entrada e saída padrão

int main () {
    bool flg;  // flg para inflexão
    int n, i, picos, v[10001];  // variaveis da solução
    char bff[7000], *ptr = &bff[0];  // buffer p/ resultado
    
    while (scanf("%d", &n) && n) {  // entrada para qtde de valores
        for (i = 0; i < n; ++i)  // loop p/ entrada de valores
            scanf("%d", &v[i]);  // entrada de valores

        flg = (v[n - 1] < v[0]);  // atribui resultado da expr p/ flg
        for(picos = i = 0; i < n; ++i)  // loop p/ todos os valores
            if ((v[i] < v[(i + 1) % n]) != flg) {  // há uma inflexão
                ++picos;  // acresce 1 ao contador de picos
                flg = !flg;  // inverte flg (sentido do pico)
            }
        ptr += sprintf(ptr, "%d\n", picos);  // concatena resp. no buffer
    }
    printf("%s", bff);  // imprime resultado
    return 0;  // fim do programa
}
