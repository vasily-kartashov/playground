module Problem073 where

import Data.List
import Data.Ratio

main = print $ length $ takeWhile (< 1 % 2) $ dropWhile (<= 1 % 3) $ farey 12000

farey n = 0 : unfoldr step (0, 1, 1, n)
  where step (a, b, c, d) | c > n     = Nothing
                          | otherwise = let k = (n + b) `quot` d in 
                                        Just (c % d, (c, d, k * c - a, k * d - b))
