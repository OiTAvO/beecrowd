{-- 
    author: OiTAvO 
    problem_name: escadinha 
    problem_number: 2782 
    category: iniciante
    difficulty_level: 3
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2782 
--} 
 
escada :: Int -> Int -> Int -> [Int] -> Int
escada a b c (x:xs) | xs == [] = a
                    | c == 1 || c == 2 = 1
                    | b == (x - (head xs))= escada a b c xs
                    | otherwise = escada (a + 1) (x - (head xs)) c xs

paraInt x = (read x :: Int)

main = do
  input <- getLine
  let n = (read input :: Int)
  input <- getLine
  let strInteiros = words input
  let inteiros = map paraInt strInteiros
  print (escada 1 ((head inteiros) - (head (tail inteiros))) n inteiros)
