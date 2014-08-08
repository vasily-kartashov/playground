module Problem048 where

main = 
  print $ drop (length s - 10) $ s
  where x = sum $ map (\i -> i ^ i) [1 .. 1000] 
        s = show x
