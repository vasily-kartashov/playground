module Problem005 where

main = 
  print $ product $ reduce [2..20]

reduce [] = []
reduce (n:ns) = n : reduce (filter (> 1) $ map f ns)
                where f x = if x `rem` n == 0 then x `div` n
                                              else x  

