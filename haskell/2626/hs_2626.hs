{-- 
    author: OiTAvO 
    problem_name: turma_do_jb6 
    problem_number: 2626 
    category: iniciante
    difficulty_level: 5
    link: https://www.urionlinejudge.com.br/judge/pt/problems/view/2626 
--} 
 
import System.IO
import Control.Monad

dodo = "Os atributos dos monstros vao ser inteligencia, sabedoria..."
leo = "Iron Maiden's gonna get you, no matter how far!"
pepper = "Urano perdeu algo muito precioso..."
empate = "Putz vei, o Leo ta demorando muito pra jogar..."

pp = "papel"
pd = "pedra"
ts = "tesoura"

maior a b | a == pp && b == pd = True
          | a == pd && b == ts = True
          | a == ts && b == pp = True
          | otherwise = False
          
compara [] = empate
compara (d:l:p:_) | d == l && d == p = empate
                  | d == l = if maior d p then empate else pepper
                  | d == p = if maior d l then empate else leo
                  | l == p = if maior d l then dodo else empate
                  | otherwise = empate

loop = do
  fim <- isEOF
  unless fim $ do
    input <- getLine
    let jb6 = words input
    putStrLn (compara jb6)
    loop

main = loop
