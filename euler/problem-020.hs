module Problem020 where

import Data.Char (digitToInt)
import Data.List (foldl1')

main = 
  print $ sum $ map digitToInt $ show $ f 100
  where f x = foldl1' (*) [1..x]
