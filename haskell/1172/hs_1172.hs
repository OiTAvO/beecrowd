{-- 
    author: OiTAvO 
    problem_name: substituicao_em_vetor_1
    problem_number: 1172 
    category: iniciante
    difficulty_level: 2
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1172 
--} 
 
import Control.Monad

condicao x | x < 1 = 1
           | otherwise = x

main = do
  inputs <- replicateM 10 getLine
  let nCases = map (\n -> (read n :: Int)) inputs
  let vetFinal = zip [0..10] (map condicao nCases)
  let output = map (\(x, y) -> "X[" ++ (show x) ++ "] = " ++ (show y)) vetFinal
  mapM_ putStrLn output
