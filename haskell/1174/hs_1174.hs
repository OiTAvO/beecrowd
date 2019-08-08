{-- 
    author: OiTAvO 
    problem_name: selecao_em_vetor_1
    problem_number: 1174 
    category: iniciante
    difficulty_level: 3
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1174 
--}

import Control.Monad
 
main = do
  inputs <- replicateM 100 getLine
  let valores = map (\n -> (read n :: Double)) inputs
  let valores_index = zip [0 .. 99] valores
  let v_i_filtrados = filter (\(i, v) -> v <= 10.0) valores_index
  let output = map (\(i, v) -> "A[" ++ show i ++ "] = " ++ show v) v_i_filtrados
  mapM_ putStrLn output
