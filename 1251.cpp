// OAMP - tempo 0.020s
#include <cstdio>  // Para entrada e saída padrão
#include <algorithm>  // Para usar o sort

struct chQtde {char ch = 0, qtd = 0;};  // estrutura p/ valor do char e sua qtde

bool ordem(chQtde p1, chQtde p2) {  // função compara uso estruturas p/ sort
  if (p1.qtd < p2.qtd) return true;  // menor?
  if (p1.qtd > p2.qtd) return false;  // maior?
  if (p1.ch > p2.ch) return true;  // qtde iguas, char maior?
  return false;  // char menor
}

int main() {
  char cStr[1002], *ptr;  // cStr p/ capturar entrada, *ptr para iterar
  int count = 0, n;  // contador
  chQtde vChar[128], *ptrS;  // vetor de estrutura e iterador

  while (scanf("%[^\n]", &cStr) != EOF) {  // captura string e ver. EOF
    getchar();  // captura '\n' rejeitado
    if (count++) printf("\n");  // maior que zero?
    for (ptr = &cStr[0]; *ptr != '\0'; ++ptr) {  // loop p/ to a string
      vChar[(int)*ptr].qtd++;  // add +1
      vChar[(int)*ptr].ch = *ptr;  // atribui o char para a estrutura
    }  // fim do for

    ptrS = &vChar[32];  // posição inicial do ponteiro
    std::sort(ptrS, ptrS + 96, ordem);  // ordena o deque
    
    ptr = &cStr[0];
    for (ptrS = &vChar[32]; ptrS <= &vChar[127]; ++ptrS) {  // loop p/ iterar
      if (!(ptrS->qtd)) continue;  //  igual a 0? continue
      n = sprintf(ptr, "%d %d\n", ptrS->ch, ptrS->qtd);  // imprime linha
      ptr += n;  // atualiza posição do vetor
      ptrS->qtd &= 0;  // atribui 0 para a qtd
    }  // fim do for
    printf("%s", cStr);  // imprime valores
  }
  return 0;
}  // fim do programa
