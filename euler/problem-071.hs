module Problem071 where

import Data.Ratio
import Data.List

main = 
  print $ frac 3 7 (10 ^ 6)

frac a b n = frac' 1 0 2  n
  where frac' s r l q
          | q >= l = let p = (a * q - 1) `div` b in
                     if p * s > r * q then frac' q p (s `div` (a * s - b * r)) (q - 1)
                                      else frac' s r l (q - 1)
          | otherwise = let f = gcd r s in
                        (r `div` f, s `div` f)
