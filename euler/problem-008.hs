module Problem008 where

import Data.Char (digitToInt)
import Data.List (tails)

main = do str <- readFile "problem-008.txt"
          let n = map digitToInt (concat $ lines str)
          print $ maximum $ map (product . take 13) $ tails n


