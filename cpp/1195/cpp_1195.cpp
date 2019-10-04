/* 
    author: OiTAvO 
    problem_name: arvore_binaria_de_busca
    problem_number: 1195 
    category: grafos
    difficulty_level: 6
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1195 
*/ 
 
#include<bits/stdc++.h>

using namespace std;

struct Arvore {
    struct No {
        int valor;
        No *r = nullptr, *l = nullptr;

        No (int vlr) : valor(vlr) {}
    } *raiz = nullptr;

    void insere(int vlr, No* &noAtual) {
        if (noAtual == nullptr)
            noAtual = new No(vlr);
        else if (vlr > (*noAtual).valor)
            insere(vlr, (*noAtual).r);
        else
            insere(vlr, (*noAtual).l);
    }

    void preOrdem(No *noAtual, char **ptr) {
        if (!noAtual) return;
            *ptr += sprintf(*ptr, " %d", noAtual->valor);
            preOrdem(noAtual->l, ptr);
            preOrdem(noAtual->r, ptr);
    }

    void emOrdem(No *noAtual, char **ptr) {
        if (!noAtual) return;
            emOrdem(noAtual->l, ptr);
            *ptr += sprintf(*ptr, " %d", noAtual->valor);
            emOrdem(noAtual->r, ptr);
    }

    void posOrdem(No *noAtual, char **ptr) {
        if (!noAtual) return;
            posOrdem(noAtual->l, ptr);
            posOrdem(noAtual->r, ptr);
            *ptr += sprintf(*ptr, " %d", noAtual->valor);
    }    
};

int main() {
    int n, m, input, Case = 1;
    static char bff[4000000], *ptr = &bff[0];

    scanf("%d", &n);
    while (n--) {
        scanf("%d", &m);
        Arvore tree;
        while (m--) {
            scanf("%d", &input);
            tree.insere(input, tree.raiz);
        }
        ptr += sprintf(ptr, "Case %d:", Case++);
        ptr += sprintf(ptr, "\nPre.:");
        tree.preOrdem(tree.raiz, &ptr);
        ptr += sprintf(ptr, "\nIn..:");
        tree.emOrdem(tree.raiz, &ptr);
        ptr += sprintf(ptr, "\nPost:");
        tree.posOrdem(tree.raiz, &ptr);
        ptr += sprintf(ptr, "\n\n");
    }
    printf("%s", bff);
    return 0;
}