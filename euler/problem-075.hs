module Problem075 where

import Data.List

main =
  print $ length $ filter (\g -> length g == 1) $ group $ sort $ pers 1500000

pers a = [k * p | t <- triplets a, let p = sum t, k <- [1 .. a `div` p]]

triplets a = [pyth m n | m <- [2 .. b],
                         n <- [1 .. (m - 1)],
                         gcd m n == 1,
                         odd (m + n)]                                 
  where b = (round $ sqrt $ fromIntegral a)
        pyth m n = [m2 - n2, 2 * m * n, m2 + n2]
          where m2 = m * m
                n2 = n * n
