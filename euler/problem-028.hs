module Problem028 where

main = 
  print $ 1 + (sum d) 
  where d = map (\x -> 4 * x * x + 6 * (1 - x)) [3, 5 .. 1001]
