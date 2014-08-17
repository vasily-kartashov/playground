module Problem062 where

import GHC.Exts
import Data.List

main =
  print $ head $ concatMap (permGroups 6) $ map cubes [1 ..]

cubes n = takeWhile (< 10 ^ n) $ dropWhile (< 10 ^ (n - 1)) $ map (^ 3) [1 ..]

permGroups n cs = filter (\g -> length g == n) $ groupWith (sort . show) cs
