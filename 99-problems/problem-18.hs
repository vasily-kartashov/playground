module Problem18 where

main =
  print $ slice ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'k'] 3 7

slice _ 0 0 = []
slice (a:as) i j
  | i > 1 = slice as (i - 1) (j - 1)
  | j > 0 = a : slice as 0 (j - 1)
