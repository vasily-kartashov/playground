module Problem041 where

import Data.Char
import Data.List

main = 
  print $ maximum $ head $ dropWhile (null) $ map pandigitals [9, 8 ..] 

pandigitals d = [x | n <- permute['1' .. intToDigit d], let x = read n, isPrime x]

permute [] = [[]]
permute s = [(x:xs) | x <- s, xs <- permute (delete x s)] 

isPrime 1 = False
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x
          | p * p > x      = True
          | x `rem` p == 0 = False
          | otherwise      = isPrime' ps x

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) x = p * p > x || x `rem` p /= 0 && f ps x
