{-- 
    author: OiTAvO 
    problem_name: preenchimento_de_vetor_1
    problem_number: 1173 
    category: iniciante
    difficulty_level: 1
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1173 
--} 

main = do
  input <- getLine
  let valor = (read input :: Int)
  let lista = [valor * 2 ^ x | x <- [0 .. 9]]
  let lista_index = zip [0 .. 9] lista
  let output = map (\(i, v) -> "N[" ++ show i ++ "] = " ++ show v) lista_index
  mapM_ putStrLn output
