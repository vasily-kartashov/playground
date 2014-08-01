module Problem013 where

main = do s <- readFile "problem-013.txt"
          let xs = map read $ lines s
          print xs
          print $ take 10 $ show $ sum xs

