module Problem04 where

main = do
  putStrLn $ show $ myLength [123, 456, 789]
  putStrLn $ show $ myLength "Hello, world!"

myLength [] = 0
myLength (_:as) = 1 + myLength as
