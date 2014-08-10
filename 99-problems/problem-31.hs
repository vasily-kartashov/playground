module Problem31 where 

main =
  print $ take 100 $ filter isPrime [1..]

isPrime 1 = False
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x

primes = 2 : 3 : filter isPrime [5, 7 ..]
