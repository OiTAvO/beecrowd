import Control.Monad

paraInt x = (read x :: Int)

impares :: [Int] -> [Int]
impares (p:r:_)
  | even p = impares [(p + 1), r] 
  | otherwise = take r [ x | x <- [p..(p + r * 2)], odd x]

main = do
  input <- getLine
  let n = (read input :: Int)
  inputs <- replicateM n getLine
  let linhas = map words inputs
  let num_linhas = [ map paraInt x | x <- linhas]
  mapM_ print (map sum [impares x | x <- num_linhas])
