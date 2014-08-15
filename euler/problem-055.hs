module Problem055 where

main =
  print $ length $ filter lychrel [10 .. 10000]

lychrel n = lychrel' 0 n
  where lychrel' 50 _ = True
        lychrel' i n = (i == 0 || n /= n') && lychrel' (i + 1) (n + n')
          where n' = (read . reverse . show) n

