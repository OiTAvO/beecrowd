{-- 
    author: OiTAvO 
    problem_name: numero_perfeito
    problem_number: 1164 
    category: iniciante
    difficulty_level: 1
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1164 
--} 

import Control.Monad

saidas n1 n2 | n1 == n2 = ((show n1) ++ " eh perfeito")
             | otherwise = ((show n1) ++ " nao eh perfeito")

main = do
  input <- getLine
  let qtd = (read input :: Int)
  inputs <- replicateM qtd getLine
  let nCases = map (\n -> (read n :: Int)) inputs
  let sums = map (\n -> sum [x | x <- [1..(n - 1)], mod n x == 0]) nCases
  let output = map (\(n1, n2) -> saidas n1 n2) (zip nCases sums) 
  mapM_ putStrLn output 
