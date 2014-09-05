module Problem077 where

import Control.Monad

main =
  print $ head $ filter (\n -> length (part n) > 5000) [2..]

part = part' primes
  where part' pa@(p:ps) n
          | p == n = [[n]]
          | p > n = []
          | otherwise = left ++ right
          where left = map (p:) (part' pa (n - p)) 
                right = part' ps n

isPrime :: Int -> Bool
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x

primes :: [Int]
primes = 2 : 3 : filter isPrime [5, 7 ..]
