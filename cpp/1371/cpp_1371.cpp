// OAMP - tempo 0.000s
#include <cstdio>  // entrada e saída padrão

int main() {
  int i, n;  // indexador e n p/ qtd de netos/quartos
  char buffer[1000000], *ptr = &buffer[0];  // buffer p/ resp. final e ptr
  
  while(scanf("%d", &n) && n) {  // enquanto entrada de n e n == true
    for (i = 1; i*i <= n; ++i)  // loop p/ qtd quartos p/ i² <= qtd quartos
      ptr += sprintf(ptr, "%d ", i*i);  // concatena resp. no buffer
      
    ptr += sprintf(--ptr, "\n");  // concatena new line
  }
  printf("%s", buffer);  // printf resp. final
  return 0;  // fim do programa
}
