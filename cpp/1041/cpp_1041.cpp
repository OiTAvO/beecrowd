/* 
    author: OiTAvO 
    problem_name: coordenadas_de_um_ponto
    problem_number: 1041
    category: iniciante
    difficulty_level: 4
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1041
*/ 

#include <iostream>  // entrada e saída padrçao

using namespace std;

int main() {
  float x, y;  // variáveis p/ coordenadas

  cin >> x >> y;  // entrada dos dados
  
  if (x == 0.0 && y == 0.0) cout << "Origem\n";  // na origem ?
  else if (y == 0.0) cout << "Eixo X\n";  // no eixo Y ?
  else if (x == 0.0)cout << "Eixo Y\n";  // no eixo X ?
  else if (y > 0.0) {  // y nos quadrantes Q1 ou Q2?
    if (x > 0.0) cout << "Q1\n";  // x no 1º quadrante ?
    else cout << "Q2\n";  // x no 2º quadrante
  } else {  // y nos quadrantes Q3 ou Q4
    if (x < 0.0) cout << "Q3\n";  // x no 3º quadrante ?
    else cout << "Q4\n";   // x no 4º quadrante
  } 
  return 0;  // fim do programa
}
