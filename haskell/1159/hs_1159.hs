import System.IO
import Control.Monad

soma n = sum (take 5 [ x | x <- [n..], rem x 2 == 0])

endOfFile = do
  eof <- isEOF
  unless (eof) $ do
    input <- getLine
    let n = (read input :: Int)
    unless (n == 0) $ do
      print (soma n)
    endOfFile

main = endOfFile
