module Problem042 where

import Data.Char

main =
  do s <- readFile "problem-042.txt"
     let words = (read :: String -> [String]) $ "[" ++ s ++ "]"
     let ts = filter (triangle . score) words
     print ts 
     print $ length ts

score w = sum $ map (\c -> ord c - ord 'A' + 1) w

triangle :: (Integral a) => a -> Bool
triangle t = n * (n + 1) == 2 * t
  where n = floor $ sqrt (2.0 * fromIntegral t)
