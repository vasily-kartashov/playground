module Problem009 where

main = 
  print $ product $ triplet 1000

triplet n = map (* m) t
    where f x = n `rem` (sum x) == 0
          t = head $ filter f $ triplets n
          m = n `div` (sum t)

triplets a = [pyth m n | n <- [1..b], m <- [(n + 1)..b]]
  where b = (round $ sqrt $ fromIntegral a) `div` 2

pyth m n = [m2 - n2, 2 * m * n, m2 + n2]
  where m2 = m * m
        n2 = n * n
