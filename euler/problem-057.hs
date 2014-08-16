module Problem057 where

import Data.Ratio

main =
  print $ length $ [f | f <- take 1000 series, 
                       (length . show . numerator) f > (length . show . denominator) f]

series = iterate (\n -> 1 + 1 / (1 + n)) (1 % 1)

