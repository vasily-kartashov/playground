module Problem039 where

import Data.List

main = 
  print $ sort $ map (\s -> (length s, head s)) $ group $ sort $ filter (< l) $ map sum $ pyths l
  where l = 1000
 
pyths l = nub $ concatMap pyth [(m, n, l) | n <- [1 .. limit], m <- [n + 1 .. limit]]
  where limit = l `div` 2

pyth (m, n, l) = [sort [a * k, b * k, c * k] | k <- [1 .. l `div` p]]
  where a = m * m - n * n
        b = 2 * m * n
        c = m * m + n * n
        p = a + b + c

