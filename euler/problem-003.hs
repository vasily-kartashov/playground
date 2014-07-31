module Problem003 where

main =
  print $ reduce 600851475143 primes

reduce n (p:ps) = if n == p then p
                  else if n `rem` p == 0 then reduce (n `div` p) (p:ps)
                                         else reduce n ps

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) n = p * p > n || n `rem` p /= 0 && f ps n 
