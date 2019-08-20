''' 
    author: OiTAvO 
    problem_name: ho_ho_ho
    problem_number: 1759 
    category: iniciante
    difficulty_level: 3
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1759 
''' 
 
n = int(input())
print(" ".join(["Ho" if x != (n - 1) else "Ho!" for x in range(n)]))
