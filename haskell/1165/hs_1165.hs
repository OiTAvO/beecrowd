{-- 
    author: OiTAvO 
    problem_name:  
    problem_number: 1165 
    category:  
    difficulty_level:  
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1165 
--} 
 
import Control.Monad

divisors 1 = [1]
divisors x = 1:[ y | y <- [2..(x `div` 2)], x `mod` y == 0] ++ [x]

isPrime x
    | divisors x == [1,x] = ((show x) ++ " eh primo")
    | otherwise = ((show x) ++ " nao eh primo")    

main = do
    input <- getLine
    let qtd = (read input :: Int)
    inputs <- replicateM qtd getLine
    let nCases = map (\n -> (read n :: Int)) inputs
    let output = map isPrime nCases
    mapM_ putStrLn output
