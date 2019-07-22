// OAMP - tempo 0.004s
#include <cstdio>  // entrada e saída padrão
#include <queue>  // estrutura FIFO

/* Struct p/ coordenadas x e y de uma árvore
* dist indica se a árvore é alcançada */
struct coord { int x, y; bool dist = false; };

int d;  // tam. máx. do cipó - global p/ uso na função abaixo

inline bool dist(coord& c1, coord& c2) {
  return ((c1.x - c2.x) * (c1.x - c2.x) +
            (c1.y - c2.y) * (c1.y - c2.y)) <= d*d;
}  // retorna true se distância entre as árvores <= distância do cipó

int main() {
  coord vC[1000];  // array com tam. máx de árvores restantes
  std::queue<int> q({0});  // fila inicializada com {0}
  int n, i, j, cnt = 0;  // n qtd árvores - i, j index - cnt árvores alcançadas

  scanf("%d %d", &n, &d);  // entrada qtd árvores e tam. máx. cipó
  for (i = 0; i < n; ++i)  // loop p/ qtd árvores
    scanf("%d %d", &vC[i].x, &vC[i].y);  // entrada p/ coordenadas da árvore

  while (!q.empty()) {  // enquanto fila não estiver vazia
    i = q.front(); q.pop();  // atrib. inicio da fila p/ i, remove item inicio
    for (j = 0; j < n; ++j) {  // loop p/ qtd árvores restantes
      if (i == j) continue;  // posições das árvores iguais ? próxima iteração
      if (!vC[j].dist)  // posição não alcançada?
        if(dist(vC[j], vC[i])) {  // árvore alcançada?
            vC[j].dist = true;  // indica que árvore foi alcançada
            q.push(j);  // insere posição na fila
            ++cnt;  // +1 p/ contador de árvores alcançadas
        }  // fim if árvore alcançada
    }  // fim for j
  }  // fim enquanto
  cnt == n ? printf("S\n") : printf("N\n");  // cnd == n ? imprime S se não N
  return 0;  // fim do programa
}
