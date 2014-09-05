module Problem080 where

import Data.Char

main =
  print $ sum $ map rootSum $ filter (not . isSquare) [1 .. 100]

rootSum n = iter (5 * n) 5
  where iter a b
          | b > 10 ^ 102 = sum $ map digitToInt $ take 100 $ show b
          | a > b        = iter (a - b) (b + 10)
          | otherwise    = iter (100 * a) (100 * (b `div` 10) + 5) 

isSquare n = let sqrti = floor . sqrt . fromIntegral in
              (sqrti n) ^ 2 == n
