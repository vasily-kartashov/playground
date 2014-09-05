module Problem072 where

import Math.NumberTheory.Primes.Factorisation

main = 
  print $ sum $ map totient [2 .. 10 ^ 6]
