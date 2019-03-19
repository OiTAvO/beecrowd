// OAMP - tempo 0.308s
#include <cstdio>  // entrada e saída padrãp

int main() {
  int mtz[1002][1002];  // matriz de pixels
  int x, y, j, i, k, m, n, T = 1;  // indexadores e outros
  
  while (scanf("%d %d", &n, &m)) {  // entrada p/ n e m
    if (!n && !m) break;  // n == 0 e m == 0 ? quebra o loop
    if (T > 1) printf("\n");  // new line p/ T > 1
    for (i = 0; i < n; ++i)  // loop p/ linhas da matriz
      for (j = 0; j < m; ++j)  // loop p/ colunas da matriz
        scanf("%d", &mtz[i][j]);  // entrada p/ matriz na pos.
  
    y = x = 0;  // iguala correções a 0
    while (scanf("%d %d", &j, &k)) {  // entrada p/ i e j
      if (!j && !k) break;  // i == 0 e  j == 0 ? quebra loop
      x += j; y += k;  // acresce valor de x e y
    }  // fim enquanto
    
    x %= m; y %= n;  // recalcula correções

    if (x < 0) x = m + x;  // se x menor que zero
    if (x > 0) x = m - x;  // se x maior que zero
    if (y < 0) y = n + y;  // se y menor que zero

    printf("Teste %d\n", T);  // imprime cabeçalho do Teste
    for (i = 0; i < n; ++i) {  // loop p/ linhas da matriz
      for (j = 0; j < m; ++j) {  // loop p/ colunas da matriz
        printf("%d", mtz[(y + i) % n][(x + j) % m]);  // print da posição
        if (j < m - 1) printf(" ");  // pos. < m ? print " "
      }
      printf("\n");  // imprime nova linha
    }  // fim for i
    ++T;  // acresce ao contador de Testes
  }  // fim enquanto
  printf("\n");  // imprime nova linha
  return 0;  // fim do programa
}
