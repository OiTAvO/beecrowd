{-- 
    author: OiTAvO 
    problem_name: lexico
    problem_number: 2826 
    category: iniciante
    difficulty_level: 2
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2826 
--} 
 
import Data.List

main = do
    a <- getLine
    b <- getLine
    mapM_ putStrLn (sort [a, b])