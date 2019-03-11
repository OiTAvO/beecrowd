// OAMP  - tempo: 0.008s
#include <cstdio>  // Utilzado para scanf, printf, getchar

using namespace std;

int main() {
  int qtde;  // qtde de frases para criptografar
  char *pMeio, *it, *pMax;  // pMeio p/ meio da frase, it p/ iterar e pMax
  char buffer[1002], bfAux[1002];  // buffer para captura das frases e buffer aux

  scanf("%d", &qtde);  // qtde recebe input
  getchar();  // recebe o '\n' excluido do input
  while (qtde--) {  // Enquanto houver frases para capturar
    scanf("%[^\n]", buffer);  // buffer recebe frase do input
    getchar();  // recebe o '\n' excluido do input

    for (it = &buffer[0];  *it != '\0'; ++it)  // iterar sobre a frase
      if ((*it >= 'A' && *it <= 'Z') | (*it >= 'a' && *it <= 'z'))  // no range?
        *it += 3;  // modifica o char

    pMax = &buffer[it++ - 1 - &buffer[0]];  // aponta p/ tamanho máx. da string
    pMeio = &buffer[((it - &buffer[0]) >> 1)];  // aponta p/ a metade da frase
    
    for (it = &buffer[0]; it < pMeio; ++it)  // modifica o char até pMeio
      *it -= 1;  // modifica o char

    for (it = &bfAux[0]; pMax >= &buffer[0];)  // loop p/ reversão da string
        *it++ = *pMax--;
    
    *it++ = '\n';  // pula linha
    *it = '\0';  // fim da string
    printf("%s", bfAux);  // imprime string reversa
  }  // fim Enquanto
  return 0;
}
