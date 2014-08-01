module Problem011 where

main = do str <- readFile "problem-011.txt"
          let xs = map (read :: String -> Int) $ words str
          print $ maximum $ [prod xs is | i <- [0..400], o <- offsets, let is = map (+ i) o, last is < 400]

offsets = [[0, 1, 2, 3]
          ,[0,20,40,60]
          ,[0,21,42,63]
          ,[3,22,41,60]
          ]

prod xs is = product $ map (xs !!) is
