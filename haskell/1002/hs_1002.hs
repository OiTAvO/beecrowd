{-- 
    author: OiTAvO
    problem_name: area_do_circulo
    problem_number: 1002
    category: iniciante
    difficulty_level: 5
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1002
--} 
 
import Text.Printf

p = 3.14159

main = do
    input <- getLine
    let r = (read input :: Double)
    printf "A=%0.4f\n" (p * (r * r))
