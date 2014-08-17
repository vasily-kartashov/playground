module Problem063 where

main = 
  print $ length [n | b <- [1 .. 9], p <- ps, let n = b ^ p, length (show n) == p]
  where ps = takeWhile (\p -> length (show (9 ^ p)) >= p) [1 ..]
