module Problem06 where

main = do
  putStrLn $ show $ isPalindrome [1, 2, 3]
  putStrLn $ show $ isPalindrome "madamimadam"
  putStrLn $ show $ isPalindrome [1, 2, 4, 8, 16, 8, 4, 2, 1]

isPalindrome [] = True
isPalindrome [a] = True
isPalindrome a = and $ zipWith (==) t a 
  where l = length a `div` 2
        t = reverse $ drop l a
