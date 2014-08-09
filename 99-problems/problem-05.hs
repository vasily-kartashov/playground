module Problem05 where

main = do
  putStrLn $ show $ myReverse "A man, a plan, a canal, panama!"
  putStrLn $ show $ myReverse [1, 2, 3, 4]

myReverse = myReverse' [] 
  where myReverse' as [] = as
        myReverse' as (b:bs) = myReverse' (b:as) bs
