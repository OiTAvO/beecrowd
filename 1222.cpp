#include <cstdio>  // entrada e saida padrao
#include <cstring>  // strlen

int main () {
    int n, l, c, chs, pg, ln, len;  // variaveis do problema
    char str[100], bff[1000], *ptr = &bff[0];  // buffer p/ resposta
    
    while (~scanf("%d %d %d", &n, &l, &c)) {  // entrada ate EOF
        ln = 1; chs = 0;  // inicia com linhas = 1 e caracteres = 0
        while (n--) {  // loop p/ todas as palavras
          scanf("%s", &str);  // entrada da palavra
          len = strlen(str);  // tamanho da palavra
          // Obs.: (bool) retorna 1 para valores de chs diferentes de 0
          if (chs + len + (bool)chs > c) {  // expr > max char por ln?
            chs = len;  // novo comprimento em char da prox. linha
            ++ln;  // acresce +1 para qtd de linhas
          } else chs += (bool)chs + len;  // chs += palav. + esp. se houver
        }  // fim while
        // (bool)(ln % l) retorna 1 para valores diferentes de 0
        pg = (ln / l) + (bool)(ln % l);  // calc para qtd de paginas
        ptr += sprintf(ptr, "%d\n", pg);  // concat resultado no buffer
    }  // fim while
    printf("%s", bff);  // imprime resultado
    return 0;  // fim do programa
}
