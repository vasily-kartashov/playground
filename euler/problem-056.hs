module Problem056 where

import Data.Char

main =
  print $ maximum [(sum' (a ^ b), a, b) | a <- [1 .. 100], b <- [1 .. 100]]

sum' = sum . (map digitToInt) . show
