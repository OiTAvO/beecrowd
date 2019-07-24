{-- 
    author: OiTAvO 
    problem_name: as_moedas_de_robbie 
    problem_number: 2709 
    category: iniciante 
    difficulty_level: 9 
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2709 
--} 

import System.IO
import Control.Monad

paraInt x = (read x :: Int)

gloria = "You’re a coastal aircraft, Robbie, a large silver aircraft."
robbie = "Bad boy! I’ll hit you."

divisors 1 = [1]
divisors x = 1:[ y | y <- [2..(x `div` 2)], x `mod` y == 0] ++ [x]

isPrime x = divisors x == [1,x]

soma n len lista = sum [lista!!x | x <- [0..(len - 1)], ((x + n) `mod` n) == 0]

ateOFim = do
    eof <- isEOF
    unless (eof) $ do
        input <- getLine
        let n = (read input :: Int)
        inputs <- replicateM n getLine
        input <- getLine
        let p = (read input :: Int)
        let n_lista = map paraInt inputs
        let r_lista = reverse n_lista
        let num = soma p (length r_lista) r_lista
        let primo = isPrime num
        let result = (if primo then gloria else robbie)
        putStrLn result
        ateOFim

main = do
    hSetEncoding stdout utf8
    ateOFim