''' 
    author: OiTAvO 
    problem_name: esquerda_volver
    problem_number: 1437 
    category: ad-hoc
    difficulty_level: 2 
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1437 
''' 

from sys import stdin

direcao = ['N', 'L', 'S', 'O']

def main():
    out = []
    comandos = [line.strip() for line in stdin]

    for comando in comandos[1::2]:
        Direitas = comando.count('D')
        Esquerdas = len(comando) - Direitas
        
        out.append(direcao[(3 * Esquerdas + Direitas) % 4])
    print(*out, sep='\n')
    
if __name__ == '__main__':
    main()
