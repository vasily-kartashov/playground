module Problem02 where

main = do
  putStrLn $ show $ myButLast [1, 2, 3, 4]
  putStrLn $ show $ myButLast ['a' .. 'z']

myButLast [] = error "Empty list"
myButLast [_] = error "One element only"
myButLast (a:_:[]) = a
myButLast (_:as) = myButLast as 
