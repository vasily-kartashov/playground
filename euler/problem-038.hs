module Problem038 where

import Data.Function
import Data.List

main =
  print $ sort $ filter (\x -> isPandigital' (fst x)) $ map (\x -> (expand x, x)) [1..10000]

isPandigital' s = sort s == "123456789"

expand x = expand' 1 []
   where expand' n s
           | length s  >= 9 = s
           | otherwise      = expand' (n + 1) s' where s' = s ++ show (x * n)


