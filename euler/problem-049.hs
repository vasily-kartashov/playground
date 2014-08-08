module Problem049 where

import Data.List
import GHC.Exts

main =
  print $ concatMap diff gs

diff [] = []
diff (g:gs) = [(g, g', g'') | g' <- gs, let g'' = g' + (g' - g), g'' `elem` gs] ++ diff gs

gs = filter (\g -> length g > 2) $ groupWith (sort . show) $ filter isPrime [1000 .. 9999]

primes = 2 : 3 : filter isPrime [5, 7 ..]
isPrime = isPrime' primes
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x
