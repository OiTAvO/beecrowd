/*
	author: OiTAvO
	problem_name: crescimento_populacional
	problem_number: 1160
	category: iniciante
	difficulty_level: 4
	link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1160
*/

#include <bits/stdc++.h>

static char bff[100];

const char* mensagem(int anos) {
  if (anos > 100) return "Mais de 1 seculo.\n";
  sprintf (&bff[0], "%d anos.\n", anos);
  return &bff[0];
}

int main() {
  int pa, pb, anos, n;
  double txa, txb;

  scanf("%d", &n);
  while (n--) {
    scanf("%d %d %lf %lf", &pa, &pb, &txa, &txb);
    anos = 0;
    while (++anos) {
      pa *= (1.0 + (txa / 100.0));
      pb *= (1.0 + (txb / 100.0));
      if (pa > pb) break;
      else if (anos > 100) break;
    }
    printf("%s", mensagem(anos));
  }
  return 0;
}
