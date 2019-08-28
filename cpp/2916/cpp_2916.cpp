/* 
    author: OiTAvO 
    problem_name: a_nota
    problem_number: 2916 
    category: estruturas_e_bibliotecas
    difficulty_level: 9
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2916 
*/ 
 
#include <bits/stdc++.h>

using namespace std;
using ull = unsigned long long;
using vull = vector<ull>;

static char bff[10000], *ptr = &bff[0];
static const ull mod = 1e9+7;

int main() {
    ull a, b, soma, n;

    while (~scanf("%llu %llu", &a, &b)) {
        
        vull x(a);
        for(auto& xs: x)
            scanf("%llu", &xs);
        
        sort(x.begin(), x.end(), [](ull& a, ull&b){ return a > b; });
        
        soma = 0;
        for(auto xs = x.begin(); xs != x.begin() + b; ++xs)
            soma = (soma + *xs) % mod;
            
        ptr += sprintf(ptr, "%llu\n", soma);
    }
    printf("%s", bff);
    return 0;
}