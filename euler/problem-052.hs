module Problem052 where

import Data.List

main =
  print $ head $ filter criteria [1 ..]
  where criteria x = same $ map (sort . show . (* x)) [1 .. 6]

same [] = True
same (a:as) = all (== a) as
