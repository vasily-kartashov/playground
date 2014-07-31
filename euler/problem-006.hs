module Problem006 where

main =
  print $ sum [2 * x * y | x <- [1..100], y <- [(x + 1)..100]]
