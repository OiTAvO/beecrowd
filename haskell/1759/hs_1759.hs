{-- 
    author: OiTAvO 
    problem_name: ho_ho_ho
    problem_number: 1759 
    category: iniciante
    difficulty_level: 3
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1759 
--} 

import Control.Monad

main = do
  input <- getLine
  let n = (read input :: Int)
  let hohos = replicate (n - 1) "Ho "
  putStrLn (join hohos ++ "Ho!")
