module Problem12 where

data Tuple a = Single a
             | Multiple Int a
               deriving (Show)

main =
  print $ decodeModified 
            [Multiple 4 'a',Single 'b',Multiple 2 'c',
             Multiple 2 'a',Single 'd',Multiple 4 'e']  

decodeModified = concatMap translate
  where translate (Single a)     = [a]
        translate (Multiple n a) = take n (repeat a)
