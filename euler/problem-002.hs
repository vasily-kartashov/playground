module Problem002 where

main = 
  print $ sum $ filter even $ takeWhile (< 4000000) $ map (fib !!) [1..]

fib = 0 : 1 : zipWith (+) fib (tail fib)

