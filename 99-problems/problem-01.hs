module Main where

main = do
  putStrLn $ show $ myLast [1, 2, 3, 4]
  putStrLn $ show $ myLast ['x', 'y', 'z']

myLast [] = error "Empty list"
myLast [a] = a
myLast (_:as) = myLast as

