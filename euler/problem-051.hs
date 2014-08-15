module Problem051 where

import Data.Char
import Data.List

main =
  print $ head $ dropWhile (\f -> length f < 8) $ map family primes

family x = family' n d
  where n = show x
        d = head $ sort n
        family' n d
          | d `elem` n = filter isPrime $ map read $ map (replace n d) [d .. '9']
          | otherwise = []

replace [] _ _ = []
replace (x:xs) a b = (if x == a then b else x) : replace xs a b
         
          
isPrime 1 = False
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x

primes = 2 : 3 : filter isPrime [5, 7 ..]
