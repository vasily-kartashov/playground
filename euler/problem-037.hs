module Problem037 where

import Data.List

main =
  print $ sum $ take 11 $ filter isTruncatablePrime primes

isTruncatablePrime x = x > 7 && all isPrime (variants x)

variants x = sort $ nub $ map (read :: String -> Int) $ u
  where s = show x
        u = filter (\x -> length x > 0) $ tails s ++ inits s

isPrime x = isPrime' primes x
  where isPrime' _ 1 = False
        isPrime' (p:ps) x
          | p * p > x      = True
          | x `rem` p == 0 = False
          | otherwise      = isPrime' ps x

primes = 2 : 3 : filter (f primes) [5, 7 ..]
  where f (p:ps) x = p * p > x || x `rem` p /= 0 && f ps x
