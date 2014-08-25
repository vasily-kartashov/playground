module Problem074 where

main =
  print $ length $ filter (\n -> chlen n == 60) [1 .. 10 ^ 6]

chlen n = chlen' [] (fchain n)
  where chlen' as (b:bs)
          | b `elem` as = 0
          | otherwise   = 1 + chlen' (b:as) bs

fchain n = n : (fchain . fsum)  n

fsum = sum . map fact . show
  where
    fact '0' = 1
    fact '1' = 1
    fact '2' = 2
    fact '3' = 6
    fact '4' = 24
    fact '5' = 120
    fact '6' = 720
    fact '7' = 5040
    fact '8' = 40320
    fact '9' = 362880

