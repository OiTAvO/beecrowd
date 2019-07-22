// OAMP - tempo 0.000s
#include <iostream>  // entrada e saída padrão
#include <iomanip>  // usado p/ fixed, setprecision
#define PI  3.14159  // valor de PI
using namespace std;
 
int main() {
    double raio = 0.0;  // raio do Círculo
    
    cin >> raio;  // entrada de valor p/ raio
    // sentença abaixo imprime valor da área calculado do círculo
    cout << "A=" << fixed << setprecision(4) << PI * raio * raio << endl;   
    return 0;  // fim do programa
}
