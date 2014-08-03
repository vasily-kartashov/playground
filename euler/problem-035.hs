module Problem035 where

import Data.List

main = 
  print $ length $ filter isCircular [2 .. 1000000]

isCircular = all isPrime . rotate

rotate x = take n $ map ((read :: String -> Int) . take n) $ tails $ take (2 * n) $ cycle s
 where s = show x
       n = length s

isPrime x = isPrime' primes x
  where isPrime' (p:ps) x
          | p * p > x      = True
          | x `rem` p == 0 = False
          | otherwise      = isPrime' ps x

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) x = p * p > x || x `rem` p /= 0 && f ps x
