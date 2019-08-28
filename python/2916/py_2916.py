''' 
    author: OiTAvO 
    problem_name: a_nota
    problem_number: 2916 
    category: estruturas_e_bibliotecas
    difficulty_level: 9
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2916 
''' 
from sys import stdin

mod = 1000000007
output = []

inputs = [line for line in stdin]
flatten = [int(y) for x in inputs for y in x.split()]
i = 0
while i < len(flatten):
    n, k = flatten[i], flatten[i+1]
    i = i + 2

    lista = sorted(flatten[i:i+n], reverse=True)
    i = i + n

    soma = sum(lista[:k])

    output.append(str(soma % mod))
print('\n'.join(output))
