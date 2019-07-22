// OAMP - tempo 0.000s
#include <iostream>  // entrada e saída padrão

using namespace std;

int main() {
  int vetCed[7] = {100, 50, 20, 10, 5, 2, 1},  // vet de cédulas
      vet[7] = { 0 }, valor, resto, aux;  // vet qtd cédulas, val, resto e aux

  cin >> valor;  // entrada do valor
  resto = valor;  // atribui valor para resto

  for (int i = 0; i < 7; ++i) {  // loop p/ 
    aux = resto / vetCed[i];  // atribui p/ aux a div do resto p/ vet de cédulas
    resto %= vetCed[i];  // atualiza o valor restante
    vet[i] = aux;  // atribui resultado da divisão
  }

  cout << valor << endl;  // imprime valor

  for (int i = 0; i < 7; ++i) {  // loop p/ impressão
    cout << vet[i] << " nota(s) de R$ "
         << fixed
         << vetCed[i] << ",00" << endl;  // imprime qtd de cada cédula
  }
  return 0;  // fim de programa
}
