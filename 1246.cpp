// Copyright OAMP - tempo 0.024s
#include <cstdio>  // entrada e saída padrão

int main() {
  char pEst[1001], c,  // array p/ qtd vagas max possivel e char tipo comando
      buffer[1001], *ptr;  // buffer para resposta final e ptr
  int p, t, est, nQtde, vagas,  // placa, tam., estac., qtd eventos e qtd vagas
      i, j, k, valor, indCar[9000][2],  // iteradores i, j, k. vlr e ind reverso
      n;  // Para posição do ptr

  ptr = &buffer[0];  // aponta para inicio do buffer
  while (scanf("%d %d", &est, &nQtde) != EOF) {  // tm estac. qtd eventos != EOF
    for (i = 0; i < est; ++i)  // loop p/ zerar vagas
      pEst[i] = '0';  // atribui '0' char - indica vaga desocupada
    valor = 0;  // atribui 0 ao valor
    vagas = est;  // atribui tm. esacionamento para qtd vagas

    for (i = 0; i < nQtde; ++i) {  // loop pela qtd de eventos
      scanf(" %c %d", &c, &p);  // captura Chegada/Saida e número da placa
      if (c == 'C') {  // Chegada?
        scanf(" %d", &t);  // captura tamanho do carro
        getchar();  // limpa buffer
        if (t <= vagas) {  // qtde vagas >= que tamanho do carro?
          for (j = 0, k = 0; j < est; ++j) {  // loop pelo estacionamento
            if (pEst[j] == '1') {  // encontrou vaga ocupada?
              k = 0;  // reseta valor de K
            } else {
              if ((t - 1) == k++) {  // compara e acrescenta +1 a K
                while (0 < k--) {  // compare e decrementa -1 de K
                  pEst[j - k] = '1';  // preenchimento da array
                }
                indCar[p - 1000][0] = j - t + 1;  // salva posicao inic
                indCar[p - 1000][1] = t;  // salva tamanho
                vagas -= t;  // calcula espaco estacionamento apos guardar carro
                valor += 10;  // soma valor do estacionamento
                break;  // quebra o loop for j
              }  // end if
            }  // end else
          }  // for j
        }  // end if t <= vagas
      } else {  // end if c == 'C' e inicio else
        j = indCar[p - 1000][0]; k = indCar[p - 1000][1];  // vlr inic. p/ i, j
        for (; k > 0; ++j, --k)  // loop pelo estacionamento
          pEst[j] = '0';  // atribui '0' char - indica vaga desocupada
        vagas += indCar[p - 1000][1];  // espaco no estacion. apos guardar carro
      }
    }  // end for i getOrdem
    n = sprintf(ptr, "%d\n", valor);  // saida formatada do resultado
    ptr += n;  // atualiza o endereço p/ onde ptr aponta
  }
  printf("%s", buffer);  // imprime o resultado
  return 0;  // fim do programa
}
