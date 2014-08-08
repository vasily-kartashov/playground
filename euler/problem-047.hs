module Problem047 where

import Data.List

main = 
  print $ head $ dropWhile (not . c) [1..]
  where c x = all (== 4) $ map (nods !!) $ map (+ x) [0..3]

nods = map (length . nub . divisors) [0..]

divisors 0 = []
divisors 1 = []
divisors x = divisors' primes [] x
  where divisors' _ ds 1 = ds
        divisors' (p:ps) ds x
          | r == 0    = divisors' (p:ps) (p:ds) q
          | otherwise = divisors' ps ds x
          where (q, r) = x `quotRem` p

isPrime = primeF primes
primes = 2 : 3 : filter (primeF primes) [5, 7 ..]
primeF (p:ps) x = p * p > x || x `rem` p /= 0 && primeF ps x
