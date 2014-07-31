module Problem007 where

main =
  print $ primes !! 10000

primes = 2 : 3 : filter (f primes) [5, 7 ..]
         where f (p:ps) n = p * p > n || n `rem` p /= 0 && f ps n
