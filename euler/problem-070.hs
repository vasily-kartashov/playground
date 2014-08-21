module Problem070 where

import Data.List
import Data.Function

main = print $ minimum $ [(n `div'` p, n) | a <- takeWhile (\p -> p ^ 2 < 10 ^ 7) $ dropWhile (< 1000) primes, 
                                            b <- takeWhile (\p -> a * p < 10 ^ 7) primes,
                                            a /= b, 
                                            let n = a * b,
                                            let p = n - a - b + 1,
                                            sort (show n) == sort (show p)]
  where a `div'` b = (fromIntegral a) / (fromIntegral b)

isPrime :: Int -> Bool
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x

primes :: [Int]
primes = 2 : 3 : filter isPrime [5, 7 ..]
