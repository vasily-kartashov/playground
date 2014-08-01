module Problem014 where

import Data.List (foldl1')
import Data.MemoTrie (memo)

main = 
  print $ foldl1' (max) $ map (\x -> (collatz x, x)) ([1..1000000] :: [Int])

collatz :: Int -> Int
collatz = memo collatz'
  where collatz' n 
          | n == 1    = 1
          | r == 0    = 1 + collatz q
          | otherwise = 1 + collatz (3 * n + 1)
          where (q, r) = n `quotRem` 2
