/* 
    author: OiTAvO
    problem_name: soma_das_casas
    problem_number: 2422
    category: ad-hoc
    difficulty_level: 6
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2422 
*/ 
 
#include <bits/stdc++.h>

using namespace std;

int main() {
    int n, soma;
    static int vi[100000];
    
    scanf("%d", &n);
    
    for (int i = 0; i < n; ++i)
        scanf("%d", &vi[i]);

    scanf("%d", &soma);
   
    for(int i = 0;;++i) {
        if (binary_search(vi + i, vi + n, soma - vi[i])) {
            printf("%d %d\n", vi[i], soma - vi[i]);
            return 0;
        }
    }
}
