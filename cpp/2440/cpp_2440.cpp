// OAMP - tempo 0.048s
#include <cstdio>  // entrada e saída padrão
#include <vector>  // container
#include <stack>  // estrutura LIFO

using namespace std;

int main() {
    int n, m, f1, f2, cnt = 0;  // f1 e f2 p/ pares e cnt p/ contador
    stack<int> pilha; // pilha para uso de flood fill
    
    scanf("%d %d", &n, &m);  // entrada de qtd de familiares e instruções
    int cp[n+1] = { 0 };  // vetor cp iniciado com 0
    vector<int> arr[n+1];  // array de vector<int>
    
    while (m--) {  // enquanto houver intruções
        scanf("%d %d", &f1, &f2);  // entrada de pares de familiares
        arr[f1].push_back(f2);  // insere f2 na posição do arr[f1]
        arr[f2].push_back(f1);  // insere f1 na posição do arr[f2]
    }  // fim enquanto
    
    for (int i = 1; i <= n; ++i) {  // loop p/ todos familiares
        if(cp[i]) continue;  // cp[i] familiar a alguém ? continua 
        pilha.push(i);  // empilha valor de i
        ++cnt;  // +1 ao contador de familias
        while (!pilha.empty()) {  // enquanto pilha estiver cheia
            f1 = pilha.top(); pilha.pop();  // top() p/ f1, depois pop()
            for (auto j: arr[f1])  // loop p/ todo vector<int>
                if (!cp[j]++) pilha.push(j);  // ñ visitado? visitado, insere na pilha
        }  // fim enquanto
    }  // fim for i
 
    printf("%d\n", cnt);  // print qtde familias
    
    return 0;  // fim do programa
}
