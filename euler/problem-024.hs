module Problem023 where

import Data.List

main = print $ fetch (descent 999999) [0..]

fetch is as = fetch' is as []
  where fetch' [] as bs = reverse bs
        fetch' (i:is) as bs = fetch' is as' (b:bs)
                              where b = as !! i
                                    as' = take i as ++ drop (i + 1) as

descent x = descent' x 9 []
  where descent' x 0 bs = reverse (x:bs)
        descent' x i bs = descent' r (i - 1) (q:bs)
                          where (q, r) = x `quotRem` (factorial !! i)

factorial = 1 : scanl1 (*) [1..]
