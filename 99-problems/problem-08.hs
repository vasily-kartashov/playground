module Problem08 where

main = do
  putStrLn $ show $ compress "aaaabccaadeeee"

compress [] = []
compress (a:as) = compress' a (as)
  where compress' p [] = [p]
        compress' p (a:as)
          | p == a    = compress' p as
          | otherwise = p : compress' a as 
