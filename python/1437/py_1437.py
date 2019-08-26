''' 
    author: OiTAvO 
    problem_name: esquerda_volver
    problem_number: 1437 
    category: ad-hoc
    difficulty_level: 2 
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1437 
''' 

direcao = ['N', 'L', 'S', 'O'] 

while True:
    N = int(input()) 
    if N == 0:
        break
    
    D = 0
    for i in input():
        if i == 'D':
            D += 1
        else:
            D += 3
        
    print(direcao[D % 4])
