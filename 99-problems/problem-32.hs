module Problem32 where

main = 
  print $ gcd' 36 63

gcd' a 0 = a
gcd' a b = gcd' b (a `rem` b)
