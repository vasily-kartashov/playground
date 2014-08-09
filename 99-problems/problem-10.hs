module Problem10 where

main = 
  print $ encode "aaaabccaadeeee"

encode [] = []
encode (a:as) = encode' as 1 a
  where encode' [] n c = [(n, c)]
        encode' (a:as) n c
          | a == c    = encode' as (n + 1) c
          | otherwise = (n, c) : encode' as 1 a
