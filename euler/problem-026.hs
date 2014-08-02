module Problem026 where

import Data.List (maximumBy)
import Data.Function (on)

main = 
  print $ maximumBy (compare `on` cyc) [1..1000]

cyc n
  | even n         = 0
  | n `rem` 5 == 0 = 0
  | otherwise      = head [p | p <- [1..], (10 ^ p - 1) `rem` n == 0]

