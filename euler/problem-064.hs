module Problem064 where

main =
  print $ length $ filter (even . length . expand) [1 .. 10000]

expand n = expand' n 0 1
  where expand' _ _ 0 = []
        expand' r n d = m : rest
          where m = ((floor . sqrt . fromIntegral) r + n) `div` d
                a = n - d * m
                rest
                  | d == 1 && n /= 0 = [] 
                  | otherwise = expand' r (-a) ((r - a * a) `div` d)
