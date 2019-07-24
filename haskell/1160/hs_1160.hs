{--
	author: OiTAvO
	problem_name: crescimento_populacional
	problem_number: 1160
	category: iniciante
	difficulty_level: 4
	link: https://www.urionlinejudge.com.br/judge/pt/problems/view/1160
--}

import Control.Monad

paraDouble x = (read x :: Double)

tempo x | x > 100 = "Mais de 1 seculo."
        | otherwise = (show (floor x)) ++ " anos."

crescimento pop tx = fromIntegral (floor (pop * (1 + (tx / 100)))) :: Double

l_tempo (p1:p2:tx1:tx2:cnt)
  | null cnt = l_tempo [(crescimento p1 tx1), (crescimento p2 tx2), tx1, tx2, 1]
  | head cnt > 100.0 = 101.0
  | p1 > p2 = head cnt
  | otherwise = l_tempo [(crescimento p1 tx1), (crescimento p2 tx2), tx1, tx2, (head cnt) + 1]

main = do
  input <- getLine
  let qtd = (read input :: Int)
  inputs <- replicateM qtd getLine
  let entradas = map words inputs
  let n_entradas = [ map paraDouble x | x <- entradas ]
  let tempos = map l_tempo n_entradas
  mapM_ putStrLn (map tempo tempos)
