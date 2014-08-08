module Problem045 where

main =
  print $ check 286 166 144 

check i j k
  | x < y     = check (i + 1) j k
  | y < z     = check i (j + 1) k
  | z < x     = check i j (k + 1)
  | otherwise = x
  where x = triangle i
        y = pentagonal j
        z = hexagonal k

triangle n = n * (n + 1) `div` 2
pentagonal n = n * (3 * n - 1) `div` 2
hexagonal n = n * (2 * n - 1)
