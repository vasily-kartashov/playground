module Problem069 where

import Data.List
import Data.Ratio
import Data.Function

main =
  print $ maximumBy (compare `on` rphi) [2 .. 1000000]

rphi n = (fromIntegral n) / (fromIntegral (totient n))

totient n = foldl (\n d -> n - n `div` d) n (divisors n)

divisors n = nub $ reduce n primes
  where reduce 1 _ = []
        reduce n p'@(p:ps)
          | r == 0 = p : reduce q p'
          | otherwise = reduce n ps
          where (q, r) = n `quotRem` p

isPrime 1 = False
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x

primes = 2 : 3 : filter isPrime [5, 7 ..]
