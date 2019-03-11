// OAMP - tempo: 0.000s
#include <iostream>
#include <cstdio>
#include <string>

using namespace std;

inline bool flagCh(char ch) {  // verific se o char é nulo ou '0'
  return (ch == '0' | ch == NULL) ? true : false;
}

int main() {
  int n;  // variável para digito com problema
  string val, result;  // val armazena valor original e resultado final
  char n_str;  // char para digito com problema
  size_t found, len_val;  // found indica se digito foi encontrado
    
  while (scanf("%d", &n) != EOF) {  // captura digito até EOF
    getchar();  // limpa buffer
    getline(cin, val);  // recebe valor original
    len_val = val.size();  // recebe tamanho do valor original

    if (n == 0 && len_val == 1 && val[0] == '0')  // val original e digito != 0
      break;  // fim da execução

    n_str = '0' + n;  // converte digito para char
    found = val.find(n_str);  // procura por char
    do {  // faça
      if (found != string::npos)  // char encontrado?
        val.replace(found, 1, "");  // troca char na posiçao encontrada por ""
      else  // char não foi encontrado?
        break;  // termina laço do while
      found = val.find(n_str);  // executa busca por mais digitos
    } while (true);  // enquanto verdade

    if (val.size() == 0) {  // após substituições tamanha ficou = 0?
      result.append("0\n");  // acrescenta "0\n"
      continue;  // reinicia laço while
    }

    len_val = val.size();  // recebe novo tamanho após as substituições
    for (int i = 1; i < 10; ++i) {  // loop para verificar valores restantes
      n_str = '0' + i;  // valor para ser procurado
      found = val.find(n_str);  // retorna indice encontrado
      if (found != string::npos && found < len_val)  // achou e val < len_val
        len_val = found;  // recebe valor da posição encontrada
    }
      
    if (len_val == val.size()) {  // tamanhos iguais?
      result.append("0\n");  // valor a ser apresentado "0\n"
      continue;  // reinicia laço while
    }
    
    result.append(val.begin() + len_val, val.end());  // append val ao result
    result.append("\n");  // acrescenta "\n" para nova linha
  }

  printf("%s", result.c_str());  // printf do result

  return 0;
}
