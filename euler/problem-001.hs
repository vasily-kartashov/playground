module Problem001 where

main = 
  print $ sum' 1000

sum' :: (Integral a) => a -> a
sum' m = f 3 + f 5 - f 15 
         where f x = x * n * (n + 1) `quot` 2
                     where n = (m - 1) `quot` x

