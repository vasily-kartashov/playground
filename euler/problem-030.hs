module Problem030 where 

import Data.Char

main = 
  print $ filter test [2 .. 10 ^ limit]
  where test x = x == x'
          where x' = sum $ map (^ 5) $ map digitToInt $ show x
        limit = head $ dropWhile (\n -> 10 ^ n < n * 9 ^ 5) [1..]
