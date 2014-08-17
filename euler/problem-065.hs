module Problem065 where

import Data.Char
import Data.Ratio
import Data.List

main = 
  print $ (sum . map digitToInt . show . numerator) (iter 100)

iter n = iter' (take n series)
  where iter' [a] = a % 1
        iter' (a:as) = a % 1 + 1 / (iter' as)

series = 2 : concat [[1, 2 * i, 1] | i <- [1 ..]]
