module Problem16 where

main =
  print $ dropEvery "abcdefghik" 3

dropEvery as n = dropEvery' as 1
  where dropEvery' [] _ = []
        dropEvery' (a:as) i
          | i `rem` n == 0 = dropEvery' as (i + 1)
          | otherwise      = a : dropEvery' as (i + 1)
