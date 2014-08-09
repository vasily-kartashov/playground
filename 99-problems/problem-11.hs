module Problem11 where

data Tuple a = Single a
             | Multiple Int a
               deriving (Show)
main =
  print $ show $ encodeModified "aaaabccaadeeee"

encodeModified (a:as) = encodeModified' 1 a as
  where encodeModified' n c [] = [wrap n c]
        encodeModified' n c (a:as)
          | c == a    = encodeModified' (n + 1) c as
          | otherwise = wrap n c : encodeModified' 1 a as
        wrap 1 a = Single a
        wrap n a = Multiple n a
