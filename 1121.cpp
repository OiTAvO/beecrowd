// OAMP - tempo 0.008s
#include <cstdio>  // entrada e saída padrão

int dx[4] = {-1, 0, 1, 0};  // incremento p/ x
int dy[4] = {0, 1, 0, -1};  // incremento p/ y
char mat[102][103], co[50004];  // matriz p/ varredura e comandos
char bff[100000], *ptr = &bff[0];  // buffer e ptr para saída
char ref[4] = {'N', 'L', 'S', 'O'};  // array p/ orientação

int main(int argc, char const *argv[]) {
    int i, j, x, d, n, m, s, pi, pj;  // i, j iteradores

    while (scanf("%d %d %d", &n, &m, &s) != EOF) {  // entrada enquanto !- EOF
        if (!(n | m | s)) break;  // valores == 0 ? quebra o loop
        for (x = i = 0; i < n; i++) {  // loop p/ linhas e x = 0
            scanf("%s ", mat[i]);  // captura entrada para a linha
            for (j = 0; j < m; j++)  // loop p/ colunas
                if (mat[i][j] > 'K' & mat[i][j] < 'U')  // é uma orientação ?
                    pi = i, pj = j;  // coordanadas atuais/inicial
        }  // fim for i

        for (i = 0; i < 4; i++)  // loop p/ identificar orientação exata
            if (mat[pi][pj] == ref[i]) {d = i; break;}  // encont. ? quebra loop

        scanf("%s ", co);  // entrada de comandos
        for (i = 0; i < s; i++) {  // loop p/ comandos
            if (co[i] == 'E') d = (d + 3) % 4; // comando p/ esquerda ?
            else if(co[i] == 'D') d = (d + 1) % 4;  // comando p/ direita ?
            else if (pi + dx[d] != n & pj + dy[d] != m) // pos. até lim. sup.?
                if (pi + dx[d] > -1 & pj + dy[d] > -1)  // pos. até lim. inf.?
                    if (mat[pi + dx[d]][pj + dy[d]] != '#') {  // ñ é pilastra?
                        mat[pi][pj] = '.';  // pos. é uma célula normal
                        if (mat[pi + dx[d]][pj + dy[d]] == '*') x++;  // fig. ?
                        pi += dx[d], pj += dy[d];  // autaliza pos.
                    }  // fim if (mat[pi + dx[d]][pj + dy[d]] != '#')
        }  // fim for i
        ptr += sprintf(ptr, "%d\n", x);  // concatena resultado
    }
    printf("%s", bff);  // imprime todos os resultados
    return 0;  // fim do programa
}
