/* 
    author: OiTAvO 
    problem_name: duende_perdido
    problem_number: 2294 
    category: ad-hoc
    difficulty_level: 4
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2294 
*/ 
 
#include <bits/stdc++.h>

using namespace std;

int n, m, menor = INT_MAX;
int inc[2][4] = {{1, 0, -1, 0}, {0, 1, 0, -1}};

struct Coord {
    int x, y, valor = 2, visitado = 0, dist = 0;
} mtx[12][12];

int main() {
    queue<Coord> fC;

    scanf("%d %d", &n, &m);
    for (int i = 1; i <= n; ++i) 
        for (int j = 1; j <= m; ++j) {
            scanf("%d", &mtx[i][j].valor);
            mtx[i][j].x = j;
            mtx[i][j].y = i;
            if (mtx[i][j].valor == 3) {
                mtx[i][j].visitado = 1;                
                fC.push(mtx[i][j]);
            }
        }

    while (!fC.empty()) {
        Coord c = fC.front(); fC.pop();
        if (!c.valor && c.dist < menor) menor = c.dist;

        for (int i = 0; i < 4; ++i) {
            int xs = c.x + inc[0][i];
            int ys = c.y + inc[1][i];
            mtx[ys][xs].dist = c.dist + 1;
            if (mtx[ys][xs].valor != 2 && !mtx[ys][xs].visitado) {
                mtx[ys][xs].visitado = 1;
                fC.push(mtx[ys][xs]);
            }    
        }        
    }
    printf("%d\n", menor);
    return 0;
}