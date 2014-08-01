module Problem018 where

main = do s <- readFile "problem-018.txt"
          let c = (map . map) (read :: String -> Int) $ map words $ lines s
          print $ foldr1 f c
          where f xs ys = zipWith3 g xs ys (tail ys)
                g x y z = x + max y z
