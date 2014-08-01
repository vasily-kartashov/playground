module Problem012 where

import Data.List (group)

main =
  print $ head $ filter (\x -> nod x > 500) $ tris

tris = scanl (+) 1 [2..]

nod f = product $ map (\x -> 1 + length x) $ group $ factors f 

factors x = factors' x primes []
  where factors' x (p:ps) fs | x == 1         = fs
                             | x `rem` p == 0 = factors' (x `div` p) (p:ps) (p:fs)
                             | otherwise      = factors' x ps fs

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) n = p * p > n || n `rem` p /= 0 && f ps n

