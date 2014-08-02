module Problem021 where

import Data.List (group)

main =
  print $ sum $ filter amicable [2..10000]

amicable x = x /= x' && sumd x' == x
  where x' = sumd x

sumd x = product (map f1 gs) - product (map f2 gs)
  where gs = map (\g -> (head g, length g)) $ group $ factors x
        f1 (p, m) = (p ^ (m + 1) - 1) `div` (p - 1)
        f2 (p, m) = p ^ m

factors x = f x primes []
  where f x (p:ps) fs 
          | x == 1    = fs
          | r == 0    = p:(factors q)
          | otherwise = f x ps fs          where (q, r) = x `quotRem` p

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) n = p * p > n || n `rem` p /= 0 && f ps n


