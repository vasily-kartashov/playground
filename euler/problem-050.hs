module Problem050 where

import Data.List

main =
  print $ longest 1000000

longest n = maxLength n $ cumPrimes n

maxLength _ [] = (0, 0)
maxLength n (c:cs) = max a b   
   where a = foldl' max (0, 0) [(l, d) | y <- takeWhile (\i -> snd i - snd c < n) cs,
                                         let d = snd y - snd c,
                                         isPrime d,
                                         let l = fst y - fst c]
         b = maxLength n cs

cumPrimes n = scanl (\c i -> (i + 1, snd c + primes !! i)) (0, 0) $ takeWhile (\i -> primes !! i < n) [0 ..]

primes = 2 : 3 : filter isPrime [5, 7 ..]
isPrime = isPrime' primes
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x
