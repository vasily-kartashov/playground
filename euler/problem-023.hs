module Problem023 where

import Data.List

main = 
  print $ foldl1' (+) $ filter (not . isAbundantSum) [1..28123]

isAbundantSum x = f x $ filter (abundants !!) [1..]
  where f x (y:ys)
          | y + y > x                              = False
          | abundants !! y && abundants !! (x - y) = True
          | otherwise                              = f x ys

abundants = False : map (\x -> sumd x > x) [1..]

sumd x = product (map f1 gs) - product (map f2 gs)
  where gs = map (\g -> (head g, length g)) $ group $ factors x
        f1 (p, m) = (p ^ (m + 1) - 1) `div` (p - 1)
        f2 (p, m) = p ^ m

factors x = f x primes []
  where f x (p:ps) fs 
          | x == 1    = fs
          | r == 0    = p:(factors q)
          | otherwise = f x ps fs          
          where (q, r) = x `quotRem` p

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) n = p * p > n || n `rem` p /= 0 && f ps n
