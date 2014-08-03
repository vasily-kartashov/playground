module Problem027 where

import Data.List
import Data.Function

main =
  print $ maximumBy (compare `on` length . primeSeq) s
  where n = 999
        s = [(a, b) | a <- [-n .. n], b <- takeWhile (< n) primes]

primeSeq (a, b) = takeWhile isPrime $ takeWhile (> 0) $ map (\n -> n * n + a * n + b) [0..]

isPrime = isPrime' primes
  where isPrime' (p:ps) x 
          | p * p > x      = True
          | x `rem` p == 0 = False
          | otherwise      = isPrime' ps x

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) x = p * p > x || x `rem` p /= 0 && f ps x
