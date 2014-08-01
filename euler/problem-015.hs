module Problem013 where

main = 
  print $ 40 `choose` 20

n `choose` 0 = 1
0 `choose` k = 0
n `choose` k = (n - 1) `choose` (k - 1) * n `div` k
