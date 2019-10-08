''' 
    author: OiTAvO
    problem_name: duende_perdido
    problem_number: 2294
    category: ad-hoc
    difficulty_level: 4
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2294
''' 
from sys import stdin

class Coord:
    def __init__(self):
        self.x = None
        self.y = None
        self.valor = 2
        self.visitado = 0

incX = [-1, 0, 1, 0]
incY = [0, -1, 0, 1]
menor = 1000000

entrada = [line for line in stdin]
n, m = [int(x) for x in entrada[0].split()]

fila = []
mtx = [[]]

for ni in range(12):
    for mi in range(12):
        mtx[ni].append(Coord())
    mtx.append(list())

for i in range(1, n + 1):
    lista = [int(x) for x in entrada[i].split()]
    for idx, j in enumerate(lista, start=1):
        mtx[i][idx].x = idx
        mtx[i][idx].y = i
        mtx[i][idx].valor = j
        if j == 3:
            mtx[i][idx].visitado = 1
            fila.append(mtx[i][idx])

while len(fila) > 0:
    coord = fila[0]
    fila = fila[1:]
    if coord.valor == 0 and coord.visitado < menor:
        menor = coord.visitado

    for i in range(4):
        xs = coord.x + incX[i]
        ys = coord.y + incY[i]
        if not mtx[ys][xs].valor == 2 and not bool(mtx[ys][xs].visitado):
            mtx[ys][xs].visitado = coord.visitado + 1
            fila.append(mtx[ys][xs])

print(menor - 1)