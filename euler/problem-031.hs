module Problem031 where

main = 
  print $ length $ split 200

split n = split' [200, 100, 50, 20, 10, 5, 2, 1] n
  where split' (1:[]) n = [take n $ repeat 1]
        split' (c:cs) n
          | n > c     = map (c:) (split' (c:cs) (n - c)) ++ split' cs n
          | n == c    = [[c]] ++ split' cs n
          | otherwise = split' cs n
