module Problem058 where

main =
  print $ head $ dropWhile above10p $ drop 1 $ scanl evolve ((0, 1), 1) [3, 5 ..] 

above10p ((a, b), _) = 10 * a > b

evolve ((a, b), n) n' = ((a + diag n', b + 4), n')

diag n = length $ filter isPrime [s - d, s - 2 * d, s - 3 * d]
  where s = n * n
        d = n - 1

isPrime = isPrime' primes
  where isPrime' (p:ps) n = p * p > n || n `rem` p /= 0 && isPrime' ps n

primes = 2 : 3 : filter isPrime [5, 7 ..]
