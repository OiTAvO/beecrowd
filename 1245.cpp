// OAMP - tempo 0.004s
#include <cstdio>  // entrada e saída padrão
#define D 'D'  // define a macro D
#define E 'E'  // define a macro E

int main() {
    int botas[31]['F'],  // matriz para tamanho de botas
        qtde, tm, i, sz, resultado;  // tm da bota, qtde de botas 
    char *ptr, pe, buffer[7000];  // pe indicado da bota buffer e ptr
    ptr = &buffer[0];  // indica o inicio do buffer
    
    while (scanf("%d", &qtde) != EOF) {  // caprtura enquanto ñ for EOF
        resultado &= 0;  // atribui resultado a 0
        for (int *i : botas)  // loop p/ matriz de botas
            i[D] = i[E] &= 0;  // atribui a 0 p/ posição da matriz
    
        for(; qtde--;){  // loop enquanto qtde for maior que 0
            scanf("%d %c", &tm, &pe);  //  captura tamanho e o pe
            botas[tm - 30][pe]++;  // aumenta em 1 a qtde do par
        }
        
        for (int *i : botas)  // loop pela matriz de botas
            if (i[D] != 0 & i[E] != 0)  // valores diferentes de 0
                resultado += i[D]/D < i[E]/E ?
                          i[D]/D : i[E]/E;  // atrib. valor ao resultado
        
        sz = sprintf(ptr,"%d\n", resultado);  // concatena resultado
        ptr += sz;  // aponta p/ posição final depois de concatenar
    }
    printf("%s", buffer);  // imprime buffer com o resultado
    return 0;  // fim do programa
}
