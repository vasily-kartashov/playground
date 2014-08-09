module Problem03 where

main = do
  putStrLn $ show $ elementAt [1, 2, 3] 2
  putStrLn $ show $ elementAt "haskell" 5

elementAt [] _ = error "List exhausted"
elementAt (a:_) 1 = a
elementAt (_:as) n = elementAt as (n - 1)
