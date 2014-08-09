module Problem14 where

main = 
  print $ dupli [1, 2, 3]

dupli [] = []
dupli [a] = [a,a]
dupli (a:as) = a : a : dupli as
