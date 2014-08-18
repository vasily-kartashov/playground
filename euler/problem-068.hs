module Problem068 where

import Data.List

main =
  print $ join $ maximum $ filter (\s -> length (join s) == 16) $ filter check cs
  where cs = map (6:) $ permutations $ [1..5] ++ [7..10]

join as = let (os, ps) = halve as in
          concat $ zipWith3 (\a b c -> show a ++ show b ++ show c) os ps (tail (cycle ps))

check as = let (os, ps) = halve as in 
           same $ zipWith3 (\a b c -> a + b + c) os ps (tail (cycle ps))

halve as = let l = length as `div` 2 in (take l as, drop l as)

same [] = True
same (a:as) = all (== a) as
