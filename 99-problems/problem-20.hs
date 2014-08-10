module Problem20 where

main = 
  print $ removeAt 2 "abcd"

removeAt _ [] = error "Empty list"
removeAt 1 (a:as) = (a, as)
removeAt n (a:as) = (h, a:ts)
  where (h, ts) = removeAt (n - 1) as
