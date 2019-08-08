{-- 
    author: OiTAvO 
    problem_name: preenchimento_de_vetor_2
    problem_number: 1177 
    category: iniciante
    difficulty_level: 1
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1177 
--} 

import Control.Monad

main = do
  input <- getLine
  let qtd = (read input :: Int)
  let lista_lista = replicate (1 + (quot 1000 qtd)) [0 .. (qtd - 1)]
  let lista = take 1000 $ join lista_lista
  let lista_index = zip [0 .. 999] lista
  let output = map (\(i, v) -> "N[" ++ show i ++ "] = " ++ show v) lista_index
  mapM_ putStrLn output
