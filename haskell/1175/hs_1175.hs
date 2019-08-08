{-- 
    author: OiTAvO 
    problem_name: troca_em_vetor_1
    problem_number: 1175 
    category: iniciante
    difficulty_level: 1
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1175 
--} 
 
import Control.Monad

main = do
    inputs <- replicateM 20 getLine
    let vals = map (\n -> (read n :: Int)) inputs
    let de_re = reverse vals
    let dere_index = zip [0 ..19] de_re
    let output = map (\(i, v) -> "N[" ++ show i ++ "] = " ++ show v) dere_index
    mapM_ putStrLn output
