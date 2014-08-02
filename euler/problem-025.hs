module Problem025 where

main =
  print $ head $ dropWhile (not . goal) [1..]

goal x = length (show (fib !! x)) == 1000

fib = 0 : 1 : zipWith (+) fib (tail fib)
