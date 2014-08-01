module Proble010 where

main =
  print $ sum $ takeWhile (< 2000000) $ primes

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) n = p * p > n || n `rem` p /= 0 && f ps n
 
