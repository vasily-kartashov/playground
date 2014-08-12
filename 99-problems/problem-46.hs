module Problem46 where

import Data.List

data Table = Table [[Bool]]

instance Show Table where 
  show (Table rs) = intercalate "\n" $ map (\r -> intercalate "\t" (map show r)) rs

main =
  print $ table (\a b -> (and' a (or' a b)))

not' True = False
not' False = True

and' False _ = False
and' True b = b

or' True _ = True
or' False b = b

nor' a b = not' (or' a b)

nand' a b = not' (and' a b)

xor' a b = a /= b

impl' a b = or' (not' a) b

equ' :: Bool -> Bool -> Bool
equ' = (==)

table :: (Bool -> Bool -> Bool) -> Table
table f =
  Table [[a, b, f a b] | a <- [False, True], b <- [False, True]]
