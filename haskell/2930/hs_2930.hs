{-- 
    author: OiTAvO 
    problem_name: tcc_da_depressão_natalino
    problem_number: 2930 
    category: iniciante
    difficulty_level: 5
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2930 
--} 
 
tcc :: Int -> Int -> [[Char]]
tcc e d | e > d = ["Eu odeio a professora!"]
        | d - e >= 3 = ["Muito bem! Apresenta antes do Natal!"]
        | e < 22 = ["Parece o trabalho do meu filho!", "TCC Apresentado!"]
        | otherwise = ["Parece o trabalho do meu filho!", "Fail! Entao eh nataaaaal!"]

paraInt n = (read n :: Int)

main = do 
    inp <- getLine
    let palavras = words inp
    let e = (read (head palavras) :: Int)
    let d = (read (head (tail palavras)) :: Int)
    mapM_ putStrLn (tcc e d)