module Problem060 where

main = 
  print $ findExpansion 5 5

type Group = (Int, [Int])
type Tree = (Int, [Group])

findExpansion :: Int -> Int -> [[Int]]
findExpansion lb ub = map snd $ filter (\g -> fst g >= lb) gs
   where gs = snd $ head $  dropWhile (\t -> fst t < ub) $ scanl expand (0, []) primes

expand :: Tree -> Int -> Tree
expand (n, gs) p = (max n n', (1, [p]) : gs ++ gs')
  where gs' = map (expandGroup p) $ filter (adjGroup p) gs       
        n' = if length gs' == 0 then 0
                                else maximum $ map fst gs'

expandGroup :: Int -> Group -> Group
expandGroup p g = (1 + fst g, p : snd g)

adjGroup :: Int -> Group -> Bool
adjGroup p g = all (adj p) (snd g)

adj :: Int -> Int -> Bool
adj a b = let a' = show a
              b' = show b in
          isPrime (read (a' ++ b')) && isPrime (read (b' ++ a'))

isPrime :: Int -> Bool
isPrime x = isPrime' primes x
  where isPrime' (p:ps) x = p * p > x || x `rem` p /= 0 && isPrime' ps x

primes :: [Int]
primes = 2 : 3 : filter isPrime [5, 7 ..]
