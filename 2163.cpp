// Copyright OAMP
#include <iostream>
#include <cstdio>
#include <string>
#include <cstring>
#include <cstdlib>
#include <stack>

using std::getline;

int main() {
  unsigned int n, m, count, posY;
  typedef std::pair<int, int> coord;
  coord xy;
  std::stack<coord> pilha;
  char* cPtr;
  char str[7000];

  scanf("%d %d", &n, &m);
  getchar();
  count = n;
  int arr2d[n][m];

  while (count--) {
    scanf("%[^\n]", str);
    getchar();
    posY = n - 1 - count;
    cPtr = strtok(&str[0], " ");
    for (int i = 0; cPtr != NULL; ++i) {
      arr2d[posY][i] = atoi(cPtr);
      if (arr2d[posY][i] == 42)
        if (posY > 0 & posY < n - 1)
          if (cPtr != &str[0] & cPtr != &str[0] + m)
            pilha.push(coord(posY, i));
      cPtr = strtok(NULL, " ");
    }
  }

  while (!pilha.empty()) {
    count &= 0;
    xy = pilha.top(); pilha.pop();
    for (int i  = -1, iy = xy.first; i < 2; ++i) {
      for (int j = -1, jx = xy.second; j < 2; ++j) {
        if (arr2d[iy + i][jx + j] == 7) count++;
        else if (arr2d[iy + i][jx + j] == 42 & i  == 0 & j == 0) count++;
        else {
            count &= 0;
            break;
        }
      }
      if (!(count))
        break;
    }
        
    if (count == 9) {
      (xy.first)++; (xy.second)++;
      break;
    }
    xy = std::make_pair(0, 0);
  }
  
  printf("%d %d\n", xy.first, xy.second);

  return 0;
}
