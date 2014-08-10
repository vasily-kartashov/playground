module Problem17 where

main = 
  print $ split "abcdefghik" 3

split [] _ = error "Empty list"
split as 0 = ([], as)
split (a:as) n = (a:xs, ys)
  where (xs, ys) = split as (n - 1)

