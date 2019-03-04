// Copyright OAMP  - tempo: 0.012s
#include <cstdio>  // Utilzado para scanf, printf, getchar
#include <string>  // Utilização de strings para facilitar a vida

using namespace std;

int main() {
  int qtde;  // qtde de frases para criptografar
  string txt, result;  // txt para simples reversão da frase, result para o fim
  char *pMeio, *it;  // pMeio marca a metade da frase, it pointeiro para iterar
  char buffer[1002];  // buffer para captura das frases


  scanf("%d", &qtde);  // qtde recebe input
  getchar();  // recebe o '\n' excluido do input
  while (qtde--) {  // Enquanto houver frases para capturar
    scanf("%[^\n]", buffer);  // buffer recebe frase do input
    getchar();  // recebe o '\n' excluido do input

    for (it = &buffer[0];  *it != '\0'; ++it)  // iterar sobre a frase
      if ((*it >= 'A' && *it <= 'Z') | (*it >= 'a' && *it <= 'z'))  // no range?
        *it += 3;  // modifica o char

    pMeio = &buffer[((++it - &buffer[0]) >> 1)];  // aponta p/ a metado da frase

    for (it = &buffer[0]; it < pMeio; ++it)  // modifica o char até pMeio
      *it -= 1;  // modifica o char

    txt = buffer;  // string txt recebe buffer já modificado
    result.append(txt.rbegin(), txt.rend());  // result acrescenta txt reverso
    result.append("\n");  // result acrescenta "\n"
  }  // fim Enquanto

  printf("%s", result.c_str());  // printf do resultado final

  return 0;
}
