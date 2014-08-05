module Problem040 where

import Data.Char
import Data.List

main =
  print $ product $ map digitToInt $ map (s !!) $ map (\n -> 10 ^ n - 1) [0..6] 
  where s = concat $ map show [1..]
