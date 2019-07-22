// OAMP - tempo 0.000s
#include <iostream>  // entrada e saída padrão

using namespace std;
using ull = unsigned long long;  // novo nome p/ unsigned long long

// função recusiva de cauda, valor passado p/ referência
inline void fact(ull& val, int mult) { 
    if (val < 2) val = 1;  // menor que 2? retorna 1
    if (mult > 1) fact(val *= mult, mult - 1);  // chama func. com novos valores
}  // fim da função

int main() {
    ull m, n;  // variáveis p/ cálculo
    
    while (cin >> m >> n) {  // entrada até EOF
        fact(m, m - 1);  // chamada da função
        fact(n, n - 1);  // chamada da função
        cout << m + n << endl;  // cout da soma
    }  // fim enquanto
    return 0;  // fim do programa
}
