module Problem046 where

main =
  print $ head $ filter (not . goldbach) $ filter (not . isPrime) [9, 11 ..]

goldbach x = any isPrime $ map (\s -> x - s) $ takeWhile (< x) squares2

squares2 = map (\n -> 2 * n * n) [1..]

isPrime = primeF primes
primes = 2 : 3 : filter (primeF primes) [5, 7 ..]
primeF (p:ps) x = p * p > x || x `rem` p /= 0 && primeF ps x

