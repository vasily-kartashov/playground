module Problem022 where

import Data.List (sort)
import Data.Char (ord)

main = do s <- readFile "names.txt"
          let names = sort $ read $ "[" ++ s ++ "]"
          let scores = zipWith score names [1..]
          print $ sum scores
          where f c = ord c - ord 'A' + 1
                score w p = p * (sum $ map f w)
