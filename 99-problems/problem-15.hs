module Problem12 where

main = 
  print $ repli "abc" 3

repli as 0 = []
repli as n = as ++ repli as (n - 1)
