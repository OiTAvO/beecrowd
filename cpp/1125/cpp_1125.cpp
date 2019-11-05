/* 
    author: OiTAvO 
    problem_name: formula_1
    problem_number: 1125 
    category: ad-hoc
    difficulty_level: 3
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1125 
*/ 

#include<bits/stdc++.h>

using namespace std;

struct Piloto {
  int ident, pts = 0;
  bool operator<(const Piloto& p) {
    if (pts == p.pts) return ident < p.ident;
    return pts > p.pts;
  }
  void operator=(const int& _ident) { ident = _ident; }
  bool operator==(const int& _pts) {return pts == _pts;}
};

int main() {
  int g, p, s, k, i, j;

  ios_base::sync_with_stdio(false);
  
  while ((cin >> g >> p) && (g && p)) {
    vector<vector<int>> gps(g);
    for (auto& gp : gps) {
      vector<int> ordemChegada(p);
      for (auto& c : ordemChegada) cin >> c;
      gp = ordemChegada;
    }

    cin >> s;
    vector<vector<int>> pontos(s);
    for (auto& pt : pontos) {
      cin >> k;
      vector<int> valores(p, 0);
      for (i = 0; i < k; ++i) cin >> valores[i];
      pt = valores;
    }

    for (auto& ponto : pontos) {
      Piloto pilotos[100];
      iota(pilotos, pilotos + p, 1);
      for (auto& gp : gps)
        for (i = 0; i < gp.size(); ++i)
          pilotos[i].pts += ponto[gp[i] - 1];
      sort(pilotos, pilotos + p);
      i = count(pilotos, pilotos + p, pilotos[0].pts);
      for (j = 0; j < i; ++j)
        cout << pilotos[j].ident << (j + 1 == i ? "\n" : " ");
    }
  }
  return 0;
}
