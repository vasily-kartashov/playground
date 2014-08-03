module Problem034 where

import Data.Char

main = 
  print $ [x | x <- [3 .. 10 ^ limit], x == facs x]
  where limit = head $ dropWhile (\n -> 10 ^ n < n * fact9) [2..]
        fact9 = product [2 .. 9] 


facs = sum . map (product . enumFromTo 1 . digitToInt) . show  

