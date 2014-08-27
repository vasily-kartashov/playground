{-# LANGUAGE NoMonomorphismRestriction #-}
module Problem076 where

import Data.Function.Memoize

main =
  print 2

-- http://en.wikipedia.org/wiki/Partition_(number_theory)
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
