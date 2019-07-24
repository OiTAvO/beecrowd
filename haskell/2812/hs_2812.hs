{-- 
    author: OiTAvO 
    problem_name: laercio
    problem_number: 2812 
    category: iniciante
    difficulty_level: 4
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2812 
--} 
 
import Data.List
import Control.Monad

paraInt x = (read x :: Int)

rm _ _ [] = []
rm n lista (x:xs) = do
        if n == 0 then lista
        else
            rm (n - 1) (lista ++ [x]) xs
        

imprime _ [] = ""
imprime nova (x:xs) | length xs == 0 = nova ++ (show x)
                    | otherwise = imprime (nova ++ (show x) ++ " ") xs

loop x = do
  if x == (-1) then do
    input <- getLine
    let q = (read input :: Int)
    loop q
  else
    unless (x == 0) $ do
        input <- getLine
        input <- getLine
        let strs = words input
        let ns = map paraInt strs
        let imp = [x | x <- ns, odd x]
        let qtd = length imp
        let menor_maior = sort imp
        let maior_menor = reverse menor_maior
        let inter = concat (transpose [maior_menor, menor_maior])
        let l_final = rm (qtd) [] inter
        putStrLn (imprime [] l_final)
        loop (x - 1)

main = loop (-1)