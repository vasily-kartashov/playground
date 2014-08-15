module Problem053 where

main =
  print $ sum [1 | n <- [1 .. 100], k <- [1 .. n], let x = n `choose` k, x > 1000000]

n `choose` k = (factorial !! n) `div` ((factorial !! k) * (factorial !! (n - k)))

factorial = scanl (*) 1 [1..]
