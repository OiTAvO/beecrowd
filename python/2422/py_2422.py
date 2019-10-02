''' 
    author: OiTAvO
    problem_name: soma_das_casas
    problem_number: 2422
    category: ad-hoc
    difficulty_level: 6
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2422
''' 
 
from bisect import bisect_left
from sys import stdin

entrada = [int(x) for line in stdin for x in line.split()]

n = entrada[0]
lista = entrada[1:len(entrada) - 1]
valor = entrada[-1]

for i in lista:
    found = bisect_left(lista, valor - i)
    if found != n and lista[found] == valor - i:
        print("{} {}".format(i, valor - i))
        break
