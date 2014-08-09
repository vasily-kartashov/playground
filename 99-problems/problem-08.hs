module Problem08 where

main = do
  putStrLn $ show $ compress "aaaabccaadeeee"

compress (a:as) = compress' a (as) [a]
  where compress' p [] cs = reverse cs
        compress' p (a:as) cs
          | p == a    = compress' p as cs
          | otherwise = compress' a as (a:cs) 
