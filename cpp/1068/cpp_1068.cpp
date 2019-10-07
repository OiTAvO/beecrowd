/* 
    author: OiTAvO 
    problem_name: balanco_de_parenteses
    problem_number: 1068 
    category: estruturas_e_bibliotecas
    difficulty_level: 5
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1068 
*/ 
 
#include <bits/stdc++.h>

using namespace std;

int main() {
    char in[1001];

    while (~scanf("%[^\n]\n", &in)) {
        
        queue<char> fC;
        for(int i = 0; in[i]; ++i)
            if (in[i] == '(' | in[i] == ')') fC.push(in[i]);

        stack<char> pC({'#'});
        while (!fC.empty()) {
            char idx = fC.front(); fC.pop();
            if(idx == ')' && pC.top() == '(') pC.pop();
            else pC.push(idx);
        }

        if (pC.size() == 1) printf("correct\n");
        else printf("incorrect\n");
    }
    return 0;
}