module Problem032 where

import Data.List

main = 
  print $ sum $ nub $ [c | a <- [1 .. 2000], b <- [1..50], let c = a * b, pandigital a b c]
  where pandigital a b c = "123456789" == sort (concatMap show [a, b, c])
