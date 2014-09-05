module Problem076 where

import Data.Function.Memoize

main =
  print $ partitions 100
 
partitions :: Integer -> Integer
partitions = memoize partitions' 
  where partitions' n
          | n < 0     = 0
          | n == 0    = 1
          | otherwise = sum $ zipWith (*) cs ps
          where cs = cycle [1, 1, -1, -1]
                ps = map (\i -> partitions (n - i)) $ takeWhile (<= n) pentagonals


pentagonals = map f ns
  where f n = n * (3 * n - 1) `div` 2
        ns = concat [[n, -n] | n <- [1..]]
