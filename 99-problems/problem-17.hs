module Problem17 where

main = 
  print $ split "abcdefghik" 3

split [] _ = error "Empty list"
split as n = split' as [] n
  where split' as ps 0 = (reverse ps, as) 
        split' (a:as) ps n = split' as (a:ps) (n - 1)
