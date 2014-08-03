module Problem033 where

import Data.Ratio

main = 
  print $ denominator $ product $ map (\(x, y) -> x % y) fractions

fractions = [(n, d) | x <- [1 .. 9], y <- [1 .. 9], z <- [1 .. 9], 
                      let n = 10 * x + y,
                      let d = 10 * y + z,
                      x % z == n % d]
